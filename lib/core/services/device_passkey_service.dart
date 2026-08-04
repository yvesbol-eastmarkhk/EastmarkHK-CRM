import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

/// Déverrouillage rapide par Touch ID, lié à un jeton d'appareil aléatoire
/// stocké dans le trousseau sécurisé — jamais dans la base SQLite.
///
/// ⚠️ Ce n'est PAS un passkey WebAuthn/FIDO2 portable (qui nécessite un
/// relying party serveur et une cérémonie d'attestation). C'est un secret
/// local, propre à cet appareil : pratique pour éviter de retaper son mot
/// de passe, mais il ne se synchronise pas entre appareils. Le vrai passkey
/// portable arrivera avec le module Sync & Équipe, sur crm.eastmarkhk.com
/// (les endpoints WebAuthn existent déjà côté eastmarkhk.com).
class DevicePasskeyService {
  DevicePasskeyService._();

  // Même option qu'e-Invoicing : le trousseau Data Protection casse
  // passkey/Touch ID sous sandbox / après changement de bundle ID.
  static const _storage = FlutterSecureStorage(
    mOptions: MacOsOptions(usesDataProtectionKeychain: false),
  );
  static final LocalAuthentication _auth = LocalAuthentication();

  static String _key(String userId) => 'device_passkey_$userId';

  static String _randomToken() {
    final rnd = Random.secure();
    final bytes = Uint8List.fromList(List.generate(32, (_) => rnd.nextInt(256)));
    return base64UrlEncode(bytes);
  }

  /// Crée (ou remplace) le jeton d'appareil pour ce compte et le stocke
  /// dans le trousseau. À appeler quand l'utilisateur active Touch ID.
  static Future<String> createToken(String userId) async {
    final token = _randomToken();
    await _storage.write(key: _key(userId), value: token);
    return token;
  }

  static Future<bool> hasToken(String userId) async {
    final v = await _storage.read(key: _key(userId));
    return v != null;
  }

  static Future<void> removeToken(String userId) async {
    await _storage.delete(key: _key(userId));
  }

  static Future<bool> deviceSupportsBiometrics() async {
    try {
      final supported = await _auth.isDeviceSupported();
      if (!supported) return false;
      final canCheck = await _auth.canCheckBiometrics;
      final biometrics = await _auth.getAvailableBiometrics();
      return canCheck || biometrics.isNotEmpty || supported;
    } catch (_) {
      return false;
    }
  }

  /// Demande Touch ID / Face ID / code appareil — même comportement qu'e-Invoicing
  /// (`biometricOnly: false` pour autoriser le code de secours macOS/iOS).
  static Future<bool> unlock(String userId) async {
    final hasStoredToken = await hasToken(userId);
    if (!hasStoredToken) return false;
    try {
      return await _auth.authenticate(
        localizedReason: 'Déverrouiller EastmarkHK CRM',
        biometricOnly: false,
        persistAcrossBackgrounding: true,
      );
    } catch (_) {
      return false;
    }
  }
}
