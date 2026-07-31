import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Éditeur de notes riches — vrai éditeur WYSIWYG (Jodit, licence MIT)
/// embarqué dans une WebView locale (assets/jodit/, auto-hébergé, sans CDN
/// ni clé de licence).
///
/// Sur macOS, WKWebView ne relaie pas toujours ⌘C/⌘V au contenu web : quand
/// l'éditeur a le focus (signal JS), les raccourcis sont interceptés côté
/// Flutter et relayés via JavaScript.
class JoditEditor extends StatefulWidget {
  const JoditEditor({super.key, required this.initialHtml});

  final String initialHtml;

  @override
  State<JoditEditor> createState() => JoditEditorState();
}

class _EditorPasteIntent extends Intent {
  const _EditorPasteIntent();
}

class _EditorCopyIntent extends Intent {
  const _EditorCopyIntent();
}

class _EditorCutIntent extends Intent {
  const _EditorCutIntent();
}

class _EditorSelectAllIntent extends Intent {
  const _EditorSelectAllIntent();
}

class JoditEditorState extends State<JoditEditor> {
  late final WebViewController _webController;
  late String _currentHtml;
  bool _loadFailed = false;
  bool _editorFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _currentHtml = widget.initialHtml;
    _webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterReady',
        onMessageReceived: (_) {
          final encoded = _jsStringLiteral(widget.initialHtml);
          _webController.runJavaScript('setEditorContent($encoded);');
        },
      )
      ..addJavaScriptChannel(
        'FlutterChange',
        onMessageReceived: (message) => _currentHtml = message.message,
      )
      ..addJavaScriptChannel(
        'FlutterFocus',
        onMessageReceived: (message) {
          if (!mounted) return;
          final focused = message.message == 'focus';
          if (_editorFocused != focused) {
            setState(() => _editorFocused = focused);
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (_) {
            if (mounted) setState(() => _loadFailed = true);
          },
        ),
      )
      ..loadFlutterAsset('assets/jodit/editor.html');
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String _jsStringLiteral(String s) {
    final escaped = s
        .replaceAll(r'\', r'\\')
        .replaceAll("'", r"\'")
        .replaceAll('\n', r'\n')
        .replaceAll('\r', '')
        .replaceAll('</script>', '<\\/script>');
    return "'$escaped'";
  }

  String _unwrapJsString(dynamic raw) {
    if (raw is! String) return raw.toString();
    if (raw.startsWith('"') && raw.endsWith('"')) {
      return jsonDecode(raw) as String;
    }
    return raw;
  }

  String getHtml() => _currentHtml;

  void _activateEditor() {
    FocusManager.instance.primaryFocus?.unfocus();
    _focusNode.requestFocus();
    _webController.runJavaScript('focusEditor();');
  }

  Future<void> _pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text;
    if (text == null || text.isEmpty) return;
    final encoded = _jsStringLiteral(text);
    await _webController.runJavaScript('pasteAtCursor($encoded);');
  }

  Future<void> _copyFromEditor() async {
    try {
      final raw = await _webController.runJavaScriptReturningResult('copySelectionToClipboard()');
      final parsed = jsonDecode(_unwrapJsString(raw)) as Map<String, dynamic>;
      final text = (parsed['text'] as String?)?.trim() ?? '';
      final html = (parsed['html'] as String?)?.trim() ?? '';
      if (text.isEmpty && html.isEmpty) return;
      await Clipboard.setData(ClipboardData(text: text.isNotEmpty ? text : html));
    } catch (_) {
      if (_currentHtml.isNotEmpty) {
        await Clipboard.setData(ClipboardData(text: _currentHtml));
      }
    }
  }

  Future<void> _cutFromEditor() async {
    try {
      final raw = await _webController.runJavaScriptReturningResult('cutSelection()');
      final parsed = jsonDecode(_unwrapJsString(raw)) as Map<String, dynamic>;
      final text = (parsed['text'] as String?)?.trim() ?? '';
      final html = (parsed['html'] as String?)?.trim() ?? '';
      if (text.isEmpty && html.isEmpty) return;
      await Clipboard.setData(ClipboardData(text: text.isNotEmpty ? text : html));
    } catch (_) {}
  }

  Future<void> _selectAllInEditor() async {
    await _webController.runJavaScript('selectAllContent();');
  }

  Map<ShortcutActivator, Intent> get _shortcuts => _editorFocused
      ? {
          const SingleActivator(LogicalKeyboardKey.keyV, meta: true): const _EditorPasteIntent(),
          const SingleActivator(LogicalKeyboardKey.keyV, control: true): const _EditorPasteIntent(),
          const SingleActivator(LogicalKeyboardKey.keyC, meta: true): const _EditorCopyIntent(),
          const SingleActivator(LogicalKeyboardKey.keyC, control: true): const _EditorCopyIntent(),
          const SingleActivator(LogicalKeyboardKey.keyX, meta: true): const _EditorCutIntent(),
          const SingleActivator(LogicalKeyboardKey.keyX, control: true): const _EditorCutIntent(),
          const SingleActivator(LogicalKeyboardKey.keyA, meta: true): const _EditorSelectAllIntent(),
          const SingleActivator(LogicalKeyboardKey.keyA, control: true): const _EditorSelectAllIntent(),
        }
      : const {};

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: scheme.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: _loadFailed
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "L'éditeur n'a pas pu se charger. Réessayez, ou vérifiez que "
                  'les fichiers Jodit sont bien inclus dans les assets de l\'app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: scheme.error),
                ),
              ),
            )
          : Focus(
              focusNode: _focusNode,
              child: Shortcuts(
                shortcuts: _shortcuts,
                child: Actions(
                  actions: {
                    _EditorPasteIntent: CallbackAction<_EditorPasteIntent>(
                      onInvoke: (_) {
                        _pasteFromClipboard();
                        return null;
                      },
                    ),
                    _EditorCopyIntent: CallbackAction<_EditorCopyIntent>(
                      onInvoke: (_) {
                        _copyFromEditor();
                        return null;
                      },
                    ),
                    _EditorCutIntent: CallbackAction<_EditorCutIntent>(
                      onInvoke: (_) {
                        _cutFromEditor();
                        return null;
                      },
                    ),
                    _EditorSelectAllIntent: CallbackAction<_EditorSelectAllIntent>(
                      onInvoke: (_) {
                        _selectAllInEditor();
                        return null;
                      },
                    ),
                  },
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerDown: (_) => _activateEditor(),
                    child: WebViewWidget(controller: _webController),
                  ),
                ),
              ),
            ),
    );
  }
}
