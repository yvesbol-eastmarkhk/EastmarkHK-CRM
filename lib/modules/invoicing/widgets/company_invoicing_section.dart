import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../theme/crm_tokens.dart';
import '../invoicing_repository.dart';
import '../models/invoicing_models.dart';
import '../screens/quote_editor_screen.dart';

/// Section Facturation sur la fiche client.
class CompanyInvoicingSection extends StatefulWidget {
  const CompanyInvoicingSection({super.key, required this.companyId, required this.onChanged});

  final String companyId;
  final VoidCallback onChanged;

  @override
  State<CompanyInvoicingSection> createState() => _CompanyInvoicingSectionState();
}

class _CompanyInvoicingSectionState extends State<CompanyInvoicingSection> {
  List<InvQuote> _quotes = [];
  List<InvInvoice> _invoices = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = InvoicingRepository.instance;
    final quotes = await repo.quotes(companyId: widget.companyId);
    final invoices = await repo.invoices(companyId: widget.companyId);
    if (!mounted) return;
    setState(() {
      _quotes = quotes.take(5).toList();
      _invoices = invoices.take(5).toList();
    });
  }

  Future<void> _newQuote() async {
    final ok = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => QuoteEditorScreen(companyId: widget.companyId)),
    );
    if (ok == true) {
      await _load();
      widget.onChanged();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(Icons.receipt_long_outlined, size: 18, color: scheme.primary),
            const SizedBox(width: 8),
            Text('Facturation', style: Theme.of(context).textTheme.titleSmall),
            const Spacer(),
            TextButton.icon(
              onPressed: _newQuote,
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Devis'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (_quotes.isEmpty && _invoices.isEmpty)
          Text('Aucun devis ni facture.', style: TextStyle(color: scheme.onSurfaceVariant))
        else ...[
          if (_quotes.isNotEmpty) ...[
            Text('DEVIS', style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 4),
            for (final q in _quotes)
              _row(q.number ?? '—', q.status.labelFr, formatAmount(q.total)),
            const SizedBox(height: 8),
          ],
          if (_invoices.isNotEmpty) ...[
            Text('FACTURES', style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 4),
            for (final inv in _invoices)
              _row(inv.number ?? '—', inv.status.labelFr, formatAmount(inv.total)),
          ],
        ],
        const SizedBox(height: 4),
        Text(
          'EastmarkHK e-Invoicing reste utilisable seul — les données se synchronisent si le mode connecté est actif.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _row(String title, String status, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: CrmTokens.bodySize))),
          Text(status, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant)),
          const SizedBox(width: 12),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
