/// Notes enrichies stockées en **HTML** : `notes` reste un simple champ
/// TEXT en base, mais le contenu est directement exploitable ailleurs plus
/// tard — affichage sur crm.eastmarkhk.com, export PDF… — sans réécrire un
/// interpréteur propriétaire côté serveur.
///
/// Le rendu passe par un vrai parseur HTML5 (`package:html`, pur Dart,
/// sans code natif — aucun risque côté build Xcode/Android, contrairement
/// à un package d'édition riche type flutter_quill) plutôt qu'un
/// analyseur maison à base de RegExp : ça permet de coller du HTML réel
/// (généré par un autre outil, avec commentaires, entités `&eacute;`,
/// attributs `style="..."`, `<thead>`/`<tbody>`/`<caption>`…) et de
/// l'afficher correctement, en plus des balises produites par la barre
/// d'outils (`<b>`, `<i>`, `<u>`, `<s>`, `<code>`,
/// `<span style="color:#RRGGBB">`, `<h1>`/`<h2>`, `<blockquote>`,
/// `<ul>`/`<ol>` + `<li>`, `<pre>`, `<table>`).
///
/// [buildRichNoteBlocks] rend ce HTML en widgets Flutter pour l'aperçu —
/// seul un sous-ensemble pragmatique du CSS en ligne est interprété
/// (couleur, fond, gras, italique, souligné/barré, taille, alignement) ;
/// le reste des propriétés (ombres, bordures fines, border-radius…) est
/// ignoré sans faire planter le rendu.
library;

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;

import '../../l10n/gen/app_localizations.dart';

/// True si [html] est vide ou ne contient que des balises vides Jodit
/// (`<p><br></p>`, `&nbsp;`, etc.).
bool isBlankNotesHtml(String? html) {
  if (html == null) return true;
  final trimmed = html.trim();
  if (trimmed.isEmpty) return true;
  try {
    final text = html_parser.parseFragment(trimmed).text ?? '';
    return text.replaceAll(RegExp(r'[\s\u00A0]+'), '').isEmpty;
  } catch (_) {
    return trimmed.isEmpty;
  }
}

/// Renvoie [html] trimé, ou `null` s'il est vide / sans contenu visible.
String? notesHtmlOrNull(String? html) {
  final trimmed = html?.trim();
  if (trimmed == null || isBlankNotesHtml(trimmed)) return null;
  return trimmed;
}

