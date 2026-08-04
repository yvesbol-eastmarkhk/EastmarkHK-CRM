import 'package:flutter/material.dart';

import '../../../core/db/app_database.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../../theme/crm_tokens.dart';
import '../einvoice_connector.dart';
import '../invoicing_module.dart';
import '../screens/einvoice_remote_settings_dialog.dart';
import '../screens/quote_editor_screen.dart';
import 'ei_document_detail_dialog.dart';

/// Section Facturation sur la fiche client — documents lus dans la base
/// e-Invoicing partagée via le mappage crm_company_id.
class CompanyInvoicingSection extends StatefulWidget {
  const CompanyInvoicingSection({super.key, required this.companyId, required this.onChanged});

  final String companyId;
  final VoidCallback onChanged;

  @override
  State<CompanyInvoicingSection> createState() => _CompanyInvoicingSectionState();
}

class _CompanyInvoicingSectionState extends State<CompanyInvoicingSection> {
  List<EiDocument> _quotes = [];
  List<EiDocument> _invoices = [];
  bool _available = true;
  bool _needsRemoteSetup = false;
  bool _linked = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final connector = EInvoiceConnector.instance;
    final available = await connector.isAvailable();
    final needsSetup = !available && await connector.needsRemoteSetup();
    final company = await AppDatabase.instance.companyById(widget.companyId);
    var docs = <EiDocument>[];
    if (available) {
      docs = await connector.documentsForCompany(widget.companyId, limit: 10);
    }
    if (!mounted) return;
    setState(() {
      _available = available;
      _needsRemoteSetup = needsSetup;
      _linked = (company?.einvoiceCustomerUuid ?? '').trim().isNotEmpty;
      _quotes = docs.where((d) => !d.isInvoice).take(5).toList();
      _invoices = docs.where((d) => d.isInvoice).take(5).toList();
    });
  }

  Future<void> _openRemoteSettings() async {
    final saved = await showEinvoiceRemoteSettingsDialog(context);
    if (saved) _load();
  }

  Future<void> _newDocument({required bool asInvoice}) async {
    final ok = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => EiDocumentEditorScreen(
          companyId: widget.companyId,
          asInvoice: asInvoice,
        ),
      ),
    );
    if (ok == true) {
      await _load();
      widget.onChanged();
    }
  }

  Future<void> _unlinkCustomer() async {
    final l10n = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.invUnlinkConfirmTitle),
        content: Text(l10n.invUnlinkConfirmBody),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.commonClose)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.invUnlinkCustomer)),
        ],
      ),
    );
    if (ok != true) return;
    final company = await AppDatabase.instance.companyById(widget.companyId);
    if (company == null) return;
    await EInvoiceConnector.instance.clearCustomerLink(company);
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l10n.invUnlinkDone)));
    await _load();
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(Icons.receipt_long_outlined, size: 18, color: scheme.primary),
            const SizedBox(width: 8),
            Text(InvoicingModule.displayName, style: Theme.of(context).textTheme.titleSmall),
            const Spacer(),
            if (_available) ...[
              PopupMenuButton<String>(
                tooltip: l10n.invLinkMenu,
                icon: Icon(
                  _linked ? Icons.link : Icons.link_off,
                  size: 18,
                  color: _linked ? scheme.primary : scheme.onSurfaceVariant,
                ),
                onSelected: (v) {
                  if (v == 'unlink') _unlinkCustomer();
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    enabled: false,
                    child: Text(
                      _linked ? l10n.invLinkStatusLinked : l10n.invLinkStatusNone,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  if (_linked)
                    PopupMenuItem(
                      value: 'unlink',
                      child: Text(l10n.invUnlinkCustomer),
                    ),
                ],
              ),
              TextButton.icon(
                onPressed: () => _newDocument(asInvoice: false),
                icon: const Icon(Icons.add, size: 16),
                label: Text(l10n.invSectionQuote),
              ),
              TextButton.icon(
                onPressed: () => _newDocument(asInvoice: true),
                icon: const Icon(Icons.receipt_outlined, size: 16),
                label: Text(l10n.invSectionInvoice),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        if (!_available)
          _needsRemoteSetup
              ? Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.invRemoteNotConfigured,
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      ),
                    ),
                    TextButton(
                        onPressed: _openRemoteSettings,
                        child: Text(l10n.invConfigure)),
                  ],
                )
              : Text(
                  l10n.invAppNotDetected,
                  style: TextStyle(color: scheme.onSurfaceVariant),
                )
        else if (_quotes.isEmpty && _invoices.isEmpty)
          Text(l10n.invEmptyCompanyDocs,
              style: TextStyle(color: scheme.onSurfaceVariant))
        else ...[
          if (_quotes.isNotEmpty) ...[
            Text(l10n.invQuotesSection, style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 4),
            for (final q in _quotes) _row(q),
            const SizedBox(height: 8),
          ],
          if (_invoices.isNotEmpty) ...[
            Text(l10n.invInvoicesSection, style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 4),
            for (final inv in _invoices) _row(inv),
          ],
        ],
        const SizedBox(height: 4),
        Text(
          l10n.invCompanyFooter,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _row(EiDocument doc) {
    return InkWell(
      onTap: () => showEiDocumentDetail(context, doc, onChanged: _load),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                doc.number,
                style: const TextStyle(fontSize: CrmTokens.bodySize),
              ),
            ),
            Text(
              doc.status,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              formatAmount(doc.total),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right,
              size: 18,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
