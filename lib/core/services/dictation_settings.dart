import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// Entrée curatée pour le sélecteur (évite speech_to_text à l'ouverture).
typedef DictationLocaleOption = ({String id, String label});

/// Langue de dictée — indépendante de la langue d'interface.
///
/// Sur desktop, `speech_to_text.initialize()` peut planter : le sélecteur
/// utilise donc [curatedLocales]. Le moteur natif n'est touché qu'à la
/// demande (mobile), et toujours dans un try/catch.
class DictationSettings extends ChangeNotifier {
  DictationSettings._();
  static final DictationSettings instance = DictationSettings._();

  static const _prefKey = 'dictation_locale_id';

  /// Locales BCP-47 courants pour la reconnaissance vocale.
  static const curatedLocales = <DictationLocaleOption>[
    (id: 'fr_FR', label: 'Français (France)'),
    (id: 'fr_BE', label: 'Français (Belgique)'),
    (id: 'fr_CH', label: 'Français (Suisse)'),
    (id: 'en_GB', label: 'English (UK)'),
    (id: 'en_US', label: 'English (US)'),
    (id: 'nl_BE', label: 'Nederlands (België)'),
    (id: 'nl_NL', label: 'Nederlands (Nederland)'),
    (id: 'de_DE', label: 'Deutsch'),
    (id: 'es_ES', label: 'Español'),
    (id: 'pt_PT', label: 'Português (Portugal)'),
    (id: 'pt_BR', label: 'Português (Brasil)'),
    (id: 'it_IT', label: 'Italiano'),
    (id: 'zh_CN', label: '中文 (简体)'),
    (id: 'zh_TW', label: '中文 (繁體)'),
    (id: 'ja_JP', label: '日本語'),
    (id: 'ko_KR', label: '한국어'),
    (id: 'th_TH', label: 'ไทย'),
    (id: 'vi_VN', label: 'Tiếng Việt'),
    (id: 'id_ID', label: 'Bahasa Indonesia'),
    (id: 'ms_MY', label: 'Bahasa Melayu'),
    (id: 'ru_RU', label: 'Русский'),
    (id: 'uk_UA', label: 'Українська'),
    (id: 'pl_PL', label: 'Polski'),
    (id: 'tr_TR', label: 'Türkçe'),
    (id: 'ar_SA', label: 'العربية'),
    (id: 'he_IL', label: 'עברית'),
    (id: 'hi_IN', label: 'हिन्दी'),
    (id: 'sv_SE', label: 'Svenska'),
    (id: 'da_DK', label: 'Dansk'),
    (id: 'nb_NO', label: 'Norsk'),
    (id: 'fi_FI', label: 'Suomi'),
    (id: 'cs_CZ', label: 'Čeština'),
    (id: 'ro_RO', label: 'Română'),
    (id: 'hu_HU', label: 'Magyar'),
    (id: 'el_GR', label: 'Ελληνικά'),
    (id: 'fil_PH', label: 'Filipino'),
  ];

  String? _localeId;
  String? get localeId => _localeId;

  bool _loaded = false;
  List<LocaleName> _available = [];
  List<LocaleName> get available => _available;

  final SpeechToText speech = SpeechToText();
  bool _speechReady = false;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _localeId = prefs.getString(_prefKey);
    _loaded = true;
  }

  /// Initialise le moteur (mobile) — jamais bloquant, jamais crash.
  Future<List<LocaleName>> loadAvailableLocales() async {
    final desktop = !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux);
    if (desktop) return [];

    try {
      if (!_speechReady) {
        _speechReady = await speech.initialize();
      }
      if (!_speechReady) return [];
      _available = await speech.locales();
      return _available;
    } catch (_) {
      _speechReady = false;
      return [];
    }
  }

  Future<void> setLocale(String? id) async {
    _localeId = id;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    if (id == null) {
      await prefs.remove(_prefKey);
    } else {
      await prefs.setString(_prefKey, id);
    }
  }

  /// Locale réellement utilisée pour la dictée (jamais un hardcode FR).
  /// `null` / « langue du système » → locale appareil (`PlatformDispatcher`).
  String effectiveLocaleId() {
    final chosen = _localeId?.trim();
    if (chosen != null && chosen.isNotEmpty) return chosen;
    return localeIdFromSystem();
  }

  /// Mappe la locale OS (ex. en_US, en_GB) vers un id speech_to_text.
  static String localeIdFromSystem() {
    final loc = PlatformDispatcher.instance.locale;
    final lang = loc.languageCode.toLowerCase();
    final country = (loc.countryCode ?? '').toUpperCase();
    final exact = country.isEmpty ? lang : '${lang}_$country';

    for (final l in curatedLocales) {
      if (l.id.replaceAll('-', '_').toLowerCase() ==
          exact.replaceAll('-', '_').toLowerCase()) {
        return l.id;
      }
    }
    for (final l in curatedLocales) {
      if (l.id.split('_').first.toLowerCase() == lang) return l.id;
    }
    // Dernier recours : anglais, pas français.
    return 'en_US';
  }

  String currentLabel() {
    if (_localeId == null) {
      final sys = localeIdFromSystem();
      final code = sys.split('_').first.toUpperCase();
      return 'Langue du système ($code)';
    }
    for (final l in curatedLocales) {
      if (l.id == _localeId) return l.label;
    }
    final match = _available.where((l) => l.localeId == _localeId);
    return match.isEmpty ? _localeId! : match.first.name;
  }

  /// Code court affiché à côté du micro (FR, EN, NL, ZH…).
  String shortCode() {
    final id = effectiveLocaleId();
    final lang = id.replaceAll('-', '_').split('_').first;
    return lang.toUpperCase();
  }
}