/// Texte brut d'une note HTML (aperçu liste, recherche…) — sans balises.
String notesPlainText(String? html) {
  if (html == null || html.trim().isEmpty) return '';
  try {
    final text = html_parser.parseFragment(html).text ?? '';
    return text.replaceAll(RegExp(r'[\s\u00A0]+'), ' ').trim();
  } catch (_) {
    return html.replaceAll(RegExp(r'<[^>]*>'), ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}

/// Marqueur du titre produit dans une description de ligne devis/facture.
const kLineTitleAttr = 'data-emhk-line-title';

String _escapeHtmlAttr(String s) => s
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;');

/// Compose HTML ligne : titre produit (fort, marqué) + corps Jodit.
String composeLineDescriptionHtml({
  required String title,
  required String bodyHtml,
}) {
  final t = title.trim();
  final titlePart = t.isEmpty
      ? ''
      : '<p $kLineTitleAttr="1"><strong>${_escapeHtmlAttr(t)}</strong></p>';
  var body = bodyHtml.trim();
  // Retire un éventuel titre déjà présent dans le corps.
  body = splitLineDescriptionHtml(body).bodyHtml.trim();
  if (isBlankNotesHtml(body)) return titlePart;
  if (titlePart.isEmpty) return body;
  return '$titlePart$body';
}

/// Découpe une description de ligne en titre apparent + corps HTML.
({String title, String bodyHtml}) splitLineDescriptionHtml(String? html) {
  final raw = (html ?? '').trim();
  if (raw.isEmpty) return (title: '', bodyHtml: '');

  // Format actuel : <p data-emhk-line-title="1"><strong>…</strong></p>…
  try {
    final fragment = html_parser.parseFragment(raw);
    String title = '';
    final bodyNodes = <dom.Node>[];
    for (final node in fragment.nodes) {
      if (node is dom.Element &&
          node.localName == 'p' &&
          node.attributes[kLineTitleAttr] == '1' &&
          title.isEmpty) {
        title = node.text.replaceAll(RegExp(r'\s+'), ' ').trim();
        continue;
      }
      bodyNodes.add(node);
    }
    if (title.isNotEmpty) {
      return (title: title, bodyHtml: _serializeHtmlNodes(bodyNodes));
    }
  } catch (_) {}

  // Ancien format plain : « Nom (REF)\nDescription… »
  if (!raw.contains('<')) {
    final nl = raw.indexOf('\n');
    if (nl >= 0) {
      return (
        title: raw.substring(0, nl).trim(),
        bodyHtml: '<p>${_escapeHtmlAttr(raw.substring(nl + 1).trim())}</p>',
      );
    }
    return (title: raw, bodyHtml: '');
  }

  // HTML sans marqueur : premier <p><strong>…</strong></p> = titre.
  try {
    final fragment = html_parser.parseFragment(raw);
    String title = '';
    final bodyNodes = <dom.Node>[];
    for (final node in fragment.nodes) {
      if (title.isEmpty &&
          node is dom.Element &&
          node.localName == 'p' &&
          node.children.length == 1 &&
          node.children.first.localName == 'strong') {
        title = node.text.replaceAll(RegExp(r'\s+'), ' ').trim();
        continue;
      }
      bodyNodes.add(node);
    }
    if (title.isNotEmpty) {
      return (title: title, bodyHtml: _serializeHtmlNodes(bodyNodes));
    }
  } catch (_) {}

  return (title: '', bodyHtml: raw);
}

String _serializeHtmlNodes(List<dom.Node> nodes) {
  final buf = StringBuffer();
  for (final n in nodes) {
    if (n is dom.Element) {
      buf.write(n.outerHtml);
    } else if (n is dom.Text) {
      buf.write(n.data);
    }
  }
  return buf.toString().trim();
}

/// Aperçu lecture seule d'une note HTML (client, tâche…).
Widget buildNotesPreview(BuildContext context, String html, {TextStyle? style}) {
  final base = style ?? Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: buildRichNoteBlocks(context, html, base),
  );
}

/// Balises traitées comme des blocs (leur propre ligne/widget) — tout le
/// reste est considéré comme du texte en ligne et regroupé en paragraphes.
const _blockTags = {
  'table',
  'ul',
  'ol',
  'h1',
  'h2',
  'h3',
  'blockquote',
  'pre',
  'p',
  'div',
};

/// Découpe [source] en blocs (paragraphes / titres / citation / listes /
/// tableau) et les rend en widgets — un `Table` ou une liste ont besoin
/// d'un widget dédié, ils ne peuvent pas être de simples `InlineSpan` au
/// milieu d'un `Text.rich`.
List<Widget> buildRichNoteBlocks(BuildContext context, String source, TextStyle baseStyle) {
  final widgets = <Widget>[];
  try {
    final fragment = html_parser.parseFragment(source);
    _renderNodes(context, fragment.nodes, widgets, baseStyle);
  } catch (_) {
    // Filet de sécurité : si jamais un texte particulièrement tordu fait
    // trébucher le parseur, on affiche au moins le texte brut plutôt que
    // de faire planter la fenêtre d'aperçu.
    widgets.add(Text(source, style: baseStyle));
  }
  return widgets;
}

/// Parcourt une liste de nœuds au même niveau, regroupant le texte/les
/// éléments en ligne en paragraphes et sortant les éléments de bloc
/// (table, listes, titres…) en widgets dédiés.
void _renderNodes(BuildContext context, List<dom.Node> nodes, List<Widget> out, TextStyle baseStyle) {
  final buffer = <dom.Node>[];

  void flush() {
    if (buffer.isEmpty) return;
    final spans = buffer.expand((n) => _inlineNodeToSpans(n, baseStyle)).toList();
    buffer.clear();
    final hasText = spans.any((s) => s is TextSpan && (s.text?.trim().isNotEmpty ?? false));
    if (!hasText) return;
    out.add(Text.rich(TextSpan(children: spans)));
    out.add(const SizedBox(height: 8));
  }

  for (final node in nodes) {
    if (node is dom.Comment) continue; // <!-- ... --> ignoré, jamais affiché
    if (node is dom.Text) {
      if (node.data.trim().isEmpty && buffer.isEmpty) continue;
      buffer.add(node);
      continue;
    }
    if (node is dom.Element) {
      if (_blockTags.contains(node.localName)) {
        flush();
        out.add(_renderElement(context, node, baseStyle));
        out.add(const SizedBox(height: 8));
      } else {
        buffer.add(node);
      }
    }
  }
  flush();
}

Widget _renderElement(BuildContext context, dom.Element node, TextStyle baseStyle) {
  final scheme = Theme.of(context).colorScheme;
  switch (node.localName) {
    case 'table':
      return _renderTableElement(context, node, baseStyle);
    case 'ul':
      return _renderListElement(node, baseStyle, ordered: false);
    case 'ol':
      return _renderListElement(node, baseStyle, ordered: true);
    case 'h1':
      return _paragraphWidget(
          node.nodes, baseStyle.copyWith(fontWeight: FontWeight.bold, fontSize: (baseStyle.fontSize ?? 14) + 6));
    case 'h2':
      return _paragraphWidget(
          node.nodes, baseStyle.copyWith(fontWeight: FontWeight.bold, fontSize: (baseStyle.fontSize ?? 14) + 3));
    case 'h3':
      return _paragraphWidget(
          node.nodes, baseStyle.copyWith(fontWeight: FontWeight.bold, fontSize: (baseStyle.fontSize ?? 14) + 1));
    case 'blockquote':
      return Container(
        padding: const EdgeInsets.only(left: 12, top: 2, bottom: 2),
        decoration: BoxDecoration(border: Border(left: BorderSide(width: 3, color: scheme.outlineVariant))),
        child: _paragraphWidget(
          node.nodes,
          baseStyle.copyWith(fontStyle: FontStyle.italic, color: baseStyle.color?.withValues(alpha: 0.7)),
        ),
      );
    case 'pre':
      // Bloc de code : texte tel quel (les balises internes, ex.
      // <pre><code>…</code></pre>, ne sont pas interprétées — le contenu
      // doit rester littéral), police à chasse fixe, fond distinct façon
      // Tiny/GitHub.
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: Text(
          _plainText(node).replaceAll(RegExp(r'^\n+'), '').replaceAll(RegExp(r'\n+$'), ''),
          style: baseStyle.copyWith(fontFamily: 'monospace', fontSize: (baseStyle.fontSize ?? 14) - 1),
        ),
      );
    case 'p':
    case 'div':
      // Simple conteneur de bloc : on redescend récursivement (peut
      // contenir aussi bien du texte que d'autres blocs).
      final children = <Widget>[];
      _renderNodes(context, node.nodes, children, baseStyle);
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: children);
    default:
      return _paragraphWidget(node.nodes, baseStyle);
  }
}

