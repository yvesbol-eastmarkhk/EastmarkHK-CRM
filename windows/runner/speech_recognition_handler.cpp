#include "speech_recognition_handler.h"

#include <flutter/event_channel.h>
#include <flutter/event_sink.h>
#include <flutter/event_stream_handler.h>
#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

#include <windows.h>
#include <shellapi.h>

#include <atlbase.h>
#include <sapi.h>
#pragma warning(push)
#pragma warning(disable : 4996)  // GetVersionExW in sphelper.h
#include <sphelper.h>
#pragma warning(pop)

#include <cctype>

#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Foundation.Collections.h>
#include <winrt/Windows.Globalization.h>
#include <winrt/Windows.Media.SpeechRecognition.h>
#include <winrt/base.h>

#include <atomic>
#include <algorithm>
#include <chrono>
#include <fstream>
#include <memory>
#include <mutex>
#include <string>
#include <thread>
#include <vector>

#pragma comment(lib, "sapi.lib")

namespace {

using flutter::EncodableMap;
using flutter::EncodableValue;
using flutter::EventSink;
using flutter::MethodCall;
using flutter::MethodChannel;
using flutter::MethodResult;
using flutter::StreamHandlerError;

namespace wmsr = winrt::Windows::Media::SpeechRecognition;
namespace wg = winrt::Windows::Globalization;

void SpeechLog(const std::string& line) {
  try {
    wchar_t temp[MAX_PATH];
    if (GetTempPathW(MAX_PATH, temp) == 0) {
      return;
    }
    std::wstring path = std::wstring(temp) + L"eastmarkhk_speech.log";
    std::ofstream out(path, std::ios::app);
    if (!out) {
      return;
    }
    const auto now = std::chrono::system_clock::to_time_t(
        std::chrono::system_clock::now());
    char ts[32];
    ctime_s(ts, sizeof(ts), &now);
    std::string stamp(ts);
    if (!stamp.empty() && stamp.back() == '\n') {
      stamp.pop_back();
    }
    out << stamp << " | " << line << '\n';
  } catch (...) {
  }
}

std::string WideToUtf8(std::wstring_view wide) {
  if (wide.empty()) {
    return {};
  }
  const int size = WideCharToMultiByte(CP_UTF8, 0, wide.data(),
                                       static_cast<int>(wide.size()), nullptr,
                                       0, nullptr, nullptr);
  if (size <= 0) {
    return {};
  }
  std::string out(size, '\0');
  WideCharToMultiByte(CP_UTF8, 0, wide.data(), static_cast<int>(wide.size()),
                      out.data(), size, nullptr, nullptr);
  return out;
}

std::wstring LocaleIdToBcp47(const std::string& locale_id) {
  std::wstring wide(locale_id.begin(), locale_id.end());
  std::replace(wide.begin(), wide.end(), L'_', L'-');
  return wide;
}

WORD LocaleIdToLcid(const std::string& locale_id) {
  const std::string lower = [&] {
    std::string s = locale_id;
    std::transform(s.begin(), s.end(), s.begin(),
                   [](unsigned char c) { return static_cast<char>(tolower(c)); });
    std::replace(s.begin(), s.end(), '-', '_');
    return s;
  }();
  if (lower.rfind("fr", 0) == 0) return 0x040C;
  if (lower.rfind("pt_br", 0) == 0 || lower == "pt-br") return 0x0416;
  if (lower.rfind("pt", 0) == 0) return 0x0816;
  if (lower.rfind("en_gb", 0) == 0 || lower == "en-gb") return 0x0809;
  if (lower.rfind("en_us", 0) == 0 || lower == "en-us") return 0x0409;
  if (lower.rfind("en", 0) == 0) return 0x0809;
  if (lower.rfind("de", 0) == 0) return 0x0407;
  if (lower.rfind("es", 0) == 0) return 0x0C0A;
  if (lower.rfind("it", 0) == 0) return 0x0410;
  if (lower.rfind("zh", 0) == 0) return 0x0804;
  if (lower.rfind("ja", 0) == 0) return 0x0411;
  return static_cast<WORD>(GetUserDefaultLCID());
}

bool IsPrivacyPolicyError(const std::string& message) {
  const std::string lower = [&] {
    std::string s = message;
    std::transform(s.begin(), s.end(), s.begin(),
                   [](unsigned char c) { return static_cast<char>(tolower(c)); });
    return s;
  }();
  return lower.find("privacy policy") != std::string::npos ||
         lower.find("privacy") != std::string::npos &&
             lower.find("speech") != std::string::npos;
}

const char* ResultStatusName(wmsr::SpeechRecognitionResultStatus status) {
  switch (status) {
    case wmsr::SpeechRecognitionResultStatus::Success:
      return "Success";
    case wmsr::SpeechRecognitionResultStatus::TopicLanguageNotSupported:
      return "TopicLanguageNotSupported";
    case wmsr::SpeechRecognitionResultStatus::GrammarCompilationFailure:
      return "GrammarCompilationFailure";
    case wmsr::SpeechRecognitionResultStatus::AudioQualityFailure:
      return "AudioQualityFailure";
    case wmsr::SpeechRecognitionResultStatus::UserCanceled:
      return "UserCanceled";
    case wmsr::SpeechRecognitionResultStatus::Unknown:
      return "Unknown";
    case wmsr::SpeechRecognitionResultStatus::TimeoutExceeded:
      return "TimeoutExceeded";
    case wmsr::SpeechRecognitionResultStatus::PauseLimitExceeded:
      return "PauseLimitExceeded";
    case wmsr::SpeechRecognitionResultStatus::NetworkFailure:
      return "NetworkFailure";
    case wmsr::SpeechRecognitionResultStatus::MicrophoneUnavailable:
      return "MicrophoneUnavailable";
    default:
      return "Other";
  }
}

class SpeechRecognitionHandler {
 public:
  static SpeechRecognitionHandler& Instance() {
    static SpeechRecognitionHandler instance;
    return instance;
  }

