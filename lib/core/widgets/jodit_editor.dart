import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../l10n/gen/app_localizations.dart';
import '../services/app_locale_settings.dart';
import '../services/desktop_speech_service.dart';
import '../services/dictation_settings.dart';
import '../utils/activity_labels.dart';
import 'dictation_language_picker.dart';

/// Micro actif sur iOS/Android (speech_to_text) et desktop natif (macOS/Windows).
bool get _dictationSupported =>
    defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android ||
    defaultTargetPlatform == TargetPlatform.macOS ||
    defaultTargetPlatform == TargetPlatform.windows;

bool get _useNativeSpeech => DesktopSpeechService.instance.isSupported;

/// Éditeur WYSIWYG Jodit (MIT) dans une WebView locale (`assets/jodit/`).
///
/// Sur macOS, le clavier doit rester au WKWebView (first responder).
/// On évite donc de garder un [FocusNode] Flutter actif pendant la saisie —
/// sinon les frappes n'arrivent jamais dans Jodit. Les raccourcis ⌘C/V/X/A
/// sont relayés seulement quand Jodit signale le focus (canal JS), via un
/// [Shortcuts] parent qui n'appelle pas [FocusNode.requestFocus].
///
/// Le micro de dictée est un **frère** de la WebView (jamais un overlay) :
/// sur macOS tout pixel Flutter peint au-dessus d'une platform view vole
/// le hit-test (flutter/flutter#181257).
class JoditEditor extends StatefulWidget {
  const JoditEditor({
    super.key,
    required this.initialHtml,
    this.onChanged,
    this.onReady,
  });

  final String initialHtml;
  final ValueChanged<String>? onChanged;

  /// Appelé une fois le HTML initial injecté (FlutterReady + setEditorContent).
  final VoidCallback? onReady;

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
  bool _listening = false;
  bool _busy = false;
  /// True après le 1er `setEditorContent` post-FlutterReady.
  /// Avant ça, Jodit peut émettre un `change` vide au boot — il ne faut
  /// pas le remonter (sinon une ligne catalogue devis/facture perd son HTML).
  bool _contentApplied = false;
  /// Overlay loader — ValueNotifier pour ne PAS setState le State parent
  /// (sinon WebView2 Windows est détruite/recréée → flash OK puis gris).
  final ValueNotifier<bool> _showBootOverlay = ValueNotifier(true);
  String _dictationBase = '';
  // Incrémenté à chaque (re)démarrage de la dictée — protège contre un
  // callback tardif d'une session précédente (stop puis reprise rapide).
  int _dictationGen = 0;

  /// Laisse la WebView gagner face au [ListView] parent (scroll + clics).
  static final Set<Factory<OneSequenceGestureRecognizer>> _gestures = {
    Factory<EagerGestureRecognizer>(EagerGestureRecognizer.new),
  };

  SpeechToText get _speech => DictationSettings.instance.speech;

  @override
  void initState() {
    super.initState();
    _currentHtml = widget.initialHtml;
    _webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterReady',
        onMessageReceived: (_) {
          _contentApplied = true;
          // Utilise _currentHtml (peut avoir été mis à jour via setHtml
          // pendant le chargement de la WebView).
          final encoded = _jsStringLiteral(_currentHtml);
          _webController.runJavaScript('setEditorContent($encoded);');
          _showBootOverlay.value = false;
          widget.onReady?.call();
        },
      )
      ..addJavaScriptChannel(
        'FlutterChange',
        onMessageReceived: (message) {
          final next = message.message;
          // Ignore le change vide de boot tant que le contenu initial
          // catalogue / notes n'a pas encore été injecté.
          if (!_contentApplied &&
              next.trim().isEmpty &&
              _currentHtml.trim().isNotEmpty) {
            return;
          }
          _currentHtml = next;
          widget.onChanged?.call(_currentHtml);
        },
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
    _showBootOverlay.dispose();
    if (_listening) {
      // ignore: unawaited_futures
      _speech.stop();
    }
    super.dispose();
  }

  /// Literal JS sûr (JSON) — l’ancien escape manuel cassait le HTML produit
  /// (apostrophes FR, guillemets d’attributs, unicode…) et Jodit affichait
  /// alors un contenu tronqué / faux après choix catalogue.
  String _jsStringLiteral(String s) => jsonEncode(s);

