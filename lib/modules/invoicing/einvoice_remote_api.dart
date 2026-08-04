import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../../platform/einvoice_remote_config.dart';
import 'ei_models.dart';

/// Client HTTP vers l'API PHP d'EastmarkHK e-Invoicing (mode « stockage
/// distant »), utilisé quand la base SQLite locale d'e-Invoicing n'est plus
/// la source de vérité (voir `EInvoiceConnector`).
///
/// Miroir volontairement minimal de `remote_einvoicing_api.dart` côté
/// e-Invoicing : mêmes routes (`/einvoicing/customers`, `/quotes`,
/// `/invoices`), même schéma JSON (clés = colonnes SQLite de e-Invoicing,
/// `snake_case`), même auth (`Authorization: Bearer <mot de passe>` +
/// `X-Emhk-Ftp-User: <login>`). Ne gère que le mode d'auth « moderne »
/// (serveur e-Invoicing ≥ 1.4) — pas le fallback token legacy.
///
/// Sur `https://inv.eastmarkhk.com` (hébergement sans rewrite), l'URL de
/// base doit inclure `/index.php` →
/// `https://inv.eastmarkhk.com/index.php/einvoicing/ping`.
/// [EinvoiceRemoteConfig.normalizeBaseUrl] l'ajoute automatiquement.
class EInvoiceRemoteApi {
  EInvoiceRemoteApi._();
  static final EInvoiceRemoteApi instance = EInvoiceRemoteApi._();

  static const _prefix = '/einvoicing';

  Future<bool> isConfigured() async {
    final c = await EinvoiceRemoteConfig.load();
    return c.isComplete;
  }

