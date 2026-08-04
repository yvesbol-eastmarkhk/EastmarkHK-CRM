import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../platform/einvoice_display_prefs.dart';
import '../../../platform/entitlement_service.dart';
import '../../../widgets/section_card.dart';
import '../einvoice_connector.dart';
import '../invoicing_module.dart';

/// Carte dashboard facturation — même SectionCard que le reste du CRM.
class InvoicingDashboardCard extends StatefulWidget {
  const InvoicingDashboardCard({super.key, required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  State<InvoicingDashboardCard> createState() => _InvoicingDashboardCardState();
}

class _InvoicingDashboardCardState extends State<InvoicingDashboardCard> {
  static const _accent = Color(0xFF2BA89A);

  double _openTotal = 0;
  int _openCount = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await EinvoiceDisplayPrefs.instance.ensureLoaded();
    final docs = await EInvoiceConnector.instance.recentDocuments(
      limit: 500,
      crmRelatedOnly: EinvoiceDisplayPrefs.instance.crmRelatedOnly,
    );
    var total = 0.0;
    var count = 0;
    for (final d in docs) {
      if (!d.isInvoice) continue;
      if (d.status == 'paid' || d.status == 'cancelled') continue;
      total += d.total;
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
    final rec = EntitlementService.instance.recordFor('invoicing');
    final licenseLabel = switch (rec?.source) {
      EntitlementSource.license => 'Abonnement actif — eastmarkhk.com',
      EntitlementSource.iap => 'Abonnement actif — App Store',
      EntitlementSource.trial => 'Essai gratuit',
      _ => null,
    };

    return SectionCard(
      title: InvoicingModule.displayName,
      icon: Icons.receipt_long_outlined,
      accent: _accent,
      margin: EdgeInsets.zero,
      children: [
        if (licenseLabel != null) ...[
          Text(
            licenseLabel,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: _accent,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 10),
        ],
        Text(
          formatAmount(_openTotal),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: _accent,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          '$_openCount facture${_openCount > 1 ? 's' : ''} ouverte${_openCount > 1 ? 's' : ''}',
          style: TextStyle(color: scheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