Widget _paragraphWidget(List<dom.Node> nodes, TextStyle style) {
  return Text.rich(TextSpan(children: nodes.expand((n) => _inlineNodeToSpans(n, style)).toList()));
}

/// Concatène le texte de tous les nœuds descendants (équivalent maison du
/// `textContent` du DOM) — utilisé pour les blocs de code, où le contenu
/// doit rester littéral plutôt que ré-interprété comme des spans stylés.
String _plainText(dom.Node node) {
  if (node is dom.Text) return node.data;
  if (node is dom.Element) {
    final buf = StringBuffer();
    for (final child in node.nodes) {
      buf.write(_plainText(child));
    }
    return buf.toString();
  }
  return '';
}

List<InlineSpan> _inlineNodeToSpans(dom.Node node, TextStyle style) {
  if (node is dom.Comment) return const [];
  if (node is dom.Text) {
    return [TextSpan(text: node.data, style: style)];
  }
  if (node is dom.Element) {
    if (node.localName == 'br') return const [TextSpan(text: '\n')];
    var childStyle = style;
    switch (node.localName) {
      case 'b':
      case 'strong':
        childStyle = style.copyWith(fontWeight: FontWeight.bold);
        break;
      case 'i':
      case 'em':
        childStyle = style.copyWith(fontStyle: FontStyle.italic);
        break;
      case 'u':
        childStyle = style.copyWith(decoration: TextDecoration.underline);
        break;
      case 's':
      case 'del':
      case 'strike':
        childStyle = style.copyWith(decoration: TextDecoration.lineThrough);
        break;
      case 'code':
        childStyle = style.copyWith(
          fontFamily: 'monospace',
          fontSize: (style.fontSize ?? 14) - 1,
          backgroundColor: const Color(0x1F000000),
        );
        break;
      case 'span':
      case 'font':
        childStyle = _applyInlineCss(node.attributes['style'], style);
        break;
      default:
        break;
    }
    return node.nodes.expand((n) => _inlineNodeToSpans(n, childStyle)).toList();
  }
  return const [];
}

