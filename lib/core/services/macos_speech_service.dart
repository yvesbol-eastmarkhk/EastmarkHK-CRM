import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Pont Dart → [SpeechRecognitionHandler] natif macOS.
class MacosSpeechService {
  MacosSpeechService._();
  static final instance = MacosSpeechService._();

  static const _method = MethodChannel('eastmarkhk_crm/speech');
  static const _events = EventChannel('eastmarkhk_crm/speech_events');

  StreamSubscription<dynamic>? _sub;
  void Function(String words, {required bool isFinal})? _onResult;
  void Function()? _onDone;

  /// Identifiant de la session d'écoute en cours. Incrémenté à chaque
  /// [stop] — la reconnaissance vocale d'Apple finalise de façon
  /// asynchrone (`endAudio()` puis callback tardif sur une file séparée) :
  /// sans ce garde-fou, un résultat "final" tardif de l'ancienne session
  /// peut arriver après le démarrage d'une nouvelle session (stop puis
  /// reprise rapide de la dictée) et perturber le texte en cours de
  /// rédaction. Tout événement dont la session ne correspond plus à
  /// [_session] est silencieusement ignoré.
  int _session = 0;

  bool get isSupported => defaultTargetPlatform == TargetPlatform.macOS;

  Future<bool> start({
    required String localeId,
    required void Function(String words, {required bool isFinal}) onResult,
    void Function()? onDone,
  }) async {
    if (!isSupported) return false;
    await stop();
    final session = ++_session;
    _onResult = onResult;
    _onDone = onDone;
    _sub = _events.receiveBroadcastStream().listen(
      (raw) => _handleEvent(raw, session),
      onError: (_) {
        if (session == _session) _onDone?.call();
      },
    );
    try {
      final ok = await _method.invokeMethod<bool>('start', {
        'localeId': localeId,
      });
      return ok == true;
    } catch (e, st) {
      debugPrint('MacosSpeechService.start: $e\n$st');
      await stop();
      return false;
    }
  }

  Future<void> stop() async {
    // Invalide immédiatement toute session précédente — avant même l'appel
    // natif — pour qu'un événement déjà en vol ne puisse plus rien changer.
    _session++;
    try {
      await _method.invokeMethod<void>('stop');
    } catch (_) {}
    await _sub?.cancel();
    _sub = null;
    _onResult = null;
    final done = _onDone;
    _onDone = null;
    done?.call();
  }

  void _handleEvent(dynamic raw, int session) {
    if (session != _session) return;
    if (raw is! Map) return;
    final type = raw['type']?.toString();
    if (type == 'result') {
      final words = raw['words']?.toString() ?? '';
      final isFinal = raw['final'] == true;
      _onResult?.call(words, isFinal: isFinal);
      if (isFinal) {
        _onDone?.call();
      }
    } else if (type == 'status') {
      final status = raw['status']?.toString();
      if (status == 'done' || status == 'notListening') {
        _onDone?.call();
      }
    } else if (type == 'error') {
      _onDone?.call();
    }
  }
}
