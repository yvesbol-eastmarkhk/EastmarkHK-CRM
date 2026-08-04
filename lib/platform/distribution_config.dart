import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;

/// `true` pour les builds iOS / macOS App Store (Xcode Cloud) :
/// `--dart-define=EMHK_APP_STORE_DISTRIBUTION=true`
const bool kEmhkAppStoreDistribution = bool.fromEnvironment(
  'EMHK_APP_STORE_DISTRIBUTION',
  defaultValue: false,
);

/// IAP StoreKit — iOS toujours, macOS si build App Store.
bool get emhkUsesAppStoreIap {
  if (kIsWeb) return false;
  if (Platform.isIOS) return true;
  if (Platform.isMacOS && kEmhkAppStoreDistribution) return true;
  return false;
}

/// Afficher le bouton d’achat App Store (logo Apple) — plateformes Apple.
bool get emhkShowsAppStorePurchaseButton {
  if (kIsWeb) return false;
  return Platform.isIOS || Platform.isMacOS;
}

/// Liens « Acheter sur eastmarkhk.com » — interdits sur App Store (3.1.1).
bool get emhkShowsWebStorePurchaseLinks => !emhkUsesAppStoreIap && !kIsWeb;

/// URL App Store d'EastmarkHK e-Invoicing — vide tant que l'ID App Store
/// n'est pas connu. Passer `--dart-define=EMHK_EINVOICING_APP_STORE_URL=…`.
const String kEmhkEinvoicingAppStoreUrl = String.fromEnvironment(
  'EMHK_EINVOICING_APP_STORE_URL',
  defaultValue: '',
);

bool get emhkHasEinvoicingAppStoreUrl =>
    kEmhkEinvoicingAppStoreUrl.trim().isNotEmpty;

/// Activation par code (client déjà abonné sur le webstore).
/// Masquée sur iOS / macOS App Store (Guideline 3.1.1 — pas d’UI
/// « abonnement eastmarkhk.com » à côté de l’IAP).
bool get emhkAllowsWebLicenseActivation =>
    !kIsWeb && !emhkUsesAppStoreIap;

/// @deprecated Utiliser [emhkShowsWebStorePurchaseLinks] ou [emhkAllowsWebLicenseActivation].
bool get emhkUsesWebsiteLicense => emhkShowsWebStorePurchaseLinks;