Widget _renderListElement(dom.Element list, TextStyle baseStyle, {required bool ordered}) {
  final items = list.children.where((e) => e.localName == 'li').toList();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var i = 0; i < items.length; i++)
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 22, child: Text(ordered ? '${i + 1}.' : '•', style: baseStyle)),
              Expanded(
                child: Text.rich(
                    TextSpan(children: items[i].nodes.expand((n) => _inlineNodeToSpans(n, baseStyle)).toList())),
              ),
            ],
          ),
        ),
    ],
  );
}

Widget _renderTableElement(BuildContext context, dom.Element table, TextStyle baseStyle) {
  final scheme = Theme.of(context).colorScheme;
  // querySelectorAll aplatit <thead>/<tbody>/<tfoot> automatiquement — on
  // récupère toutes les lignes dans l'ordre du document sans se soucier
  // de leur regroupement.
  final rows = table.querySelectorAll('tr');
  if (rows.isEmpty) return const SizedBox.shrink();

  final parsedRows = <({bool isHeader, List<dom.Element> cells})>[];
  var cols = 0;
  for (final tr in rows) {
    final cells = tr.children.where((e) => e.localName == 'th' || e.localName == 'td').toList();
    if (cells.isEmpty) continue;
    final isHeader = cells.every((e) => e.localName == 'th');
    cols = cells.length > cols ? cells.length : cols;
    parsedRows.add((isHeader: isHeader, cells: cells));
  }
  if (cols == 0) return const SizedBox.shrink();

  final captionEl = table.querySelector('caption');

  Widget cellWidget(dom.Element cellEl) {
    final css = cellEl.attributes['style'];
    final align = _cssTextAlign(css);
    final bg = _cssBackgroundColor(css);
    var style = _applyInlineCss(css, baseStyle);
    if (cellEl.localName == 'th') style = style.copyWith(fontWeight: FontWeight.bold);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: bg,
      child: Text.rich(
        TextSpan(children: cellEl.nodes.expand((n) => _inlineNodeToSpans(n, style)).toList()),
        textAlign: align,
      ),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (captionEl != null) ...[
        Text.rich(TextSpan(
            children: captionEl.nodes
                .expand((n) => _inlineNodeToSpans(n, baseStyle.copyWith(fontWeight: FontWeight.w600)))
                .toList())),
        const SizedBox(height: 4),
      ],
      Table(
        border: TableBorder.all(color: scheme.outlineVariant),
        columnWidths: {for (var c = 0; c < cols; c++) c: const FlexColumnWidth()},
        children: [
          for (final row in parsedRows)
            TableRow(
              decoration:
                  row.isHeader ? BoxDecoration(color: scheme.primaryContainer.withValues(alpha: 0.5)) : null,
              children: [
                for (var c = 0; c < cols; c++)
                  c < row.cells.length ? cellWidget(row.cells[c]) : const SizedBox.shrink(),
              ],
            ),
        ],
      ),
    ],
  );
}

/// Applique un sous-ensemble pragmatique de `style="..."` (couleur, fond,
/// gras, italique, souligné/barré, taille) — le reste (ombres, bordures,
/// border-radius, box-shadow…) n'a pas d'équivalent texte simple et est
/// ignoré sans erreur.
TextStyle _applyInlineCss(String? css, TextStyle base) {
  if (css == null || css.trim().isEmpty) return base;
  var style = base;
  for (final decl in css.split(';')) {
    final idx = decl.indexOf(':');
    if (idx < 0) continue;
    final prop = decl.substring(0, idx).trim().toLowerCase();
    final value = decl.substring(idx + 1).trim();
    switch (prop) {
      case 'color':
        final c = _parseCssColor(value);
        if (c != null) style = style.copyWith(color: c);
        break;
      case 'font-weight':
        final n = int.tryParse(value);
        if (value == 'bold' || value == 'bolder' || (n != null && n >= 600)) {
          style = style.copyWith(fontWeight: FontWeight.bold);
        }
        break;
      case 'font-style':
        if (value == 'italic' || value == 'oblique') style = style.copyWith(fontStyle: FontStyle.italic);
        break;
      case 'text-decoration':
      case 'text-decoration-line':
        if (value.contains('line-through')) {
          style = style.copyWith(decoration: TextDecoration.lineThrough);
        } else if (value.contains('underline')) {
          style = style.copyWith(decoration: TextDecoration.underline);
        }
        break;
      case 'font-size':
        final size = _parseCssFontSize(value);
        if (size != null) style = style.copyWith(fontSize: size);
        break;
    }
  }
  return style;
}

