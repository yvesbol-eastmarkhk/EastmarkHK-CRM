import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Modules achetés / licenciés mais volontairement masqués du CRM
/// (« Ne pas utiliser dans le CRM »).
class ModuleCrmPrefs extends ChangeNotifier {
  ModuleCrmPrefs._();
  static final ModuleCrmPrefs instance = ModuleCrmPrefs._();

  static const _disabledKey = 'crm_modules_disabled_ids';

  final Set<String> _disabled = {};
  bool _loaded = false;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_disabledKey) ?? const [];
    _disabled
      ..clear()
      ..addAll(raw);
    _loaded = true;
  }

  bool isEnabledInCrm(String moduleId) => !_disabled.contains(moduleId);

  Future<void> setEnabledInCrm(String moduleId, bool enabled) async {
    await ensureLoaded();
    if (enabled) {
      _disabled.remove(moduleId);
    } else {
      _disabled.add(moduleId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_disabledKey, _disabled.toList());
    notifyListeners();
  }
}
