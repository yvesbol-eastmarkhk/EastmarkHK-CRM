import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../core/utils/rich_notes.dart';
import '../../../core/widgets/dictation_field.dart';
import '../../../core/widgets/jodit_editor.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../../theme/crm_tokens.dart';
import '../einvoice_connector.dart';
import 'ei_line_photo_picker.dart';
import 'ei_product_picker.dart';

/// Titre catalogue (+ réf.) bien visible + corps description HTML Jodit.
String _lineDescriptionFromProduct(EiProduct product) {
  final title = product.ref.trim().isEmpty
      ? product.name
      : '${product.name} (${product.ref})';
  return composeLineDescriptionHtml(
    title: title,
    bodyHtml: product.description,
  );
}

/// Couleurs alignées sur e-Invoicing (module facturation CRM).
abstract final class _EiColors {
  static const primary = Color(0xFF1E4D8C);
  static const teal = Color(0xFF2BA89A);
  static const fuchsia = Color(0xFFE6007E);
  static const catalogSave = Color(0xFF2E7D32);
  static const paidSoft = Color(0xFFE6F5F2);
}

/// Éditeur de lignes — miroir e-Invoicing : boutons plein, catalogue,
/// ligne libre, enregistrement catalogue (prix + photos).
class EiLineItemsEditor extends StatefulWidget {
  const EiLineItemsEditor({
    super.key,
    required this.lines,
    required this.onChanged,
    this.vatRate = 0,
  });

  final List<EiLine> lines;
  final VoidCallback onChanged;
  final double vatRate;

  @override
  State<EiLineItemsEditor> createState() => EiLineItemsEditorState();
}

class EiLineItemsEditorState extends State<EiLineItemsEditor> {
  bool get _compact => MediaQuery.sizeOf(context).width < 720;
  final Map<String, String> _resolvedPhotos = {};
  final Map<EiLine, GlobalKey<_LineDescriptionBlockState>> _descKeys = {};

  Future<void> commitEdits() async {
    for (final key in _descKeys.values) {
      await key.currentState?.commit();
    }
  }

  ButtonStyle get _catalogBtnStyle => FilledButton.styleFrom(
        backgroundColor: _EiColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
      );

  ButtonStyle get _addLineBtnStyle => FilledButton.styleFrom(
        backgroundColor: _EiColors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
      );

  @override
  void initState() {
    super.initState();
    _resolvePhotos();
  }

