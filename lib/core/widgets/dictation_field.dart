import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../services/dictation_settings.dart';
import 'dictation_language_picker.dart';

/// La correction orthographique native de Flutter (SpellCheckConfiguration)
/// n'a de service disponible que sur iOS/Android — l'activer sur
/// macOS/Windows/Linux fait planter EditableText au premier build faute de
/// spell check service. On la limite donc à ces deux plateformes ; le futur
/// équivalent macOS (NSSpellChecker) demandera un pont natif dédié.
bool get _spellCheckSupported =>
    defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;

/// Champ texte avec dictée on-device — pilier « super facile » du CRM :
/// chaque champ de saisie de l'app utilise ce widget, jamais un TextField nu.
/// Transcription locale (Speech iOS/macOS, SpeechRecognizer Android,
/// Windows Speech) via le plugin speech_to_text.
///
/// La langue de dictée est indépendante de la langue de l'interface —
/// choisie globalement (DictationSettings) parmi toutes les langues
/// installées sur l'appareil. Appui long sur le micro pour la changer.
class DictationField extends StatefulWidget {
  const DictationField({
    super.key,
    required this.controller,
    this.label,
    this.maxLines = 1,
    this.autofocus = false,
    this.expands = false,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? label;
  final int maxLines;
  final bool autofocus;
  final VoidCallback? onChanged;

  /// Remplit toute la hauteur disponible (le parent doit fournir une
  /// contrainte bornée, ex. `Expanded`) — pour les longues zones de notes
  /// dans des modales agrandies. Impose `maxLines: null` (exigence de
  /// Flutter pour `expands`), [maxLines] est alors ignoré.
  final bool expands;

  @override
  State<DictationField> createState() => _DictationFieldState();
}

class _DictationFieldState extends State<DictationField> {
  bool _listening = false;
  String _baseText = '';

  SpeechToText get _speech => DictationSettings.instance.speech;

  Future<void> _toggle() async {
    if (_listening) {
      await _speech.stop();
      if (mounted) setState(() => _listening = false);
      return;
    }
    await DictationSettings.instance.ensureLoaded();
    final available = await _speech.initialize(
      onStatus: (s) {
        if (s == 'done' || s == 'notListening') {
          if (mounted) setState(() => _listening = false);
        }
      },
      onError: (_) {
        if (mounted) setState(() => _listening = false);
      },
    );
    if (!available || !mounted) return;
    _baseText = widget.controller.text;
    setState(() => _listening = true);
    await _speech.listen(
      localeId: DictationSettings.instance.localeId,
      listenOptions: SpeechListenOptions(partialResults: true),
      onResult: (r) {
        final sep = _baseText.isEmpty ? '' : ' ';
        widget.controller.text = '$_baseText$sep${r.recognizedWords}';
        widget.controller.selection = TextSelection.collapsed(
          offset: widget.controller.text.length,
        );
      },
    );
  }

  Future<void> _pickLanguage() async {
    if (_listening) {
      await _speech.stop();
      if (mounted) setState(() => _listening = false);
    }
    await showDictationLanguagePicker(context);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged != null ? (_) => widget.onChanged!() : null,
      maxLines: widget.expands ? null : widget.maxLines,
      expands: widget.expands,
      textAlignVertical: widget.expands ? TextAlignVertical.top : null,
      autofocus: widget.autofocus,
      // Correction orthographique native de l'OS (souligné + suggestions) —
      // s'ajoute à la dictée pour fiabiliser la saisie. Uniquement iOS/Android
      // (voir _spellCheckSupported) : sur desktop, aucun service de spell
      // check n'est fourni par Flutter et l'activer fait planter le champ.
      spellCheckConfiguration:
          _spellCheckSupported ? const SpellCheckConfiguration() : const SpellCheckConfiguration.disabled(),
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: GestureDetector(
          onLongPress: _pickLanguage,
          child: IconButton(
            tooltip: _listening
                ? 'Arrêter la dictée'
                : 'Dicter (${DictationSettings.instance.currentLabel()}) — appui long pour changer de langue',
            icon: Icon(
              _listening ? Icons.mic : Icons.mic_none,
              color: _listening ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: _toggle,
          ),
        ),
      ),
    );
  }
}