  Uri _uri(EinvoiceRemoteCredentials c, String path, [Map<String, String>? query]) {
    var base = EinvoiceRemoteConfig.normalizeBaseUrl(c.baseUrl);
    while (base.endsWith('/')) {
      base = base.substring(0, base.length - 1);
    }
    final p = path.startsWith('/') ? path : '/$path';
    final full = p.startsWith(_prefix) ? p : '$_prefix$p';
    return Uri.parse('$base$full').replace(queryParameters: {
      ...?query,
      '_': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  Map<String, String> _headers(EinvoiceRemoteCredentials c, {bool jsonBody = false}) => {
        if (jsonBody) 'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
        'Cache-Control': 'no-cache',
        'Pragma': 'no-cache',
        'Authorization': 'Bearer ${c.password}',
        'X-Emhk-Ftp-User': c.user.trim(),
      };

  Map<String, dynamic> _decode(http.Response res) {
    Map<String, dynamic> map = {};
    try {
      final decoded = jsonDecode(res.body);
      if (decoded is Map) map = Map<String, dynamic>.from(decoded);
    } catch (_) {}
    if (res.statusCode >= 400 || map['ok'] == false) {
      final err = '${map['error'] ?? map['reason'] ?? res.body}';
      throw StateError('API e-Invoicing ${res.statusCode} : $err');
    }
    return map;
  }

  Future<EinvoiceRemoteCredentials> _requireCreds() async {
    final c = await EinvoiceRemoteConfig.load();
    if (!c.isComplete) {
      throw StateError(
          'Connexion à l\'API e-Invoicing non configurée — renseigne l\'URL, '
          'le login et le mot de passe dans les réglages du module.');
    }
    return c;
  }

  /// GET /einvoicing/ping — vérifie que les identifiants fonctionnent.
  Future<void> testConnection() async {
    final c = await _requireCreds();
    final res = await http
        .get(_uri(c, '/ping'), headers: _headers(c))
        .timeout(const Duration(seconds: 15));
    _decode(res);
  }

  // ---- Clients ---------------------------------------------------------

  Future<List<Map<String, dynamic>>> listCustomers({String search = ''}) async {
    final c = await _requireCreds();
    final res = await http
        .get(
          _uri(c, '/customers', search.trim().isEmpty ? null : {'q': search.trim()}),
          headers: _headers(c),
        )
        .timeout(const Duration(seconds: 60));
    final map = _decode(res);
    final items = map['items'];
    if (items is! List) return const [];
    return items.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
  }

  /// Crée (ou met à jour si `uuid` déjà connu du serveur) un client distant.
  /// Renvoie la ligne serveur (avec son `uuid` et `id` distants).
  Future<Map<String, dynamic>> upsertCustomer(Map<String, dynamic> customerJson) async {
    final c = await _requireCreds();
    final res = await http
        .post(
          _uri(c, '/customers'),
          headers: _headers(c, jsonBody: true),
          body: jsonEncode(customerJson),
        )
        .timeout(const Duration(seconds: 60));
    final map = _decode(res);
    final row = map['row'];
    if (row is Map) return Map<String, dynamic>.from(row);
    throw StateError('API e-Invoicing : réponse client inattendue ($map)');
  }

  /// Recherche seule (sans création) — correspondance TVA puis nom. Utilisé
  /// pour afficher les documents d'un client sans créer de fiche distante
  /// juste pour vérifier qu'elle existe.
  Future<String?> findCustomerUuid({required String name, String? vatNumber}) async {
    final hit = await findCustomer(name: name, vatNumber: vatNumber);
    return hit?.uuid;
  }

  /// Comme [findCustomerUuid], mais renvoie le client complet (nom + TVA)
  /// pour détecter les écarts de libellé avant création d'un document.
  Future<EiCustomerHit?> findCustomer({required String name, String? vatNumber}) async {
    final vat = vatNumber?.trim() ?? '';
    if (vat.isNotEmpty) {
      final byVat = await listCustomers(search: vat);
      final match = byVat.firstWhereOrNull(
          (r) => '${r['vat_number'] ?? ''}'.trim().toLowerCase() == vat.toLowerCase());
      if (match != null) return _hitFromRemote(match);
    }
    final byName = await listCustomers(search: name);
    final matchName = byName.firstWhereOrNull(
        (r) => '${r['name'] ?? ''}'.trim().toLowerCase() == name.trim().toLowerCase());
    return matchName == null ? null : _hitFromRemote(matchName);
  }

  /// Recherche séparée TVA / email / téléphone / nom (dialogue de résolution).
  Future<({
    EiCustomerHit? byTaxId,
    EiCustomerHit? byEmail,
    EiCustomerHit? byPhone,
    EiCustomerHit? byName,
  })> findCustomerCandidates({
    required String name,
    String? vatNumber,
    String? email,
    String? phone,
    String? preferUuid,
  }) async {
    EiCustomerHit? byTaxId;
    EiCustomerHit? byEmail;
    EiCustomerHit? byPhone;
    EiCustomerHit? byName;

    if (preferUuid != null && preferUuid.isNotEmpty) {
      final all = await listCustomers(search: preferUuid);
      final linked = all.firstWhereOrNull((r) => r['uuid'] == preferUuid) ??
          (await listCustomers()).firstWhereOrNull((r) => r['uuid'] == preferUuid);
      if (linked != null) {
        return (
          byTaxId: _hitFromRemote(linked, EiCustomerMatchBy.linked),
          byEmail: null,
          byPhone: null,
          byName: null,
        );
      }
    }

    final vat = vatNumber?.trim() ?? '';
    if (vat.isNotEmpty) {
      final byVat = await listCustomers(search: vat);
      final match = byVat.firstWhereOrNull(
          (r) => '${r['vat_number'] ?? ''}'.trim().toLowerCase() == vat.toLowerCase());
      if (match != null) byTaxId = _hitFromRemote(match, EiCustomerMatchBy.taxId);
    }

    final em = email?.trim().toLowerCase() ?? '';
    if (em.isNotEmpty) {
      final rows = await listCustomers(search: em);
      final match = rows.firstWhereOrNull(
          (r) => '${r['email'] ?? ''}'.trim().toLowerCase() == em);
      if (match != null) byEmail = _hitFromRemote(match, EiCustomerMatchBy.email);
    }

    final ph = _digitsOnly(phone);
    if (ph.length >= 6) {
      final rows = await listCustomers(search: phone!.trim());
      final match = rows.firstWhereOrNull((r) {
        final remote = _digitsOnly('${r['phone'] ?? ''}');
        return remote.isNotEmpty &&
            (remote.endsWith(ph) || ph.endsWith(remote));
      });
      if (match != null) byPhone = _hitFromRemote(match, EiCustomerMatchBy.phone);
    }

    final byNameRows = await listCustomers(search: name);
    final matchName = byNameRows.firstWhereOrNull(
        (r) => '${r['name'] ?? ''}'.trim().toLowerCase() == name.trim().toLowerCase());
    if (matchName != null) {
      byName = _hitFromRemote(matchName, EiCustomerMatchBy.name);
    }
    return (byTaxId: byTaxId, byEmail: byEmail, byPhone: byPhone, byName: byName);
  }

  static String _digitsOnly(String? raw) =>
      (raw ?? '').replaceAll(RegExp(r'\D'), '');

  static EiCustomerHit _hitFromRemote(
    Map<String, dynamic> r, [
    EiCustomerMatchBy matchBy = EiCustomerMatchBy.name,
  ]) =>
      EiCustomerHit(
        uuid: r['uuid'] as String?,
        name: '${r['name'] ?? ''}',
        vatNumber: '${r['vat_number'] ?? ''}',
        email: '${r['email'] ?? ''}',
        phone: '${r['phone'] ?? ''}',
        matchBy: matchBy,
      );

  /// Trouve ou crée le client distant pour [company] (correspondance TVA
  /// puis nom — pas de mappage persistant côté serveur, contrairement au
  /// mode local qui pose `crm_company_id`).
  ///
  /// [forceCreate] ignore toute correspondance et crée une nouvelle fiche.
  /// [preferUuid] force l'utilisation d'un client déjà choisi dans le dialogue.
  Future<String> ensureCustomerUuid({
    required String name,
    String? vatNumber,
    String? email,
    String? phone,
    String? phoneCountry,
    String? address,
    String? district,
    String? zip,
    String? city,
    String? state,
    String? countryCode,
    String? peppolId,
    bool forceCreate = false,
    String? preferUuid,
  }) async {
    if (preferUuid != null && preferUuid.isNotEmpty) return preferUuid;
    if (!forceCreate) {
      final candidates = await findCustomerCandidates(
        name: name,
        vatNumber: vatNumber,
        email: email,
        phone: phone,
      );
      final hit = candidates.byTaxId ??
          candidates.byEmail ??
          candidates.byPhone ??
          candidates.byName;
      if (hit?.uuid != null) return hit!.uuid!;
    }
    final vat = vatNumber?.trim() ?? '';

    final created = await upsertCustomer({
      'uuid': newUuid(),
      'name': name.trim(),
      'email': email ?? '',
      'phone': phone ?? '',
      'phone_country_code': phoneCountry ?? '',
      'address': address ?? '',
      'district': district ?? '',
      'zip': zip ?? '',
      'city': city ?? '',
      'state': state ?? '',
      'country_code': countryCode ?? '',
      'vat_number': vat,
      'peppol_id': peppolId ?? '',
      'use_e_invoicing': 1,
      'notes': '',
    });
    return created['uuid'] as String;
  }

  // ---- Produits (catalogue — lecture + upsert) ---------------------------

  Future<List<EiProduct>> listProducts({String search = ''}) async {
    final c = await _requireCreds();
    final res = await http
        .get(
          _uri(c, '/products', search.trim().isEmpty ? null : {'q': search.trim()}),
          headers: _headers(c),
        )
        .timeout(const Duration(seconds: 30));
    final map = _decode(res);
    final items = map['items'];
    if (items is! List) return const [];
    return [
      for (final e in items.whereType<Map>())
        EiProduct.fromRemoteJson(Map<String, dynamic>.from(e)),
    ];
  }

  /// Crée ou met à jour un produit distant (POST /einvoicing/products).
  Future<EiProduct> upsertProduct(Map<String, dynamic> productJson) async {
    final c = await _requireCreds();
    final res = await http
        .post(
          _uri(c, '/products'),
          headers: _headers(c, jsonBody: true),
          body: jsonEncode(productJson),
        )
        .timeout(const Duration(seconds: 45));
    final map = _decode(res);
    final row = map['row'] ?? map['item'] ?? map['product'];
    if (row is Map) {
      return EiProduct.fromRemoteJson(Map<String, dynamic>.from(row));
    }
    // Certains serveurs ne renvoient que ok + uuid.
    final uuid = '${map['uuid'] ?? productJson['uuid'] ?? ''}';
    if (uuid.isEmpty) {
      throw StateError('API e-Invoicing : réponse produit inattendue ($map)');
    }
    return EiProduct(
      uuid: uuid,
      name: '${productJson['name'] ?? ''}',
      ref: '${productJson['ref'] ?? ''}',
      description: '${productJson['description'] ?? ''}',
      hsCode: '${productJson['hs_code'] ?? ''}',
      taxRate: (productJson['tax_rate'] as num?)?.toDouble() ?? 0,
      taxNote: '${productJson['tax_note'] ?? ''}',
      salePrice: (productJson['sale_price'] as num?)?.toDouble() ?? 0,
      photoPaths: _photosFromJson(productJson['photo_paths']),
      notes: '${productJson['notes'] ?? ''}',
      cfop: '${productJson['cfop'] ?? ''}',
      cstIcms: '${productJson['cst_icms'] ?? ''}',
      cstPisCofins: '${productJson['cst_pis_cofins'] ?? ''}',
    );
  }

  /// Supprime un produit distant (DELETE /einvoicing/products/{uuid}).
  /// Le schéma serveur n'a pas de `deleted_at` — soft-delete via upsert inopérant.
  Future<void> deleteProduct(String uuid) async {
    final u = uuid.trim();
    if (u.isEmpty) throw StateError('UUID produit requis.');
    final c = await _requireCreds();
    final res = await http
        .delete(
          _uri(c, '/products/$u'),
          headers: _headers(c),
        )
        .timeout(const Duration(seconds: 30));
    _decode(res);
  }

  Future<void> uploadMediaBytes({
    required String relativePath,
    required List<int> bytes,
  }) async {
    final c = await _requireCreds();
    final res = await http
        .post(
          _uri(c, '/media'),
          headers: _headers(c, jsonBody: true),
          body: jsonEncode({
            'path': relativePath.replaceAll('\\', '/'),
            'content_base64': base64Encode(bytes),
          }),
        )
        .timeout(const Duration(seconds: 180));
    _decode(res);
  }

  Future<void> deleteMedia(String relativePath) async {
    final c = await _requireCreds();
    final res = await http
        .delete(
          _uri(c, '/media', {'path': relativePath.replaceAll('\\', '/')}),
          headers: _headers(c),
        )
        .timeout(const Duration(seconds: 45));
    _decode(res);
  }

  /// Télécharge un média distant (photo produit / ligne) en bytes.
  Future<List<int>?> downloadMediaBytes(String relativePath) async {
    final c = await _requireCreds();
    final res = await http
        .get(
          _uri(c, '/media', {'path': relativePath.replaceAll('\\', '/')}),
          headers: _headers(c),
        )
        .timeout(const Duration(seconds: 60));
    final map = _decode(res);
    final b64 = '${map['content_base64'] ?? ''}';
    if (b64.isEmpty) return null;
    return base64Decode(b64);
  }

  static List<String> _photosFromJson(Object? raw) {
    if (raw is List) return raw.map((e) => '$e').where((e) => e.isNotEmpty).toList();
    if (raw is String && raw.trim().isNotEmpty) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is List) {
          return decoded.map((e) => '$e').where((e) => e.isNotEmpty).toList();
        }
      } catch (_) {}
    }
    return const [];
  }