  void SetEventSink(std::unique_ptr<EventSink<EncodableValue>> sink) {
    std::lock_guard<std::mutex> lock(mutex_);
    event_sink_ = std::move(sink);
  }

  void Emit(const EncodableMap& payload) {
    if (!emit_enabled_.load()) {
      return;
    }
    std::lock_guard<std::mutex> lock(mutex_);
    if (event_sink_) {
      try {
        event_sink_->Success(EncodableValue(payload));
      } catch (...) {
      }
    }
  }

  void EmitStatus(const std::string& status) {
    EncodableMap map;
    map[EncodableValue("type")] = EncodableValue("status");
    map[EncodableValue("status")] = EncodableValue(status);
    Emit(map);
  }

  void EmitResult(const std::string& words, bool is_final) {
    EncodableMap map;
    map[EncodableValue("type")] = EncodableValue("result");
    map[EncodableValue("words")] = EncodableValue(words);
    map[EncodableValue("final")] = EncodableValue(is_final);
    Emit(map);
  }

  void EmitError(const std::string& message) {
    SpeechLog(std::string("ERROR: ") + message);
    EncodableMap map;
    map[EncodableValue("type")] = EncodableValue("error");
    map[EncodableValue("message")] = EncodableValue(message);
    Emit(map);
  }

  void Stop(bool emit_status = true) {
    SpeechLog("Stop()");
    // Coupe d'abord les emits (évite EventSink pendant teardown WinRT).
    emit_enabled_ = false;
    winrt_callbacks_alive_ = false;
    const bool was_active = active_.exchange(false);
    session_ended_ = true;
    stop_event_.notify();
    // Ne PAS CancelAsync ici (thread UI/method) — le worker le fait.
    // Un CancelAsync concurrent + callback Completed sur variable stack
    // provoquait APPCRASH c0000005 à la sauvegarde de tâche.
    if (worker_.joinable()) {
      worker_.join();
    }
    {
      std::lock_guard<std::mutex> lock(recognizer_mutex_);
      recognizer_ = nullptr;
    }
    committed_text_.clear();
    if (emit_status && was_active) {
      emit_enabled_ = true;
      EmitStatus("notListening");
      emit_enabled_ = false;
    }
    // Prépare la prochaine dictée (CompileConstraints est le goulot).
    // Seulement après un Stop utilisateur — pas pendant Start→Stop(false).
    if (emit_status && !last_locale_id_.empty()) {
      const auto locale = last_locale_id_;
      std::thread([this, locale]() {
        try {
          Warmup(locale, nullptr);
        } catch (...) {
        }
      }).detach();
    }
  }

  static bool LocalesCompatible(const std::string& a, const std::string& b) {
    if (a.empty() || b.empty()) return a == b;
    auto norm = [](std::string s) {
      std::transform(s.begin(), s.end(), s.begin(),
                     [](unsigned char c) { return static_cast<char>(tolower(c)); });
      std::replace(s.begin(), s.end(), '-', '_');
      return s;
    };
    const auto na = norm(a);
    const auto nb = norm(b);
    if (na == nb) return true;
    const auto la = na.substr(0, na.find('_'));
    const auto lb = nb.substr(0, nb.find('_'));
    return la == lb;
  }

  wmsr::SpeechRecognizer TakeWarmRecognizer(const std::string& locale_id) {
    std::lock_guard<std::mutex> lock(warm_mutex_);
    if (!warm_recognizer_ || !LocalesCompatible(warm_locale_, locale_id)) {
      return nullptr;
    }
    SpeechLog(std::string("Using warm recognizer for ") + locale_id);
    auto rec = warm_recognizer_;
    warm_recognizer_ = nullptr;
    warm_locale_.clear();
    return rec;
  }

