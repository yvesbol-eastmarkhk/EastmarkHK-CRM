import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Déverrouillage rapide par biométrie / Windows Hello, lié à un jeton
/// d'appareil aléatoire — jamais dans la base SQLite.
///
/// ⚠️ Ce n'est PAS un passkey WebAuthn/FIDO2 portable (qui nécessite un
/// relying party serveur et une cérémonie d'attestation). C'est un secret
/// local, propre à cet appareil : pratique pour éviter de retaper son mot
/// de passe, mais il ne se synchronise pas entre appareils. Le vrai passkey
/// portable arrivera avec le module Sync & Équipe, sur crm.eastmarkhk.com
/// (les endpoints WebAuthn existent déjà côté eastmarkhk.com).
///
/// Stockage : trousseau / Credential Locker en priorité, avec **fallback
/// fichier** dans Application Support. Sur Windows (surtout MSIX), le
/// stockage sécurisé échoue parfois alors que Windows Hello est bien
/// disponible — sans fallback le bouton passkey n'apparaissait jamais
/// (`createToken` plantait dans un `catch` silencieux).
class DevicePasskeyService {
  DevicePasskeyService._();

  static const _storage = FlutterSecureStorage(
    // Trousseau Data Protection casse passkey/Touch ID sous sandbox /
    // après changement de bundle ID (même réglage qu'e-Invoicing).
    mOptions: MacOsOptions(usesDataProtectionKeychain: false),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    // Compat lecture des anciennes entrées Credential Locker (v9 → v10).
    wOptions: WindowsOptions(useBackwardCompatibility: true),
  );
  static final LocalAuthentication _auth = LocalAuthentication();

  static String _key(String userId) => 'device_passkey_$userId';

  static String _randomToken() {
    final rnd = Random.secure();
    final bytes = Uint8List.fromList(List.generate(32, (_) => rnd.nextInt(256)));
    return base64UrlEncode(bytes);
  }

  /// Crée (ou remplace) le jeton d'appareil pour ce compte.
  /// À appeler quand l'utilisateur active Touch ID / Windows Hello,
  /// ou après un login MDP réussi.
  static Future<String> createToken(String userId) async {
    final token = _randomToken();
    var secureOk = false;
    try {
      await _storage.write(key: _key(userId), value: token);
      secureOk = true;
    } catch (e, st) {
      debugPrint('DevicePasskeyService secure write failed: $e\n$st');
    }
    // Toujours écrire le fallback : sur Windows le Credential Locker peut
    // réussir à l'écriture puis échouer à la lecture (identité MSIX).
    await _writeFallback(userId, token);
    if (!secureOk) {
      debugPrint(
        'DevicePasskeyService: token kept in Application Support fallback '
        '(Windows Hello / biometrics still usable).',
      );
    }
    return token;
  }

  static Future<bool> hasToken(String userId) async {
    final token = await _readToken(userId);
    return token != null && token.isNotEmpty;
  }

  static Future<void> removeToken(String userId) async {
    try {
      await _storage.delete(key: _key(userId));
    } catch (e) {
      debugPrint('DevicePasskeyService secure delete failed: $e');
    }
    await _deleteFallback(userId);
  }

  static Future<bool> deviceSupportsBiometrics() async {
    try {
      final supported = await _auth.isDeviceSupported();
      if (!supported) return false;
      final canCheck = await _auth.canCheckBiometrics;
      final biometrics = await _auth.getAvailableBiometrics();
      // Windows Hello : canCheckBiometrics == isDeviceSupported ; la liste
      // peut être vide selon le plugin — on accepte `supported` seul.
      return canCheck || biometrics.isNotEmpty || supported;
    } catch (e) {
      debugPrint('DevicePasskeyService.deviceSupportsBiometrics: $e');
      return false;
    }
  }

  /// Demande Touch ID / Face ID / Windows Hello / code appareil.
  /// (`biometricOnly: false` pour autoriser le code de secours).
  static Future<bool> unlock(String userId) async {
    final hasStoredToken = await hasToken(userId);
    if (!hasStoredToken) return false;
    try {
      return await _auth.authenticate(
        localizedReason: 'Unlock EastmarkHK CRM',
        biometricOnly: false,
        persistAcrossBackgrounding: true,
      );
    } catch (e) {
      debugPrint('DevicePasskeyService.unlock failed: $e');
      return false;
    }
  }

  static Future<String?> _readToken(String userId) async {
    try {
      final fromSecure = await _storage.read(key: _key(userId));
      if (fromSecure != null && fromSecure.isNotEmpty) {
        // Réplique vers le fallback si manquant (migration / MSIX).
        unawaited(_writeFallback(userId, fromSecure));
        return fromSecure;
      }
    } catch (e) {
      debugPrint('DevicePasskeyService secure read failed: $e');
    }
    return _readFallback(userId);
  }

  static Future<File> _fallbackFile(String userId) async {
    final dir = await getApplicationSupportDirectory();
    final safeId = userId.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_');
    final folder = Directory(p.join(dir.path, 'passkeys'));
    await folder.create(recursive: true);
    return File(p.join(folder.path, '$safeId.token'));
  }

  static Future<void> _writeFallback(String userId, String token) async {
    try {
      final file = await _fallbackFile(userId);
      await file.writeAsString(base64Encode(utf8.encode(token)), flush: true);
    } catch (e) {
      debugPrint('DevicePasskeyService fallback write failed: $e');
    }
  }

  static Future<String?> _readFallback(String userId) async {
    try {
      final file = await _fallbackFile(userId);
      if (!await file.exists()) return null;
      final raw = (await file.readAsString()).trim();
      if (raw.isEmpty) return null;
      return utf8.decode(base64Decode(raw));
    } catch (e) {
      debugPrint('DevicePasskeyService fallback read failed: $e');
      return null;
    }
  }

  static Future<void> _deleteFallback(String userId) async {
    try {
      final file = await _fallbackFile(userId);
      if (await file.exists()) await file.delete();
    } catch (_) {}
  }
}
