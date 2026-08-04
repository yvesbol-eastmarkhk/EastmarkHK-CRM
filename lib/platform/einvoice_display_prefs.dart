import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Portée des devis/factures affichés dans le CRM.
enum EinvoiceDocsScope {
  /// Clients liés au CRM uniquement (défaut).
  crmRelated,

  /// Tout le contenu d’e-Invoicing (y compris hors CRM).
  all,
}

  /// Préférence Réglages : voir tout e-Invoicing ou seulement le lié au CRM.
class EinvoiceDisplayPrefs extends ChangeNotifier {
  EinvoiceDisplayPrefs._();
  static final EinvoiceDisplayPrefs instance = EinvoiceDisplayPrefs._();

  static const _key = 'einvoice_docs_scope';

  /// Défaut = tout afficher (sinon un devis créé sans uuid mémorisé
  /// disparaissait de la liste CRM alors qu’il existait bien côté serveur).
  EinvoiceDocsScope _scope = EinvoiceDocsScope.all;
  bool _loaded = false;

  EinvoiceDocsScope get scope => _scope;

  bool get crmRelatedOnly => _scope == EinvoiceDocsScope.crmRelated;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == 'crm') {
      _scope = EinvoiceDocsScope.crmRelated;
    } else {
      // null (jamais choisi) ou 'all' → tout afficher.
      _scope = EinvoiceDocsScope.all;
    }
    _loaded = true;
  }

  Future<void> setScope(EinvoiceDocsScope value) async {
    await ensureLoaded();
    if (_scope == value) return;
    _scope = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      value == EinvoiceDocsScope.all ? 'all' : 'crm',
    );
    notifyListeners();
  }
}
