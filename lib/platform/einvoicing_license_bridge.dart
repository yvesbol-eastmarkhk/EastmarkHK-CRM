import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Lit la licence de l'app standalone **EastmarkHK e-Invoicing** (macOS).
///
/// Ordre de lecture (sandbox Release) :
/// 1. Fichier miroir App Group `einvoicing_license.json` (Dart — fiable)
/// 2. Canal natif (CFPreferences + plist conteneur)
/// 3. PlistBuddy (debug / sandbox off)
class EinvoicingLicenseBridge {
  EinvoicingLicenseBridge._();

  static const _channel = MethodChannel('eastmarkhk/shared_container');
  static const _einvoicingBundleId = 'com.eastmarkhk.einvoicing';
  static const _prefsFileName = 'com.eastmarkhk.einvoicing.plist';
  static const _plistBuddy = '/usr/libexec/PlistBuddy';
  static const _mirrorFileName = 'einvoicing_license.json';

  static const _kLicenseToken = 'eastmark_einvoicing.license_token';
  static const _kPremiumActive = 'einvoice_premium_active';
  static const _kPremiumExpiry = 'einvoice_premium_expiry';
  static const _kTrialStart = 'eastmark_einvoicing.trial_start';
  static const _kDataStorageMode = 'data_storage_mode';

  static String? _cachedGroupRoot;

  /// macOS + iOS/iPadOS : les deux plateformes où l'app sœur e-Invoicing
  /// existe et peut partager un App Group avec le CRM.
  static bool get _supportsSharedContainer =>
      Platform.isMacOS || Platform.isIOS;

  /// HOME réel — hors conteneur sandbox du CRM.
  static String? _realUserHome() {
    if (!Platform.isMacOS) return Platform.environment['HOME'];
    final home = Platform.environment['HOME'];
    if (home == null || home.isEmpty) return null;
    const marker = '/Library/Containers/';
    final idx = home.indexOf(marker);
    if (idx > 0) return home.substring(0, idx);
    return home;
  }

  static List<String> prefsCandidatePaths() {
    final home = _realUserHome();
    if (home == null) return [];
    return [
      '$home/Library/Containers/$_einvoicingBundleId/Data/Library/Preferences/$_prefsFileName',
      '$home/Library/Preferences/$_prefsFileName',
    ];
  }

  static Future<String?> _appGroupRoot() async {
    if (_cachedGroupRoot != null) return _cachedGroupRoot;
    try {
      final root = await _channel.invokeMethod<String>('path');
      if (root != null && root.isNotEmpty) {
        _cachedGroupRoot = root;
        return root;
      }
    } catch (e) {
      debugPrint('EinvoicingLicenseBridge: App Group path — $e');
    }
    return null;
  }

  /// Miroir JSON écrit dans `group.com.eastmarkhk.shared`.
  static Future<Map<String, dynamic>?> _readAppGroupMirror() async {
    try {
      final root = await _appGroupRoot();
      if (root == null) return null;
      final file = File('$root/$_mirrorFileName');
      if (!await file.exists()) {
        debugPrint('EinvoicingLicenseBridge: pas de miroir ($file)');
        return null;
      }
      final map = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      debugPrint('EinvoicingLicenseBridge: miroir App Group lu (${map.keys.join(",")})');
      return map;
    } catch (e) {
      debugPrint('EinvoicingLicenseBridge: miroir App Group — $e');
      return null;
    }
  }

  static Future<String?> _readFromAppGroupMirror(String key) async {
    final map = await _readAppGroupMirror();
    if (map == null) return null;
    final bare = key.startsWith('flutter.') ? key.substring(8) : key;

    String? asString(dynamic v) {
      if (v == null) return null;
      if (v is String && v.isNotEmpty) return v;
      if (v is bool) return v ? 'true' : 'false';
      if (v is num) return v.toString();
      return null;
    }

    if (bare.contains('license_token')) {
      return asString(map['license_token'] ?? map[bare] ?? map[key]);
    }
    if (bare.contains('license_email')) {
      return asString(map['license_email'] ?? map[bare] ?? map[key]);
    }
    if (bare.contains('premium_active')) {
      return asString(map['premium_active'] ?? map[bare] ?? map[key]);
    }
    if (bare.contains('premium_expiry')) {
      return asString(map['premium_expiry'] ?? map[bare] ?? map[key]);
    }
    if (bare.contains('data_storage_mode')) {
      return asString(map['data_storage_mode'] ?? map[bare] ?? map[key]);
    }
    if (bare.contains('remote_base_url') || bare == 'remote_base_url') {
      return asString(map['remote_base_url'] ?? map[bare] ?? map[key]);
    }
    if (bare.contains('remote_ftp_user') || bare == 'remote_ftp_user') {
      return asString(map['remote_ftp_user'] ?? map[bare] ?? map[key]);
    }
    if (bare.contains('remote_ftp_password') || bare == 'remote_ftp_password') {
      return asString(map['remote_ftp_password'] ?? map[bare] ?? map[key]);
    }
    if (bare.contains('trial_start')) {
      return asString(map['trial_start'] ?? map[bare] ?? map[key]);
    }
    return asString(map[bare] ?? map[key] ?? map['flutter.$bare']);
  }

  static Future<String?> _readNativePref(String key) async {
    if (!Platform.isMacOS) return null;
    try {
      final v = await _channel.invokeMethod<String>('readEinvoicingPref', key);
      if (v != null && v.isNotEmpty) {
        debugPrint('EinvoicingLicenseBridge: $key via native');
        return v;
      }
    } catch (e) {
      debugPrint('EinvoicingLicenseBridge: native $key — $e');
    }
    return null;
  }