double? _parseCssFontSize(String value) {
  final px = RegExp(r'^([\d.]+)\s*px$').firstMatch(value);
  if (px != null) return double.tryParse(px.group(1)!);
  final rem = RegExp(r'^([\d.]+)\s*rem$').firstMatch(value);
  if (rem != null) {
    final base = double.tryParse(rem.group(1)!);
    return base == null ? null : base * 16;
  }
  final pt = RegExp(r'^([\d.]+)\s*pt$').firstMatch(value);
  if (pt != null) {
    final base = double.tryParse(pt.group(1)!);
    return base == null ? null : base * 96 / 72;
  }
  return null;
}

TextAlign _cssTextAlign(String? css) {
  if (css == null) return TextAlign.left;
  final m = RegExp(r'text-align\s*:\s*(\w+)').firstMatch(css);
  switch (m?.group(1)) {
    case 'center':
      return TextAlign.center;
    case 'right':
      return TextAlign.right;
    case 'justify':
      return TextAlign.justify;
    default:
      return TextAlign.left;
  }
}

Color? _cssBackgroundColor(String? css) {
  if (css == null) return null;
  final m = RegExp(r'background-color\s*:\s*([^;]+)').firstMatch(css);
  if (m == null) return null;
  return _parseCssColor(m.group(1)!.trim());
}

Color? _parseCssColor(String value) {
  final v = value.trim();
  final hex = RegExp(r'^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$').firstMatch(v);
  if (hex != null) {
    var h = hex.group(1)!;
    if (h.length == 3) h = h.split('').map((c) => '$c$c').join();
    return Color(int.parse('FF$h', radix: 16));
  }
  final rgb = RegExp(r'^rgba?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*(?:,\s*([\d.]+))?\)$').firstMatch(v);
  if (rgb != null) {
    final r = int.parse(rgb.group(1)!);
    final g = int.parse(rgb.group(2)!);
    final b = int.parse(rgb.group(3)!);
    final a = rgb.group(4) != null ? (double.parse(rgb.group(4)!) * 255).round() : 255;
    return Color.fromARGB(a, r, g, b);
  }
  return null;
}

/// Insère un tableau HTML 3 colonnes / 2 lignes au curseur — les titres de
/// colonnes ("Titre 1"…) sont à éditer directement dans le texte.
void insertTableTemplate(TextEditingController c) {
  const template = '\n<table>'
      '<tr><th>Titre 1</th><th>Titre 2</th><th>Titre 3</th></tr>'
      '<tr><td>ligne 1</td><td>ligne 1</td><td>ligne 1</td></tr>'
      '<tr><td>ligne 2</td><td>ligne 2</td><td>ligne 2</td></tr>'
      '</table>\n';
  final sel = c.selection;
  final text = c.text;
  final insertAt = sel.isValid ? sel.start : text.length;
  final newText = text.substring(0, insertAt) + template + text.substring(insertAt);
  c.value = TextEditingValue(
      text: newText, selection: TextSelection.collapsed(offset: insertAt + template.length));
}

/// Palette de couleurs proposée dans la barre d'outils.
const richNoteColors = <Color>[
  Color(0xFFD32F2F), // rouge
  Color(0xFFF57C00), // orange
  Color(0xFFFBC02D), // ambre
  Color(0xFF388E3C), // vert
  Color(0xFF00897B), // teal
  Color(0xFF1976D2), // bleu
  Color(0xFF5E35B1), // indigo
  Color(0xFFC2185B), // fuchsia (cohérent avec la couleur des contacts)
  Color(0xFF6D4C41), // marron
  Color(0xFF424242), // gris foncé
];

/// Ouvre un petit sélecteur de couleurs (grille de pastilles) — pas de
/// dépendance externe, juste une palette fixe suffisante pour annoter un
/// texte (urgent en rouge, à valider en orange…).
Future<Color?> showRichNoteColorPicker(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return showDialog<Color>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l10n.richColorPickerTitle),
      content: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          for (final c in richNoteColors)
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => Navigator.pop(ctx, c),
              child: CircleAvatar(radius: 18, backgroundColor: c),
            ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.commonCancel)),
      ],
    ),
  );
}
