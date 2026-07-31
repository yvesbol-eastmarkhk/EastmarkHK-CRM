import 'package:shared_preferences/shared_preferences.dart';

/// Largeur du rail de navigation (colonne 1) — mémorisée entre les sessions.
class WorkspaceLayoutSettings {
  WorkspaceLayoutSettings._();
  static final WorkspaceLayoutSettings instance = WorkspaceLayoutSettings._();

  static const railMin = 52.0;
  static const railMax = 220.0;

  static const _railKey = 'workspace_rail_width';

  double _railWidth = railMin;
  bool _loaded = false;

  double get railWidth => _railWidth;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _railWidth = (prefs.getDouble(_railKey) ?? railMin).clamp(railMin, railMax);
    _loaded = true;
  }

  Future<void> setRailWidth(double width) async {
    _railWidth = width.clamp(railMin, railMax);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_railKey, _railWidth);
  }
}