  bool Warmup(const std::string& locale_id, std::string* error) {
    SpeechLog(std::string("Warmup locale=") + locale_id);
    try {
      winrt::init_apartment(winrt::apartment_type::multi_threaded);
    } catch (...) {
    }
    {
      std::lock_guard<std::mutex> lock(warm_mutex_);
      if (warm_recognizer_ && LocalesCompatible(warm_locale_, locale_id)) {
        SpeechLog("Warmup already ready");
        return true;
      }
    }
    std::string local_error;
    auto rec = CreateWinRtRecognizer(locale_id, &local_error);
    if (!rec) {
      if (error) *error = local_error;
      SpeechLog(std::string("Warmup FAILED: ") + local_error);
      return false;
    }
    {
      std::lock_guard<std::mutex> lock(warm_mutex_);
      warm_recognizer_ = rec;
      warm_locale_ = locale_id;
    }
    SpeechLog("Warmup OK");
    return true;
  }

  bool Start(const std::string& locale_id, std::string* error) {
    SpeechLog(std::string("Start locale=") + locale_id);
    Stop(false);
    committed_text_.clear();
    startup_error_.clear();
    recognizer_ready_ = false;
    session_ended_ = false;
    emit_enabled_ = true;
    winrt_callbacks_alive_ = true;
    active_ = true;
    last_locale_id_ = locale_id;
    stop_event_.reset();

    worker_ = std::thread([this, locale_id]() { RecognitionLoop(locale_id); });

    // Polling plus serré : avec warmup, StartAsync est souvent < 300 ms.
    for (int i = 0; i < 300; ++i) {
      if (recognizer_ready_.load()) {
        EmitStatus("listening");
        SpeechLog("Start OK — listening");
        return true;
      }
      if (!active_.load()) {
        break;
      }
      Sleep(20);
    }

    if (error && !startup_error_.empty()) {
      *error = startup_error_;
    } else if (error) {
      *error = "Speech recognition failed to start";
    }
    SpeechLog(std::string("Start FAILED: ") + (error ? *error : ""));
    Stop(false);
    return false;
  }

 private:
  class ManualResetEvent {
   public:
    ManualResetEvent() : handle_(CreateEventW(nullptr, TRUE, FALSE, nullptr)) {}
    ~ManualResetEvent() {
      if (handle_) CloseHandle(handle_);
    }
    void notify() {
      if (handle_) SetEvent(handle_);
    }
    void reset() {
      if (handle_) ResetEvent(handle_);
    }
    HANDLE get() const { return handle_; }

   private:
    HANDLE handle_;
  };

  SpeechRecognitionHandler() = default;

  bool CompileConstraint(wmsr::SpeechRecognizer const& rec,
                         wmsr::SpeechRecognitionScenario scenario,
                         const wchar_t* tag,
                         std::string* detail) {
    try {
      wmsr::SpeechRecognitionTopicConstraint constraint(scenario, tag);
      rec.Constraints().Clear();
      rec.Constraints().Append(constraint);
      const auto compile = rec.CompileConstraintsAsync().get();
      const auto status = compile.Status();
      SpeechLog(std::string("Compile ") + WideToUtf8(tag) + " → " +
                ResultStatusName(status));
      if (status == wmsr::SpeechRecognitionResultStatus::Success) {
        return true;
      }
      if (detail) {
        *detail = ResultStatusName(status);
      }
    } catch (const winrt::hresult_error& ex) {
      SpeechLog(std::string("Compile exception: ") +
                WideToUtf8(ex.message().c_str()));
      if (detail) {
        *detail = WideToUtf8(ex.message().c_str());
      }
    }
    return false;
  }

