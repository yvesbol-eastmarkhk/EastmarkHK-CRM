import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../l10n/gen/app_localizations.dart';
import '../services/app_locale_settings.dart';
import '../services/desktop_speech_service.dart';
import '../services/dictation_settings.dart';
import '../utils/activity_labels.dart';
import 'dictation_language_picker.dart';

bool get _spellCheckSupported =>
    defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android;

/// Micro actif sur iOS/Android (speech_to_text) et desktop natif (macOS/Windows).
bool get dictationSupported =>
    defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android ||
    defaultTargetPlatform == TargetPlatform.macOS ||
    defaultTargetPlatform == TargetPlatform.windows;

bool get _useNativeSpeech => DesktopSpeechService.instance.isSupported;

/// Champ texte (+ micro uniquement sur plateformes supportées).
class DictationField extends StatefulWidget {
  const DictationField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.maxLines = 1,
    this.autofocus = false,
    this.expands = false,
    this.onChanged,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.enabled = true,
    this.inputFormatters,
    this.textInputAction,
    this.decoration,
    this.style,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final int maxLines;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final bool expands;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextStyle? style;

  @override
  State<DictationField> createState() => _DictationFieldState();
}

class _DictationFieldState extends State<DictationField> {
  bool _listening = false;
  bool _starting = false;
  bool _busy = false;
  String _baseText = '';
  // Incrémenté à chaque (re)démarrage de la dictée — un callback lié à une
  // session précédente (stop puis reprise rapide) est ignoré s'il arrive
  // en retard, pour ne jamais perturber le texte de la session en cours.
  int _dictationGen = 0;

  SpeechToText get _speech => DictationSettings.instance.speech;

