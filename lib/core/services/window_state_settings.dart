import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Mémoire de la taille et de l'emplacement de la fenêtre bureau (macOS,
/// Windows). La taille par défaut — 800×600, celle définie dans le XIB
/// macOS — est utilisée tant que le client n'a pas déplacé/redimensionné
/// la fenêtre ; dès qu'il le fait, la nouvelle taille + position sont
/// sauvegardées et restaurées au prochain lancement.
class WindowStateSettings extends ChangeNotifier {
  WindowStateSettings._();
  static final WindowStateSettings instance = WindowStateSettings._();

  static const _xKey = 'window_x';
  static const _yKey = 'window_y';
  static const _widthKey = 'window_width';
  static const _heightKey = 'window_height';
  static const _maximizedKey = 'window_maximized';
  static const _fullScreenKey = 'window_fullscreen';

  double? _x;
  double? _y;
  double? _width;
  double? _height;
  bool _maximized = false;
  bool _fullScreen = false;
  bool _loaded = false;

  /// `true` si une position + taille ont déjà été sauvegardées (le client a
  /// déplacé ou redimensionné la fenêtre au moins une fois).
  bool get hasSavedBounds =>
      _loaded && _x != null && _y != null && _width != null && _height != null;

  Rect? get savedBounds =>
      hasSavedBounds ? Rect.fromLTWH(_x!, _y!, _width!, _height!) : null;

  bool get maximized => _maximized;
  bool get fullScreen => _fullScreen;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _x = prefs.getDouble(_xKey);
    _y = prefs.getDouble(_yKey);
    _width = prefs.getDouble(_widthKey);
    _height = prefs.getDouble(_heightKey);
    _maximized = prefs.getBool(_maximizedKey) ?? false;
    _fullScreen = prefs.getBool(_fullScreenKey) ?? false;
    _loaded = true;
  }

  Future<void> save({Rect? bounds, bool? maximized, bool? fullScreen}) async {
    final prefs = await SharedPreferences.getInstance();
    if (bounds != null) {
      _x = bounds.left;
      _y = bounds.top;
      _width = bounds.width;
      _height = bounds.height;
      await prefs.setDouble(_xKey, _x!);
      await prefs.setDouble(_yKey, _y!);
      await prefs.setDouble(_widthKey, _width!);
      await prefs.setDouble(_heightKey, _height!);
    }
    if (maximized != null) {
      _maximized = maximized;
      await prefs.setBool(_maximizedKey, maximized);
    }
    if (fullScreen != null) {
      _fullScreen = fullScreen;
      await prefs.setBool(_fullScreenKey, fullScreen);
    }
  }
}
