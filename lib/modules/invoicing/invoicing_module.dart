import 'package:flutter/material.dart';

import '../../core/db/app_database.dart';
import '../../core/models/models.dart';
import '../../core/modules/crm_module.dart';
import '../../core/utils/formatters.dart';
import '../../theme/crm_tokens.dart';
import 'invoicing_repository.dart';
import 'models/invoicing_models.dart';
import 'screens/invoicing_home_screen.dart';
import 'widgets/company_invoicing_section.dart';
import 'widgets/invoicing_dashboard_card.dart';

/// Module Facturation — port d'EastmarkHK e-Invoicing dans le CRM.
class InvoicingModule implements CrmModule {
  InvoicingModule._();
  static final InvoicingModule instance = InvoicingModule._();

  @override
  String get id => 'invoicing';

  @override
  String get title => 'Facturation';

  @override
  String get description =>
      'Devis, factures, paiements, PDF et Peppol — intégrés à chaque fiche client. '
      'Utilise la même logique qu\'EastmarkHK e-Invoicing, utilisable aussi en app indépendante.';

  @override
  IconData get icon => Icons.receipt_long_outlined;

  @override
  String get priceLabel => '5,99 €/mois';

  @override
  List<String> get migrations => invoicingMigrations;

  @override
  Future<void> ensureSchema() => InvoicingRepository.instance.ensureSchema();

  @override
  List<ModuleNavDestination> navDestinations(BuildContext context) => [
        ModuleNavDestination(
          id: 'invoicing',
          title: 'Facturation',
          icon: icon,
          builder: (_) => const InvoicingHomeScreen(),
        ),
      ];

  @override
  List<Widget> customerSections(BuildContext context, String companyId, VoidCallback onChanged) => [
        CompanyInvoicingSection(companyId: companyId, onChanged: onChanged),
      ];

  @override
  List<Widget> dashboardCards(BuildContext context, VoidCallback onRefresh) => [
        InvoicingDashboardCard(onRefresh: onRefresh),
      ];

  @override
  Future<List<ModuleSearchHit>> search(BuildContext context, String query) async {
    final hits = <ModuleSearchHit>[];
    final quotes = await InvoicingRepository.instance.quotes(search: query);
    for (final q in quotes.take(6)) {
      hits.add(ModuleSearchHit(
        moduleId: id,
        title: q.number ?? 'Devis',
        subtitle: q.status.labelFr,
        icon: Icons.request_quote_outlined,
        onOpen: () {},
      ));
    }
    final invoices = await InvoicingRepository.instance.invoices(search: query);
    for (final inv in invoices.take(6)) {
      hits.add(ModuleSearchHit(
        moduleId: id,
        title: inv.number ?? 'Facture',
        subtitle: inv.status.labelFr,
        icon: Icons.receipt_outlined,
        onOpen: () {},
      ));
    }
    return hits;
  }

  /// Point d'entrée depuis une opportunité gagnée.
  static Future<InvQuote?> createQuoteFromOpportunity(BuildContext context, Opportunity opp) async {
    try {
      final q = await InvoicingRepository.instance.createQuoteFromOpportunity(opp);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Devis ${q.number} créé')),
        );
      }
      return q;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Impossible de créer le devis : $e')),
        );
      }
      return null;
    }
  }
}