  // fr-BE n'est souvent pas packagé → fr-FR, jamais un autre langage (pt-BR…).
  std::vector<std::wstring> WinRtLanguageCandidates(const std::string& locale_id) {
    std::vector<std::wstring> out;
    auto add = [&](const std::wstring& tag) {
      if (tag.empty()) return;
      for (const auto& existing : out) {
        if (_wcsicmp(existing.c_str(), tag.c_str()) == 0) return;
      }
      out.push_back(tag);
    };

    if (!locale_id.empty()) {
      add(LocaleIdToBcp47(locale_id));
    }

    std::string lang = locale_id;
    const auto us = lang.find('_');
    const auto dash = lang.find('-');
    size_t cut = std::string::npos;
    if (us != std::string::npos) cut = us;
    if (dash != std::string::npos && (cut == std::string::npos || dash < cut)) {
      cut = dash;
    }
    if (cut != std::string::npos) lang = lang.substr(0, cut);
    std::transform(lang.begin(), lang.end(), lang.begin(),
                   [](unsigned char c) { return static_cast<char>(tolower(c)); });

    if (lang == "fr") {
      add(L"fr-FR");
      add(L"fr-CA");
      add(L"fr");
    } else if (lang == "en") {
      add(L"en-GB");
      add(L"en-US");
      add(L"en");
    } else if (lang == "pt") {
      add(L"pt-BR");
      add(L"pt-PT");
      add(L"pt");
    } else if (lang == "nl") {
      add(L"nl-BE");
      add(L"nl-NL");
      add(L"nl");
    } else if (lang == "de") {
      add(L"de-DE");
      add(L"de-AT");
      add(L"de");
    } else if (lang == "es") {
      add(L"es-ES");
      add(L"es-MX");
      add(L"es");
    } else if (lang == "zh") {
      add(L"zh-CN");
      add(L"zh-TW");
      add(L"zh-Hans");
      add(L"zh-Hant");
    } else if (!lang.empty()) {
      std::wstring wide(lang.begin(), lang.end());
      add(wide);
    }

    // Langues speech réellement supportées pour ce language tag.
    try {
      const auto supported = wmsr::SpeechRecognizer::SupportedTopicLanguages();
      for (const auto& l : supported) {
        const auto tag = std::wstring(l.LanguageTag());
        std::wstring prefix(lang.begin(), lang.end());
        if (!prefix.empty() && tag.size() >= prefix.size() &&
            _wcsnicmp(tag.c_str(), prefix.c_str(), prefix.size()) == 0 &&
            (tag.size() == prefix.size() || tag[prefix.size()] == L'-')) {
          add(tag);
        }
      }
    } catch (...) {
    }

    return out;
  }

  wmsr::SpeechRecognizer CreateWinRtRecognizer(const std::string& locale_id,
                                               std::string* error) {
    auto try_language = [&](wmsr::SpeechRecognizer rec,
                            const char* label) -> wmsr::SpeechRecognizer {
      std::string detail;
      if (CompileConstraint(rec, wmsr::SpeechRecognitionScenario::Dictation,
                            L"dictation", &detail)) {
        SpeechLog(std::string("Using Dictation / ") + label);
        return rec;
      }
      if (CompileConstraint(rec, wmsr::SpeechRecognitionScenario::FormFilling,
                            L"form", &detail)) {
        SpeechLog(std::string("Using FormFilling / ") + label);
        return rec;
      }
      return nullptr;
    };

    const auto candidates = WinRtLanguageCandidates(locale_id);
    for (const auto& tag : candidates) {
      try {
        SpeechLog(std::string("Try WinRT language ") + WideToUtf8(tag));
        auto localized = wmsr::SpeechRecognizer(wg::Language(tag));
        auto ok = try_language(localized, WideToUtf8(tag).c_str());
        if (ok) {
          if (!locale_id.empty()) {
            const auto requested = LocaleIdToBcp47(locale_id);
            if (_wcsicmp(requested.c_str(), tag.c_str()) != 0) {
              EmitStatus("languageFallback");
              SpeechLog(std::string("Fallback speech language: requested=") +
                        WideToUtf8(requested) + " using=" + WideToUtf8(tag));
            }
          }
          return ok;
        }
      } catch (const winrt::hresult_error& ex) {
        SpeechLog(std::string("WinRT locale failed (") + WideToUtf8(tag) +
                  "): " + WideToUtf8(ex.message().c_str()));
      } catch (...) {
        SpeechLog(std::string("WinRT locale failed (") + WideToUtf8(tag) + ")");
      }
    }

    // Dernier recours système — journalise la langue réelle (évite le piège pt-BR).
    try {
      auto fallback = wmsr::SpeechRecognizer();
      try {
        const auto sys = fallback.CurrentLanguage().LanguageTag();
        SpeechLog(std::string("System speech language=") +
                  WideToUtf8(sys.c_str()));
      } catch (...) {
      }
      // N'utilise le défaut système QUE s'il matche la langue demandée.
      if (!locale_id.empty()) {
        std::string want = locale_id;
        const auto cut = want.find_first_of("_-");
        if (cut != std::string::npos) want = want.substr(0, cut);
        std::transform(want.begin(), want.end(), want.begin(),
                       [](unsigned char c) {
                         return static_cast<char>(tolower(c));
                       });
        try {
          const auto sys = WideToUtf8(
              fallback.CurrentLanguage().LanguageTag().c_str());
          std::string sys_lang = sys;
          const auto scut = sys_lang.find('-');
          if (scut != std::string::npos) sys_lang = sys_lang.substr(0, scut);
          std::transform(sys_lang.begin(), sys_lang.end(), sys_lang.begin(),
                         [](unsigned char c) {
                           return static_cast<char>(tolower(c));
                         });
          if (sys_lang != want) {
            SpeechLog(std::string("Skip system speech language mismatch: want=") +
                      want + " system=" + sys);
            if (error) {
              *error =
                  "Speech language pack missing for " + locale_id +
                  " — install French (France) in Windows Settings > Time & "
                  "language > Speech";
            }
            return nullptr;
          }
        } catch (...) {
        }
      }
      auto ok = try_language(fallback, "system");
      if (ok) return ok;
    } catch (...) {
    }

    if (error) {
      *error = "WinRT speech unavailable for " +
               (locale_id.empty() ? std::string("system") : locale_id);
    }
    return nullptr;
  }