  String _unwrapJsString(dynamic raw) {
    if (raw is! String) return raw.toString();
    if (raw.startsWith('"') && raw.endsWith('"')) {
      return jsonDecode(raw) as String;
    }
    return raw;
  }

  String getHtml() => _currentHtml;

  /// Relit le HTML depuis Jodit (avant sauvegarde).
  Future<String> flushHtml() async {
    try {
      final raw = await _webController
          .runJavaScriptReturningResult('getEditorContent()');
      final html = _unwrapJsString(raw);
      _currentHtml = html;
      widget.onChanged?.call(_currentHtml);
    } catch (_) {}
    return _currentHtml;
  }

  void setHtml(String html) {
    _currentHtml = html;
    _webController.runJavaScript('setEditorContent(${_jsStringLiteral(html)});');
  }

  void _prepareNativeFocus() {
    // Libère le focus Flutter (TextFormField…) pour que WKWebView puisse
    // devenir first responder et recevoir le clavier.
    FocusManager.instance.primaryFocus?.unfocus();
    _webController.runJavaScript('focusEditor();');
  }

  Future<void> _pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text;
    if (text == null || text.isEmpty) return;
    await _webController.runJavaScript('pasteAtCursor(${_jsStringLiteral(text)});');
  }

  /// Utilisé uniquement par la dictée : ajoute toujours à la fin du
  /// contenu existant, sans dépendre de la sélection/du focus de la
  /// WebView (fragile face au bouton micro, widget Flutter voisin).
  Future<void> _pasteText(String text) async {
    if (text.isEmpty) return;
    await _webController.runJavaScript('appendDictationText(${_jsStringLiteral(text)});');
  }

  Future<void> _copyFromEditor() async {
    try {
      final raw = await _webController
          .runJavaScriptReturningResult('copySelectionToClipboard()');
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
      final raw =
          await _webController.runJavaScriptReturningResult('cutSelection()');
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

  Future<void> _toggleDictation() async {
    if (!_dictationSupported || _busy) return;
    _busy = true;
    final l10n = AppLocalizations.of(context);
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
          if (mounted) {
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(content: Text(l10n.dictationUnavailable)),
            );
          }
          return;
        }
      }

      if (_useNativeSpeech) {
        _dictationBase = '';
        final gen = ++_dictationGen;
        await _webController.runJavaScript('focusEditor();');
        // Ne passe en « listening » qu'après démarrage natif (évite perte début).
        final ok = await DesktopSpeechService.instance.start(
          localeId: DictationSettings.instance.effectiveLocaleId(),
          onResult: (words, {required bool isFinal}) {
            if (!mounted || gen != _dictationGen || words.isEmpty) return;
            final prev = _dictationBase;
            _dictationBase = words;
            final addition =
                words.startsWith(prev) ? words.substring(prev.length) : words;
            if (addition.isEmpty) return;
            final toPaste = prev.isEmpty ? addition.trimLeft() : addition;
            if (toPaste.isEmpty) return;
            _pasteText(toPaste);
          },
          onDone: () {
            if (mounted && gen == _dictationGen) setState(() => _listening = false);
          },
          onError: (message) {
            if (!mounted || gen != _dictationGen) return;
            setState(() => _listening = false);
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(content: Text(message), duration: const Duration(seconds: 6)),
            );
          },
          onInfo: (message) {
            if (!mounted || gen != _dictationGen) return;
            final tip = localizedDictationInfo(AppLocalizations.of(context), message);
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(content: Text(tip), duration: const Duration(seconds: 8)),
            );
          },
        );
        if (!ok || !mounted) {
          if (mounted) {
            setState(() => _listening = false);
            final err = DesktopSpeechService.instance.lastError;
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(
              SnackBar(
                content: Text(err?.isNotEmpty == true ? err! : l10n.dictationUnavailable),
                duration: const Duration(seconds: 6),
              ),
            );
          }
          return;
        }
        if (mounted) setState(() => _listening = true);
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
        debugPrint('JoditEditor.dictation.initialize: $e\n$st');
        available = false;
      }

      if (!available || !mounted) {
        if (mounted) {
          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
            SnackBar(content: Text(l10n.dictationUnavailable)),
          );
        }
        return;
      }

      _dictationBase = '';
      final gen = ++_dictationGen;
      await _webController.runJavaScript('focusEditor();');
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
            final words = r.recognizedWords;
            if (words.isEmpty) return;
            // Diff incrémental : n'injecte que le nouveau suffixe.
            final prev = _dictationBase;
            _dictationBase = words;
            final addition = words.startsWith(prev)
                ? words.substring(prev.length)
                : words;
            if (addition.trim().isEmpty && addition.isEmpty) return;
            final toPaste = prev.isEmpty ? addition.trimLeft() : addition;
            if (toPaste.isEmpty) return;
            _pasteText(toPaste);
          },
        );
      } catch (e, st) {
        debugPrint('JoditEditor.dictation.listen: $e\n$st');
        if (mounted) setState(() => _listening = false);
      }
    } finally {
      _busy = false;
    }
  }

  Future<void> _pickDictationLanguage() async {
    if (!_dictationSupported) return;
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
    await showDictationLanguagePicker(context);
    if (mounted) setState(() {});
  }

  Map<ShortcutActivator, Intent> get _shortcuts => _editorFocused
      ? {
          const SingleActivator(LogicalKeyboardKey.keyV, meta: true):
              const _EditorPasteIntent(),
          const SingleActivator(LogicalKeyboardKey.keyV, control: true):
              const _EditorPasteIntent(),
          const SingleActivator(LogicalKeyboardKey.keyC, meta: true):
              const _EditorCopyIntent(),
          const SingleActivator(LogicalKeyboardKey.keyC, control: true):
              const _EditorCopyIntent(),
          const SingleActivator(LogicalKeyboardKey.keyX, meta: true):
              const _EditorCutIntent(),
          const SingleActivator(LogicalKeyboardKey.keyX, control: true):
              const _EditorCutIntent(),
          const SingleActivator(LogicalKeyboardKey.keyA, meta: true):
              const _EditorSelectAllIntent(),
          const SingleActivator(LogicalKeyboardKey.keyA, control: true):
              const _EditorSelectAllIntent(),
        }
      : const {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    // Cadre dessiné en *fond* (couleur + padding) et sans clip : sur macOS,
    // tout pixel peint au-dessus d'une platform view lui vole le hit-test et
    // la WebView devient inerte (flutter/flutter#181257).
    //
    // IMPORTANT Windows : la WebView doit rester au **même** emplacement dans
    // l'arbre (Stack slot 0). La basculer hors/dans un Stack au ready la
    // détruit → contenu OK une fraction de seconde puis surface grise.
    final webView = _loadFailed
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.joditLoadFailed,
                textAlign: TextAlign.center,
                style: TextStyle(color: scheme.error),
              ),
            ),
          )
        : Shortcuts(
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
                onPointerDown: (_) => _prepareNativeFocus(),
                child: WebViewWidget(
                  controller: _webController,
                  gestureRecognizers: _gestures,
                ),
              ),
            ),
          );

    return Container(
      color: scheme.outlineVariant,
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_dictationSupported)
            Material(
              color: scheme.surface,
              child: Align(
                alignment: Alignment.centerRight,
                child: ListenableBuilder(
                  listenable: DictationSettings.instance,
                  builder: (context, _) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _DictationBadge(
                        code: DictationSettings.instance.shortCode(),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onLongPress: _pickDictationLanguage,
                        child: IconButton(
                          tooltip: _listening
                              ? l10n.dictationStop
                              : l10n.dictationStart,
                          icon: Icon(
                            _listening ? Icons.mic : Icons.mic_none,
                            color: _listening ? scheme.primary : null,
                          ),
                          onPressed: _toggleDictation,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Expanded(
            child: ColoredBox(
              color: Colors.white,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  webView,
                  if (!_loadFailed)
                    ValueListenableBuilder<bool>(
                      valueListenable: _showBootOverlay,
                      builder: (context, show, _) {
                        if (!show) return const SizedBox.shrink();
                        return const ColoredBox(
                          color: Colors.white,
                          child: Center(
                            child: SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Petit badge du code de langue de dictée (FR, EN…) avant le micro.
class _DictationBadge extends StatelessWidget {
  const _DictationBadge({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Text(
        code,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: scheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
      ),
    );
  }
}