  @override
  void initState() {
    super.initState();
    if (_useNativeSpeech) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await DictationSettings.instance.ensureLoaded();
        await AppLocaleSettings.instance.ensureLoaded();
        await DesktopSpeechService.instance.warmup(
          DictationSettings.instance.effectiveLocaleId(),
        );
      });
    }
  }

  @override
  void dispose() {
    // Invalide les callbacks tout de suite — le stop natif peut arriver
    // pendant le pop du dialogue (Save tâche) et ne doit plus toucher l'UI.
    _dictationGen++;
    _listening = false;
    if (_useNativeSpeech) {
      // ignore: unawaited_futures
      DesktopSpeechService.instance.stop();
    } else {
      // ignore: unawaited_futures
      _speech.stop();
    }
    super.dispose();
  }

  Future<void> _toggle() async {
    if (!dictationSupported || _busy) return;
    _busy = true;
    try {
      if (_listening) {
        _dictationGen++;
        try {
          if (_useNativeSpeech) {
            await DesktopSpeechService.instance.stop();
          } else {
            await _speech.stop();
          }
        } catch (_) {}
        if (mounted) setState(() => _listening = false);
        return;
      }

      await DictationSettings.instance.ensureLoaded();
      await AppLocaleSettings.instance.ensureLoaded();

      if (defaultTargetPlatform == TargetPlatform.windows && !_useNativeSpeech) {
        final mic = await Permission.microphone.request();
        if (!mic.isGranted) {
          _showUnavailable();
          return;
        }
      }

      if (_useNativeSpeech) {
        _baseText = widget.controller.text;
        final gen = ++_dictationGen;
        // Orange = préparation ; bleu seulement quand le moteur écoute vraiment
        // (sinon les premiers mots sont perdus pendant le CompileConstraints).
        if (mounted) setState(() {
          _starting = true;
          _listening = false;
        });
        final ok = await DesktopSpeechService.instance.start(
          localeId: DictationSettings.instance.effectiveLocaleId(),
          onResult: (words, {required bool isFinal}) {
            if (!mounted || gen != _dictationGen) return;
            final sep = _baseText.isEmpty ? '' : ' ';
            final next = '$_baseText$sep$words';
            widget.controller.value = TextEditingValue(
              text: next,
              selection: TextSelection.collapsed(offset: next.length),
            );
            widget.onChanged?.call(next);
          },
          onDone: () {
            if (mounted && gen == _dictationGen) {
              setState(() {
                _listening = false;
                _starting = false;
              });
            }
          },
          onError: (message) {
            if (!mounted || gen != _dictationGen) return;
            setState(() {
              _listening = false;
              _starting = false;
            });
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(content: Text(message), duration: const Duration(seconds: 6)),
            );
          },
          onInfo: (message) {
            if (!mounted || gen != _dictationGen) return;
            final l10n = AppLocalizations.of(context);
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(
                content: Text(localizedDictationInfo(l10n, message)),
                duration: const Duration(seconds: 8),
              ),
            );
          },
        );
        if (!mounted) return;
        if (!ok) {
          setState(() {
            _listening = false;
            _starting = false;
          });
          final err = DesktopSpeechService.instance.lastError;
          if (err != null && err.isNotEmpty) {
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(content: Text(err), duration: const Duration(seconds: 6)),
            );
          } else {
            _showUnavailable();
          }
          return;
        }
        setState(() {
          _starting = false;
          _listening = true;
        });
        return;
      }

      bool available = false;
      try {
        available = await _speech.initialize(
          onStatus: (s) {
            if (!mounted) return;
            if (s == 'done' || s == 'notListening') {
              setState(() => _listening = false);
            }
          },
          onError: (_) {
            if (mounted) setState(() => _listening = false);
          },
        );
      } catch (e, st) {
        debugPrint('DictationField.initialize: $e\n$st');
        available = false;
      }

      if (!available || !mounted) {
        _showUnavailable();
        return;
      }

      _baseText = widget.controller.text;
      final gen = ++_dictationGen;
      setState(() => _listening = true);

      try {
        await _speech.listen(
          listenOptions: SpeechListenOptions(
            partialResults: true,
            cancelOnError: true,
            localeId: DictationSettings.instance.effectiveLocaleId(),
          ),
          onResult: (r) {
            if (!mounted || gen != _dictationGen) return;
            final sep = _baseText.isEmpty ? '' : ' ';
            final next = '$_baseText$sep${r.recognizedWords}';
            widget.controller.value = TextEditingValue(
              text: next,
              selection: TextSelection.collapsed(offset: next.length),
            );
            widget.onChanged?.call(next);
          },
        );
      } catch (e, st) {
        debugPrint('DictationField.listen: $e\n$st');
        if (mounted) {
          setState(() => _listening = false);
          _showUnavailable();
        }
      }
    } finally {
      _busy = false;
    }
  }

  void _showUnavailable() {
    if (!mounted) return;
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).dictationUnavailable)),
    );
  }

  Future<void> _pickLanguage() async {
    if (!dictationSupported) return;
    if (_listening) {
      _dictationGen++;
      try {
        if (_useNativeSpeech) {
          await DesktopSpeechService.instance.stop();
        } else {
          await _speech.stop();
        }
      } catch (_) {}
      if (!mounted) return;
      setState(() => _listening = false);
    }
    try {
      await showDictationLanguagePicker(context);
    } catch (e, st) {
      debugPrint('DictationField.pickLanguage: $e\n$st');
    }
    if (mounted) setState(() {});
  }

  Widget? get _mic {
    if (!dictationSupported) return null;
    return ListenableBuilder(
      listenable: DictationSettings.instance,
      builder: (context, _) {
        final l10n = AppLocalizations.of(context);
        final scheme = Theme.of(context).colorScheme;
        final code = DictationSettings.instance.shortCode();
        return GestureDetector(
          onLongPress: _pickLanguage,
          child: Padding(
            // Colle le bloc langue+micro au bord droit du champ.
            padding: const EdgeInsets.only(right: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  code,
                  style: TextStyle(
                    fontSize: 9,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                    color: scheme.onSurfaceVariant.withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(width: 1),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  tooltip: _listening
                      ? l10n.dictationStop
                      : (_starting
                          ? l10n.dictationStarting
                          : l10n.dictationStart),
                  icon: Icon(
                    _listening || _starting ? Icons.mic : Icons.mic_none,
                    size: 22,
                    color: _listening
                        ? scheme.primary
                        : (_starting ? scheme.tertiary : null),
                  ),
                  onPressed: _starting ? null : _toggle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  InputDecoration get _decoration {
    final base = widget.decoration ??
        InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
        );
    final mic = _mic;
    Widget? suffix = base.suffixIcon;
    if (mic != null && suffix != null) {
      suffix = Row(
        mainAxisSize: MainAxisSize.min,
        children: [suffix, mic],
      );
    } else {
      suffix = mic ?? suffix;
    }
    return base.copyWith(
      labelText: widget.label ?? base.labelText,
      hintText: widget.hint ?? base.hintText,
      suffixIcon: suffix,
      // Évite que Flutter réserve une large zone vide autour du suffix.
      suffixIconConstraints: const BoxConstraints(
        minWidth: 40,
        minHeight: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final spell = _spellCheckSupported
        ? const SpellCheckConfiguration()
        : const SpellCheckConfiguration.disabled();

    if (widget.validator != null || widget.onSaved != null) {
      return TextFormField(
        controller: widget.controller,
        onChanged: (v) => widget.onChanged?.call(v),
        onSaved: widget.onSaved,
        validator: widget.validator,
        maxLines: widget.expands ? null : widget.maxLines,
        expands: widget.expands,
        textAlignVertical:
            widget.expands ? TextAlignVertical.top : TextAlignVertical.center,
        autofocus: widget.autofocus,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign,
        textCapitalization: widget.textCapitalization,
        focusNode: widget.focusNode,
        style: widget.style,
        obscureText: widget.obscureText,
        enabled: widget.enabled,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        spellCheckConfiguration: spell,
        decoration: _decoration,
      );
    }

    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      maxLines: widget.expands ? null : widget.maxLines,
      expands: widget.expands,
      textAlignVertical: widget.expands ? TextAlignVertical.top : null,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      textAlign: widget.textAlign,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.focusNode,
      style: widget.style,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.textInputAction,
      spellCheckConfiguration: spell,
      decoration: _decoration,
    );
  }
}

/// Variante [initialValue] (comme [TextFormField]) avec micro de dictée.
class DictationFormField extends StatefulWidget {
  const DictationFormField({
    super.key,
    this.initialValue,
    this.label,
    this.hint,
    this.maxLines = 1,
    this.autofocus = false,
    this.onChanged,
    this.onSaved,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.inputFormatters,
    this.decoration,
  });

  final String? initialValue;
  final String? label;
  final String? hint;
  final int maxLines;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;

  @override
  State<DictationFormField> createState() => _DictationFormFieldState();
}

class _DictationFormFieldState extends State<DictationFormField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DictationField(
      controller: _controller,
      label: widget.label,
      hint: widget.hint,
      maxLines: widget.maxLines,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      textAlign: widget.textAlign,
      validator: widget.validator,
      onSaved: widget.onSaved,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      decoration: widget.decoration,
      onChanged: widget.onChanged,
    );
  }
}