  // ---- Devis / Factures --------------------------------------------------

  Future<List<Map<String, dynamic>>> listQuotes() => _listDocs('/quotes');
  Future<List<Map<String, dynamic>>> listInvoices() => _listDocs('/invoices');

  Future<List<Map<String, dynamic>>> _listDocs(String path) async {
    final c = await _requireCreds();
    final res = await http
        .get(_uri(c, path), headers: _headers(c))
        .timeout(const Duration(seconds: 30));
    final map = _decode(res);
    final items = map['items'];
    if (items is! List) return const [];
    return items.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
  }

  Future<Map<String, dynamic>> createQuote({
    required String customerUuid,
    required List<Map<String, dynamic>> lines,
    double vatRate = 21,
    String? notes,
    int validDays = 30,
    DateTime? date,
    DateTime? validUntil,
    String status = 'draft',
  }) {
    final docDate = date ?? DateTime.now();
    final until = validUntil ?? docDate.add(Duration(days: validDays));
    return _createDoc(
      path: '/quotes',
      body: {
        'uuid': newUuid(),
        'customer_uuid': customerUuid,
        'number': '',
        'date': docDate.toUtc().toIso8601String(),
        'valid_until': until.toUtc().toIso8601String(),
        'status': status,
        'vat_rate': vatRate,
        // Schéma SQLite : notes TEXT NOT NULL — jamais null.
        'notes': notes ?? '',
        'lines': lines,
      },
    );
  }

