import 'package:dart_quill_delta/dart_quill_delta.dart' show Delta;
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill_delta_from_html/flutter_quill_delta_from_html.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart' as d2h;

import '../utils/rich_notes.dart';

/// Éditeur de notes riches — deux modes complémentaires plutôt qu'un seul
/// WYSIWYG universel :
///
/// - Contenu « simple » (texte formaté au fil de la frappe, listes,
///   tableau simple créé via le bouton Tableau) → vrai éditeur WYSIWYG
///   (flutter_quill), façon Tiny.
/// - Tableau HTML « réel » collé depuis ailleurs (avec `<thead>`/`<tbody>`,
///   styles par cellule…) → **aperçu en lecture seule fidèle**, rendu par
///   notre propre moteur HTML (`rich_notes.dart`, basé sur un vrai parseur
///   HTML5) plutôt que par Quill. Testé en pratique : le format Quill
///   "Delta" n'a qu'un support basique des tableaux et aplatit ce genre de
///   contenu (structure et couleurs perdues) — l'aperçu fidèle passe donc
///   à côté de Quill pour ce cas précis. Le code source, lui, reste
///   toujours éditable et n'est jamais touché par ce détour.
///
/// Stockage inchangé : le contenu reste du HTML, jamais du Delta.
///
/// Bouton `</>` : bascule entre la vue formatée (WYSIWYG ou aperçu lecture
/// seule selon le cas) et le code source HTML brut.
class QuillNotesEditor extends StatefulWidget {
  const QuillNotesEditor({super.key, required this.initialHtml});

  final String initialHtml;

  @override
  State<QuillNotesEditor> createState() => QuillNotesEditorState();
}

class QuillNotesEditorState extends State<QuillNotesEditor> {
  late quill.QuillController _controller;
  late TextEditingController _sourceController;
  bool _sourceMode = false;
  // Message affiché quand du HTML simple n'a pas pu être chargé dans
  // l'éditeur WYSIWYG (balises incomplètes…) — voir _toggleSource.
  String? _toggleError;

  @override
  void initState() {
    super.initState();
    _sourceController = TextEditingController(text: widget.initialHtml);
    if (_looksLikeComplexTable(widget.initialHtml)) {
      // Tableau HTML réel : pas d'édition WYSIWYG fiable possible (voir
      // doc de la classe) — un contrôleur Quill basique suffit, il ne sert
      // que si l'utilisateur bascule un jour sur du contenu simple.
      // L'affichage par défaut est l'aperçu fidèle en lecture seule.
      _controller = quill.QuillController.basic();
      return;
    }
    try {
      _controller = quill.QuillController(
        document: quill.Document.fromDelta(_htmlToDelta(widget.initialHtml)),
        selection: const TextSelection.collapsed(offset: 0),
      );
    } catch (_) {
      // Contenu existant déjà mal formé pour une raison quelconque : on
      // ouvre directement en mode source plutôt que de faire planter tout
      // le dialogue — l'utilisateur voit au moins son texte et peut le
      // corriger ou l'enregistrer tel quel.
      _controller = quill.QuillController.basic();
      _sourceMode = true;
    }
  }

  /// Heuristique : un tableau avec en-tête de section (`<thead>`/`<tbody>`)
  /// ou plusieurs cellules stylées en ligne — le genre de HTML « réel »
  /// généré par un autre outil, par opposition au `<table><tr><th>` tout
  /// simple produit par notre propre bouton Tableau. Seul ce second cas
  /// passe correctement par le convertisseur HTML→Delta de Quill.
  bool _looksLikeComplexTable(String html) {
    final lower = html.toLowerCase();
    if (!lower.contains('<table')) return false;
    return lower.contains('<thead') ||
        lower.contains('<tbody') ||
        'style='.allMatches(lower).length > 3;
  }

  @override
  void dispose() {
    _controller.dispose();
    _sourceController.dispose();
    super.dispose();
  }

  Delta _htmlToDelta(String html) {
    if (html.trim().isEmpty) return Delta()..insert('\n');
    try {
      return HtmlToDelta().convert(html);
    } catch (_) {
      // HTML trop inhabituel pour être décomposé en Delta : on le montre
      // au moins tel quel comme texte plutôt que de perdre le contenu.
      return Delta()..insert('$html\n');
    }
  }