  @override
  void didUpdateWidget(covariant EiLineItemsEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lines != widget.lines) _resolvePhotos();
  }

  Future<void> _resolvePhotos() async {
    for (final l in widget.lines) {
      final key = l.photoPath ?? '';
      if (key.isEmpty || _resolvedPhotos.containsKey(key)) continue;
      final local = await EInvoiceConnector.instance.resolvePhotoPath(key);
      if (local != null) _resolvedPhotos[key] = local;
    }
    if (mounted) setState(() {});
  }

  Future<void> _pickFromCatalog() async {
    final product = await showEiProductPicker(context);
    if (product == null || !mounted) return;

    var photoPath = '';
    final paths = product.photoPaths.where((p) => p.trim().isNotEmpty).toList();
    if (paths.length == 1) {
      photoPath = paths.first;
    } else if (paths.length > 1) {
      final chosen = await showEiLinePhotoPicker(
        context,
        photoPaths: paths,
        selectedPath: product.mainPhotoPath,
      );
      if (chosen == null || !mounted) return;
      photoPath = chosen;
    }

    setState(() {
      widget.lines.add(EiLine(
        description: _lineDescriptionFromProduct(product),
        qty: 1,
        unitPrice: product.salePrice,
        productId: product.id,
        productUuid: product.uuid.isEmpty ? null : product.uuid,
        photoPath: photoPath.isEmpty ? null : photoPath,
      ));
    });
    widget.onChanged();
    _resolvePhotos();
  }

  void _addFreeLine() {
    setState(() => widget.lines.add(EiLine()));
    widget.onChanged();
  }

  Future<void> _pickPhoto(EiLine l) async {
    List<String> paths = [];
    if (l.productUuid != null || l.productId != null) {
      final product = await EInvoiceConnector.instance.findProduct(
        id: l.productId,
        uuid: l.productUuid,
      );
      paths = product?.photoPaths.where((p) => p.trim().isNotEmpty).toList() ??
          [];
    }
    final current = (l.photoPath ?? '').trim();
    if (current.isNotEmpty && !paths.contains(current)) {
      paths = [...paths, current];
    }

    if (!mounted) return;

    // Ligne libre / catalogue sans photo : fichier ou sélecteur.
    if ((l.productUuid == null && l.productId == null) || paths.isEmpty) {
      String? path;
      if (paths.isEmpty) {
        path = await pickLinePhotoFromDevice(context);
      } else {
        path = await showEiLinePhotoPicker(
          context,
          photoPaths: paths,
          selectedPath: current,
          allowChooseNewFile: true,
          allowNone: true,
        );
      }
      if (path == null || !mounted) return;
      final stored = path;
      setState(() => l.photoPath = stored.isEmpty ? null : stored);
      widget.onChanged();
      _resolvePhotos();
      return;
    }

    final chosen = await showEiLinePhotoPicker(
      context,
      photoPaths: paths,
      selectedPath: current,
      allowChooseNewFile: true,
      allowNone: true,
    );
    if (chosen == null || !mounted) return;
    setState(() => l.photoPath = chosen.isEmpty ? null : chosen);
    widget.onChanged();
    _resolvePhotos();
  }

  Future<void> _saveAsProduct(EiLine l) async {
    try {
      final product =
          await EInvoiceConnector.instance.saveLineAsProduct(l);
      if (!mounted) return;
      setState(() {
        l.productId = product.id;
        l.productUuid = product.uuid;
        if (product.photoPaths.isNotEmpty) {
          l.photoPath = product.photoPaths.first;
        }
      });
      widget.onChanged();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).invProductSaved),
      ));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    }
  }

  Future<void> _updateProduct(EiLine l) async {
    try {
      final product =
          await EInvoiceConnector.instance.updateCatalogProductFromLine(l);
      if (!mounted) return;
      setState(() {
        if (product.photoPaths.isNotEmpty) {
          l.photoPath = product.photoPaths.first;
        }
      });
      widget.onChanged();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).invProductUpdated),
      ));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    }
  }

  InputDecoration _dec(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      );

  Widget _descriptionField(EiLine l, {required double photoSize}) {
    final key =
        _descKeys.putIfAbsent(l, () => GlobalKey<_LineDescriptionBlockState>());
    _descKeys.removeWhere((line, _) => !widget.lines.contains(line));
    return _LineDescriptionBlock(
      key: key,
      initialHtml: l.description,
      photo: _photoThumb(l, size: photoSize),
      onChanged: (html) {
        l.description = html;
      },
    );
  }

  Widget _qtyField(EiLine l) => TextFormField(
        initialValue:
            l.qty == 0 ? '' : formatNumber(l.qty, decimals: l.qty % 1 != 0),
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500),
        decoration: _dec('Qté'),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: (v) {
          l.qty = double.tryParse(v.replaceAll(',', '.')) ?? 0;
          setState(() {});
          widget.onChanged();
        },
      );

  Widget _unitPriceField(EiLine l) => TextFormField(
        initialValue: l.unitPrice == 0 ? '' : l.unitPrice.toStringAsFixed(2),
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500),
        decoration: _dec('PU HT'),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: (v) {
          l.unitPrice = double.tryParse(v.replaceAll(',', '.')) ?? 0;
          setState(() {});
          widget.onChanged();
        },
      );

  Widget _unitPriceTvacField(EiLine l) {
    final tvac = l.unitPrice * (1 + widget.vatRate / 100);
    return InputDecorator(
      decoration: _dec('PU TVAC'),
      child: Text(
        formatAmount(tvac),
        textAlign: TextAlign.right,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _totalField(EiLine l) {
    final totalTvac = l.total * (1 + widget.vatRate / 100);
    return InputDecorator(
      decoration: _dec('Total TVAC'),
      child: Text(
        formatAmount(totalTvac),
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: _EiColors.fuchsia,
        ),
      ),
    );
  }

  String? _displayPhoto(EiLine l) {
    final key = l.photoPath ?? '';
    if (key.isEmpty) return null;
    final resolved = _resolvedPhotos[key];
    if (resolved != null) return resolved;
    if (File(key).existsSync()) return key;
    return null;
  }

  Widget _photoThumb(EiLine l, {required double size}) {
    final l10n = AppLocalizations.of(context);
    final path = _displayPhoto(l);
    final has = path != null;
    return Tooltip(
      message: has ? l10n.invChangePhotoTooltip : l10n.invAddPhotoTooltip,
      child: InkWell(
        onTap: () => _pickPhoto(l),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: has
                  ? _EiColors.teal
                  : Color.lerp(_EiColors.teal, CrmTokens.borderLight, 0.5)!,
              width: has ? 1.5 : 1,
            ),
            color: has ? Colors.white : _EiColors.paidSoft,
          ),
          clipBehavior: Clip.antiAlias,
          child: has
              ? Image.file(
                  File(path),
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Icon(
                    Icons.broken_image_outlined,
                    size: size * 0.4,
                    color: CrmTokens.textTertiaryLight,
                  ),
                )
              : Icon(
                  Icons.add_photo_alternate_outlined,
                  size: size * 0.45,
                  color: _EiColors.teal,
                ),
        ),
      ),
    );
  }

  List<Widget> _lineActions(EiLine l, int index) {
    final l10n = AppLocalizations.of(context);
    final linked = l.productUuid != null || l.productId != null;
    final saveBtn = linked
        ? IconButton(
            icon: const Icon(Icons.save_alt),
            tooltip: l10n.invUpdateProductTooltip,
            style: IconButton.styleFrom(
              foregroundColor: _EiColors.catalogSave,
              backgroundColor: _EiColors.catalogSave.withValues(alpha: 0.12),
            ),
            onPressed: () => _updateProduct(l),
          )
        : IconButton(
            icon: const Icon(Icons.inventory_2_outlined),
            tooltip: l10n.invAddToCatalogTooltip,
            style: IconButton.styleFrom(
              foregroundColor: _EiColors.catalogSave,
              backgroundColor: _EiColors.catalogSave.withValues(alpha: 0.12),
            ),
            onPressed: () => _saveAsProduct(l),
          );
    return [
      saveBtn,
      IconButton(
        icon: const Icon(Icons.delete_outline),
        tooltip: l10n.invDeleteLineTooltip,
        style: IconButton.styleFrom(
          backgroundColor: CrmTokens.overdue.withValues(alpha: 0.1),
          foregroundColor: CrmTokens.overdue,
        ),
        onPressed: () {
          setState(() => widget.lines.removeAt(index));
          widget.onChanged();
        },
      ),
    ];
  }

  Widget _addButtons() {
    final l10n = AppLocalizations.of(context);
    final catalog = FilledButton.icon(
      style: _catalogBtnStyle,
      onPressed: _pickFromCatalog,
      icon: const Icon(Icons.inventory_2_outlined, size: 18),
      label: Text(l10n.invAddFromCatalog),
    );
    final addLine = FilledButton.icon(
      style: _addLineBtnStyle,
      onPressed: _addFreeLine,
      icon: const Icon(Icons.add, size: 18),
      label: Text(l10n.invAddFreeLine),
    );
    if (_compact) {
      return Row(children: [
        Expanded(child: catalog),
        const SizedBox(width: 8),
        Expanded(child: addLine),
      ]);
    }
    return Row(children: [
      const Spacer(),
      catalog,
      const SizedBox(width: 8),
      addLine,
    ]);
  }

  Widget _lineRow(int i) {
    final l = widget.lines[i];
    // Cadre en fond seulement — un `shape` avec `side` peint au-dessus
    // et casse le hit-test Jodit sur macOS (flutter/flutter#181257).
    final border =
        Color.lerp(_EiColors.teal, CrmTokens.borderLight, 0.55)!;
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _descriptionField(l, photoSize: _compact ? 72 : 56),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _qtyField(l)),
            const SizedBox(width: 8),
            Expanded(child: _unitPriceField(l)),
            const SizedBox(width: 8),
            Expanded(child: _unitPriceTvacField(l)),
            const SizedBox(width: 8),
            Expanded(child: _totalField(l)),
            if (!_compact) ...[
              const SizedBox(width: 4),
              ..._lineActions(l, i),
            ],
          ],
        ),
        if (_compact) ...[
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 4,
            runSpacing: 4,
            children: _lineActions(l, i),
          ),
        ],
      ],
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(1.5),
        color: border,
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(_compact ? 12 : 10),
            child: body,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _addButtons(),
        const SizedBox(height: 8),
        if (widget.lines.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
              decoration: BoxDecoration(
                color: _EiColors.paidSoft,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color.lerp(_EiColors.teal, Colors.white, 0.55)!,
                ),
              ),
              child: Column(
                children: [
                  Icon(Icons.playlist_add,
                      size: 36,
                      color: _EiColors.teal.withValues(alpha: 0.85)),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context).invEmptyLines,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ),
        for (var i = 0; i < widget.lines.length; i++) _lineRow(i),
      ],
    );
  }
}

