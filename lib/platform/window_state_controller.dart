import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';

import '../core/services/window_state_settings.dart';

/// Fenêtre bureau (macOS, Windows) : restaure au démarrage la taille et la
/// position sauvegardées par le client, puis mémorise chaque déplacement /
/// redimensionnement / maximisation / plein écran pour les prochaines
/// ouvertures. Sans sauvegarde, la taille par défaut du XIB (800×600) est
/// conservée telle quelle.
class WindowStateController extends WindowListener {
  WindowStateController._();
  static final WindowStateController instance = WindowStateController._();

  /// Taille minimale de la fenêtre — évite de perdre la fenêtre hors de
  /// portée après une restauration sur un écran plus petit que celui où la
  /// taille avait été enregistrée.
  static const _minSize = Size(700, 500);

  bool _restoring = false;
  Timer? _debounce;

  /// À appeler une fois, dans main(), après WidgetsFlutterBinding.
  Future<void> init() async {
    if (!_isDesktop) return;
    await WindowStateSettings.instance.ensureLoaded();
    await windowManager.ensureInitialized();

    // macOS : barre système masquée, boutons ●●● visibles — le logo EastmarkHK
    // se centre dans notre barre Flutter (voir AppShell).
    if (Platform.isMacOS) {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: true,
      );
    }

    final saved = WindowStateSettings.instance.savedBounds;
    final options = WindowOptions(
      // Sans sauvegarde : pas de size fourni → le XIB (800×600) s'applique.
      size: saved?.size,
      center: false,
      minimumSize: _minSize,
      titleBarStyle: Platform.isMacOS ? TitleBarStyle.hidden : TitleBarStyle.normal,
    );

    windowManager.addListener(this);

    await windowManager.waitUntilReadyToShow(options, () async {
      _restoring = true;
      try {
        if (saved != null) {
          await windowManager.setBounds(saved);
        }
        if (WindowStateSettings.instance.fullScreen) {
          await windowManager.setFullScreen(true);
        } else if (WindowStateSettings.instance.maximized) {
          await windowManager.maximize();
        }
      } finally {
        _restoring = false;
      }
      await windowManager.show();
      await windowManager.focus();
    });
  }

  bool get _isDesktop =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows);

  Future<void> _save() async {
    if (_restoring) return;
    final bounds = await windowManager.getBounds();
    final maximized = await windowManager.isMaximized();
    final fullScreen = await windowManager.isFullScreen();
    await WindowStateSettings.instance.save(
      bounds: bounds,
      maximized: maximized,
      fullScreen: fullScreen,
    );
  }

  void _scheduleSave() {
    if (_restoring) return;
    _debounce?.cancel();
    // Les événements « resized » / « moved » arrivent en rafale pendant le
    // redimensionnement/déplacement ; on attend la fin du geste avant de
    // lire les bounds finaux.
    _debounce = Timer(const Duration(milliseconds: 250), _save);
  }

  @override
  void onWindowResized() => _scheduleSave();

  @override
  void onWindowMoved() => _scheduleSave();

  @override
  void onWindowMaximize() => _scheduleSave();

  @override
  void onWindowUnmaximize() => _scheduleSave();

  @override
  void onWindowEnterFullScreen() => _scheduleSave();

  @override
  void onWindowLeaveFullScreen() => _scheduleSave();
}
