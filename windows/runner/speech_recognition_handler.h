#ifndef RUNNER_SPEECH_RECOGNITION_HANDLER_H_
#define RUNNER_SPEECH_RECOGNITION_HANDLER_H_

namespace flutter {
class BinaryMessenger;
}

/// WinRT speech recognition (Windows 10+) — même canal que macOS :
/// `eastmarkhk_crm/speech` + `eastmarkhk_crm/speech_events`.
void RegisterSpeechRecognition(flutter::BinaryMessenger* messenger);

#endif  // RUNNER_SPEECH_RECOGNITION_HANDLER_H_