  static Future<String?> _readPlistString(String path, String key) async {
    for (final k in [key, 'flutter.$key']) {
      try {
        final result = await Process.run(_plistBuddy, ['-c', 'Print "$k"', path]);
        if (result.exitCode != 0) continue;
        final v = '${result.stdout}'.trim();
        if (v.isEmpty || v == '(null)' || v.startsWith('Print:')) continue;
        return v;
      } catch (e) {
        debugPrint('EinvoicingLicenseBridge: PlistBuddy "$k" — $e');
      }
    }
    return null;
  }

  static Future<String?> _readPref(String key) async {
    final fromGroup = await _readFromAppGroupMirror(key);
    if (fromGroup != null) return fromGroup;

    final native = await _readNativePref(key);
    if (native != null) return native;

    for (final path in prefsCandidatePaths()) {
      final v = await _readPlistString(path, key);
      if (v != null) {
        debugPrint('EinvoicingLicenseBridge: $key lu ($path)');
        return v;
      }
    }
    return null;
  }

  static Future<bool?> _readPlistBool(String key) async {
    final raw = await _readPref(key);
    if (raw == null) return null;
    if (raw == 'true' || raw == '1') return true;
    if (raw == 'false' || raw == '0') return false;
    return null;
  }

  /// Token d'activation eastmarkhk.com stocké par e-Invoicing.
  static Future<String?> readStoredLicenseToken() async {
    if (!_supportsSharedContainer) return null;
    final token = await _readPref(_kLicenseToken);
    if (token != null) {
      debugPrint('EinvoicingLicenseBridge: licence e-Invoicing détectée (${token.length} car.)');
      unawaited(_mirrorTokenToAppGroup(token));
      return token;
    }
    debugPrint(
      'EinvoicingLicenseBridge: aucun token '
      '(miroir + native + ${prefsCandidatePaths().join(' | ')})',
    );
    return null;
  }

  static Future<void> _mirrorTokenToAppGroup(String token) async {
    try {
      final root = await _appGroupRoot();
      if (root == null) return;
      final file = File('$root/$_mirrorFileName');
      final mode = await _readFromAppGroupMirror(_kDataStorageMode) ??
          await _readNativePref(_kDataStorageMode);
      final payload = <String, dynamic>{'license_token': token};
      if (mode != null) payload['data_storage_mode'] = mode;
      await file.writeAsString(jsonEncode(payload));
    } catch (e) {
      debugPrint('EinvoicingLicenseBridge: écriture miroir — $e');
    }
  }

  static Future<bool> readPremiumSubscriptionActive() async {
    if (!_supportsSharedContainer) return false;
    if (await _readPlistBool(_kPremiumActive) != true) return false;
    final expiry = await _readPref(_kPremiumExpiry);
    if (expiry == null) return true;
    final exp = DateTime.tryParse(expiry);
    return exp == null || exp.isAfter(DateTime.now());
  }

  static Future<String?> dataStorageMode() async {
    if (!_supportsSharedContainer) return null;
    return _readPref(_kDataStorageMode);
  }

  static Future<bool> isRemoteModeActive() async {
    final mode = await dataStorageMode();
    return mode == 'remote';
  }

  static Future<bool> isEinvoicingAppInstalled() async {
    if (!_supportsSharedContainer) return false;
    try {
      final installed =
          await _channel.invokeMethod<bool>('isEInvoicingInstalled') ?? false;
      if (installed) return true;
    } catch (_) {}
    // Seule l'app e-Invoicing écrit ce miroir (à chaque lancement) : sa simple
    // présence suffit à prouver l'installation, même sans licence active.
    if (await _readAppGroupMirror() != null) return true;
    return (await readStoredLicenseToken()) != null ||
        await readPremiumSubscriptionActive() ||
        await _readPref(_kTrialStart) != null;
  }

  /// URL API distante e-Invoicing (`remote_base_url`).
  static Future<String?> readRemoteBaseUrl() async {
    if (!_supportsSharedContainer) return null;
    final fromMirror = await _readFromAppGroupMirror('remote_base_url');
    if (fromMirror != null && fromMirror.isNotEmpty) return fromMirror;
    return _readPref('remote_base_url');
  }

  /// Login FTP / API (`remote_ftp_user`).
  static Future<String?> readRemoteFtpUser() async {
    if (!_supportsSharedContainer) return null;
    final fromMirror = await _readFromAppGroupMirror('remote_ftp_user');
    if (fromMirror != null && fromMirror.isNotEmpty) return fromMirror;
    return _readPref('remote_ftp_user');
  }

  /// Mot de passe FTP — fichier fallback sandbox e-Invoicing (base64),
  /// ou champ `remote_ftp_password` du miroir App Group.
  static Future<String?> readRemoteFtpPassword() async {
    if (!_supportsSharedContainer) return null;
    final fromMirror = await _readFromAppGroupMirror('remote_ftp_password');
    if (fromMirror != null && fromMirror.isNotEmpty) return fromMirror;

    final home = _realUserHome();
    if (home == null) return null;
    final secret = File(
      '$home/Library/Containers/$_einvoicingBundleId/Data/Library/Application Support/'
      '$_einvoicingBundleId/.remote_ftp_secret',
    );
    try {
      if (!await secret.exists()) {
        debugPrint('EinvoicingLicenseBridge: pas de .remote_ftp_secret');
        return null;
      }
      final encoded = (await secret.readAsString()).trim();
      if (encoded.isEmpty) return null;
      final decoded = utf8.decode(base64Decode(encoded));
      return decoded.isEmpty ? null : decoded;
    } catch (e) {
      debugPrint('EinvoicingLicenseBridge: lecture FTP secret — $e');
      return null;
    }
  }
}
