import 'package:flutter/foundation.dart';

import '../core/db/app_database.dart';

/// Source d'un droit module : achat IAP, licence site, ou essai 7 jours.
enum EntitlementSource { trial, iap, license }

class EntitlementRecord {
  const EntitlementRecord({
    required this.moduleId,
    required this.source,
    this.expiresAt,
    this.payload,
  });

  final String moduleId;
  final EntitlementSource source;
  final DateTime? expiresAt;
  final String? payload;

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}

/// Gère les droits modules — table `entitlements` + essai 7 jours.
class EntitlementService extends ChangeNotifier {
  EntitlementService._();
  static final EntitlementService instance = EntitlementService._();

  static const trialDays = 7;

  final Map<String, EntitlementRecord> _cache = {};
  bool _loaded = false;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final rows = await AppDatabase.instance.entitlements();
    _cache.clear();
    for (final r in rows) {
      _cache[r.moduleId] = r;
    }
    _loaded = true;
  }

  void invalidateCache() {
    _loaded = false;
    _cache.clear();
  }

  bool isActive(String moduleId) {
    final r = _cache[moduleId];
    if (r == null) return false;
    return !r.isExpired;
  }

  EntitlementRecord? recordFor(String moduleId) => _cache[moduleId];

  int? trialDaysRemaining(String moduleId) {
    final r = _cache[moduleId];
    if (r == null || r.source != EntitlementSource.trial || r.expiresAt == null) return null;
    final diff = r.expiresAt!.difference(DateTime.now()).inDays;
    return diff < 0 ? 0 : diff + 1;
  }

  Future<void> grantTrial(String moduleId) async {
    if (isActive(moduleId)) return;
    final expires = DateTime.now().add(const Duration(days: trialDays));
    await _persist(moduleId, EntitlementSource.trial, expiresAt: expires);
    notifyListeners();
  }

  Future<void> grantPurchase(String moduleId,
      {EntitlementSource source = EntitlementSource.iap, DateTime? expiresAt}) async {
    await _persist(moduleId, source, expiresAt: expiresAt);
    notifyListeners();
  }

  Future<void> _persist(String moduleId, EntitlementSource source, {DateTime? expiresAt, String? payload}) async {
    final rec = EntitlementRecord(
      moduleId: moduleId,
      source: source,
      expiresAt: expiresAt,
      payload: payload,
    );
    await AppDatabase.instance.upsertEntitlement(rec);
    _cache[moduleId] = rec;
  }
}
