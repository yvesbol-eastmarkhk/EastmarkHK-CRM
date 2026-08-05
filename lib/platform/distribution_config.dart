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

/// Fiche Microsoft Store d'EastmarkHK e-Invoicing (CRM Windows / MSIX).
/// Surcharge possible : `--dart-define=EMHK_EINVOICING_MS_STORE_URL=…`.
const String kEmhkEinvoicingMicrosoftStoreUrl = String.fromEnvironment(
  'EMHK_EINVOICING_MS_STORE_URL',
  defaultValue: 'https://apps.microsoft.com/detail/9NHV9X5RN3P4',
);

bool get emhkHasEinvoicingMicrosoftStoreUrl =>
    kEmhkEinvoicingMicrosoftStoreUrl.trim().isNotEmpty;

/// Windows : ouvrir e-Invoicing via Microsoft Store (pas App Store / pas site).
bool get emhkUsesMicrosoftStoreForEinvoicing {
  if (kIsWeb) return false;
  return Platform.isWindows && emhkHasEinvoicingMicrosoftStoreUrl;
}

/// URL d’acquisition d’e-Invoicing selon la plateforme.
String? get emhkEinvoicingAcquireUrl {
  if (emhkUsesMicrosoftStoreForEinvoicing) {
    return kEmhkEinvoicingMicrosoftStoreUrl.trim();
  }
  if (emhkUsesAppStoreIap && emhkHasEinvoicingAppStoreUrl) {
    return kEmhkEinvoicingAppStoreUrl.trim();
  }
  return null;
}

/// Activation par code (client déjà abonné sur le webstore).
/// Masquée sur iOS / macOS App Store (Guideline 3.1.1 — pas d’UI
/// « abonnement eastmarkhk.com » à côté de l’IAP).
bool get emhkAllowsWebLicenseActivation =>
    !kIsWeb && !emhkUsesAppStoreIap;

/// @deprecated Utiliser [emhkShowsWebStorePurchaseLinks] ou [emhkAllowsWebLicenseActivation].
bool get emhkUsesWebsiteLicense => emhkShowsWebStorePurchaseLinks;
