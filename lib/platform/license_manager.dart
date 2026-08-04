import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Licence eastmarkhk.com — achat webstore, activation offline par code.
/// Compatible App Store : pas de lien d'achat externe, mais un client déjà
/// abonné sur le site peut coller son code (Apple 3.1.3(b) multi-plateforme).
class LicenseManager extends ChangeNotifier {
  LicenseManager._();
  static final LicenseManager instance = LicenseManager._();

  static const licenseRequestToEmail = 'eastmarkhk@eastmarkhk.com';

  /// Clé publique HMAC eastmarkhk.com (identique aux autres apps EMHK).
  static const _signingKeyB64 =
      'MCowBQYDK2VwAyEAu+mb7t0E06uG4ktcvY9qPu/mncw7pnktrsi3AmTKzWM=';

  static const _kLicenseToken = 'eastmark_crm.license_token';
  static const _kLicenseEmail = 'eastmark_crm.license_email';
  static const _kDeviceId = 'eastmark_crm.device_id';
  static const _kRequestEmail = 'eastmark_crm.license_request_email';

  /// Produits webstore acceptés par module CRM.
  static const moduleProductIds = {
    'invoicing': {
      'EMHK-CRM-INVOICING',
      'EMHK-CRM-INVOICE',
      'EMHK-EINVOICE',
      'EMHK-EINVOICING',
      'EASTMARK-EINVOICE',
      'com.eastmarkhk.crm.invoicing',
      'com.eastmarkhk.einvoicing',
    },
  };

  /// URL boutique — hors App Store uniquement (pas de lien sur iOS store).
  static const modulePurchaseUrls = {
    'invoicing': 'https://eastmarkhk.com/product_view.php?id=73770',
  };

  SharedPreferences? _prefs;
  String? _storedToken;
  String _licensedNote = '';
  String _hardwareUUID = '';
  bool _isBusy = false;
  bool _ready = false;

  bool get isBusy => _isBusy;
  bool get isReady => _ready;
  String get hardwareUUID => _hardwareUUID;
  String get hardwareUUIDFormatted => formattedMachineUUID(_hardwareUUID);
  String? get requestEmail => _prefs?.getString(_kRequestEmail);
  String get licensedNote => _licensedNote;

  bool isLicensedForModule(String moduleId) {
    final token = _storedToken;
    if (token == null) return false;
    return _tokenMatchesModule(token, moduleId);
  }

  DateTime? expiresAtForModule(String moduleId) {
    final token = _storedToken;
    if (token == null || !_tokenMatchesModule(token, moduleId)) return null;
    return _expiryFromToken(token);
  }

  String? purchaseUrlForModule(String moduleId) =>
      modulePurchaseUrls[moduleId];

  Future<void> init() async {
    if (_ready) return;
    _prefs = await SharedPreferences.getInstance();
    _hardwareUUID = await _resolveDeviceId();
    _storedToken = _prefs?.getString(_kLicenseToken);
    _licensedNote = _prefs?.getString(_kLicenseEmail) ?? '';
    _ready = true;
    notifyListeners();
  }

  /// Relit le Hardware UUID (avant import depuis e-Invoicing installé).
  Future<void> refreshHardwareUuid() async {
    _hardwareUUID = await _resolveDeviceId();
  }

  Future<void> setRequestEmail(String email) async {
    await _prefs?.setString(_kRequestEmail, email.trim());
    notifyListeners();
  }

