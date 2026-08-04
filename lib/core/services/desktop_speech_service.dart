import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Pont Dart → reconnaissance vocale native desktop (macOS Swift, Windows WinRT).
class DesktopSpeechService {
  DesktopSpeechService._();
  static final instance = DesktopSpeechService._();

  static const _method = MethodChannel('eastmarkhk_crm/speech');
  static const _events = EventChannel('eastmarkhk_crm/speech_events');

  StreamSubscription<dynamic>? _sub;
  void Function(String words, {required bool isFinal})? _onResult;
  void Function()? _onDone;
  void Function(String message)? _onError;
  void Function(String message)? _onInfo;
  int _session = 0;
  bool _starting = false;
  bool _userStopped = false;
  bool _offlineTipShown = false;
  bool _listening = false;
  String? _warmLocale;

  bool get isSupported =>
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;

  /// Dernier message d'erreur natif (pour l'UI après un start échoué).
  String? lastError;

  /// Précompile le moteur WinRT (évite de perdre les premiers mots).
  Future<void> warmup(String localeId) async {
    if (!isSupported || defaultTargetPlatform != TargetPlatform.windows) {
      return;
    }
    if (_listening || _starting) return;
    if (_warmLocale == localeId) return;
    try {
      final ok = await _method.invokeMethod<bool>('warmup', {
        'localeId': localeId,
      });
      if (ok == true) _warmLocale = localeId;
    } catch (e, st) {
      debugPrint('DesktopSpeechService.warmup: $e\n$st');
    }
  }

  Future<bool> start({
    required String localeId,
    required void Function(String words, {required bool isFinal}) onResult,
    void Function()? onDone,
    void Function(String message)? onError,
    void Function(String message)? onInfo,
  }) async {
    if (!isSupported) return false;

    lastError = null;
    _userStopped = false;
    if (_listening) {
      await _stopNativeOnly();
    }
    await _sub?.cancel();
    _sub = null;
    _onResult = null;
    _onDone = null;
    _onError = null;
    _onInfo = null;

    final session = ++_session;
    _onResult = onResult;
    _onDone = onDone;
    _onError = onError;
    _onInfo = onInfo;
    _starting = true;

    final streamReady = Completer<void>();
    _sub = _events.receiveBroadcastStream().listen(
      (raw) {
        if (!streamReady.isCompleted) streamReady.complete();
        _handleEvent(raw, session);
      },
      onError: (e) {
        if (!streamReady.isCompleted) streamReady.complete();
        debugPrint('DesktopSpeechService stream error: $e');
        if (session == _session && !_starting && !_userStopped) {
          lastError = e.toString();
          _onError?.call(lastError!);
          _onDone?.call();
        }
      },
    );

    // Ne bloque presque pas : le listen est en général immédiat.
    await streamReady.future.timeout(
      const Duration(milliseconds: 120),
      onTimeout: () {},
    );

    try {
      final ok = await _method.invokeMethod<bool>('start', {
        'localeId': localeId,
      });
      _starting = false;
      final success = ok == true && session == _session;
      _listening = success;
      if (success) {
        _warmLocale = null; // consommé côté natif
        // Signal audible : le moteur est prêt — parlez maintenant.
        SystemSound.play(SystemSoundType.click);
      }
      return success;
    } on PlatformException catch (e, st) {
      debugPrint('DesktopSpeechService.start: $e\n$st');
      _starting = false;
      _listening = false;
      lastError = e.message?.isNotEmpty == true
          ? e.message
          : (e.code.isNotEmpty ? e.code : 'Speech start failed');
      _onError?.call(lastError!);
      await _cleanupAfterFailure(session);
      return false;
    } catch (e, st) {
      debugPrint('DesktopSpeechService.start: $e\n$st');
      _starting = false;
      _listening = false;
      lastError = e.toString();
      _onError?.call(lastError!);
      await _cleanupAfterFailure(session);
      return false;
    }
  }

  Future<void> _cleanupAfterFailure(int session) async {
    if (session != _session) return;
    await _stopNativeOnly();
    await _sub?.cancel();
    _sub = null;
    _onResult = null;
    _onDone = null;
    _onError = null;
    _onInfo = null;
  }

  Future<void> stop() async {
    _userStopped = true;
    _starting = false;
    _listening = false;
    _session++;
    await _stopNativeOnly();
    await _sub?.cancel();
    _sub = null;
    _onResult = null;
    final done = _onDone;
    _onDone = null;
    _onError = null;
    _onInfo = null;
    done?.call();
  }

  Future<void> _stopNativeOnly() async {
    try {
      await _method.invokeMethod<void>('stop');
    } catch (_) {}
  }

  void _handleEvent(dynamic raw, int session) {
    if (session != _session) return;
    final map = _asStringMap(raw);
    if (map == null) return;
    final type = map['type'];
    if (type == 'result') {
      final words = map['words']?.toString() ?? '';
      final isFinal = map['final'] == true || map['final'] == 'true';
      if (words.isNotEmpty) {
        _onResult?.call(words, isFinal: isFinal);
      }
      return;
    }
    if (type == 'status') {
      final status = map['status'];
      if (status == 'listening') {
        _starting = false;
      } else if ((status == 'offlineEngine' || status == 'needsOnlineSpeech') &&
          defaultTargetPlatform == TargetPlatform.windows) {
        if (!_offlineTipShown) {
          _offlineTipShown = true;
          // Code stable — l’UI traduit via localizedDictationInfo.
          _onInfo?.call('tip:offlineEngine');
        }
      } else if (status == 'languageFallback' &&
          defaultTargetPlatform == TargetPlatform.windows) {
        _onInfo?.call('tip:languageFallback');
      } else if (status == 'done' &&
          defaultTargetPlatform == TargetPlatform.macOS) {
        if (!_userStopped) _onDone?.call();
      } else if (status == 'ended' &&
          defaultTargetPlatform == TargetPlatform.windows) {
        if (!_userStopped && !_starting) {
          _listening = false;
          _onDone?.call();
        }
      }
      return;
    }
    if (type == 'error') {
      final message = map['message']?.toString() ?? 'Speech error';
      debugPrint('DesktopSpeechService error: $message');
      lastError = message;
      if (!_starting) {
        _onError?.call(message);
      }
    }
  }

  Map<String, dynamic>? _asStringMap(dynamic raw) {
    if (raw is! Map) return null;
    return raw.map((k, v) => MapEntry(k.toString(), v));
  }
}
