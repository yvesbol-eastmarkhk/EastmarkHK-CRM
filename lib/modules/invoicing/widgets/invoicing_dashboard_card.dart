import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/crm_tokens.dart';
import '../invoicing_repository.dart';

/// Carte dashboard — CA facturé et factures ouvertes.
class InvoicingDashboardCard extends StatefulWidget {
  const InvoicingDashboardCard({super.key, required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  State<InvoicingDashboardCard> createState() => _InvoicingDashboardCardState();
}

class _InvoicingDashboardCardState extends State<InvoicingDashboardCard> {
  double _openTotal = 0;
  int _openCount = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final invoices = await InvoicingRepository.instance.invoices();
    var total = 0.0;
    var count = 0;
    for (final inv in invoices) {
      if (inv.status.name == 'paid' || inv.status.name == 'cancelled') continue;
      total += inv.balanceDue;
      count++;
    }
    if (!mounted) return;
    setState(() {
      _openTotal = total;
      _openCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        border: Border.all(color: Theme.of(context).crmBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.receipt_long_outlined, size: 18, color: scheme.primary),
              const SizedBox(width: 8),
              Text('Facturation (e-Invoice)', style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
          const SizedBox(height: 12),
          Text(formatAmount(_openTotal), style: Theme.of(context).textTheme.headlineSmall),
          Text(
            '$_openCount facture${_openCount > 1 ? 's' : ''} ouverte${_openCount > 1 ? 's' : ''}',
            style: TextStyle(color: scheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
