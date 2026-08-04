import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../core/modules/module_registry.dart';
import 'distribution_config.dart';
import 'entitlement_service.dart';

/// Abonnements modules CRM via App Store / Google Play.
/// Aligné sur EastmarkHK e-Invoicing (SubscriptionService).
///
/// Product IDs App Store Connect :
/// - [invoicingMonthlyId] — module Facturation CRM
/// - [einvoicePremiumId] — abonnement e-Invoice standalone (débloque aussi Facturation
///   si les deux apps partagent le même groupe d'abonnements ASC)
class CrmSubscriptionService {
  CrmSubscriptionService._();
  static final CrmSubscriptionService instance = CrmSubscriptionService._();

  static const invoicingMonthlyId = 'crm_invoicing_monthly';
  static const einvoicePremiumId = 'einvoice_premium_monthly';

  static const _productToModule = {
    invoicingMonthlyId: 'invoicing',
    einvoicePremiumId: 'invoicing',
  };

  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  final ValueNotifier<bool> isStoreAvailable = ValueNotifier(false);
  final Map<String, ProductDetails> _products = {};
  bool _initialized = false;

  ProductDetails? productForModule(String moduleId) {
    if (moduleId == 'invoicing') {
      return _products[invoicingMonthlyId] ?? _products[einvoicePremiumId];
    }
    return null;
  }

  String? localizedPriceForModule(String moduleId) => productForModule(moduleId)?.price;

  /// Plateformes Apple : sonde StoreKit pour restauration / achat IAP.
  bool get _isApplePlatform =>
      !kIsWeb && (Platform.isIOS || Platform.isMacOS);

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    if (!_isApplePlatform && !emhkUsesAppStoreIap) return;

    try {
      isStoreAvailable.value = await _iap.isAvailable();
    } catch (e) {
      debugPrint('CrmSubscriptionService: store probe failed: $e');
      return;
    }
    if (!isStoreAvailable.value) return;

    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdate,
      onError: (e) => debugPrint('CrmSubscriptionService stream error: $e'),
    );

    await _loadProducts();
    // Toujours tenter de retrouver un abonnement App Store déjà acheté.
    await restorePurchases();
  }

  /// Restauration explicite — website + App Store (appelée depuis Modules).
  Future<void> syncAppStoreEntitlements() async {
    if (!_initialized) await init();
    if (!isStoreAvailable.value) {
      try {
        isStoreAvailable.value = await _iap.isAvailable();
      } catch (_) {}
    }
    if (!isStoreAvailable.value) return;
    if (_products.isEmpty) await _loadProducts();
    await restorePurchases();
  }

  Future<void> _loadProducts() async {
    final response = await _iap.queryProductDetails(_productToModule.keys.toSet());
    if (response.error != null) {
      debugPrint('CrmSubscriptionService product error: ${response.error}');
      return;
    }
    for (final p in response.productDetails) {
      _products[p.id] = p;
    }
  }

  /// Achète l'abonnement mensuel du module (auto-renouvelable configuré dans ASC).
  Future<bool> buyModule(String moduleId) async {
    if (!_isApplePlatform || !isStoreAvailable.value) return false;
    final productId = moduleId == 'invoicing' ? invoicingMonthlyId : null;
    if (productId == null) return false;
    final details = _products[productId];
    if (details == null) {
      debugPrint('CrmSubscriptionService: product $productId not loaded');
      return false;
    }
    try {
      return await _iap.buyNonConsumable(purchaseParam: PurchaseParam(productDetails: details));
    } catch (e) {
      debugPrint('CrmSubscriptionService buy error: $e');
      return false;
    }
  }

  Future<void> restorePurchases() async {
    if (!isStoreAvailable.value) return;
    try {
      await _iap.restorePurchases();
    } catch (e) {
      debugPrint('CrmSubscriptionService restore error: $e');
    }
  }

  Future<void> _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (final purchase in purchases) {
      final moduleId = _productToModule[purchase.productID];
      if (moduleId == null) continue;

      switch (purchase.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          await _activateModule(moduleId, purchase.productID);
          break;
        case PurchaseStatus.error:
          debugPrint('CrmSubscriptionService purchase error: ${purchase.error}');
          break;
        case PurchaseStatus.pending:
        case PurchaseStatus.canceled:
          break;
      }

      if (purchase.pendingCompletePurchase) {
        await _iap.completePurchase(purchase);
      }
    }
  }

  Future<void> _activateModule(String moduleId, String productId) async {
    // Renouvellement ~31 j — en production valider le reçu App Store pour la date exacte.
    final expiry = DateTime.now().add(const Duration(days: 31));
    await ModuleRegistry.instance.activatePurchased(
      moduleId,
      source: EntitlementSource.iap,
      expiresAt: expiry,
    );
    debugPrint('CrmSubscriptionService: $moduleId activated via $productId until $expiry');
  }

  void dispose() {
    _subscription?.cancel();
    isStoreAvailable.dispose();
  }
}
