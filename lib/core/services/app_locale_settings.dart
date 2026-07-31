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
    ('pt', 'Português'),
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

  bool _loaded = false;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefKey);
    _locale = code == null ? null : Locale(code);
    _loaded = true;
  }

  Future<void> setLocale(String? code) async {
    _locale = code == null ? null : Locale(code);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    if (code == null) {
      await prefs.remove(_prefKey);
    } else {
      await prefs.setString(_prefKey, code);
    }
  }

  String currentLabel() {
    if (_locale == null) return 'Langue du système';
    final match = supported.where((s) => s.$1 == _locale!.languageCode);
    return match.isEmpty ? _locale!.languageCode : match.first.$2;
  }
}
