import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/rich_notes.dart';
import 'dictation_field.dart';
import 'jodit_editor.dart';

/// Windows desktop : pas de WebView2 (Jodit y est instable — surface grise).
bool get notesEditorAvoidsWebView =>
    !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;

/// Éditeur de contenu HTML.
///
/// - **Windows** : texte simple + dictée (pas de WebView2/Jodit).
/// - **macOS / iOS / Android** : [JoditEditor] inchangé, sauf si
///   [plainOnly] est true.
class NotesEditor extends StatefulWidget {
  const NotesEditor({
    super.key,
    required this.initialHtml,
    this.onChanged,
    this.onReady,
    this.plainOnly = false,
  });

  final String initialHtml;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onReady;

  /// Force le champ texte même hors Windows (opt-in).
  final bool plainOnly;

  @override
  State<NotesEditor> createState() => NotesEditorState();
}

class NotesEditorState extends State<NotesEditor> {
  final _joditKey = GlobalKey<JoditEditorState>();
  late final TextEditingController _plain;
  late String _html;

  bool get _usePlain => widget.plainOnly || notesEditorAvoidsWebView;

  @override
  void initState() {
    super.initState();
    _html = widget.initialHtml;
    _plain = TextEditingController(
      text: notesPlainTextMultiline(widget.initialHtml),
    );
    _plain.addListener(_onPlainChanged);
    if (_usePlain) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onReady?.call();
      });
    }
  }

  @override
  void dispose() {
    _plain.removeListener(_onPlainChanged);
    _plain.dispose();
    super.dispose();
  }

  void _onPlainChanged() {
    _html = notesHtmlFromPlainText(_plain.text);
    widget.onChanged?.call(_html);
  }

  String getHtml() {
    if (_usePlain) {
      _html = notesHtmlFromPlainText(_plain.text);
      return _html;
    }
    return _joditKey.currentState?.getHtml() ?? _html;
  }

  Future<String> flushHtml() async {
    if (_usePlain) {
      _html = notesHtmlFromPlainText(_plain.text);
      widget.onChanged?.call(_html);
      return _html;
    }
    final html = await _joditKey.currentState?.flushHtml() ?? getHtml();
    _html = html;
    return html;
  }

  void setHtml(String html) {
    _html = html;
    if (_usePlain) {
      final plain = notesPlainTextMultiline(html);
      if (_plain.text != plain) {
        _plain.value = TextEditingValue(
          text: plain,
          selection: TextSelection.collapsed(offset: plain.length),
        );
      }
      widget.onChanged?.call(_html);
      return;
    }
    _joditKey.currentState?.setHtml(html);
  }

  Widget _plainEditor(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surface,
        border: Border.all(color: scheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 4, 8),
        child: DictationField(
          controller: _plain,
          expands: true,
          keyboardType: TextInputType.multiline,
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_usePlain) return _plainEditor(context);
    return JoditEditor(
      key: _joditKey,
      initialHtml: widget.initialHtml,
      onChanged: (html) {
        _html = html;
        widget.onChanged?.call(html);
      },
      onReady: widget.onReady,
    );
  }
}
