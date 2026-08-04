import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../einvoice_connector.dart';
import '../invoicing_module.dart';
import '../screens/quote_editor_screen.dart';

/// Aperçu d’un devis/facture + édition / facturation / e-Invoicing.
Future<void> showEiDocumentDetail(
  BuildContext context,
  EiDocument doc, {
  VoidCallback? onChanged,
}) async {
  final l10n = AppLocalizations.of(context);
  await showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        '${doc.isInvoice ? l10n.invDocInvoice : l10n.invDocQuote} ${doc.number}',
      ),
      content: SizedBox(
        width: 520,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row(ctx, l10n.invDocClient, doc.customerName),
            _row(ctx, l10n.invDocStatus, doc.status),
            _row(ctx, l10n.invDocDate, formatDateFr(doc.date)),
            _row(ctx, l10n.invSubtotalHt, formatAmount(doc.subtotal)),
            _row(ctx, l10n.invVat, l10n.eiTaxRate(doc.vatRate.toStringAsFixed(0))),
            _row(ctx, l10n.invTotalTtc, formatAmount(doc.total)),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text(l10n.commonClose),
        ),
        FilledButton.tonalIcon(
          onPressed: () async {
            Navigator.pop(ctx);
            await _editDocument(context, doc, onChanged: onChanged);
          },
          icon: const Icon(Icons.edit_outlined, size: 18, color: Colors.white),
          label: Text(l10n.invEditDocument),
        ),
        if (!doc.isInvoice && doc.status != 'invoiced')
          FilledButton.tonalIcon(
            onPressed: () async {
              Navigator.pop(ctx);
              await _createInvoiceFromQuote(context, doc, onChanged: onChanged);
            },
            icon: const Icon(Icons.receipt_long_outlined, size: 18),
            label: Text(l10n.invCreateInvoiceFromQuote),
          ),
        FilledButton.icon(
          onPressed: () async {
            Navigator.pop(ctx);
            final opened = await EInvoiceConnector.instance
                .openStandaloneApp(doc: doc);
            if (!opened && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.invOpenStandaloneFailed)),
              );
            }
          },
          icon: const Icon(Icons.open_in_new, size: 18),
          label: Text(l10n.invOpenInStandalone),
        ),
      ],
    ),
  );
}

Future<void> _editDocument(
  BuildContext context,
  EiDocument doc, {
  VoidCallback? onChanged,
  EiEditableDocument? preloaded,
}) async {
  final l10n = AppLocalizations.of(context);
  EiEditableDocument editable;
  if (preloaded != null) {
    editable = preloaded;
  } else {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
    try {
      editable = await EInvoiceConnector.instance.loadEditableDocument(doc);
      if (!context.mounted) return;
      Navigator.of(context, rootNavigator: true).pop(); // progress
    } catch (e) {
      if (!context.mounted) return;
      Navigator.of(context, rootNavigator: true).pop(); // progress
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.invDocumentSaveFailed('$e'))),
      );
      return;
    }
  }
  if (!context.mounted) return;
  final saved = await Navigator.of(context).push<bool>(
    MaterialPageRoute(
      builder: (_) => EiDocumentEditorScreen(
        companyId: editable.crmCompanyId ?? doc.crmCompanyId,
        asInvoice: editable.isInvoice,
        existing: editable,
      ),
    ),
  );
  if (saved == true) onChanged?.call();
}

Future<void> _createInvoiceFromQuote(
  BuildContext context,
  EiDocument quote, {
  VoidCallback? onChanged,
}) async {
  final l10n = AppLocalizations.of(context);
  if (quote.status == 'invoiced') {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.invQuoteAlreadyInvoiced)),
    );
    return;
  }
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 16),
          Expanded(child: Text(l10n.invCreatingInvoice)),
        ],
      ),
    ),
  );
  try {
    final editable =
        await EInvoiceConnector.instance.createInvoiceFromQuote(quote);
    final companyId = editable.crmCompanyId ?? quote.crmCompanyId;
    if (companyId != null && companyId.isNotEmpty) {
      await InvoicingModule.logDocumentActivity(
        companyId: companyId,
        ref: EiDocumentRef(
          id: editable.id,
          uuid: editable.uuid,
          number: editable.number,
          isInvoice: true,
        ),
      );
    }
    if (!context.mounted) return;
    Navigator.of(context, rootNavigator: true).pop(); // progress
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.invInvoiceCreatedFromQuote(editable.number))),
    );
    // Rafraîchir la liste tout de suite — la facture est déjà sur le serveur.
    onChanged?.call();
    await _editDocument(
      context,
      quote,
      onChanged: onChanged,
      preloaded: editable,
    );
  } catch (e) {
    if (!context.mounted) return;
    Navigator.of(context, rootNavigator: true).pop(); // progress
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.invCreateInvoiceFailed('$e'))),
    );
    // Même en erreur partielle, recharger (facture parfois déjà créée).
    onChanged?.call();
  }
}

/// Résout une référence historique (uuid ou id) puis affiche le détail.
Future<void> showEiDocumentByRef(
  BuildContext context, {
  required String refType,
  required String refId,
}) async {
  final isInvoice = refType == 'invoice';
  final doc = await EInvoiceConnector.instance.findDocument(
    refId: refId,
    isInvoice: isInvoice,
  );
  if (!context.mounted) return;
  if (doc == null) {
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.eiDocumentNotFound),
      ),
    );
    return;
  }
  await showEiDocumentDetail(context, doc);
}

Widget _row(BuildContext context, String label, String value) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
