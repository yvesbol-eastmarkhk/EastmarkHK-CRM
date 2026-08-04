import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Langue de l'interface du CRM — indépendante de la langue de dictée
/// (voir DictationSettings). `null` = suit la langue du système.
///
/// Liste volontairement curatée (marchés d'EastmarkHK) plutôt que « toutes
/// les langues de macOS » : chaque langue ajoutée ici implique un travail
/// de traduction des textes de l'app (fichiers .arb), contrairement à la
/// dictée qui s'appuie directement sur le moteur vocal de l'OS.
class AppLocaleSettings extends ChangeNotifier {
  AppLocaleSettings._();
  static final AppLocaleSettings instance = AppLocaleSettings._();

  static const _prefKey = 'app_locale_code';

  /// Toutes les langues proposées pour l'interface — même logique que la
  /// dictée (§ DictationSettings) : on ne se limite pas aux marchés
  /// d'Eastmark, l'app doit pouvoir s'afficher dans n'importe quelle langue
  /// courante. La traduction effective des textes (fichiers .arb) se fait
  /// progressivement ; le réglage et l'infrastructure locale sont complets
  /// dès maintenant pour toutes ces langues.
  static const supported = <(String code, String label)>[
    ('fr', 'Français'),
    ('en', 'English'),
    ('nl', 'Nederlands'),
    ('de', 'Deutsch'),
    ('es', 'Español'),
    ('pt', 'Português (Portugal)'),
    ('pt_BR', 'Português (Brasil)'),
    ('it', 'Italiano'),
    ('zh', '中文'),
    ('ja', '日本語'),
    ('ko', '한국어'),
    ('th', 'ไทย'),
    ('vi', 'Tiếng Việt'),
    ('id', 'Bahasa Indonesia'),
    ('ms', 'Bahasa Melayu'),
    ('ru', 'Русский'),
    ('uk', 'Українська'),
    ('pl', 'Polski'),
    ('tr', 'Türkçe'),
    ('ar', 'العربية'),
    ('he', 'עברית'),
    ('hi', 'हिन्दी'),
    ('bn', 'বাংলা'),
    ('ta', 'தமிழ்'),
    ('te', 'తెలుగు'),
    ('mr', 'मराठी'),
    ('gu', 'ગુજરાતી'),
    ('kn', 'ಕನ್ನಡ'),
    ('ml', 'മലയാളം'),
    ('pa', 'ਪੰਜਾਬੀ'),
    ('ur', 'اردو'),
    ('el', 'Ελληνικά'),
    ('sv', 'Svenska'),
    ('da', 'Dansk'),
    ('no', 'Norsk'),
    ('fi', 'Suomi'),
    ('cs', 'Čeština'),
    ('ro', 'Română'),
    ('hu', 'Magyar'),
    ('sk', 'Slovenčina'),
    ('bg', 'Български'),
    ('hr', 'Hrvatski'),
    ('sr', 'Српски'),
    ('sw', 'Kiswahili'),
    ('fil', 'Filipino'),
  ];

  Locale? _locale;
  Locale? get locale => _locale;

  /// Code stocké / affiché : `fr`, `pt`, `pt_BR`…
  String? get localeCode {
    if (_locale == null) return null;
    return toCode(_locale!);
  }

  bool _loaded = false;

  /// Parse `pt_BR` / `pt-BR` → Locale('pt','BR'), sinon Locale(code).
  static Locale parseLocale(String code) {
    final parts = code.trim().replaceAll('-', '_').split('_');
    if (parts.length >= 2 && parts[1].isNotEmpty) {
      return Locale(parts[0].toLowerCase(), parts[1].toUpperCase());
    }
    return Locale(parts.first.toLowerCase());
  }

  static String toCode(Locale locale) {
    final c = locale.countryCode;
    if (c == null || c.isEmpty) return locale.languageCode;
    return '${locale.languageCode}_$c';
  }

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefKey);
    // Par défaut (première installation), suit la langue du système —
    // le choix explicite de l'utilisateur dans Réglages reste prioritaire.
    _locale = code == null ? null : parseLocale(code);
    _loaded = true;
  }

  Future<void> setLocale(String? code) async {
    _locale = code == null ? null : parseLocale(code);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    if (code == null) {
      await prefs.remove(_prefKey);
    } else {
      await prefs.setString(_prefKey, toCode(_locale!));
    }
  }

  /// [systemLanguageLabel] = `AppLocalizations.systemLanguage` (langue UI).
  String currentLabel(String systemLanguageLabel) {
    if (_locale == null) return systemLanguageLabel;
    final code = toCode(_locale!);
    for (final s in supported) {
      if (s.$1 == code) return s.$2;
    }
    // Ancien réglage `pt` sans région.
    for (final s in supported) {
      if (s.$1 == _locale!.languageCode) return s.$2;
    }
    return code;
  }
}
