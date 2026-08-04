import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Éditeur de notes riches — vrai TinyMCE embarqué dans une WebView locale
/// (assets/tinymce/, auto-hébergé, sans CDN ni clé API cloud).
///
/// Pourquoi une WebView plutôt qu'un widget Flutter « façon Tiny » (voir
/// l'historique de rich_notes.dart / quill_notes_editor.dart, laissés en
/// place mais plus utilisés) : aucun package d'édition riche natif Flutter
/// (flutter_quill compris) ne sait éditer un tableau HTML réel — cellules,
/// couleurs, redimensionnement de colonnes — de façon fiable. TinyMCE le
/// fait nativement, en JavaScript, dans son propre bac à sable ; on
/// l'embarque tel quel plutôt que de réinventer une partie de ses
/// fonctionnalités en Dart.
///
/// Stockage inchangé : le contenu échangé avec Dart (au chargement et à
/// l'enregistrement) est toujours du HTML brut, jamais un format
/// intermédiaire propriétaire.
class TinyMceEditor extends StatefulWidget {
  const TinyMceEditor({super.key, required this.initialHtml});

  final String initialHtml;

  @override
  State<TinyMceEditor> createState() => TinyMceEditorState();
}

class TinyMceEditorState extends State<TinyMceEditor> {
  late final WebViewController _webController;
  // Mis à jour à chaque modification dans l'éditeur (canal JS
  // FlutterChange) — évite d'avoir à interroger la WebView de façon
  // asynchrone au moment d'enregistrer : getHtml() reste synchrone, comme
  // pour l'ancien éditeur, donc rien à changer côté écran appelant.
  late String _currentHtml;
  bool _loadFailed = false;

  @override
  void initState() {
    super.initState();
    _currentHtml = widget.initialHtml;
    _webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // Pas de setBackgroundColor sur macOS (UnimplementedError opaque).
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
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (_) {
            if (mounted) setState(() => _loadFailed = true);
          },
        ),
      )
      ..loadFlutterAsset('assets/tinymce/editor.html');
  }

  /// Échappe une chaîne Dart en littéral JavaScript sûr (guillemets,
  /// retours à la ligne, etc.) pour l'injecter dans un appel
  /// `runJavaScript` sans dépendre de `dart:convert` juste pour ça.
  String _jsStringLiteral(String s) {
    final escaped = s
        .replaceAll(r'\', r'\\')
        .replaceAll("'", r"\'")
        .replaceAll('\n', r'\n')
        .replaceAll('\r', '')
        .replaceAll('</script>', '<\\/script>');
    return "'$escaped'";
  }

  /// Contenu HTML actuel — à appeler côté écran parent au moment
  /// d'enregistrer.
  String getHtml() => _currentHtml;

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
                  'les fichiers TinyMCE sont bien inclus dans les assets de l\'app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: scheme.error),
                ),
              ),
            )
          : WebViewWidget(controller: _webController),
    );
  }
}