  Future<void> applyPastedActivationToken(
    String raw, {
    bool skipEmailCheck = false,
  }) async {
    // Settings / import e-Invoicing peuvent arriver avant [init] (main allégé).
    if (!_ready || _prefs == null) await init();

    final token = raw.trim().replaceAll('\r', '').replaceAll('\n', '');
    if (token.isEmpty) {
      throw LicenseFlowException('Collez un code d\'activation.');
    }
    if (!skipEmailCheck) {
      final mismatch = _activationEmailMismatchMessage(token);
      if (mismatch != null) throw LicenseFlowException(mismatch);
    }
    if (_isActivationPasteExpiredInPayload(token)) {
      throw LicenseFlowException(
        'Code expiré — renouvelez sur eastmarkhk.com et collez le nouveau code.',
      );
    }
    if (!_verifyTokenCached(token, _hardwareUUID)) {
      throw LicenseFlowException(
        'Code invalide pour cet appareil ou mauvais produit.',
      );
    }
    final note = _bindingNoteFromActivationToken(token, _hardwareUUID);
    if (note == null) {
      throw LicenseFlowException('Impossible de lire le code.');
    }

    _isBusy = true;
    notifyListeners();
    try {
      final prefs = _prefs ?? await SharedPreferences.getInstance();
      _prefs = prefs;
      await prefs.setString(_kLicenseToken, token);
      await prefs.setString(_kLicenseEmail, note);
      _storedToken = token;
      _licensedNote = note;
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  Future<void> clearStoredLicense() async {
    await _prefs?.remove(_kLicenseToken);
    await _prefs?.remove(_kLicenseEmail);
    _storedToken = null;
    _licensedNote = '';
    notifyListeners();
  }

  String licenseRequestClipboardBody(String email, {required String productLabel}) {
    return 'Email: ${email.trim()}\n'
        'Machine ID: $hardwareUUIDFormatted\n'
        'Product: $productLabel\n'
        'Platform: ${Platform.operatingSystem}';
  }

  Uri licenseRequestMailtoUri(String email, {required String productLabel}) {
    final subject = 'Demande de licence — $productLabel (${Platform.operatingSystem})';
    final body = licenseRequestClipboardBody(email, productLabel: productLabel);
    return Uri.parse(
      'mailto:$licenseRequestToEmail'
      '?subject=${Uri.encodeComponent(subject)}'
      '&body=${Uri.encodeComponent(body)}',
    );
  }

  bool _tokenMatchesModule(String token, String moduleId) {
    if (!_verifyTokenCached(token, _hardwareUUID)) return false;
    final product = _productFromToken(token);
    if (product == null || product.isEmpty) return true;
    final allowed = moduleProductIds[moduleId];
    if (allowed == null) return false;
    return allowed.any((a) => a.toLowerCase() == product.toLowerCase());
  }

  String? _productFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 2) return null;
      final dict = jsonDecode(utf8.decode(base64Decode(parts[0])))
          as Map<String, dynamic>;
      return (dict['product_id'] ?? dict['product'] ?? dict['sku'])?.toString().trim();
    } catch (_) {
      return null;
    }
  }

  DateTime? _expiryFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 2) return null;
      final dict = jsonDecode(utf8.decode(base64Decode(parts[0])))
          as Map<String, dynamic>;
      final exp = dict['expires_at'];
      if (exp == null) return null;
      final deadline = exp is num ? exp.toDouble() : double.tryParse(exp.toString());
      if (deadline == null) return null;
      return DateTime.fromMillisecondsSinceEpoch((deadline * 1000).round());
    } catch (_) {
      return null;
    }
  }

  Future<String> _resolveDeviceId() async {
    if (Platform.isMacOS) {
      final uuid = await _readMacHardwareUUID();
      if (uuid != null && uuid.isNotEmpty) return uuid;
    }
    if (Platform.isWindows) {
      final guid = await _readWindowsMachineGuid();
      if (guid != null && guid.isNotEmpty) return guid;
    }
    final existing = _prefs?.getString(_kDeviceId);
    if (existing != null && existing.isNotEmpty) return existing;
    final id = _newUuid();
    await _prefs?.setString(_kDeviceId, id);
    return id;
  }

  Future<String?> _readMacHardwareUUID() async {
    // Préférer IOKit via le canal natif (sandbox Release bloque souvent
    // system_profiler — UUID faux → licence e-Invoicing refusée).
    try {
      const channel = MethodChannel('eastmarkhk/shared_container');
      final native = await channel.invokeMethod<String>('hardwareUUID');
      final trimmed = native?.trim() ?? '';
      if (trimmed.isNotEmpty) return trimmed;
    } catch (_) {}
    try {
      final result = await Process.run('system_profiler', ['SPHardwareDataType']);
      if (result.exitCode != 0) return null;
      final match =
          RegExp(r'Hardware UUID:\s*([0-9A-Fa-f\-]+)').firstMatch('${result.stdout}');
      return match?.group(1)?.trim();
    } catch (_) {
      return null;
    }
  }

  Future<String?> _readWindowsMachineGuid() async {
    try {
      final result = await Process.run('reg', [
        'query',
        r'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography',
        '/v',
        'MachineGuid',
      ]);
      if (result.exitCode != 0) return null;
      final match =
          RegExp(r'MachineGuid\s+REG_SZ\s+([0-9A-Fa-f\-]+)').firstMatch('${result.stdout}');
      return match?.group(1)?.trim();
    } catch (_) {
      return null;
    }
  }

  String _newUuid() {
    final r = DateTime.now().microsecondsSinceEpoch;
    final bytes = utf8.encode('emhk-crm-$r-${Platform.localHostname}');
    return formattedMachineUUID(sha256.convert(bytes).toString().substring(0, 32));
  }

  static bool _verifyTokenCached(String tokenString, String hardwareUUID) {
    final parts = tokenString.split('.');
    if (parts.length != 2) return false;
    late final List<int> payloadData;
    late final List<int> signatureData;
    try {
      payloadData = base64Decode(parts[0]);
      signatureData = base64Decode(parts[1]);
    } catch (_) {
      return false;
    }
    late final Map<String, dynamic> dict;
    try {
      dict = jsonDecode(utf8.decode(payloadData)) as Map<String, dynamic>;
    } catch (_) {
      return false;
    }
    final uid = (dict['hardware_uuid'] ?? dict['machine_id']) as String?;
    if (uid == null) return false;
    if (formattedMachineUUID(uid) != formattedMachineUUID(hardwareUUID)) {
      return false;
    }
    return _verifyServerHmac(payloadData, signatureData);
  }

  static bool _isActivationPasteExpiredInPayload(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 2) return false;
      final dict = jsonDecode(utf8.decode(base64Decode(parts[0])))
          as Map<String, dynamic>;
      final exp = dict['expires_at'];
      if (exp == null) return false;
      final deadline = exp is num ? exp.toDouble() : double.tryParse(exp.toString());
      if (deadline == null) return false;
      return DateTime.now().millisecondsSinceEpoch / 1000.0 > deadline;
    } catch (_) {
      return false;
    }
  }

  String? _activationEmailMismatchMessage(String token) {
    final app = (_prefs?.getString(_kRequestEmail) ?? '').trim().toLowerCase();
    if (app.isEmpty) return null;
    try {
      final parts = token.split('.');
      if (parts.length != 2) return null;
      final dict = jsonDecode(utf8.decode(base64Decode(parts[0])))
          as Map<String, dynamic>;
      final tok = (dict['customer_email'] as String?)?.trim().toLowerCase() ?? '';
      if (tok.isEmpty || tok == app) return null;
      return 'Ce code a été émis pour un autre e-mail.';
    } catch (_) {
      return null;
    }
  }

  static bool _verifyServerHmac(List<int> message, List<int> signature) {
    try {
      final key = base64Decode(_signingKeyB64);
      final expected = Hmac(sha256, key).convert(message).bytes;
      if (expected.length != signature.length) return false;
      var ok = 0;
      for (var i = 0; i < expected.length; i++) {
        ok |= expected[i] ^ signature[i];
      }
      return ok == 0;
    } catch (_) {
      return false;
    }
  }

  static String? _bindingNoteFromActivationToken(String token, String hardwareUUID) {
    try {
      final parts = token.split('.');
      if (parts.length != 2) return null;
      final dict = jsonDecode(utf8.decode(base64Decode(parts[0])))
          as Map<String, dynamic>;
      return _activationDisplayNote(dict, hardwareUUID);
    } catch (_) {
      return null;
    }
  }

  static String _activationDisplayNote(Map<String, dynamic> json, String hardwareUUID) {
    final machineId = (json['machine_id'] as String?)?.trim() ?? '';
    final cust = (json['customer_email'] as String?)?.trim() ?? '';
    final label = (json['activation_label'] as String?)?.trim() ?? '';
    final idLine =
        machineId.isNotEmpty ? machineId : formattedMachineUUID(hardwareUUID);
    final parts = <String>[];
    if (label.isNotEmpty) parts.add(label);
    if (cust.isNotEmpty) parts.add(cust);
    parts.add(idLine);
    return parts.join(' · ');
  }

  static String formattedMachineUUID(String raw) {
    final hex = raw.toUpperCase().replaceAll(RegExp(r'[^0-9A-F]'), '');
    if (hex.length != 32) return raw.trim().toUpperCase();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
        '${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20, 32)}';
  }
}

class LicenseFlowException implements Exception {
  LicenseFlowException(this.message);
  final String message;
  @override
  String toString() => message;
}
