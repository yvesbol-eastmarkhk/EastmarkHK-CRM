import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../core/utils/rich_notes.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../einvoice_connector.dart';

/// Sélecteur du catalogue e-Invoicing — même rôle que `showProductPicker`
/// côté standalone. Retourne le produit choisi, ou `null` si annulé.
Future<EiProduct?> showEiProductPicker(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  final narrow = MediaQuery.sizeOf(context).width < 600;
  if (narrow) {
    return Navigator.of(context).push<EiProduct>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => const _ProductPickerPage(),
      ),
    );
  }
  return showDialog<EiProduct>(
    context: context,
    builder: (context) => Dialog(
      child: SizedBox(
        width: 920,
        height: 720,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 12, 8),
            child: Row(children: [
              Expanded(
                child: Text(
                  l10n.invCatalogTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ]),
          ),
          Expanded(
            child: _ProductPickerBody(
              onPicked: (p) => Navigator.of(context).pop(p),
            ),
          ),
        ]),
      ),
    ),
  );
}

class _ProductPickerPage extends StatelessWidget {
  const _ProductPickerPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).invCatalogTitle)),
      body: _ProductPickerBody(onPicked: (p) => Navigator.of(context).pop(p)),
    );
  }
}

class _ProductPickerBody extends StatefulWidget {
  const _ProductPickerBody({required this.onPicked});

  final ValueChanged<EiProduct> onPicked;

  @override
  State<_ProductPickerBody> createState() => _ProductPickerBodyState();
}

class _ProductPickerBodyState extends State<_ProductPickerBody> {
  List<EiProduct> _products = [];
  final Map<String, String> _resolved = {};
  bool _loading = true;
  String? _error;
  Timer? _searchDebounce;
  int _loadGen = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String v) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 320), () {
      _load(search: v);
    });
  }

  Future<void> _load({String search = ''}) async {
    final gen = ++_loadGen;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final list =
          await EInvoiceConnector.instance.listProducts(search: search);
      if (!mounted || gen != _loadGen) return;
      setState(() {
        _products = list;
        _loading = false;
      });
      final pending = <String>[
        for (final p in list)
          if (p.mainPhotoPath.isNotEmpty &&
              !_resolved.containsKey(p.mainPhotoPath))
            p.mainPhotoPath,
      ];
      if (pending.isEmpty) return;
      final got =
          await EInvoiceConnector.instance.resolvePhotoPaths(pending);
      if (!mounted || gen != _loadGen || got.isEmpty) return;
      setState(() => _resolved.addAll(got));
    } catch (e) {
      if (!mounted || gen != _loadGen) return;
      setState(() {
        _loading = false;
        _error = '$e';
        _products = const [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: l10n.invCatalogSearch,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          onChanged: _onSearchChanged,
        ),
      ),
      const SizedBox(height: 8),
      Expanded(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(child: Text(_error!, textAlign: TextAlign.center))
                : _products.isEmpty
                    ? Center(
                        child: Text(
                          l10n.invCatalogEmpty,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: _products.length,
                        itemBuilder: (context, i) {
                          final p = _products[i];
                          final key = p.mainPhotoPath;
                          final photo = _resolved[key] ??
                              (key.isNotEmpty && File(key).existsSync()
                                  ? key
                                  : null);
                          final hasPhoto = photo != null;
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: hasPhoto
                                    ? Image.file(File(photo), fit: BoxFit.cover)
                                    : Container(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainerHighest,
                                        child: const Icon(
                                          Icons.inventory_2_outlined,
                                          size: 20,
                                        ),
                                      ),
                              ),
                            ),
                            title: Text(p.name),
                            subtitle: Text(
                              [
                                if (p.ref.isNotEmpty) p.ref,
                                formatAmount(p.salePrice),
                                if (notesPlainText(p.description).isNotEmpty)
                                  notesPlainText(p.description),
                              ].join(' · '),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () => widget.onPicked(p),
                          );
                        },
                      ),
      ),
    ]);
  }
}
