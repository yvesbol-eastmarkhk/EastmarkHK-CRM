import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/secure_credential_storage.dart';
import 'einvoicing_license_bridge.dart';

/// Identifiants API distante d'EastmarkHK e-Invoicing, saisis une fois côté
/// CRM. Nécessaires uniquement quand e-Invoicing est en mode « distant ».
class EinvoiceRemoteConfig {
  EinvoiceRemoteConfig._();

  static const _kBaseUrl = 'einvoice_remote.base_url';
  static const _kUser = 'einvoice_remote.user';
  static const _kPassword = 'einvoice_remote.password';

  static final _storage = createSecureCredentialStorage();

  static Future<EinvoiceRemoteCredentials> load() async {
    final prefs = await SharedPreferences.getInstance();
    final baseUrl = normalizeBaseUrl(prefs.getString(_kBaseUrl) ?? '');
    final user = prefs.getString(_kUser) ?? '';
    String password = '';
    try {
      password = await _storage.read(key: _kPassword) ?? '';
    } catch (_) {}
    return EinvoiceRemoteCredentials(baseUrl: baseUrl, user: user, password: password);
  }

  static Future<void> save(EinvoiceRemoteCredentials creds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kBaseUrl, normalizeBaseUrl(creds.baseUrl));
    await prefs.setString(_kUser, creds.user.trim());
    try {
      if (creds.password.isEmpty) {
        await _storage.delete(key: _kPassword);
      } else {
        await _storage.write(key: _kPassword, value: creds.password);
      }
    } catch (_) {}
  }

  /// Si le CRM n'a pas encore d'identifiants API mais qu'e-Invoicing tourne
  /// en mode distant, importe URL / login / mot de passe depuis l'app sœur
  /// (prefs + fichier fallback sandbox, via entitlements temporary-exception).
  static Future<bool> importFromEinvoicingIfNeeded() async {
    if (!(Platform.isMacOS || Platform.isIOS)) return false;
    final existing = await load();
    if (existing.isComplete) return false;
    if (!await EinvoicingLicenseBridge.isRemoteModeActive()) return false;

    final baseUrl = await EinvoicingLicenseBridge.readRemoteBaseUrl() ?? '';
    final user = await EinvoicingLicenseBridge.readRemoteFtpUser() ?? '';
    final password = await EinvoicingLicenseBridge.readRemoteFtpPassword() ?? '';
    if (baseUrl.trim().isEmpty || user.trim().isEmpty || password.isEmpty) {
      debugPrint(
        'EinvoiceRemoteConfig: import incomplet '
        '(url=${baseUrl.isNotEmpty}, user=${user.isNotEmpty}, pass=${password.isNotEmpty})',
      );
      return false;
    }
    await save(EinvoiceRemoteCredentials(
      baseUrl: baseUrl,
      user: user,
      password: password,
    ));
    debugPrint('EinvoiceRemoteConfig: identifiants e-Invoicing importés');
    return true;
  }

  static String normalizeBaseUrl(String raw) {
    var trimmed = raw.trim();
    if (trimmed.isEmpty) return trimmed;
    if (!trimmed.startsWith('http://') && !trimmed.startsWith('https://')) {
      trimmed = 'https://$trimmed';
    }
    while (trimmed.endsWith('/')) {
      trimmed = trimmed.substring(0, trimmed.length - 1);
    }
    final uri = Uri.tryParse(trimmed);
    final host = (uri?.host ?? '').toLowerCase();
    // Domaine unifié : API sous /invoice/index.php (pas à la racine).
    if (host == 'emhk.eastmarkhk.com' || host.startsWith('emhk.')) {
      final path = uri?.path ?? '';
      if (path.isEmpty ||
          path == '/' ||
          path == '/index.php' ||
          path == '/invoice' ||
          path == '/invoice/') {
        return 'https://$host/invoice/index.php';
      }
      return trimmed;
    }
    // Ancien sous-domaine inv.* → nouvel emplacement.
    if (host == 'inv.eastmarkhk.com') {
      return 'https://emhk.eastmarkhk.com/invoice/index.php';
    }
    if (uri != null && (uri.path.isEmpty || uri.path == '/')) {
      trimmed = '$trimmed/index.php';
    }
    return trimmed;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kBaseUrl);
    await prefs.remove(_kUser);
    try {
      await _storage.delete(key: _kPassword);
    } catch (_) {}
  }
}

class EinvoiceRemoteCredentials {
  const EinvoiceRemoteCredentials({
    required this.baseUrl,
    required this.user,
    required this.password,
  });

  final String baseUrl;
  final String user;
  final String password;

  bool get isComplete =>
      baseUrl.trim().isNotEmpty && user.trim().isNotEmpty && password.isNotEmpty;
}
