import 'package:flutter/material.dart';

/// Destination de navigation injectée par un module payant.
class ModuleNavDestination {
  const ModuleNavDestination({
    required this.id,
    required this.title,
    required this.icon,
    required this.builder,
  });

  final String id;
  final String title;
  final IconData icon;
  final WidgetBuilder builder;
}

/// Résultat de recherche module pour la palette ⌘K.
class ModuleSearchHit {
  const ModuleSearchHit({
    required this.moduleId,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onOpen,
  });

  final String moduleId;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onOpen;
}

/// Contrat commun à tous les modules payants (Facturation, Scanner…).
abstract class CrmModule {
  String get id;
  String get title;
  String get description;
  IconData get icon;

  /// Prix affiché dans la boutique (localisé plus tard via IAP).
  String get priceLabel;

  /// SQL exécuté à l'activation du module (tables préfixées inv_, scan_…).
  List<String> get migrations;

  /// Entrées rail / barre mobile quand le module est actif.
  List<ModuleNavDestination> navDestinations(BuildContext context);

  /// Sections injectées dans la fiche client.
  List<Widget> customerSections(BuildContext context, String companyId, VoidCallback onChanged);

  /// Widgets dashboard (CA, factures en retard…).
  List<Widget> dashboardCards(BuildContext context, VoidCallback onRefresh);

  /// Recherche ⌘K — devis, factures, etc.
  Future<List<ModuleSearchHit>> search(BuildContext context, String query);

  /// Appliquer les migrations du module.
  Future<void> ensureSchema();
}
