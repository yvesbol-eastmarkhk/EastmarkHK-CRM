import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../db/app_database.dart';
import '../models/models.dart';
import '../services/crm_data_exchange.dart';
import '../screens/company_detail_screen.dart';

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

  Future<void> _exportCsv(BuildContext context, String name, Future<String> Function() build) async {
    try {
      final csv = await build();
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$name');
      await file.writeAsString(csv);
      await Share.shareXFiles([XFile(file.path)], text: 'Export EastmarkHK CRM — $name');
    } catch (e) {
      await _snack(context, 'Export impossible : $e');
    }
  }

  Future<void> _importCsv(
    BuildContext context,
    String label,
    Future<ImportResult> Function(String) importer,
  ) async {
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
        '$label : ${result.imported} importé(s), ${result.skipped} ignoré(s).$err',
      );
    } catch (e) {
      await _snack(context, 'Import impossible : $e');
    }
  }

  Future<void> _importVCard(BuildContext context) async {
    final companies = await AppDatabase.instance.companies();
    if (!context.mounted) return;
    if (companies.isEmpty) {
      await _snack(context, 'Créez d\'abord un client pour y rattacher les contacts vCard.');
      return;
    }
    String? companyId = companies.length == 1 ? companies.first.id : null;
    if (companyId == null) {
      companyId = await showDialog<String>(
        context: context,
        builder: (ctx) => SimpleDialog(
          title: const Text('Client cible'),
          children: [
            for (final c in companies)
              SimpleDialogOption(
                onPressed: () => Navigator.pop(ctx, c.id),
                child: Text(c.name),
              ),
          ],
        ),
      );
    }
    if (companyId == null || !context.mounted) return;
    try {
      final typeGroup = XTypeGroup(label: 'vcard', extensions: ['vcf', 'vcard']);
      final file = await openFile(acceptedTypeGroups: [typeGroup]);
      if (file == null) return;
      final content = await File(file.path).readAsString();
      final result = await CrmDataExchange.importVCard(content, companyId: companyId);
      onChanged?.call();
      if (!context.mounted) return;
      await _snack(context, 'vCard : ${result.imported} contact(s) importé(s).');
    } catch (e) {
      await _snack(context, 'Import vCard impossible : $e');
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
    if (compact) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          FilledButton.icon(
            onPressed: () => _newClient(context),
            icon: const Icon(Icons.add_business_outlined),
            label: const Text('Nouveau client'),
          ),
          OutlinedButton.icon(
            onPressed: () => _importCsv(context, 'Clients', CrmDataExchange.importCompaniesCsv),
            icon: const Icon(Icons.upload_file_outlined),
            label: const Text('Importer CSV'),
          ),
          OutlinedButton(
            onPressed: null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.extension_outlined, size: 18, color: Theme.of(context).disabledColor),
                const SizedBox(width: 8),
                Text('Modules (bientôt)', style: TextStyle(color: Theme.of(context).disabledColor)),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Export CSV', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OutlinedButton.icon(
              onPressed: () => _exportCsv(context, 'clients.csv', CrmDataExchange.exportCompaniesCsv),
              icon: const Icon(Icons.download_outlined, size: 18),
              label: const Text('Clients'),
            ),
            OutlinedButton.icon(
              onPressed: () => _exportCsv(context, 'contacts.csv', CrmDataExchange.exportContactsCsv),
              icon: const Icon(Icons.download_outlined, size: 18),
              label: const Text('Contacts'),
            ),
            OutlinedButton.icon(
              onPressed: () =>
                  _exportCsv(context, 'opportunites.csv', CrmDataExchange.exportOpportunitiesCsv),
              icon: const Icon(Icons.download_outlined, size: 18),
              label: const Text('Opportunités'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text('Import', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OutlinedButton.icon(
              onPressed: () => _importCsv(context, 'Clients', CrmDataExchange.importCompaniesCsv),
              icon: const Icon(Icons.upload_outlined, size: 18),
              label: const Text('Clients CSV'),
            ),
            OutlinedButton.icon(
              onPressed: () => _importCsv(context, 'Contacts', CrmDataExchange.importContactsCsv),
              icon: const Icon(Icons.upload_outlined, size: 18),
              label: const Text('Contacts CSV'),
            ),
            OutlinedButton.icon(
              onPressed: () =>
                  _importCsv(context, 'Opportunités', CrmDataExchange.importOpportunitiesCsv),
              icon: const Icon(Icons.upload_outlined, size: 18),
              label: const Text('Opportunités CSV'),
            ),
            OutlinedButton.icon(
              onPressed: () => _importVCard(context),
              icon: const Icon(Icons.contact_page_outlined, size: 18),
              label: const Text('Contacts vCard'),
            ),
          ],
        ),
      ],
    );
  }
}
