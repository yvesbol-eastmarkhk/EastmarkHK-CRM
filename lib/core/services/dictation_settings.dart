import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// Langue de dictée choisie par l'utilisateur — indépendante de la langue
/// de l'interface. macOS/iOS/Android exposent chacun leur propre liste de
/// langues installées pour la reconnaissance vocale ; on la lit dynamiquement
/// plutôt que de coder une liste en dur.
///
/// `null` = langue système par défaut (comportement d'origine).
class DictationSettings extends ChangeNotifier {
  DictationSettings._();
  static final DictationSettings instance = DictationSettings._();

  static const _prefKey = 'dictation_locale_id';

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

  /// Initialise le moteur de reconnaissance vocale et récupère les langues
  /// installées sur l'appareil (ex : fr_FR, en_US, nl_BE, pt_BR…).
  Future<List<LocaleName>> loadAvailableLocales() async {
    if (!_speechReady) {
      _speechReady = await speech.initialize();
    }
    if (!_speechReady) return [];
    _available = await speech.locales();
    return _available;
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

  /// Nom lisible de la langue actuellement choisie, pour affichage dans
  /// les réglages ou un badge.
  String currentLabel() {
    if (_localeId == null) return 'Langue du système';
    final match = _available.where((l) => l.localeId == _localeId);
    return match.isEmpty ? _localeId! : match.first.name;
  }
}