  Future<Map<String, dynamic>> createInvoice({
    required String customerUuid,
    required List<Map<String, dynamic>> lines,
    double vatRate = 21,
    String? notes,
    int dueDays = 30,
    DateTime? date,
    DateTime? dueDate,
    String status = 'draft',
    String? quoteUuid,
  }) {
    final docDate = date ?? DateTime.now();
    final due = dueDate ?? docDate.add(Duration(days: dueDays));
    return _createDoc(
      path: '/invoices',
      body: {
        'uuid': newUuid(),
        'customer_uuid': customerUuid,
        if (quoteUuid != null && quoteUuid.isNotEmpty) 'quote_uuid': quoteUuid,
        'number': '',
        'date': docDate.toUtc().toIso8601String(),
        'due_date': due.toUtc().toIso8601String(),
        'status': status,
        'vat_rate': vatRate,
        // Schéma SQLite : notes TEXT NOT NULL — jamais null.
        'notes': notes ?? '',
        'lines': lines,
        'payments': const [],
      },
    );
  }

  /// Marque un devis existant comme facturé (upsert LWW avec le même uuid).
  /// Corps minimal — évite de renvoyer un payload géant qui peut bloquer.
  Future<void> markQuoteInvoiced(Map<String, dynamic> quoteRow) async {
    final uuid = (quoteRow['uuid'] ?? '').toString().trim();
    if (uuid.isEmpty) {
      throw StateError('UUID devis requis pour marquage facturé.');
    }
    final body = <String, dynamic>{
      'uuid': uuid,
      'customer_uuid': quoteRow['customer_uuid'] ?? '',
      'number': quoteRow['number'] ?? '',
      'date': quoteRow['date'] ?? DateTime.now().toUtc().toIso8601String(),
      'valid_until': quoteRow['valid_until'] ??
          DateTime.now().toUtc().toIso8601String(),
      'status': 'invoiced',
      'vat_rate': quoteRow['vat_rate'] ?? 21,
      'notes': quoteRow['notes'] ?? '',
      'updated_at': DateTime.now().toUtc().toIso8601String(),
      'lines': quoteRow['lines'] is List ? quoteRow['lines'] : const [],
    };
    await _createDoc(path: '/quotes', body: body);
  }

