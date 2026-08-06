import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Stockage sécurisé partagé (mot de passe sync, etc.).
///
/// macOS : Data Protection Keychain désactivée (sinon échecs en debug/sandbox).
/// Windows : options explicites — sans ça, Credential Manager peut échouer
/// silencieusement sous MSIX et la sync auto n’a plus de mot de passe.
FlutterSecureStorage createSecureCredentialStorage() {
  return const FlutterSecureStorage(
    mOptions: MacOsOptions(usesDataProtectionKeychain: false),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    // Compat lecture des anciennes entrées Credential Locker (v9 → v10).
    wOptions: WindowsOptions(useBackwardCompatibility: true),
  );
}

/// True si la plateforme utilise un trousseau/credential manager natif
/// susceptible d’échouer (écriture à traiter comme erreur dure pour la sync).
bool get secureCredentialStorageIsCritical =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS);