  // Reconnaissance locale SAPI (pas de politique privacy cloud requise).
  bool RunSapiLoop(const std::string& locale_id, std::string* error) {
    SpeechLog("SAPI fallback begin");
    HRESULT hr = CoInitializeEx(nullptr, COINIT_MULTITHREADED);
    const bool need_uninit =
        SUCCEEDED(hr) || hr == RPC_E_CHANGED_MODE || hr == S_FALSE;
    if (FAILED(hr) && hr != RPC_E_CHANGED_MODE && hr != S_FALSE) {
      if (error) *error = "COM init failed for speech";
      return false;
    }

    bool started = false;
    CComPtr<ISpRecognizer> recognizer;
    CComPtr<ISpRecoContext> context;
    CComPtr<ISpRecoGrammar> grammar;

    auto cleanup = [&]() {
      if (grammar) {
        grammar->SetDictationState(SPRS_INACTIVE);
        grammar.Release();
      }
      context.Release();
      recognizer.Release();
      if (need_uninit && hr != RPC_E_CHANGED_MODE) {
        CoUninitialize();
      }
    };

    hr = CoCreateInstance(CLSID_SpInprocRecognizer, nullptr, CLSCTX_INPROC_SERVER,
                          IID_PPV_ARGS(&recognizer));
    if (FAILED(hr)) {
      if (error) *error = "SAPI recognizer unavailable";
      cleanup();
      return false;
    }

    // Choisit le moteur de langue (fr-FR, en-GB…).
    {
      const WORD lcid = LocaleIdToLcid(locale_id);
      wchar_t attr[64];
      swprintf_s(attr, L"language=%x", lcid);
      CComPtr<ISpObjectToken> token;
      if (SUCCEEDED(SpFindBestToken(SPCAT_RECOGNIZERS, attr, nullptr, &token)) &&
          token) {
        recognizer->SetRecognizer(token);
        SpeechLog(std::string("SAPI engine language=") + WideToUtf8(attr));
      } else {
        SpeechLog("SAPI using default recognizer");
      }
    }

    CComPtr<ISpObjectToken> audio;
    if (SUCCEEDED(SpGetDefaultTokenFromCategoryId(SPCAT_AUDIOIN, &audio)) &&
        audio) {
      recognizer->SetInput(audio, TRUE);
    } else {
      recognizer->SetInput(nullptr, TRUE);
    }

    hr = recognizer->CreateRecoContext(&context);
    if (FAILED(hr) || !context) {
      if (error) *error = "SAPI context failed";
      cleanup();
      return false;
    }

    hr = context->SetNotifyWin32Event();
    if (FAILED(hr)) {
      if (error) *error = "SAPI notify failed";
      cleanup();
      return false;
    }

    const ULONGLONG interest =
        SPFEI(SPEI_RECOGNITION) | SPFEI(SPEI_HYPOTHESIS) | SPFEI(SPEI_FALSE_RECOGNITION);
    context->SetInterest(interest, interest);

    hr = context->CreateGrammar(0, &grammar);
    if (FAILED(hr) || !grammar) {
      if (error) *error = "SAPI grammar failed";
      cleanup();
      return false;
    }

    hr = grammar->LoadDictation(nullptr, SPLO_STATIC);
    if (FAILED(hr)) {
      if (error) {
        *error =
            "SAPI dictation unavailable — install a speech language pack in "
            "Windows Settings > Time & language > Speech";
      }
      cleanup();
      return false;
    }

    hr = grammar->SetDictationState(SPRS_ACTIVE);
    if (FAILED(hr)) {
      if (error) *error = "SAPI could not activate microphone";
      cleanup();
      return false;
    }

    // Réduit le bruit de fond (TV, etc.) — SAPI est très sensible.
    recognizer->SetRecoState(SPRST_ACTIVE_ALWAYS);

    recognizer_ready_ = true;
    started = true;
    SpeechLog("SAPI listening");
    EmitStatus("offlineEngine");

    HANDLE notify = context->GetNotifyEventHandle();
    HANDLE waits[2] = {notify, stop_event_.get()};

    auto confidence_of = [](ISpRecoResult* result) -> float {
      if (!result) return 0.f;
      SPPHRASE* phrase = nullptr;
      if (FAILED(result->GetPhrase(&phrase)) || !phrase) {
        return 0.f;
      }
      // SREngineConfidence est dans [0, 1] quand fourni.
      float conf = phrase->Rule.SREngineConfidence;
      if (conf <= 0.f && phrase->pElements && phrase->Rule.ulCountOfElements > 0) {
        conf = phrase->pElements[0].SREngineConfidence;
      }
      CoTaskMemFree(phrase);
      return conf;
    };

    // Note: les scores SAPI sont souvent très bas (0.05–0.25) même sur de la
    // vraie parole — on ne filtre PAS sur la confiance, sinon aucun texte.
    while (active_.load()) {
      const DWORD wait = WaitForMultipleObjects(2, waits, FALSE, 500);
      if (!active_.load() || wait == WAIT_OBJECT_0 + 1) {
        break;
      }
      if (wait != WAIT_OBJECT_0) {
        continue;
      }

      SPEVENT event = {};
      while (active_.load() &&
             context->GetEvents(1, &event, nullptr) == S_OK) {
        if (event.eEventId == SPEI_FALSE_RECOGNITION) {
          continue;
        }
        if (event.eEventId != SPEI_RECOGNITION &&
            event.eEventId != SPEI_HYPOTHESIS) {
          continue;
        }
        CComPtr<ISpRecoResult> result;
        result.Attach(reinterpret_cast<ISpRecoResult*>(event.lParam));
        if (!result) continue;

        const float confidence = confidence_of(result);
        wchar_t* text = nullptr;
        if (FAILED(result->GetText(static_cast<ULONG>(-1), static_cast<ULONG>(-1),
                                   TRUE, &text, nullptr)) ||
            !text) {
          continue;
        }
        const std::string phrase = WideToUtf8(text);
        CoTaskMemFree(text);
        if (phrase.empty()) continue;

        const bool is_final = event.eEventId == SPEI_RECOGNITION;
        SpeechLog(std::string("SAPI text=\"") + phrase + "\" final=" +
                  (is_final ? "1" : "0") + " conf=" +
                  std::to_string(confidence));

        // Ignore seulement les monosyllabes parasites isolés en hypothèse.
        if (!is_final && phrase.size() < 2) {
          continue;
        }

        if (is_final) {
          if (!committed_text_.empty()) committed_text_ += " ";
          committed_text_ += phrase;
          EmitResult(committed_text_, true);
        } else {
          std::string preview = committed_text_;
          if (!preview.empty()) preview += " ";
          preview += phrase;
          EmitResult(preview, false);
        }
      }
    }

    grammar->SetDictationState(SPRS_INACTIVE);
    cleanup();
    SpeechLog("SAPI loop end");
    return started;
  }