  String _deltaToHtml() {
    try {
      final ops = _controller.document.toDelta().toJson() as List;
      final rawOps = List<Map<String, dynamic>>.from(
        ops.map((e) => Map<String, dynamic>.from(e as Map)),
      );
      return d2h.QuillDeltaToHtmlConverter(rawOps).convert();
    } catch (_) {
      return _controller.document.toPlainText();
    }
  }

  /// Contenu HTML actuel — à appeler côté écran parent au moment
  /// d'enregistrer, quel que soit le mode affiché.
  String getHtml() {
    if (_sourceMode || _looksLikeComplexTable(_sourceController.text)) {
      // Mode source, ou aperçu en lecture seule d'un tableau complexe : le
      // texte source est la seule vérité, jamais passé par Quill.
      return _sourceController.text;
    }
    return _deltaToHtml();
  }

  void _toggleSource() {
    setState(() {
      if (_sourceMode) {
        final complex = _looksLikeComplexTable(_sourceController.text);
        if (!complex) {
          // Contenu simple : on tente de le charger dans l'éditeur WYSIWYG
          // pour permettre l'édition riche en direct.
          try {
            _controller.document = quill.Document.fromDelta(_htmlToDelta(_sourceController.text));
            _toggleError = null;
          } catch (e) {
            _toggleError = "Ce HTML n'a pas pu être interprété : $e\n"
                'Le texte reste tel quel ci-dessous — Enregistrer le sauvegardera quand même.';
            return; // reste en mode source, rien n'est perdu
          }
        }
        // Pour un tableau complexe, aucune conversion : on bascule
        // directement vers l'aperçu en lecture seule (rich_notes.dart),
        // fidèle, sans jamais toucher au texte source.
        _sourceMode = false;
      } else {
        if (!_looksLikeComplexTable(_sourceController.text)) {
          _sourceController.text = _deltaToHtml();
        }
        // Sinon (tableau complexe déjà affiché en aperçu lecture seule) :
        // le texte source n'a jamais été modifié, rien à resynchroniser.
        _sourceMode = true;
        _toggleError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final complex = _looksLikeComplexTable(_sourceController.text);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _sourceMode
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Code source HTML — un nouveau clic sur </> réinterprète ce texte.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  : complex
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Aperçu (lecture seule) — cliquez sur </> pour modifier le HTML.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      : quill.QuillSimpleToolbar(
                          controller: _controller,
                          config: const quill.QuillSimpleToolbarConfig(
                            // Les boutons Code en ligne / Bloc de code de
                            // Quill font doublon avec le bouton </> (à
                            // droite de cette barre) qui bascule vers le
                            // vrai code source HTML — seul ce dernier est
                            // utile ici.
                            showInlineCode: false,
                            showCodeBlock: false,
                            // Alignement du texte — masqué par défaut dans
                            // flutter_quill, activé explicitement.
                            showAlignmentButtons: true,
                          ),
                        ),
            ),
            IconButton(
              tooltip: _sourceMode ? 'Revenir à la vue formatée' : 'Voir le code source (HTML)',
              icon: Icon(_sourceMode ? Icons.wysiwyg_outlined : Icons.code),
              onPressed: _toggleSource,
            ),
          ],
        ),
        if (_toggleError != null) ...[
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: scheme.errorContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(_toggleError!, style: TextStyle(color: scheme.onErrorContainer, fontSize: 12)),
          ),
        ],
        const SizedBox(height: 4),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: scheme.outlineVariant),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(4),
            child: _sourceMode
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: _sourceController,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  )
                : complex
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: buildRichNoteBlocks(
                              context,
                              _sourceController.text,
                              Theme.of(context).textTheme.bodyMedium ?? const TextStyle(),
                            ),
                          ),
                        ),
                      )
                    : quill.QuillEditor.basic(
                        controller: _controller,
                        config: const quill.QuillEditorConfig(),
                      ),
          ),
        ),
      ],
    );
  }
}
