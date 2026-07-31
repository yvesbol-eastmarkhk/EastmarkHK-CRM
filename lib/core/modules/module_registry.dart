import 'package:flutter/material.dart';

import '../../modules/invoicing/invoicing_module.dart';
import '../../platform/entitlement_service.dart';
import 'crm_module.dart';

/// Registre central — tous les modules compilés, filtrés par entitlement.
class ModuleRegistry extends ChangeNotifier {
  ModuleRegistry._();
  static final ModuleRegistry instance = ModuleRegistry._();

  late final List<CrmModule> _all = [
    InvoicingModule.instance,
  ];

  bool _initialized = false;

  Future<void> ensureInitialized() async {
    if (_initialized) return;
    await EntitlementService.instance.ensureLoaded();
    for (final m in active) {
      await m.ensureSchema();
    }
    _initialized = true;
  }

  List<CrmModule> get all => List.unmodifiable(_all);

  List<CrmModule> get active =>
      _all.where((m) => EntitlementService.instance.isActive(m.id)).toList();

  CrmModule? byId(String id) {
    for (final m in _all) {
      if (m.id == id) return m;
    }
    return null;
  }

  List<ModuleNavDestination> navDestinations(BuildContext context) =>
      active.expand((m) => m.navDestinations(context)).toList();

  Future<void> startTrial(String moduleId) async {
    await EntitlementService.instance.grantTrial(moduleId);
    await byId(moduleId)?.ensureSchema();
    notifyListeners();
  }

  Future<void> activatePurchased(String moduleId,
      {EntitlementSource source = EntitlementSource.iap, DateTime? expiresAt}) async {
    await EntitlementService.instance.grantPurchase(moduleId, source: source, expiresAt: expiresAt);
    await byId(moduleId)?.ensureSchema();
    notifyListeners();
  }

  /// Client e-Invoice existant — déverrouille Facturation dans le CRM.
  Future<void> activateFromEInvoicing() async {
    await activatePurchased('invoicing', source: EntitlementSource.license);
  }

  Future<List<ModuleSearchHit>> searchAll(BuildContext context, String query) async {
    if (query.trim().isEmpty) return [];
    final hits = <ModuleSearchHit>[];
    for (final m in active) {
      hits.addAll(await m.search(context, query));
    }
    return hits;
  }
}