  // true = session cloud démarrée (même si arrêtée ensuite par l'utilisateur).
  // false = échec au démarrage → éventuellement fallback SAPI.
  bool RunWinRtContinuous(wmsr::SpeechRecognizer const& recognizer,
                          std::string* out_error) {
    SpeechLog("WinRT continuous begin");
    try {
      auto timeouts = recognizer.Timeouts();
      // Pause naturelle entre mots OK ; coupe plus vite en fin de phrase.
      timeouts.InitialSilenceTimeout(std::chrono::seconds(15));
      timeouts.EndSilenceTimeout(std::chrono::milliseconds(1200));
      timeouts.BabbleTimeout(std::chrono::seconds(8));
    } catch (...) {
    }

    {
      std::lock_guard<std::mutex> lock(recognizer_mutex_);
      recognizer_ = recognizer;
    }

    auto session = recognizer.ContinuousRecognitionSession();
    session_ended_ = false;

    // HypothesisGenerated n'est pas projeté en C++/WinRT desktop — on utilise
    // ResultGenerated (phrases finalisées, bien meilleures que SAPI).
    // IMPORTANT: ne jamais capturer de références stack dans ces callbacks
    // (Completed peut arriver après la sortie de cette fonction → AV).
    const auto result_token = session.ResultGenerated(
        [this](wmsr::SpeechContinuousRecognitionSession const&,
               wmsr::SpeechContinuousRecognitionResultGeneratedEventArgs const&
                   args) {
          if (!winrt_callbacks_alive_.load() || !active_.load()) return;
          const auto result = args.Result();
          if (result.Confidence() ==
              wmsr::SpeechRecognitionConfidence::Rejected) {
            return;
          }
          const auto text = WideToUtf8(result.Text().c_str());
          if (text.empty()) return;
          SpeechLog(std::string("WinRT final=\"") + text + "\"");
          if (!committed_text_.empty()) committed_text_ += " ";
          committed_text_ += text;
          EmitResult(committed_text_, true);
        });

    const auto completed_token = session.Completed(
        [this](wmsr::SpeechContinuousRecognitionSession const&,
               wmsr::SpeechContinuousRecognitionCompletedEventArgs const&
                   args) {
          if (!winrt_callbacks_alive_.load()) return;
          SpeechLog(std::string("WinRT session completed: ") +
                    ResultStatusName(args.Status()));
          session_ended_ = true;
          stop_event_.notify();
        });

    try {
      session.StartAsync().get();
    } catch (const winrt::hresult_error& ex) {
      const auto msg = WideToUtf8(ex.message().c_str());
      SpeechLog(std::string("WinRT StartAsync: ") + msg);
      if (out_error) *out_error = msg;
      try {
        session.ResultGenerated(result_token);
        session.Completed(completed_token);
      } catch (...) {
      }
      {
        std::lock_guard<std::mutex> lock(recognizer_mutex_);
        recognizer_ = nullptr;
      }
      return false;
    }

    recognizer_ready_ = true;
    EmitStatus("onlineEngine");
    SpeechLog("WinRT continuous listening");

    while (active_.load()) {
      WaitForSingleObject(stop_event_.get(), 200);
      if (!active_.load()) break;
      if (!session_ended_.load()) continue;

      // Silence / fin de segment OS → on relance sans couper le micro UI.
      session_ended_ = false;
      stop_event_.reset();
      if (!active_.load()) break;
      try {
        session.StartAsync().get();
        SpeechLog("WinRT session restarted");
      } catch (const winrt::hresult_error& ex) {
        const auto msg = WideToUtf8(ex.message().c_str());
        SpeechLog(std::string("WinRT restart failed: ") + msg);
        if (active_.load()) {
          EmitError(msg);
        }
        break;
      }
    }

    // Détache les handlers AVANT Cancel — évite Completed sur objet mort.
    winrt_callbacks_alive_ = false;
    try {
      session.ResultGenerated(result_token);
      session.Completed(completed_token);
    } catch (...) {
    }
    try {
      session.CancelAsync().get();
    } catch (...) {
      try {
        session.StopAsync().get();
      } catch (...) {
      }
    }
    {
      std::lock_guard<std::mutex> lock(recognizer_mutex_);
      recognizer_ = nullptr;
    }
    SpeechLog("WinRT continuous end");
    return true;
  }

