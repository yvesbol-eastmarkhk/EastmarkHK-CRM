import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

import '../db/app_database.dart';
import '../models/models.dart';
import '../services/crm_data_exchange.dart';
import '../screens/company_detail_screen.dart';
import '../../l10n/gen/app_localizations.dart';
import '../utils/file_export.dart';

/// Import / export CSV et vCard — utilisé depuis Réglages et le tableau de bord.
class CrmImportExportPanel extends StatelessWidget {
  const CrmImportExportPanel({super.key, this.compact = false, this.onChanged});

  final bool compact;
  final VoidCallback? onChanged;

  Future<void> _snack(BuildContext context, String msg) {
    return Future.microtask(() {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
      }
    });
  }

  Future<void> _exportCsv(
    BuildContext context,
    String name,
    Future<String> Function() build,
  ) async {
    final l10n = AppLocalizations.of(context);
    try {
      final csv = await build();
      // L'utilisateur choisit le dossier / le nom — pas de fichier temporaire imposé.
      final path = await FileExport.saveText(
        suggestedName: name,
        contents: csv,
        extensions: const ['csv'],
      );
      if (path == null || !context.mounted) return;
      await _snack(context, l10n.importExported(path));
    } catch (e) {
      if (!context.mounted) return;
      await _snack(context, l10n.importExportFailed(e.toString()));
    }
  }

  Future<void> _importCsv(
    BuildContext context,
    String label,
    Future<ImportResult> Function(String) importer,
  ) async {
    final l10n = AppLocalizations.of(context);
    try {
      final typeGroup = XTypeGroup(label: 'csv', extensions: ['csv', 'txt']);
      final file = await openFile(acceptedTypeGroups: [typeGroup]);
      if (file == null) return;
      final content = await File(file.path).readAsString();
      final result = await importer(content);
      onChanged?.call();
      if (!context.mounted) return;
      final err = result.errors.isEmpty ? '' : '\n${result.errors.take(3).join('\n')}';
      await _snack(
        context,
        l10n.importResult(label, result.imported, result.skipped) + err,
      );
    } catch (e) {
      if (!context.mounted) return;
      await _snack(context, l10n.importFailed(e.toString()));
    }
  }

  Future<void> _importVCard(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final companies = await AppDatabase.instance.companies();
    if (!context.mounted) return;
    if (companies.isEmpty) {
      await _snack(context, l10n.importNeedClientFirst);
      return;
    }
    String? companyId = companies.length == 1 ? companies.first.id : null;
    companyId ??= await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: Text(l10n.importTargetClient),
        children: [
          for (final c in companies)
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, c.id),
              child: Text(c.name),
            ),
        ],
      ),
    );
    if (companyId == null || !context.mounted) return;
    try {
      final typeGroup = XTypeGroup(label: 'vcard', extensions: ['vcf', 'vcard']);
      final file = await openFile(acceptedTypeGroups: [typeGroup]);
      if (file == null) return;
      final content = await File(file.path).readAsString();
      final result = await CrmDataExchange.importVCard(content, companyId: companyId);
      onChanged?.call();
      if (!context.mounted) return;
      await _snack(context, l10n.importVcardResult(result.imported));
    } catch (e) {
      if (!context.mounted) return;
      await _snack(context, l10n.importVcardFailed(e.toString()));
    }
  }

  Future<void> _newClient(BuildContext context) async {
    final now = nowIso();
    final draft = Company(id: AppDatabase.newId(), name: '', createdAt: now, updatedAt: now);
    if (!context.mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => CompanyEditorDialog(company: draft, isNew: true),
    );
    if (ok == true) onChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (compact) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          FilledButton.icon(
            onPressed: () => _newClient(context),
            icon: const Icon(Icons.add_business_outlined),
            label: Text(l10n.companyNewButton),
          ),
          OutlinedButton.icon(
            onPressed: () => _importCsv(context, l10n.importExportClients, CrmDataExchange.importCompaniesCsv),
            icon: const Icon(Icons.upload_file_outlined),
            label: Text(l10n.importCsvButton),
          ),
          OutlinedButton(
            onPressed: null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.extension_outlined, size: 18, color: Theme.of(context).disabledColor),
                const SizedBox(width: 8),
                Text(l10n.importModulesSoon, style: TextStyle(color: Theme.of(context).disabledColor)),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.importExportCsvTitle, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OutlinedButton.icon(
              onPressed: () => _exportCsv(context, 'clients.csv', CrmDataExchange.exportCompaniesCsv),
              icon: const Icon(Icons.download_outlined, size: 18),
              label: Text(l10n.importExportClients),
            ),
            OutlinedButton.icon(
              onPressed: () => _exportCsv(context, 'contacts.csv', CrmDataExchange.exportContactsCsv),
              icon: const Icon(Icons.download_outlined, size: 18),
              label: Text(l10n.importExportContacts),
            ),
            OutlinedButton.icon(
              onPressed: () =>
                  _exportCsv(context, 'opportunites.csv', CrmDataExchange.exportOpportunitiesCsv),
              icon: const Icon(Icons.download_outlined, size: 18),
              label: Text(l10n.importExportOpportunities),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(l10n.importTitle, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OutlinedButton.icon(
              onPressed: () => _importCsv(context, l10n.importExportClients, CrmDataExchange.importCompaniesCsv),
              icon: const Icon(Icons.upload_outlined, size: 18),
              label: Text(l10n.importClientsCsv),
            ),
            OutlinedButton.icon(
              onPressed: () => _importCsv(context, l10n.importExportContacts, CrmDataExchange.importContactsCsv),
              icon: const Icon(Icons.upload_outlined, size: 18),
              label: Text(l10n.importContactsCsv),
            ),
            OutlinedButton.icon(
              onPressed: () =>
                  _importCsv(context, l10n.importExportOpportunities, CrmDataExchange.importOpportunitiesCsv),
              icon: const Icon(Icons.upload_outlined, size: 18),
              label: Text(l10n.importOpportunitiesCsv),
            ),
            OutlinedButton.icon(
              onPressed: () => _importVCard(context),
              icon: const Icon(Icons.contact_page_outlined, size: 18),
              label: Text(l10n.importContactsVCard),
            ),
          ],
        ),
      ],
    );
  }
}
