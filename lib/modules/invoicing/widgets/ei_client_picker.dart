import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/models/models.dart';
import '../../../l10n/gen/app_localizations.dart';

/// Sélecteur client CRM — modal avec recherche (comme le catalogue produits).
Future<Company?> showEiClientPicker(
  BuildContext context, {
  required List<Company> companies,
  String? selectedId,
}) {
  final l10n = AppLocalizations.of(context);
  final narrow = MediaQuery.sizeOf(context).width < 600;
  if (narrow) {
    return Navigator.of(context).push<Company>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => _ClientPickerPage(
          companies: companies,
          selectedId: selectedId,
        ),
      ),
    );
  }
  return showDialog<Company>(
    context: context,
    builder: (context) => Dialog(
      child: SizedBox(
        width: 720,
        height: 640,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 12, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.invPickClientTitle,
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
                ],
              ),
            ),
            Expanded(
              child: _ClientPickerBody(
                companies: companies,
                selectedId: selectedId,
                onPicked: (c) => Navigator.of(context).pop(c),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _ClientPickerPage extends StatelessWidget {
  const _ClientPickerPage({
    required this.companies,
    this.selectedId,
  });

  final List<Company> companies;
  final String? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).invPickClientTitle)),
      body: _ClientPickerBody(
        companies: companies,
        selectedId: selectedId,
        onPicked: (c) => Navigator.of(context).pop(c),
      ),
    );
  }
}

class _ClientPickerBody extends StatefulWidget {
  const _ClientPickerBody({
    required this.companies,
    required this.onPicked,
    this.selectedId,
  });

  final List<Company> companies;
  final String? selectedId;
  final ValueChanged<Company> onPicked;

  @override
  State<_ClientPickerBody> createState() => _ClientPickerBodyState();
}

class _ClientPickerBodyState extends State<_ClientPickerBody> {
  String _query = '';

  List<Company> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return widget.companies;
    return [
      for (final c in widget.companies)
        if (c.name.toLowerCase().contains(q) ||
            (c.vatNumber ?? '').toLowerCase().contains(q) ||
            (c.country ?? '').toLowerCase().contains(q))
          c,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final list = _filtered;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: l10n.invPickClientSearch,
              border: const OutlineInputBorder(),
              isDense: true,
            ),
            onChanged: (v) => setState(() => _query = v),
          ),
        ),
        Expanded(
          child: list.isEmpty
              ? Center(child: Text(l10n.invPickClientEmpty))
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final c = list[i];
                    final selected = c.id == widget.selectedId;
                    return ListTile(
                      selected: selected,
                      leading: Icon(
                        selected
                            ? Icons.business
                            : Icons.business_outlined,
                      ),
                      title: Text(c.name),
                      subtitle: Text(
                        [
                          if ((c.vatNumber ?? '').isNotEmpty) c.vatNumber!,
                          if ((c.country ?? '').isNotEmpty) c.country!,
                        ].join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () => widget.onPicked(c),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