  void RecognitionLoop(std::string locale_id) {
    SpeechLog("RecognitionLoop begin");
    bool used_sapi = false;

    try {
      winrt::init_apartment(winrt::apartment_type::multi_threaded);

      std::string winrt_error;
      auto recognizer = TakeWarmRecognizer(locale_id);
      if (!recognizer) {
        recognizer = CreateWinRtRecognizer(locale_id, &winrt_error);
      }

      if (recognizer) {
        std::string continuous_error;
        const bool started =
            RunWinRtContinuous(recognizer, &continuous_error);
        if (!started) {
          startup_error_ = continuous_error.empty() ? winrt_error
                                                    : continuous_error;
          if (active_.load() &&
              (IsPrivacyPolicyError(startup_error_) ||
               continuous_error.find("network") != std::string::npos ||
               continuous_error.find("Network") != std::string::npos ||
               IsPrivacyPolicyError(continuous_error))) {
            SpeechLog("Switching to SAPI offline dictation");
            ShellExecuteW(nullptr, L"open", L"ms-settings:privacy-speech",
                          nullptr, nullptr, SW_SHOWNORMAL);
            EmitStatus("needsOnlineSpeech");
            std::string sapi_error;
            used_sapi = RunSapiLoop(locale_id, &sapi_error);
            if (!used_sapi) {
              startup_error_ =
                  "Enable Online speech recognition: Windows Settings > "
                  "Privacy & security > Speech.";
              if (!sapi_error.empty()) {
                startup_error_ += " [" + sapi_error + "]";
              }
              EmitError(startup_error_);
            }
          } else if (!startup_error_.empty() && active_.load()) {
            EmitError(startup_error_);
          }
        }
      } else if (active_.load()) {
        SpeechLog(std::string("WinRT unavailable: ") + winrt_error);
        ShellExecuteW(nullptr, L"open", L"ms-settings:privacy-speech", nullptr,
                      nullptr, SW_SHOWNORMAL);
        EmitStatus("needsOnlineSpeech");
        std::string sapi_error;
        used_sapi = RunSapiLoop(locale_id, &sapi_error);
        if (!used_sapi) {
          startup_error_ = winrt_error.empty()
                               ? "Speech recognition unavailable"
                               : winrt_error;
          EmitError(startup_error_);
        }
      }
    } catch (const winrt::hresult_error& ex) {
      SpeechLog(std::string("Loop hresult: ") + WideToUtf8(ex.message().c_str()));
      if (active_.load()) {
        EmitError(WideToUtf8(ex.message().c_str()));
      }
    } catch (...) {
      SpeechLog("Loop unknown exception");
      if (active_.load()) {
        EmitError("Speech recognition failed");
      }
    }

    active_ = false;
    recognizer_ready_ = false;
    {
      std::lock_guard<std::mutex> lock(recognizer_mutex_);
      recognizer_ = nullptr;
    }
    SpeechLog(used_sapi ? "RecognitionLoop end (SAPI)"
                        : "RecognitionLoop end");
    EmitStatus("ended");
  }