  /// Met à jour un devis existant (même uuid — upsert LWW côté serveur).
  Future<Map<String, dynamic>> upsertQuote({
    required String uuid,
    required String customerUuid,
    required String number,
    required List<Map<String, dynamic>> lines,
    double vatRate = 21,
    String? notes,
    DateTime? date,
    DateTime? validUntil,
    String status = 'draft',
  }) {
    final docDate = date ?? DateTime.now();
    final until = validUntil ?? docDate.add(const Duration(days: 30));
    return _createDoc(
      path: '/quotes',
      body: {
        'uuid': uuid,
        'customer_uuid': customerUuid,
        'number': number,
        'date': docDate.toUtc().toIso8601String(),
        'valid_until': until.toUtc().toIso8601String(),
        'status': status,
        'vat_rate': vatRate,
        'notes': notes ?? '',
        'updated_at': DateTime.now().toUtc().toIso8601String(),
        'lines': lines,
      },
    );
  }

  /// Met à jour une facture existante (même uuid — upsert LWW).
  Future<Map<String, dynamic>> upsertInvoice({
    required String uuid,
    required String customerUuid,
    required String number,
    required List<Map<String, dynamic>> lines,
    double vatRate = 21,
    String? notes,
    DateTime? date,
    DateTime? dueDate,
    String status = 'draft',
    String? quoteUuid,
  }) {
    final docDate = date ?? DateTime.now();
    final due = dueDate ?? docDate.add(const Duration(days: 30));
    return _createDoc(
      path: '/invoices',
      body: {
        'uuid': uuid,
        'customer_uuid': customerUuid,
        if (quoteUuid != null && quoteUuid.isNotEmpty) 'quote_uuid': quoteUuid,
        'number': number,
        'date': docDate.toUtc().toIso8601String(),
        'due_date': due.toUtc().toIso8601String(),
        'status': status,
        'vat_rate': vatRate,
        'notes': notes ?? '',
        'updated_at': DateTime.now().toUtc().toIso8601String(),
        'lines': lines,
        'payments': const [],
      },
    );
  }