/// Nom produit bien visible + description riche (Jodit) en dessous.
class _LineDescriptionBlock extends StatefulWidget {
  const _LineDescriptionBlock({
    super.key,
    required this.initialHtml,
    required this.onChanged,
    required this.photo,
  });

  final String initialHtml;
  final ValueChanged<String> onChanged;
  final Widget photo;

  @override
  State<_LineDescriptionBlock> createState() => _LineDescriptionBlockState();
}

class _LineDescriptionBlockState extends State<_LineDescriptionBlock> {
  late final TextEditingController _title;
  late final String _initialBody;
  final _bodyKey = GlobalKey<JoditEditorState>();
  late bool _bodyExpanded;

  static const _heightCollapsed = 160.0;
  static const _heightExpanded = 520.0;

  @override
  void initState() {
    super.initState();
    final parts = splitLineDescriptionHtml(widget.initialHtml);
    _title = TextEditingController(text: parts.title);
    _initialBody = parts.bodyHtml;
    _bodyExpanded = !isBlankNotesHtml(_initialBody);
    _title.addListener(_emit);
  }

  @override
  void dispose() {
    _title.removeListener(_emit);
    _title.dispose();
    super.dispose();
  }

  Future<void> commit() async {
    final body = await _bodyKey.currentState?.flushHtml() ??
        _bodyKey.currentState?.getHtml() ??
        _initialBody;
    widget.onChanged(
      composeLineDescriptionHtml(title: _title.text, bodyHtml: body),
    );
    final expanded = !isBlankNotesHtml(body);
    if (expanded != _bodyExpanded && mounted) {
      setState(() => _bodyExpanded = expanded);
    }
  }

  void _emit() {
    final body = _bodyKey.currentState?.getHtml() ?? _initialBody;
    widget.onChanged(
      composeLineDescriptionHtml(title: _title.text, bodyHtml: body),
    );
    final expanded = !isBlankNotesHtml(body);
    if (expanded != _bodyExpanded) {
      setState(() => _bodyExpanded = expanded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.photo,
            const SizedBox(width: 12),
            Expanded(
              child: DictationField(
                controller: _title,
                decoration: InputDecoration(
                  labelText: l10n.eiProductLabel,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: Color(0xFF2BA89A),
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          l10n.eiDescriptionLabel,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: _bodyExpanded ? _heightExpanded : _heightCollapsed,
          child: JoditEditor(
            key: _bodyKey,
            initialHtml: _initialBody,
            onChanged: (_) => _emit(),
          ),
        ),
      ],
    );
  }
}