  std::mutex mutex_;
  std::mutex recognizer_mutex_;
  std::mutex warm_mutex_;
  std::unique_ptr<EventSink<EncodableValue>> event_sink_;
  wmsr::SpeechRecognizer recognizer_{nullptr};
  wmsr::SpeechRecognizer warm_recognizer_{nullptr};
  std::string warm_locale_;
  std::string last_locale_id_;
  std::thread worker_;
  std::atomic<bool> active_{false};
  std::atomic<bool> recognizer_ready_{false};
  std::atomic<bool> emit_enabled_{true};
  std::atomic<bool> winrt_callbacks_alive_{false};
  std::atomic<bool> session_ended_{false};
  ManualResetEvent stop_event_;
  std::string committed_text_;
  std::string startup_error_;
};

class SpeechEventStreamHandler
    : public flutter::StreamHandler<EncodableValue> {
 protected:
  std::unique_ptr<StreamHandlerError<EncodableValue>> OnListenInternal(
      const EncodableValue* arguments,
      std::unique_ptr<EventSink<EncodableValue>>&& events) override {
    SpeechRecognitionHandler::Instance().SetEventSink(std::move(events));
    return nullptr;
  }

  std::unique_ptr<StreamHandlerError<EncodableValue>> OnCancelInternal(
      const EncodableValue* arguments) override {
    SpeechRecognitionHandler::Instance().SetEventSink(nullptr);
    return nullptr;
  }
};

void HandleMethodCall(
    const MethodCall<EncodableValue>& call,
    std::unique_ptr<MethodResult<EncodableValue>> result) {
  const auto& method = call.method_name();
  if (method == "isAvailable") {
    result->Success(EncodableValue(true));
    return;
  }
  if (method == "requestPermission") {
    result->Success(EncodableValue(true));
    return;
  }
  if (method == "warmup") {
    std::string locale_id;
    if (call.arguments()) {
      if (const auto* map = std::get_if<EncodableMap>(call.arguments())) {
        const auto it = map->find(EncodableValue("localeId"));
        if (it != map->end()) {
          if (const auto* value = std::get_if<std::string>(&it->second)) {
            locale_id = *value;
          }
        }
      }
    }
    std::string error;
    const bool ok =
        SpeechRecognitionHandler::Instance().Warmup(locale_id, &error);
    result->Success(EncodableValue(ok));
    return;
  }
  if (method == "start") {
    std::string locale_id;
    if (call.arguments()) {
      if (const auto* map = std::get_if<EncodableMap>(call.arguments())) {
        const auto it = map->find(EncodableValue("localeId"));
        if (it != map->end()) {
          if (const auto* value = std::get_if<std::string>(&it->second)) {
            locale_id = *value;
          }
        }
      }
    }
    std::string error;
    const bool ok =
        SpeechRecognitionHandler::Instance().Start(locale_id, &error);
    if (!ok) {
      if (!error.empty()) {
        SpeechRecognitionHandler::Instance().EmitError(error);
      }
      result->Error("start_failed", error);
      return;
    }
    result->Success(EncodableValue(true));
    return;
  }
  if (method == "stop") {
    SpeechRecognitionHandler::Instance().Stop();
    result->Success();
    return;
  }
  result->NotImplemented();
}

}  // namespace

void RegisterSpeechRecognition(flutter::BinaryMessenger* messenger) {
  constexpr char kMethodChannel[] = "eastmarkhk_crm/speech";
  constexpr char kEventChannel[] = "eastmarkhk_crm/speech_events";

  SpeechLog("RegisterSpeechRecognition");

  auto method = std::make_unique<MethodChannel<EncodableValue>>(
      messenger, kMethodChannel, &flutter::StandardMethodCodec::GetInstance());
  method->SetMethodCallHandler(
      [](const auto& call, auto result) { HandleMethodCall(call, std::move(result)); });

  auto events = std::make_unique<flutter::EventChannel<EncodableValue>>(
      messenger, kEventChannel, &flutter::StandardMethodCodec::GetInstance());
  events->SetStreamHandler(std::make_unique<SpeechEventStreamHandler>());
}