  Future<Map<String, dynamic>> _createDoc({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    final c = await _requireCreds();
    final res = await http
        .post(_uri(c, path), headers: _headers(c, jsonBody: true), body: jsonEncode(body))
        .timeout(const Duration(seconds: 90));
    final map = _decode(res);
    final row = map['row'];
    if (row is Map) return Map<String, dynamic>.from(row);
    // Certains serveurs renvoient ok sans `row` alors que l’écriture a réussi.
    final uuid = '${map['uuid'] ?? body['uuid'] ?? ''}';
    if (uuid.isNotEmpty || map['ok'] == true) {
      return {
        ...body,
        if (uuid.isNotEmpty) 'uuid': uuid,
        'id': map['id'] ?? body['id'] ?? 0,
        'number': map['number'] ?? body['number'] ?? '',
      };
    }
    throw StateError('API e-Invoicing : réponse document inattendue ($map)');
  }

  static Map<String, dynamic> lineJson({
    required String description,
    required double qty,
    required double unitPrice,
    String? productUuid,
    String? photoPath,
  }) =>
      {
        'uuid': newUuid(),
        'description': description,
        'qty': qty,
        'unit_price': unitPrice,
        if (productUuid != null && productUuid.isNotEmpty) 'product_uuid': productUuid,
        'photo_path':
            (photoPath != null && photoPath.isNotEmpty) ? photoPath : null,
      };

  /// UUID v4 — même format que e-Invoicing (identité stable inter-appareil).
  static String newUuid() {
    final rand = Random.secure();
    final bytes = List<int>.generate(16, (_) => rand.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    String hex(int start, int len) => bytes
        .sublist(start, start + len)
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();
    return '${hex(0, 4)}-${hex(4, 2)}-${hex(6, 2)}-${hex(8, 2)}-${hex(10, 6)}';
  }
}

extension _FirstWhereOrNull<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }
}
