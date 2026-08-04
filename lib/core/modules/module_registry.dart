import 'package:flutter/material.dart';

import '../../modules/invoicing/invoicing_module.dart';
import '../../platform/einvoicing_license_bridge.dart';
import '../../platform/entitlement_service.dart';
import '../../platform/license_manager.dart';
import '../../platform/module_crm_prefs.dart';
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
    await ModuleCrmPrefs.instance.ensureLoaded();
    ModuleCrmPrefs.instance.addListener(notifyListeners);
    // Détection auto de l'app sœur e-Invoicing (App Group / licence) au
    // démarrage — sinon il fallait ouvrir l'écran Modules au moins une fois
    // sur chaque appareil pour qu'elle soit reconnue comme installée.
    // Reste malgré tout masquée du tableau de bord tant que l'utilisateur
    // n'a pas explicitement cliqué « Utiliser dans le CRM ».
    if (!EntitlementService.instance.isActive('invoicing')) {
      try {
        await importFromInstalledEinvoicing();
      } catch (e) {
        debugPrint('ModuleRegistry: import auto e-Invoicing — $e');
      }
    }
    for (final m in entitled) {
      await m.ensureSchema();
    }
    _initialized = true;
  }

  List<CrmModule> get all => List.unmodifiable(_all);

  /// Acheté / licencié / essai — indépendant de l’affichage rail.
  List<CrmModule> get entitled =>
      _all.where((m) => EntitlementService.instance.isActive(m.id)).toList();

  /// Visible dans le CRM (rail, fiche…) — entitlement + « Utiliser dans le CRM ».
  List<CrmModule> get active => entitled
      .where((m) => ModuleCrmPrefs.instance.isEnabledInCrm(m.id))
      .toList();

  /// Droit d’affichage / usage dans le CRM (pas seulement l’achat).
  bool isUsedInCrm(String moduleId) =>
      EntitlementService.instance.isActive(moduleId) &&
      ModuleCrmPrefs.instance.isEnabledInCrm(moduleId);

  Future<void> setUsedInCrm(String moduleId, bool used) async {
    await ModuleCrmPrefs.instance.setEnabledInCrm(moduleId, used);
    if (used) await byId(moduleId)?.ensureSchema();
    notifyListeners();
  }

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

  /// Synchronise les droits depuis une licence webstore déjà stockée.
  Future<void> syncLicensesFromStorage() async {
    for (final m in _all) {
      if (!LicenseManager.instance.isLicensedForModule(m.id)) continue;
      final expiresAt = LicenseManager.instance.expiresAtForModule(m.id);
      if (expiresAt != null && DateTime.now().isAfter(expiresAt)) continue;
      await activatePurchased(m.id, source: EntitlementSource.license, expiresAt: expiresAt);
    }
  }

  /// Colle un code d'activation eastmarkhk.com et débloque le module.
  Future<void> applyWebActivationCode(
    String moduleId,
    String rawCode, {
    bool skipEmailCheck = false,
  }) async {
    await LicenseManager.instance.applyPastedActivationToken(
      rawCode,
      skipEmailCheck: skipEmailCheck,
    );
    if (!LicenseManager.instance.isLicensedForModule(moduleId)) {
      throw LicenseFlowException('Ce code ne couvre pas ${byId(moduleId)?.title ?? moduleId}.');
    }
    final expiresAt = LicenseManager.instance.expiresAtForModule(moduleId);
    await activatePurchased(moduleId, source: EntitlementSource.license, expiresAt: expiresAt);
  }

  /// Réutilise la licence de l'app **EastmarkHK e-Invoicing** déjà installée (macOS).
  /// Retourne `true` si le module a été débloqué.
  /// Propage [LicenseFlowException] (code trouvé mais refusé) pour l'UI.
  Future<bool> importFromInstalledEinvoicing() async {
    const moduleId = 'invoicing';
    if (EntitlementService.instance.isActive(moduleId)) return true;

    await LicenseManager.instance.refreshHardwareUuid();

    final token = await EinvoicingLicenseBridge.readStoredLicenseToken();
    if (token != null) {
      debugPrint('ModuleRegistry: import licence e-Invoicing (${token.length} car.)');
      // Import depuis l'app sœur : pas de contrôle e-mail CRM.
      await applyWebActivationCode(moduleId, token, skipEmailCheck: true);
      debugPrint('ModuleRegistry: EastmarkHK e-Invoicing activé via app installée');
      return true;
    }

    if (await EinvoicingLicenseBridge.readPremiumSubscriptionActive()) {
      await activatePurchased(moduleId, source: EntitlementSource.license);
      debugPrint('ModuleRegistry: e-Invoicing premium IAP détecté');
      return true;
    }

    // Pas de licence/IAP (usage perso, gate désactivé côté e-Invoicing) :
    // la simple présence de l'app sœur suffit à débloquer le module.
    if (await EinvoicingLicenseBridge.isEinvoicingAppInstalled()) {
      await activatePurchased(moduleId, source: EntitlementSource.license);
      debugPrint('ModuleRegistry: e-Invoicing détecté installé (sans licence) — débloqué');
      return true;
    }
    return false;
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
