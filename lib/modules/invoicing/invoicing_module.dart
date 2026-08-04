import 'package:flutter/material.dart';

import '../../core/db/app_database.dart';
import '../../core/models/models.dart';
import '../../core/modules/crm_module.dart';
import '../../l10n/gen/app_localizations.dart';
import 'einvoice_connector.dart';
import 'screens/ei_products_screen.dart';
import 'screens/invoicing_home_screen.dart';
import 'screens/quote_editor_screen.dart';
import 'widgets/company_invoicing_section.dart';
import 'widgets/ei_document_detail_dialog.dart';
import 'widgets/invoicing_dashboard_card.dart';

/// Module EastmarkHK e-Invoicing — intégration de l'app standalone dans le CRM.
///
/// Le CRM ne stocke AUCUNE donnée de facturation : il écrit devis/factures
/// directement dans la base de l'app e-Invoicing (conteneur App Group
/// partagé) et lit les statuts pour les afficher. L'achat du module donne
/// aussi l'app standalone (App Store) — reçues, relances, Peppol, PDF y
/// vivent en exclusivité.
class InvoicingModule implements CrmModule {
  InvoicingModule._();
  static final InvoicingModule instance = InvoicingModule._();

  /// Nom affiché partout (Modules, rail, fiche client…) — aligné site + App Store.
  static const displayName = 'EastmarkHK e-Invoicing';

  @override
  String get id => 'invoicing';

  @override
  String get title => displayName;

  @override
  String get description =>
      'Devis et factures créés depuis vos clients et opportunités CRM, '
      'gérés par l\'app EastmarkHK e-Invoicing (incluse — App Store). '
      'Reçues, relances et envoi se pilotent dans l\'app e-Invoicing.';

  @override
  IconData get icon => Icons.receipt_long_outlined;

  @override
  String get priceLabel => '5,99 €/mois';

  /// Aucune table CRM : les données vivent dans la base e-Invoicing partagée.
  @override
  List<String> get migrations => const [];

  @override
  Future<void> ensureSchema() async {}

  @override
  List<ModuleNavDestination> navDestinations(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return [
      ModuleNavDestination(
        id: 'invoicing',
        title: l10n.invModuleTitle,
        icon: icon,
        builder: (_) => const InvoicingHomeScreen(),
      ),
      ModuleNavDestination(
        id: 'invoicing_products',
        title: l10n.eiProductsTitle,
        icon: Icons.inventory_2_outlined,
        builder: (_) => const EiProductsScreen(),
      ),
    ];
  }

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
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return const [];
    final docs = await EInvoiceConnector.instance.recentDocuments(limit: 200);
    return [
      for (final d in docs
          .where((d) =>
              d.number.toLowerCase().contains(q) ||
              d.customerName.toLowerCase().contains(q))
          .take(8))
        ModuleSearchHit(
          moduleId: id,
          title: d.number,
          subtitle: '${d.customerName} — ${d.status}',
          icon: d.isInvoice ? Icons.receipt_outlined : Icons.request_quote_outlined,
          onOpen: () => _openDocumentFromSearch(context, d),
        ),
    ];
  }

  static Future<void> _openDocumentFromSearch(
      BuildContext context, EiDocument d) async {
    if (!context.mounted) return;
    await showEiDocumentDetail(context, d);
  }

  /// Journalise dans la timeline CRM la création d'un document e-Invoicing —
  /// c'est ainsi que le CRM « est informé » (comme une tâche ou une
  /// opportunité), sans dupliquer la donnée.
  static Future<void> logDocumentActivity({
    required String companyId,
    String? opportunityId,
    required EiDocumentRef ref,
  }) async {
    final now = nowIso();
    await AppDatabase.instance.upsertActivity(Activity(
      id: AppDatabase.newId(),
      companyId: companyId,
      opportunityId: opportunityId,
      type: ActivityType.moduleEvent,
      moduleId: 'invoicing',
      refTable: ref.isInvoice ? 'invoices' : 'quotes',
      refId: ref.uuid,
      title: ref.isInvoice ? 'Facture créée' : 'Devis créé',
      body: '${ref.number} — EastmarkHK e-Invoicing',
      happenedAt: now,
      createdAt: now,
      updatedAt: now,
    ));
  }

  /// Point d'entrée depuis une opportunité gagnée : ouvre l'éditeur de devis
  /// (catalogue + lignes libres) prérempli avec le client CRM et une ligne
  /// libre basée sur le titre / montant de l'opportunité.
  static Future<bool> createQuoteFromOpportunity(
      BuildContext context, Opportunity opp) async {
    final companyId = opp.companyId;
    if (companyId == null) return false;
    final connector = EInvoiceConnector.instance;
    if (!await connector.isAvailable()) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).invModuleAppNotFound),
        ));
      }
      return false;
    }
    if (!context.mounted) return false;
    final created = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => EiDocumentEditorScreen(
          companyId: companyId,
          opportunityId: opp.id,
          initialLines: [
            EiLine(
              description: opp.title,
              qty: 1,
              unitPrice: opp.amount ?? 0,
            ),
          ],
        ),
      ),
    );
    return created == true;
  }
}
