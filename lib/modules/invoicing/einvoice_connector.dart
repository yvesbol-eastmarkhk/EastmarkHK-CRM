import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/data/countries.dart';
import '../../core/db/app_database.dart';
import '../../core/models/models.dart';
import '../../core/utils/rich_notes.dart';
import '../../platform/einvoice_remote_config.dart';
import '../../platform/einvoicing_license_bridge.dart';
import 'ei_models.dart';
import 'einvoice_remote_api.dart';
import 'services/ei_product_photo_compress.dart';

export 'ei_models.dart';

/// Mode effectif de la connexion e-Invoicing pour cette session.
enum EiMode {
  /// SQLite locale dans le conteneur App Group — lecture/écriture directes.
  local,

  /// e-Invoicing en stockage distant + identifiants CRM configurés — API PHP.
  remote,

  /// e-Invoicing absente, jamais lancée, ou en Remote sans identifiants CRM.
  unavailable,
}

/// Connecteur vers EastmarkHK e-Invoicing — source de vérité facturation.
/// Le CRM ne duplique aucune donnée : il écrit devis/factures dans
/// e-Invoicing (avec l'UX du CRM) et lit les statuts pour les afficher.
/// Reçues et relances restent exclusives à l'app standalone.
///
/// Deux transports selon la configuration d'e-Invoicing :
/// - **Local** : base SQLite dans le conteneur App Group
///   `group.com.eastmarkhk.shared`, ouverte par opération (multi-process).
///   Registre clients : mappage `customers.crm_company_id` posé par le CRM.
/// - **Remote** (e-Invoicing en stockage distant) : appels à la même API PHP
///   qu'e-Invoicing ([EInvoiceRemoteApi]), avec des identifiants saisis une
///   fois côté CRM (Keychain séparé de celui d'e-Invoicing — voir
///   `EinvoiceRemoteConfig`). Pas de mappage persistant client CRM ↔ serveur
///   distant (correspondance TVA/nom à chaque fois, comme le repli local).
class EInvoiceConnector {
  EInvoiceConnector._();
  static final EInvoiceConnector instance = EInvoiceConnector._();

  static const _channel = MethodChannel('eastmarkhk/shared_container');
  static const _dbFileName = 'eastmarkhk_einvoicing.db';

  String? _cachedDbPath;

  Future<String?> _dbPath() async {
    if (_cachedDbPath != null) return _cachedDbPath;
    if (kIsWeb || !Platform.isMacOS) return null;
    if (await EinvoicingLicenseBridge.isRemoteModeActive()) return null;
    String? groupPath;
    try {
      groupPath = await _channel.invokeMethod<String>('path');
    } catch (_) {
      return null;
    }
    if (groupPath == null || groupPath.isEmpty) return null;
    final path = p.join(groupPath, 'einvoicing', _dbFileName);
    if (!await File(path).exists()) return null;
    _cachedDbPath = path;
    return path;
  }

  Future<EiMode> resolveMode() async {
    // Importe les identifiants remote si absents (e-Invoicing en mode distant).
    await EinvoiceRemoteConfig.importFromEinvoicingIfNeeded();
    if (await _dbPath() != null) return EiMode.local;
    if (await EinvoicingLicenseBridge.isRemoteModeActive()) {
      if (await EInvoiceRemoteApi.instance.isConfigured()) return EiMode.remote;
    }
    return EiMode.unavailable;
  }

  /// true si utilisable (local ou remote configuré) pour créer/lire des documents.
  Future<bool> isAvailable() async => await resolveMode() != EiMode.unavailable;

  /// true si e-Invoicing est en mode Remote mais que les identifiants API ne
  /// sont pas encore renseignés côté CRM — état actionnable (bouton
  /// « Configurer ») plutôt qu'un simple blocage.
  Future<bool> needsRemoteSetup() async {
    if (kIsWeb || !Platform.isMacOS) return false;
    if (await _dbPath() != null) return false;
    if (!await EinvoicingLicenseBridge.isRemoteModeActive()) return false;
    return !await EInvoiceRemoteApi.instance.isConfigured();
  }

  /// L'app e-Invoicing est-elle installée (App Store) ?
  Future<bool> isAppInstalled() async {
    try {
      if (await _channel.invokeMethod<bool>('isEInvoicingInstalled') ?? false) {
        return true;
      }
    } catch (_) {}
    // iOS (et repli macOS) : pas de canal natif dédié — le miroir App Group
    // suffit à prouver la présence de l'app sœur (voir EinvoicingLicenseBridge).
    return EinvoicingLicenseBridge.isEinvoicingAppInstalled();
  }

  /// Lance / active e-Invoicing.
  ///
  /// - [doc] : ouvre ce devis/facture (App Group + URL scheme).
  /// - [kind] : `quote` / `invoice` — au minimum bascule sur la bonne page
  ///   (ex. bouton toolbar depuis l’onglet Devis/Factures).
  Future<bool> openStandaloneApp({EiDocument? doc, String? kind}) async {
    final resolvedKind = doc != null
        ? (doc.isInvoice ? 'invoice' : 'quote')
        : (kind == 'invoice' || kind == 'quote' ? kind : null);
    if (resolvedKind != null) {
      await _writeOpenDocumentRequest(
        kind: resolvedKind,
        id: doc?.id,
        uuid: doc?.uuid ?? '',
        number: doc?.number ?? '',
      );
    }
    final deepLink = resolvedKind == null
        ? null
        : _deepLinkUri(
            kind: resolvedKind,
            id: doc?.id,
            uuid: doc?.uuid ?? '',
            number: doc?.number ?? '',
          );
    try {
      final ok = await _channel.invokeMethod<bool>('openEInvoicing', {
            if (deepLink != null) 'url': deepLink.toString(),
          }) ??
          false;
      if (ok) return true;
    } catch (_) {}
    if (!kIsWeb && Platform.isMacOS) {
      if (deepLink != null) {
        final byUrl = await Process.run('open', [deepLink.toString()]);
        if (byUrl.exitCode == 0) return true;
      }
      final byBundle =
          await Process.run('open', ['-b', 'com.eastmarkhk.einvoicing']);
      if (byBundle.exitCode == 0) return true;
      final byPath = await Process.run(
          'open', ['/Applications/EastmarkHK e-Invoicing.app']);
      return byPath.exitCode == 0;
    }
    if (!kIsWeb && Platform.isIOS) {
      // Pas d'équivalent `open -b` sur iOS : on ne peut lancer l'app sœur
      // que via son URL scheme, qu'elle ait déclaré ou non ce document
      // précis (le fichier App Group ci-dessus sert de complément fiable).
      final url = deepLink ?? Uri(scheme: 'eastmarkhk-einvoicing', host: 'open');
      try {
        if (await canLaunchUrl(url)) {
          return await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      } catch (e) {
        debugPrint('EInvoiceConnector: launchUrl iOS — $e');
      }
      return false;
    }
    return false;
  }

  static Uri _deepLinkUri({
    required String kind,
    int? id,
    String uuid = '',
    String number = '',
  }) {
    return Uri(
      scheme: 'eastmarkhk-einvoicing',
      host: 'open',
      queryParameters: {
        'kind': kind,
        if (id != null && id > 0) 'id': '$id',
        if (uuid.isNotEmpty) 'uuid': uuid,
        if (number.isNotEmpty) 'number': number,
      },
    );
  }

  Future<void> _writeOpenDocumentRequest({
    required String kind,
    int? id,
    String uuid = '',
    String number = '',
  }) async {
    if (kIsWeb || !(Platform.isMacOS || Platform.isIOS)) return;
    try {
      final root = await _channel.invokeMethod<String>('path');
      if (root == null || root.isEmpty) return;
      final file = File(p.join(root, 'open_document.json'));
      await file.writeAsString(jsonEncode({
        'kind': kind,
        if (id != null && id > 0) 'id': id,
        'uuid': uuid,
        'number': number,
        'ts': DateTime.now().toUtc().toIso8601String(),
      }));
    } catch (e) {
      debugPrint('EInvoiceConnector: open_document.json — $e');
    }
  }

  /// Ouvre la base par opération. `singleInstance: false` : chaque opération
  /// a sa propre connexion, refermée aussitôt — indispensable en multi-process.
  Future<T> _withDb<T>(Future<T> Function(Database db) action) async {
    final path = await _dbPath();
    if (path == null) {
      throw StateError('Base e-Invoicing indisponible (app non installée ou jamais lancée)');
    }
    final db = await databaseFactoryFfi.openDatabase(
      path,
      options: OpenDatabaseOptions(singleInstance: false),
    );
    try {
      await db.execute('PRAGMA busy_timeout = 5000');
      await _ensureCrmColumn(db);
      return await action(db);
    } finally {
      await db.close();
    }
  }

  /// Si le CRM tourne avant la mise à jour v18 d'e-Invoicing, pose la colonne
  /// de mappage lui-même (identique à la migration v18, idempotente).
  Future<void> _ensureCrmColumn(Database db) async {
    final info = await db.rawQuery('PRAGMA table_info(customers)');
    if (info.any((r) => r['name'] == 'crm_company_id')) return;
    await db.execute('ALTER TABLE customers ADD COLUMN crm_company_id TEXT');
  }

  static String _nowIso() => DateTime.now().toUtc().toIso8601String();

  /// UUID v4 — même format que e-Invoicing (identité stable pour sa sync).
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

  // ---- Registre clients (mode local) ---------------------------------------

  /// Aperçu du rattachement CRM → e-Invoicing (sans créer).
  /// Ordre : lien mémorisé → TVA (si pays concerné) → email → téléphone → nom.
  Future<EiCustomerPreview> previewCustomerLink(Company company) async {
    final taxLabel = taxIdLabelForCountry(company.country);
    final taxExpected = countryExpectsTaxId(company.country);
    final crmTax = company.vatNumber?.trim() ?? '';
    final missingTaxId = taxExpected && crmTax.isEmpty;
    final addr = _decodeAddress(company.addressJson);
    final email = addr['email']?.trim() ?? '';
    final phone = addr['phone']?.trim() ?? '';
    final mode = await resolveMode();

    if (mode == EiMode.local) {
      return _withDb((db) async {
        // 1. Lien CRM déjà posé côté e-Invoicing (crm_company_id).
        final mapped = await db.query(
          'customers',
          columns: ['id', 'uuid', 'name', 'vat_number', 'email', 'phone'],
          where: 'crm_company_id = ? AND deleted_at IS NULL',
          whereArgs: [company.id],
          limit: 1,
        );
        if (mapped.isNotEmpty) {
          return EiCustomerPreview(
            taxIdLabel: taxLabel,
            crmName: company.name,
            crmTaxId: crmTax,
            taxIdExpected: taxExpected,
            missingTaxId: missingTaxId,
            alreadyLinked: true,
            byTaxId: _hitFromLocal(mapped.first, EiCustomerMatchBy.linked),
          );
        }

        // 2. Lien mémorisé côté CRM (uuid) — crucial pour HK sans n° fiscal.
        final linkedUuid = company.einvoiceCustomerUuid?.trim() ?? '';
        if (linkedUuid.isNotEmpty) {
          final byUuid = await db.query(
            'customers',
            columns: ['id', 'uuid', 'name', 'vat_number', 'email', 'phone'],
            where: 'uuid = ? AND deleted_at IS NULL',
            whereArgs: [linkedUuid],
            limit: 1,
          );
          if (byUuid.isNotEmpty) {
            return EiCustomerPreview(
              taxIdLabel: taxLabel,
              crmName: company.name,
              crmTaxId: crmTax,
              taxIdExpected: taxExpected,
              missingTaxId: missingTaxId,
              alreadyLinked: true,
              byTaxId: _hitFromLocal(byUuid.first, EiCustomerMatchBy.linked),
            );
          }
        }

        EiCustomerHit? byTaxId;
        EiCustomerHit? byEmail;
        EiCustomerHit? byPhone;
        EiCustomerHit? byName;
        if (crmTax.isNotEmpty) {
          final rows = await db.query(
            'customers',
            columns: ['id', 'uuid', 'name', 'vat_number', 'email', 'phone'],
            where:
                "TRIM(COALESCE(vat_number,'')) = ? AND deleted_at IS NULL AND crm_company_id IS NULL",
            whereArgs: [crmTax],
            limit: 1,
          );
          if (rows.isNotEmpty) {
            byTaxId = _hitFromLocal(rows.first, EiCustomerMatchBy.taxId);
          }
        }
        if (email.isNotEmpty) {
          final rows = await db.query(
            'customers',
            columns: ['id', 'uuid', 'name', 'vat_number', 'email', 'phone'],
            where:
                "LOWER(TRIM(COALESCE(email,''))) = ? AND deleted_at IS NULL AND crm_company_id IS NULL",
            whereArgs: [email.toLowerCase()],
            limit: 1,
          );
          if (rows.isNotEmpty) {
            byEmail = _hitFromLocal(rows.first, EiCustomerMatchBy.email);
          }
        }
        final ph = phone.replaceAll(RegExp(r'\D'), '');
        if (ph.length >= 6) {
          final rows = await db.query(
            'customers',
            columns: ['id', 'uuid', 'name', 'vat_number', 'email', 'phone'],
            where: 'deleted_at IS NULL AND crm_company_id IS NULL',
          );
          for (final r in rows) {
            final remote = '${r['phone'] ?? ''}'.replaceAll(RegExp(r'\D'), '');
            if (remote.isNotEmpty &&
                (remote.endsWith(ph) || ph.endsWith(remote))) {
              byPhone = _hitFromLocal(r, EiCustomerMatchBy.phone);
              break;
            }
          }
        }
        final nameRows = await db.query(
          'customers',
          columns: ['id', 'uuid', 'name', 'vat_number', 'email', 'phone'],
          where:
              'LOWER(TRIM(name)) = ? AND deleted_at IS NULL AND crm_company_id IS NULL',
          whereArgs: [company.name.trim().toLowerCase()],
          limit: 1,
        );
        if (nameRows.isNotEmpty) {
          byName = _hitFromLocal(nameRows.first, EiCustomerMatchBy.name);
        }
        return EiCustomerPreview(
          taxIdLabel: taxLabel,
          crmName: company.name,
          crmTaxId: crmTax,
          taxIdExpected: taxExpected,
          missingTaxId: missingTaxId,
          byTaxId: byTaxId,
          byEmail: byEmail,
          byPhone: byPhone,
          byName: byName,
        );
      });
    }

    if (mode == EiMode.remote) {
      final candidates = await EInvoiceRemoteApi.instance.findCustomerCandidates(
        name: company.name,
        vatNumber: company.vatNumber,
        email: email,
        phone: phone,
        preferUuid: company.einvoiceCustomerUuid,
      );
      final linkedHit = candidates.byTaxId?.matchBy == EiCustomerMatchBy.linked
          ? candidates.byTaxId
          : null;
      return EiCustomerPreview(
        taxIdLabel: taxLabel,
        crmName: company.name,
        crmTaxId: crmTax,
        taxIdExpected: taxExpected,
        missingTaxId: missingTaxId,
        alreadyLinked: linkedHit != null,
        byTaxId: linkedHit ?? candidates.byTaxId,
        byEmail: candidates.byEmail,
        byPhone: candidates.byPhone,
        byName: candidates.byName,
      );
    }

    return EiCustomerPreview(
      taxIdLabel: taxLabel,
      crmName: company.name,
      crmTaxId: crmTax,
      taxIdExpected: taxExpected,
      missingTaxId: missingTaxId,
    );
  }

  /// Mémorise le lien CRM → customer e-Invoicing (uuid) sur la fiche société.
  Future<void> rememberCustomerLink(Company company, String? uuid) async {
    final u = uuid?.trim() ?? '';
    if (u.isEmpty || company.einvoiceCustomerUuid == u) return;
    company.einvoiceCustomerUuid = u;
    await AppDatabase.instance.upsertCompany(company);
  }

  /// Dissocie le client e-Invoicing mémorisé — le prochain document
  /// redéclenche la résolution (TVA / e-mail / nom / création).
  Future<void> clearCustomerLink(Company company) async {
    if ((company.einvoiceCustomerUuid ?? '').trim().isEmpty) return;
    company.einvoiceCustomerUuid = null;
    await AppDatabase.instance.upsertCompany(company);
  }

  static EiCustomerHit _hitFromLocal(
    Map<String, Object?> r, [
    EiCustomerMatchBy matchBy = EiCustomerMatchBy.name,
  ]) =>
      EiCustomerHit(
        id: r['id'] as int?,
        uuid: r['uuid'] as String?,
        name: '${r['name'] ?? ''}',
        vatNumber: '${r['vat_number'] ?? ''}',
        email: '${r['email'] ?? ''}',
        phone: '${r['phone'] ?? ''}',
        matchBy: matchBy,
      );

  /// Retrouve ou crée le customer e-Invoicing pour un client CRM.
  /// Ordre : preferId → crm_company_id → uuid mémorisé → TVA → email →
  /// téléphone → nom → création. Le mappage `crm_company_id` est posé dès
  /// la première correspondance.
  Future<int> ensureCustomer(
    Company company, {
    bool forceCreate = false,
    int? preferId,
  }) =>
      _withDb((db) async {
        Future<int> link(int id) async {
          await db.update(
            'customers',
            {'crm_company_id': company.id, 'updated_at': _nowIso()},
            where: 'id = ?',
            whereArgs: [id],
          );
          return id;
        }

        if (preferId != null) return link(preferId);

        // 1. Mappages existants (sauf création forcée).
        if (!forceCreate) {
          final mapped = await db.query('customers',
              columns: ['id'],
              where: 'crm_company_id = ? AND deleted_at IS NULL',
              whereArgs: [company.id],
              limit: 1);
          if (mapped.isNotEmpty) return mapped.first['id'] as int;

          final linkedUuid = company.einvoiceCustomerUuid?.trim() ?? '';
          if (linkedUuid.isNotEmpty) {
            final byUuid = await db.query('customers',
                columns: ['id'],
                where: 'uuid = ? AND deleted_at IS NULL',
                whereArgs: [linkedUuid],
                limit: 1);
            if (byUuid.isNotEmpty) return link(byUuid.first['id'] as int);
          }

          final addr = _decodeAddress(company.addressJson);
          final vat = company.vatNumber?.trim() ?? '';
          if (vat.isNotEmpty) {
            final found = await db.query('customers',
                columns: ['id'],
                where:
                    "TRIM(COALESCE(vat_number,'')) = ? AND deleted_at IS NULL AND crm_company_id IS NULL",
                whereArgs: [vat],
                limit: 1);
            if (found.isNotEmpty) return link(found.first['id'] as int);
          }
          final email = addr['email']?.trim().toLowerCase() ?? '';
          if (email.isNotEmpty) {
            final found = await db.query('customers',
                columns: ['id'],
                where:
                    "LOWER(TRIM(COALESCE(email,''))) = ? AND deleted_at IS NULL AND crm_company_id IS NULL",
                whereArgs: [email],
                limit: 1);
            if (found.isNotEmpty) return link(found.first['id'] as int);
          }
          final ph = (addr['phone'] ?? '').replaceAll(RegExp(r'\D'), '');
          if (ph.length >= 6) {
            final rows = await db.query('customers',
                columns: ['id', 'phone'],
                where: 'deleted_at IS NULL AND crm_company_id IS NULL');
            for (final r in rows) {
              final remote = '${r['phone'] ?? ''}'.replaceAll(RegExp(r'\D'), '');
              if (remote.isNotEmpty &&
                  (remote.endsWith(ph) || ph.endsWith(remote))) {
                return link(r['id'] as int);
              }
            }
          }
          final byName = await db.query('customers',
              columns: ['id'],
              where:
                  'LOWER(TRIM(name)) = ? AND deleted_at IS NULL AND crm_company_id IS NULL',
              whereArgs: [company.name.trim().toLowerCase()],
              limit: 1);
          if (byName.isNotEmpty) return link(byName.first['id'] as int);
        }

        // 2. Création depuis la fiche CRM (adresse JSON → colonnes).
        final addr = _decodeAddress(company.addressJson);
        final customerUuid = newUuid();
        final id = await db.insert('customers', {
          'uuid': customerUuid,
          'updated_at': _nowIso(),
          'name': company.name.trim(),
          'email': addr['email'],
          'phone': addr['phone'],
          'phone_country_code': addr['phoneCountry'],
          'address': addr['address'],
          'district': addr['district'],
          'zip': addr['zip'],
          'city': addr['city'],
          'state': addr['state'],
          'country_code': company.country,
          'vat_number': company.vatNumber,
          'peppol_id': company.peppolId,
          'use_e_invoicing': 1,
          'crm_company_id': company.id,
        });
        return id;
      });

  static Map<String, String?> _decodeAddress(String? json) {
    if (json == null || json.isEmpty) return {};
    try {
      final decoded = jsonDecode(json) as Map<String, dynamic>;
      return decoded.map((k, v) {
        final s = (v ?? '').toString().trim();
        return MapEntry(k, s.isEmpty ? null : s);
      });
    } catch (_) {
      return {};
    }
  }

  // ---- Numérotation (mode local — même logique que e-Invoicing : D2026-0001)

  Future<String> _nextNumber(Database db, String table, String prefix) async {
    final year = DateTime.now().year;
    final like = '$prefix$year-%';
    final rows = await db.rawQuery(
        'SELECT number FROM $table WHERE number LIKE ? ORDER BY number DESC LIMIT 1',
        [like]);
    var seq = 1;
    if (rows.isNotEmpty) {
      final last = rows.first['number'] as String;
      seq = (int.tryParse(last.split('-').last) ?? 0) + 1;
    }
    return '$prefix$year-${seq.toString().padLeft(4, '0')}';
  }

  // ---- Création devis / facture (routage local / remote) ------------------

  Future<EiDocumentRef> createQuote({
    required Company company,
    required List<EiLine> lines,
    double vatRate = 21,
    String? notes,
    int validDays = 30,
    DateTime? date,
    DateTime? validUntil,
    String status = 'draft',
    EiCustomerDecision? customerDecision,
  }) async {
    final docDate = date ?? DateTime.now();
    final until = validUntil ?? docDate.add(Duration(days: validDays));
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      return _createRemoteDoc(
        company: company,
        lines: lines,
        vatRate: vatRate,
        notes: notes,
        isInvoice: false,
        date: docDate,
        dueOrValid: until,
        status: status,
        customerDecision: customerDecision,
      );
    }
    if (mode == EiMode.unavailable) {
      throw StateError('e-Invoicing indisponible — voir needsRemoteSetup()/isAvailable().');
    }
    final customerId = await ensureCustomer(
      company,
      forceCreate: customerDecision?.kind == EiCustomerDecisionKind.createNew,
      preferId: customerDecision?.kind == EiCustomerDecisionKind.useExisting
          ? customerDecision?.existing?.id
          : null,
    );
    final ref = await _withDb((db) async {
      final now = _nowIso();
      final number = await _nextNumber(db, 'quotes', 'D');
      final uuid = newUuid();
      final customerUuid = await _customerUuid(db, customerId);
      final quoteId = await db.insert('quotes', {
        'uuid': uuid,
        'customer_uuid': customerUuid,
        'updated_at': now,
        'number': number,
        'customer_id': customerId,
        'date': docDate.toUtc().toIso8601String(),
        'valid_until': until.toUtc().toIso8601String(),
        'status': status,
        'vat_rate': vatRate,
        'notes': notes ?? '',
      });
      await _insertLines(db, 'quote_lines', 'quote_id', 'quote_uuid', quoteId, uuid, lines);
      await rememberCustomerLink(company, customerUuid);
      return EiDocumentRef(id: quoteId, uuid: uuid, number: number, isInvoice: false);
    });
    return ref;
  }

  /// Crée une facture dans e-Invoicing (statut brouillon — l'envoi Peppol/PDF
  /// se fait dans e-Invoicing, qui gère plateformes et conformité).
  Future<EiDocumentRef> createInvoice({
    required Company company,
    required List<EiLine> lines,
    double vatRate = 21,
    String? notes,
    int dueDays = 30,
    DateTime? date,
    DateTime? dueDate,
    String status = 'draft',
    EiCustomerDecision? customerDecision,
    int? quoteId,
    String? quoteUuid,
  }) async {
    final docDate = date ?? DateTime.now();
    final due = dueDate ?? docDate.add(Duration(days: dueDays));
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      return _createRemoteDoc(
        company: company,
        lines: lines,
        vatRate: vatRate,
        notes: notes,
        isInvoice: true,
        date: docDate,
        dueOrValid: due,
        status: status,
        customerDecision: customerDecision,
        quoteUuid: quoteUuid,
      );
    }
    if (mode == EiMode.unavailable) {
      throw StateError('e-Invoicing indisponible — voir needsRemoteSetup()/isAvailable().');
    }
    final customerId = await ensureCustomer(
      company,
      forceCreate: customerDecision?.kind == EiCustomerDecisionKind.createNew,
      preferId: customerDecision?.kind == EiCustomerDecisionKind.useExisting
          ? customerDecision?.existing?.id
          : null,
    );
    return _withDb((db) async {
      final now = _nowIso();
      final number = await _nextNumber(db, 'invoices', 'F');
      final uuid = newUuid();
      final customerUuid = await _customerUuid(db, customerId);
      final cols = await db.rawQuery('PRAGMA table_info(invoices)');
      final names = {for (final c in cols) '${c['name']}'};
      final row = <String, Object?>{
        'uuid': uuid,
        'customer_uuid': customerUuid,
        'updated_at': now,
        'number': number,
        'customer_id': customerId,
        'date': docDate.toUtc().toIso8601String(),
        'due_date': due.toUtc().toIso8601String(),
        'status': status,
        'vat_rate': vatRate,
        'notes': notes ?? '',
      };
      if (names.contains('quote_id') && quoteId != null) {
        row['quote_id'] = quoteId;
      }
      if (names.contains('quote_uuid') &&
          quoteUuid != null &&
          quoteUuid.isNotEmpty) {
        row['quote_uuid'] = quoteUuid;
      }
      final invoiceId = await db.insert('invoices', row);
      await _insertLines(
          db, 'invoice_lines', 'invoice_id', 'invoice_uuid', invoiceId, uuid, lines);
      await rememberCustomerLink(company, customerUuid);
      return EiDocumentRef(id: invoiceId, uuid: uuid, number: number, isInvoice: true);
    });
  }

  /// Crée une facture brouillon à partir d’un devis existant (lignes + notes),
  /// lie `quote_id`/`quote_uuid`, et marque le devis `invoiced`.
  /// Renvoie le document éditable (client CRM conservé) pour ouvrir l’éditeur
  /// sans recharger toute la liste distante.
  Future<EiEditableDocument> createInvoiceFromQuote(
    EiDocument quote, {
    int dueDays = 30,
  }) async {
    if (quote.isInvoice) {
      throw StateError('Ce document est déjà une facture.');
    }
    if (quote.status == 'invoiced') {
      throw StateError('Ce devis est déjà facturé.');
    }
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      return _createInvoiceFromQuoteRemote(quote, dueDays: dueDays);
    }
    if (mode != EiMode.local) {
      throw StateError('e-Invoicing indisponible.');
    }
    return _withDb((db) async {
      Map<String, Object?>? qRow;
      if (quote.uuid.isNotEmpty) {
        final rows = await db.query(
          'quotes',
          where: 'uuid = ? AND deleted_at IS NULL',
          whereArgs: [quote.uuid],
          limit: 1,
        );
        if (rows.isNotEmpty) qRow = rows.first;
      }
      if (qRow == null && quote.id > 0) {
        final rows = await db.query(
          'quotes',
          where: 'id = ? AND deleted_at IS NULL',
          whereArgs: [quote.id],
          limit: 1,
        );
        if (rows.isNotEmpty) qRow = rows.first;
      }
      if (qRow == null) {
        throw StateError('Devis introuvable dans e-Invoicing.');
      }
      if ((qRow['status'] as String?) == 'invoiced') {
        throw StateError('Ce devis est déjà facturé.');
      }
      final quoteId = qRow['id'] as int;
      final quoteUuid = (qRow['uuid'] as String?) ?? quote.uuid;
      final customerId = qRow['customer_id'] as int;
      final vatRate = (qRow['vat_rate'] as num?)?.toDouble() ?? quote.vatRate;
      final notes = (qRow['notes'] as String?) ?? '';
      final lineRows = await db.query(
        'quote_lines',
        where: 'quote_id = ? AND deleted_at IS NULL',
        whereArgs: [quoteId],
        orderBy: 'id ASC',
      );
      final lines = [
        for (final r in lineRows)
          EiLine(
            description: (r['description'] as String?) ?? '',
            qty: (r['qty'] as num?)?.toDouble() ?? 0,
            unitPrice: (r['unit_price'] as num?)?.toDouble() ?? 0,
            productId: r['product_id'] as int?,
            productUuid: r['product_uuid'] as String?,
            photoPath: r['photo_path'] as String?,
          ),
      ];
      if (lines.isEmpty) {
        throw StateError('Ce devis n’a aucune ligne à facturer.');
      }

      final now = _nowIso();
      final docDate = DateTime.now();
      final due = docDate.add(Duration(days: dueDays));
      final number = await _nextNumber(db, 'invoices', 'F');
      final uuid = newUuid();
      final customerUuid = await _customerUuid(db, customerId);
      final cols = await db.rawQuery('PRAGMA table_info(invoices)');
      final names = {for (final c in cols) '${c['name']}'};
      final row = <String, Object?>{
        'uuid': uuid,
        'customer_uuid': customerUuid,
        'updated_at': now,
        'number': number,
        'customer_id': customerId,
        'date': docDate.toUtc().toIso8601String(),
        'due_date': due.toUtc().toIso8601String(),
        'status': 'draft',
        'vat_rate': vatRate,
        'notes': notes,
      };
      if (names.contains('quote_id')) row['quote_id'] = quoteId;
      if (names.contains('quote_uuid') && quoteUuid.isNotEmpty) {
        row['quote_uuid'] = quoteUuid;
      }
      final invoiceId = await db.insert('invoices', row);
      await _insertLines(
        db,
        'invoice_lines',
        'invoice_id',
        'invoice_uuid',
        invoiceId,
        uuid,
        lines,
      );
      await db.update(
        'quotes',
        {'status': 'invoiced', 'updated_at': now},
        where: 'id = ?',
        whereArgs: [quoteId],
      );
      String? crmCompanyId = quote.crmCompanyId;
      var customerName = quote.customerName;
      final cRows = await db.query(
        'customers',
        columns: ['crm_company_id', 'uuid', 'name'],
        where: 'id = ?',
        whereArgs: [customerId],
        limit: 1,
      );
      if (cRows.isNotEmpty) {
        crmCompanyId ??= cRows.first['crm_company_id'] as String?;
        final n = (cRows.first['name'] as String?)?.trim() ?? '';
        if (n.isNotEmpty) customerName = n;
      }
      crmCompanyId ??= await _crmCompanyIdForCustomerUuid(customerUuid);
      if (crmCompanyId == null && customerName.trim().isNotEmpty) {
        crmCompanyId = await _crmCompanyIdForCustomerName(customerName);
      }
      return EiEditableDocument(
        isInvoice: true,
        id: invoiceId,
        uuid: uuid,
        number: number,
        status: 'draft',
        vatRate: vatRate,
        notes: notes,
        date: docDate,
        dueOrValid: due,
        customerId: customerId,
        customerUuid: customerUuid ?? '',
        customerName: customerName,
        crmCompanyId: crmCompanyId,
        quoteId: quoteId,
        quoteUuid: quoteUuid.isNotEmpty ? quoteUuid : null,
        lines: lines,
      );
    });
  }

  Future<EiEditableDocument> _createInvoiceFromQuoteRemote(
    EiDocument quote, {
    required int dueDays,
  }) async {
    final api = EInvoiceRemoteApi.instance;
    // Cache d’abord (liste déjà chargée sur l’écran) — évite un 2e listQuotes lent.
    final qRow = await _remoteDocRow(doc: quote);
    if (qRow == null) {
      throw StateError('Devis introuvable sur le serveur distant.');
    }
    if ((qRow['status'] ?? '').toString() == 'invoiced') {
      throw StateError('Ce devis est déjà facturé.');
    }
    final customerUuid = (qRow['customer_uuid'] ??
            quote.customerUuidForFilter ??
            '')
        .toString()
        .trim();
    if (customerUuid.isEmpty) {
      throw StateError('Client du devis introuvable (uuid manquant).');
    }
    final quoteUuid = (qRow['uuid'] ?? quote.uuid).toString();
    final vatRate =
        (qRow['vat_rate'] as num?)?.toDouble() ?? quote.vatRate;
    final notes = (qRow['notes'] as String?) ?? '';
    final rawLines = qRow['lines'];
    final eiLines = <EiLine>[];
    final lines = <Map<String, dynamic>>[];
    if (rawLines is List) {
      for (final l in rawLines.whereType<Map>()) {
        final description = (l['description'] ?? '').toString();
        final qty = (l['qty'] as num?)?.toDouble() ?? 0;
        final unitPrice = (l['unit_price'] as num?)?.toDouble() ?? 0;
        final productUuid = l['product_uuid'] as String?;
        final photoPath = l['photo_path'] as String?;
        eiLines.add(EiLine(
          description: description,
          qty: qty,
          unitPrice: unitPrice,
          productUuid: productUuid,
          photoPath: photoPath,
        ));
        lines.add(EInvoiceRemoteApi.lineJson(
          description: description,
          qty: qty,
          unitPrice: unitPrice,
          productUuid: productUuid,
          photoPath: photoPath,
        ));
      }
    }
    if (lines.isEmpty) {
      throw StateError('Ce devis n’a aucune ligne à facturer.');
    }

    // Résoudre le client CRM AVANT create — pour préremplir l’éditeur.
    var customerName = quote.customerName.trim();
    if (customerName.isEmpty) {
      customerName = (_remoteCustomerNames[customerUuid] ?? '').trim();
    }
    if (customerName.isEmpty) {
      customerName = (qRow['customer_name'] ?? '').toString().trim();
    }
    var crmCompanyId = quote.crmCompanyId ??
        await _crmCompanyIdForCustomerUuid(customerUuid);
    crmCompanyId ??= await _crmCompanyIdForCustomerName(customerName);
    if (customerName.isEmpty && crmCompanyId != null) {
      final co = await AppDatabase.instance.companyById(crmCompanyId);
      customerName = co?.name.trim() ?? '';
    }

    final row = await api.createInvoice(
      customerUuid: customerUuid,
      lines: lines,
      vatRate: vatRate,
      notes: notes,
      dueDays: dueDays,
      quoteUuid: quoteUuid,
    );
    invalidateDocumentsCache();

    // Marquage « invoiced » en arrière-plan — ne bloque plus l’UI.
    final markPayload = Map<String, dynamic>.from(qRow);
    // ignore: discarded_futures
    () async {
      try {
        await api
            .markQuoteInvoiced(markPayload)
            .timeout(const Duration(seconds: 20));
        invalidateDocumentsCache();
      } catch (e) {
        debugPrint('createInvoiceFromQuote: mark invoiced — $e');
      }
    }();

    if (crmCompanyId != null && crmCompanyId.isNotEmpty) {
      final company = await AppDatabase.instance.companyById(crmCompanyId);
      if (company != null) {
        await rememberCustomerLink(company, customerUuid);
      }
    }

    final docDate = DateTime.tryParse((row['date'] ?? '').toString()) ??
        DateTime.now();
    final due = DateTime.tryParse((row['due_date'] ?? '').toString()) ??
        docDate.add(Duration(days: dueDays));
    return EiEditableDocument(
      isInvoice: true,
      id: ((row['id'] as num?) ?? 0).toInt(),
      uuid: (row['uuid'] as String?) ?? '',
      number: (row['number'] as String?) ?? '',
      status: (row['status'] as String?) ?? 'draft',
      vatRate: (row['vat_rate'] as num?)?.toDouble() ?? vatRate,
      notes: (row['notes'] as String?) ?? notes,
      date: docDate,
      dueOrValid: due,
      customerId: ((row['customer_id'] as num?) ?? 0).toInt(),
      customerUuid: (row['customer_uuid'] as String?) ?? customerUuid,
      customerName: customerName,
      crmCompanyId: crmCompanyId,
      quoteId: (qRow['id'] as num?)?.toInt(),
      quoteUuid: quoteUuid.isNotEmpty ? quoteUuid : null,
      lines: eiLines,
    );
  }

  /// CRM company id lié à un customer_uuid e-Invoicing (mode remote).
  Future<String?> _crmCompanyIdForCustomerUuid(String? customerUuid) async {
    final u = customerUuid?.trim() ?? '';
    if (u.isEmpty) return null;
    final companies = await AppDatabase.instance.companies();
    for (final c in companies) {
      if ((c.einvoiceCustomerUuid ?? '').trim() == u) return c.id;
    }
    return null;
  }

  /// Correspondance nom CRM ↔ e-Invoicing (exact, contient, ou token unique).
  Future<String?> _crmCompanyIdForCustomerName(String? name) async {
    final n = name?.trim().toLowerCase() ?? '';
    if (n.isEmpty) return null;
    final companies = await AppDatabase.instance.companies();
    for (final c in companies) {
      if (c.name.trim().toLowerCase() == n) return c.id;
    }
    for (final c in companies) {
      final cn = c.name.trim().toLowerCase();
      if (cn.isEmpty) continue;
      if (cn.contains(n) || n.contains(cn)) return c.id;
    }
    final tokens = n
        .split(RegExp(r'[^a-z0-9]+'))
        .where((t) => t.length >= 3)
        .toList();
    for (final token in tokens) {
      final hits = [
        for (final c in companies)
          if (c.name.toLowerCase().contains(token)) c,
      ];
      if (hits.length == 1) return hits.first.id;
    }
    return null;
  }

  Future<String> _remoteCustomerName(String customerUuid) async {
    final u = customerUuid.trim();
    if (u.isEmpty) return '';
    final cached = _remoteCustomerNames[u];
    if (cached != null && cached.trim().isNotEmpty) return cached.trim();
    try {
      final customers = await EInvoiceRemoteApi.instance.listCustomers();
      for (final c in customers) {
        if ((c['uuid'] ?? '').toString() == u) {
          final name = (c['name'] ?? '').toString();
          if (name.isNotEmpty) _remoteCustomerNames[u] = name;
          return name;
        }
      }
    } catch (_) {}
    return '';
  }

  /// Charge un devis/facture complet (lignes, notes, dates) pour l’éditeur CRM.
  Future<EiEditableDocument> loadEditableDocument(EiDocument doc) async {
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      return _loadEditableRemote(doc);
    }
    if (mode != EiMode.local) {
      throw StateError('e-Invoicing indisponible.');
    }
    return _withDb((db) async {
      final table = doc.isInvoice ? 'invoices' : 'quotes';
      final lineTable = doc.isInvoice ? 'invoice_lines' : 'quote_lines';
      final fk = doc.isInvoice ? 'invoice_id' : 'quote_id';
      Map<String, Object?>? row;
      if (doc.uuid.isNotEmpty) {
        final rows = await db.query(
          table,
          where: 'uuid = ? AND deleted_at IS NULL',
          whereArgs: [doc.uuid],
          limit: 1,
        );
        if (rows.isNotEmpty) row = rows.first;
      }
      if (row == null && doc.id > 0) {
        final rows = await db.query(
          table,
          where: 'id = ? AND deleted_at IS NULL',
          whereArgs: [doc.id],
          limit: 1,
        );
        if (rows.isNotEmpty) row = rows.first;
      }
      if (row == null) {
        throw StateError('Document introuvable dans e-Invoicing.');
      }
      final id = row['id'] as int;
      final customerId = row['customer_id'] as int? ?? 0;
      String? crmCompanyId;
      var customerUuid = (row['customer_uuid'] as String?) ?? '';
      var customerName = doc.customerName;
      if (customerId > 0) {
        final cRows = await db.query(
          'customers',
          columns: ['uuid', 'crm_company_id', 'name'],
          where: 'id = ?',
          whereArgs: [customerId],
          limit: 1,
        );
        if (cRows.isNotEmpty) {
          customerUuid =
              (cRows.first['uuid'] as String?) ?? customerUuid;
          crmCompanyId = cRows.first['crm_company_id'] as String?;
          final n = (cRows.first['name'] as String?)?.trim() ?? '';
          if (n.isNotEmpty) customerName = n;
        }
      }
      crmCompanyId ??= doc.crmCompanyId;
      crmCompanyId ??= await _crmCompanyIdForCustomerUuid(customerUuid);
      if (crmCompanyId == null && customerName.trim().isNotEmpty) {
        crmCompanyId = await _crmCompanyIdForCustomerName(customerName);
      }
      final lineRows = await db.query(
        lineTable,
        where: '$fk = ? AND deleted_at IS NULL',
        whereArgs: [id],
        orderBy: 'id ASC',
      );
      final date = DateTime.tryParse((row['date'] as String?) ?? '') ??
          DateTime.now();
      final dueRaw = doc.isInvoice
          ? (row['due_date'] as String?)
          : (row['valid_until'] as String?);
      final due = DateTime.tryParse(dueRaw ?? '') ??
          date.add(const Duration(days: 30));
      return EiEditableDocument(
        isInvoice: doc.isInvoice,
        id: id,
        uuid: (row['uuid'] as String?) ?? doc.uuid,
        number: (row['number'] as String?) ?? doc.number,
        status: (row['status'] as String?) ?? doc.status,
        vatRate: (row['vat_rate'] as num?)?.toDouble() ?? doc.vatRate,
        notes: (row['notes'] as String?) ?? '',
        date: date,
        dueOrValid: due,
        customerId: customerId,
        customerUuid: customerUuid,
        customerName: customerName,
        crmCompanyId: crmCompanyId,
        quoteId: row['quote_id'] as int?,
        quoteUuid: row['quote_uuid'] as String?,
        lines: [
          for (final r in lineRows)
            EiLine(
              description: (r['description'] as String?) ?? '',
              qty: (r['qty'] as num?)?.toDouble() ?? 0,
              unitPrice: (r['unit_price'] as num?)?.toDouble() ?? 0,
              productId: r['product_id'] as int?,
              productUuid: r['product_uuid'] as String?,
              photoPath: r['photo_path'] as String?,
            ),
        ],
      );
    });
  }

  Future<EiEditableDocument> _loadEditableRemote(EiDocument doc) async {
    final row = await _remoteDocRow(doc: doc);
    if (row == null) {
      throw StateError('Document introuvable sur le serveur distant.');
    }
    final date = DateTime.tryParse((row['date'] ?? '').toString()) ??
        DateTime.now();
    final dueRaw = doc.isInvoice
        ? (row['due_date'] ?? '').toString()
        : (row['valid_until'] ?? '').toString();
    final due = DateTime.tryParse(dueRaw) ??
        date.add(const Duration(days: 30));
    final rawLines = row['lines'];
    final lines = <EiLine>[];
    if (rawLines is List) {
      for (final l in rawLines.whereType<Map>()) {
        lines.add(EiLine(
          description: (l['description'] ?? '').toString(),
          qty: (l['qty'] as num?)?.toDouble() ?? 0,
          unitPrice: (l['unit_price'] as num?)?.toDouble() ?? 0,
          productId: (l['product_id'] as num?)?.toInt(),
          productUuid: l['product_uuid'] as String?,
          photoPath: l['photo_path'] as String?,
        ));
      }
    }
    final customerUuid = (row['customer_uuid'] ?? '').toString();
    var customerName = doc.customerName.trim();
    if (customerName.isEmpty) {
      customerName = (_remoteCustomerNames[customerUuid] ?? '').trim();
    }
    if (customerName.isEmpty) {
      customerName = await _remoteCustomerName(customerUuid)
          .timeout(const Duration(seconds: 6), onTimeout: () => '');
    }
    var crmCompanyId = doc.crmCompanyId ??
        await _crmCompanyIdForCustomerUuid(customerUuid);
    crmCompanyId ??= await _crmCompanyIdForCustomerName(customerName);
    if (customerName.isEmpty && crmCompanyId != null) {
      final co = await AppDatabase.instance.companyById(crmCompanyId);
      customerName = co?.name.trim() ?? '';
    }
    return EiEditableDocument(
      isInvoice: doc.isInvoice,
      id: ((row['id'] as num?) ?? doc.id).toInt(),
      uuid: (row['uuid'] ?? doc.uuid).toString(),
      number: (row['number'] ?? doc.number).toString(),
      status: (row['status'] ?? doc.status).toString(),
      vatRate: (row['vat_rate'] as num?)?.toDouble() ?? doc.vatRate,
      notes: (row['notes'] ?? '').toString(),
      date: date,
      dueOrValid: due,
      customerId: ((row['customer_id'] as num?) ?? 0).toInt(),
      customerUuid: customerUuid,
      customerName: customerName,
      crmCompanyId: crmCompanyId,
      quoteId: (row['quote_id'] as num?)?.toInt(),
      quoteUuid: row['quote_uuid'] as String?,
      lines: lines,
    );
  }

  /// Enregistre les modifications d’un devis/facture existant.
  Future<EiDocumentRef> updateEditableDocument({
    required EiEditableDocument existing,
    required List<EiLine> lines,
    required double vatRate,
    required String notes,
    required DateTime date,
    required DateTime dueOrValid,
    required String status,
    Company? company,
    EiCustomerDecision? customerDecision,
  }) async {
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      final api = EInvoiceRemoteApi.instance;
      var customerUuid = existing.customerUuid;
      if (company != null) {
        final addr = _decodeAddress(company.addressJson);
        customerUuid = await api.ensureCustomerUuid(
          name: company.name,
          vatNumber: company.vatNumber,
          email: addr['email'],
          phone: addr['phone'],
          phoneCountry: addr['phoneCountry'],
          address: addr['address'],
          district: addr['district'],
          zip: addr['zip'],
          city: addr['city'],
          state: addr['state'],
          countryCode: company.country,
          peppolId: company.peppolId,
          forceCreate:
              customerDecision?.kind == EiCustomerDecisionKind.createNew,
          preferUuid:
              customerDecision?.kind == EiCustomerDecisionKind.useExisting
                  ? customerDecision?.existing?.uuid
                  : (company.einvoiceCustomerUuid ??
                      (customerUuid.isNotEmpty ? customerUuid : null)),
        );
        await rememberCustomerLink(company, customerUuid);
      }
      if (customerUuid.isEmpty) {
        throw StateError('Client du document introuvable.');
      }
      final lineJson = [
        for (final l in lines)
          EInvoiceRemoteApi.lineJson(
            description: l.description,
            qty: l.qty,
            unitPrice: l.unitPrice,
            productUuid: l.productUuid,
            photoPath: _storagePhotoPath(l.photoPath),
          ),
      ];
      final row = existing.isInvoice
          ? await api.upsertInvoice(
              uuid: existing.uuid,
              customerUuid: customerUuid,
              number: existing.number,
              lines: lineJson,
              vatRate: vatRate,
              notes: notes,
              date: date,
              dueDate: dueOrValid,
              status: status,
              quoteUuid: existing.quoteUuid,
            )
          : await api.upsertQuote(
              uuid: existing.uuid,
              customerUuid: customerUuid,
              number: existing.number,
              lines: lineJson,
              vatRate: vatRate,
              notes: notes,
              date: date,
              validUntil: dueOrValid,
              status: status,
            );
      return EiDocumentRef(
        id: ((row['id'] as num?) ?? existing.id).toInt(),
        uuid: (row['uuid'] as String?) ?? existing.uuid,
        number: (row['number'] as String?) ?? existing.number,
        isInvoice: existing.isInvoice,
      );
    }
    if (mode != EiMode.local) {
      throw StateError('e-Invoicing indisponible.');
    }
    return _withDb((db) async {
      var customerId = existing.customerId;
      if (company != null) {
        customerId = await ensureCustomer(
          company,
          forceCreate:
              customerDecision?.kind == EiCustomerDecisionKind.createNew,
          preferId:
              customerDecision?.kind == EiCustomerDecisionKind.useExisting
                  ? customerDecision?.existing?.id
                  : (customerId > 0 ? customerId : null),
        );
      }
      final now = _nowIso();
      final customerUuid = await _customerUuid(db, customerId);
      final table = existing.isInvoice ? 'invoices' : 'quotes';
      final lineTable =
          existing.isInvoice ? 'invoice_lines' : 'quote_lines';
      final fk = existing.isInvoice ? 'invoice_id' : 'quote_id';
      final fkUuid =
          existing.isInvoice ? 'invoice_uuid' : 'quote_uuid';
      final row = <String, Object?>{
        'updated_at': now,
        'customer_id': customerId,
        'customer_uuid': customerUuid,
        'date': date.toUtc().toIso8601String(),
        'status': status,
        'vat_rate': vatRate,
        'notes': notes,
      };
      if (existing.isInvoice) {
        row['due_date'] = dueOrValid.toUtc().toIso8601String();
      } else {
        row['valid_until'] = dueOrValid.toUtc().toIso8601String();
      }
      await db.update(table, row, where: 'id = ?', whereArgs: [existing.id]);
      // Remplace les lignes (hard delete + insert) — comme un éditeur local.
      await db.delete(lineTable, where: '$fk = ?', whereArgs: [existing.id]);
      await _insertLines(
        db,
        lineTable,
        fk,
        fkUuid,
        existing.id,
        existing.uuid,
        lines,
      );
      if (company != null && customerUuid != null) {
        await rememberCustomerLink(company, customerUuid);
      }
      return EiDocumentRef(
        id: existing.id,
        uuid: existing.uuid,
        number: existing.number,
        isInvoice: existing.isInvoice,
      );
    });
  }

  Future<String?> _customerUuid(Database db, int customerId) async {
    final rows = await db.query('customers',
        columns: ['uuid'], where: 'id = ?', whereArgs: [customerId], limit: 1);
    return rows.isEmpty ? null : rows.first['uuid'] as String?;
  }

  Future<void> _insertLines(Database db, String table, String fkCol,
      String fkUuidCol, int docId, String docUuid, List<EiLine> lines) async {
    final now = _nowIso();
    final cols = await db.rawQuery('PRAGMA table_info($table)');
    final names = {for (final c in cols) '${c['name']}'};
    for (final line in lines) {
      final row = <String, Object?>{
        'uuid': newUuid(),
        fkUuidCol: docUuid,
        'updated_at': now,
        fkCol: docId,
        'description': line.description,
        'qty': line.qty,
        'unit_price': line.unitPrice,
      };
      if (names.contains('product_id') && line.productId != null) {
        row['product_id'] = line.productId;
      }
      if (names.contains('product_uuid') &&
          (line.productUuid != null && line.productUuid!.isNotEmpty)) {
        row['product_uuid'] = line.productUuid;
      }
      if (names.contains('photo_path')) {
        final stored = _storagePhotoPath(line.photoPath);
        if (stored != null) row['photo_path'] = stored;
      }
      await db.insert(table, row);
    }
  }

  // ---- Catalogue produits ------------------------------------------------

  /// Produits du catalogue e-Invoicing (local ou remote), pour le sélecteur
  /// « Ajouter depuis le catalogue » du CRM.
  Future<List<EiProduct>> listProducts({String search = ''}) async {
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      return EInvoiceRemoteApi.instance.listProducts(search: search);
    }
    if (mode != EiMode.local) return const [];
    return _withDb((db) async {
      final q = search.trim();
      final rows = q.isEmpty
          ? await db.query(
              'products',
              where: 'deleted_at IS NULL',
              orderBy: 'name COLLATE NOCASE',
            )
          : await db.query(
              'products',
              where: '''
                deleted_at IS NULL AND (
                  name LIKE ? OR ref LIKE ? OR description LIKE ? OR hs_code LIKE ?
                )
              ''',
              whereArgs: List.filled(4, '%$q%'),
              orderBy: 'name COLLATE NOCASE',
            );
      return [for (final r in rows) EiProduct.fromRow(r)];
    });
  }

  /// Dossier assets e-Invoicing (à côté de la SQLite App Group), si dispo.
  Future<String?> _assetsRoot() async {
    final dbPath = await _dbPath();
    if (dbPath == null) return null;
    return p.dirname(dbPath);
  }

  /// Copie une image vers `product_photos/` (local) ou prépare le chemin
  /// relatif pour upload remote.
  Future<String> importLinePhotoToCatalog(String sourcePath) async {
    final src = File(sourcePath);
    if (!await src.exists()) return '';
    return importCatalogPhotoBytes(await src.readAsBytes(), fileName: p.basename(sourcePath));
  }

  /// Enregistre une photo de **ligne libre** sous `line_photos/` (persistée
  /// sur le devis et reprise à la facturation).
  Future<String> saveLinePhotoFromPath(String sourcePath) async {
    final src = File(sourcePath);
    if (!await src.exists()) return '';
    return saveLinePhotoBytes(await src.readAsBytes());
  }

  Future<String> saveLinePhotoBytes(List<int> bytes) async {
    if (bytes.isEmpty) return '';
    final raw = bytes is Uint8List ? bytes : Uint8List.fromList(bytes);
    final compressed = await EiProductPhotoCompress.compress(raw);
    final base =
        'line_${DateTime.now().microsecondsSinceEpoch}${compressed.extension}';
    final rel = 'line_photos/$base';
    final root = await _assetsRoot();
    if (root != null) {
      final dir = Directory(p.join(root, 'line_photos'));
      await dir.create(recursive: true);
      await File(p.join(root, 'line_photos', base))
          .writeAsBytes(compressed.bytes, flush: true);
    }
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      await EInvoiceRemoteApi.instance.uploadMediaBytes(
        relativePath: rel,
        bytes: compressed.bytes,
      );
    }
    return rel;
  }

  /// Enregistre des octets image dans le catalogue (drag & drop / appareil photo).
  /// Redimensionne (max [EiProductPhotoCompress.maxSide]) puis WebP ou JPEG
  /// selon le plus compact — Flutter affiche les deux, y compris au zoom.
  Future<String> importCatalogPhotoBytes(
    List<int> bytes, {
    String fileName = 'photo.jpg',
  }) async {
    if (bytes.isEmpty) return '';
    final raw = bytes is Uint8List ? bytes : Uint8List.fromList(bytes);
    final compressed = await EiProductPhotoCompress.compress(raw);
    final base =
        'product_${DateTime.now().microsecondsSinceEpoch}${compressed.extension}';
    final rel = 'product_photos/$base';
    final root = await _assetsRoot();
    if (root != null) {
      final dir = Directory(p.join(root, 'product_photos'));
      await dir.create(recursive: true);
      await File(p.join(root, 'product_photos', base))
          .writeAsBytes(compressed.bytes, flush: true);
    }
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      await EInvoiceRemoteApi.instance.uploadMediaBytes(
        relativePath: rel,
        bytes: compressed.bytes,
      );
    }
    return rel;
  }

  /// Supprime un fichier photo catalogue (local + remote si configuré).
  Future<void> deleteCatalogPhoto(String storedPath) async {
    final t = storedPath.trim().replaceAll('\\', '/');
    if (t.isEmpty) return;
    final local = await resolvePhotoPath(t);
    if (local != null) {
      try {
        final f = File(local);
        if (await f.exists()) await f.delete();
      } catch (_) {}
    }
    final rel = t.contains('product_photos/')
        ? t.substring(t.indexOf('product_photos/'))
        : 'product_photos/${p.basename(t)}';
    try {
      final mode = await resolveMode();
      if (mode == EiMode.remote) {
        await EInvoiceRemoteApi.instance.deleteMedia(rel);
      }
    } catch (e) {
      debugPrint('deleteCatalogPhoto: $e');
    }
  }

  String? resolveLocalPhotoPath(String? stored) {
    if (stored == null || stored.trim().isEmpty) return null;
    final t = stored.trim();
    if (p.isAbsolute(t) && File(t).existsSync()) return t;
    // Résolu au build — root async pas dispo sync ; l’UI appelle
    // [resolvePhotoPath] async.
    return null;
  }

  Future<String?> resolvePhotoPath(String? stored) async {
    if (stored == null || stored.trim().isEmpty) return null;
    final t = stored.trim().replaceAll('\\', '/');
    if (p.isAbsolute(t) && await File(t).exists()) return t;

    // Mode local : dossier assets à côté de la SQLite App Group.
    final root = await _assetsRoot();
    if (root != null) {
      final base = p.basename(t);
      for (final sub in ['product_photos', 'line_photos']) {
        final candidate = p.join(root, sub, base);
        if (await File(candidate).exists()) return candidate;
      }
      if (t.contains('/')) {
        final candidate = p.join(root, t);
        if (await File(candidate).exists()) return candidate;
      }
    }

    // Mode remote : télécharge vers un cache local pour l'affichage.
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      final rel = t.contains('/') ? t : 'product_photos/$t';
      try {
        final cacheDir = Directory(
          p.join(Directory.systemTemp.path, 'emhk_crm_media'),
        );
        await cacheDir.create(recursive: true);
        final out = File(p.join(cacheDir.path, p.basename(rel)));
        // Réutilise le cache disque (évite N téléchargements à chaque ouverture).
        if (await out.exists() && await out.length() > 0) return out.path;
        final bytes =
            await EInvoiceRemoteApi.instance.downloadMediaBytes(rel);
        if (bytes == null || bytes.isEmpty) return null;
        await out.writeAsBytes(bytes, flush: true);
        return out.path;
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  /// Résout plusieurs chemins photo en parallèle (pool limité).
  Future<Map<String, String>> resolvePhotoPaths(
    Iterable<String> paths, {
    int concurrency = 8,
  }) async {
    final unique = <String>[];
    final seen = <String>{};
    for (final raw in paths) {
      final t = raw.trim();
      if (t.isEmpty || !seen.add(t)) continue;
      unique.add(t);
    }
    if (unique.isEmpty) return const {};

    final out = <String, String>{};
    var next = 0;
    Future<void> worker() async {
      while (true) {
        if (next >= unique.length) return;
        final idx = next++;
        final path = unique[idx];
        final local = await resolvePhotoPath(path);
        if (local != null) out[path] = local;
      }
    }

    final n = concurrency.clamp(1, unique.length);
    await Future.wait(List.generate(n, (_) => worker()));
    return out;
  }

  /// Crée un produit catalogue depuis une ligne libre (prix + photo).
  Future<EiProduct> saveLineAsProduct(EiLine line) async {
    final parts = splitLineDescriptionHtml(line.description);
    final name = parts.title.trim().isNotEmpty
        ? parts.title.trim()
        : notesPlainText(line.description);
    if (name.isEmpty) {
      throw StateError('Saisissez une description avant d\'enregistrer.');
    }
    final catalogDescription = parts.bodyHtml;
    var photos = <String>[];
    final photo = line.photoPath;
    if (photo != null && photo.isNotEmpty) {
      if (photo.contains('product_photos/') && !p.isAbsolute(photo)) {
        photos = [photo.replaceAll('\\', '/')];
      } else {
        final local = await resolvePhotoPath(photo) ??
            (p.isAbsolute(photo) ? photo : null);
        if (local != null) {
          final imported = await importLinePhotoToCatalog(local);
          if (imported.isNotEmpty) photos = [imported];
        }
      }
    }
    final uuid = newUuid();
    final now = DateTime.now().toUtc().toIso8601String();
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      return EInvoiceRemoteApi.instance.upsertProduct({
        'uuid': uuid,
        'name': name,
        'ref': '',
        'description': catalogDescription,
        'sale_price': line.unitPrice,
        'tax_rate': 21,
        'photo_paths': photos,
        'updated_at': now,
      });
    }
    if (mode != EiMode.local) {
      throw StateError('e-Invoicing indisponible — impossible d\'enregistrer.');
    }
    return _withDb((db) async {
      final id = await db.insert('products', {
        'uuid': uuid,
        'updated_at': now,
        'name': name,
        'ref': '',
        'description': catalogDescription,
        'sale_price': line.unitPrice,
        'tax_rate': 21,
        'photo_paths': jsonEncode(photos),
        'notes': '',
      });
      return EiProduct(
        id: id,
        uuid: uuid,
        name: name,
        salePrice: line.unitPrice,
        photoPaths: photos,
      );
    });
  }

  /// Met à jour prix (+ photo) d’un produit catalogue lié à la ligne.
  Future<EiProduct> updateCatalogProductFromLine(EiLine line) async {
    final id = line.productId;
    final uuid = line.productUuid;
    if (id == null && (uuid == null || uuid.isEmpty)) {
      throw StateError('Aucun produit catalogue lié.');
    }
    final mode = await resolveMode();
    List<String> photos = const [];
    final photo = line.photoPath;
    if (photo != null && photo.isNotEmpty) {
      if (photo.contains('product_photos/') && !p.isAbsolute(photo)) {
        photos = [photo.replaceAll('\\', '/')];
      } else {
        final local = await resolvePhotoPath(photo) ??
            (p.isAbsolute(photo) ? photo : null);
        if (local != null) {
          final imported = await importLinePhotoToCatalog(local);
          if (imported.isNotEmpty) photos = [imported];
        }
      }
    }
    final now = DateTime.now().toUtc().toIso8601String();

    if (mode == EiMode.remote) {
      final existingUuid = uuid ?? '';
      if (existingUuid.isEmpty) {
        throw StateError('UUID produit manquant pour la mise à jour remote.');
      }
      // Fusionne avec les photos existantes si on en ajoute une.
      var merged = photos;
      try {
        final list =
            await EInvoiceRemoteApi.instance.listProducts(search: existingUuid);
        EiProduct? hit;
        for (final p in list) {
          if (p.uuid == existingUuid) {
            hit = p;
            break;
          }
        }
        if (hit != null && photos.isNotEmpty) {
          merged = {...hit.photoPaths, ...photos}.toList();
        } else if (hit != null && photos.isEmpty) {
          merged = hit.photoPaths;
        }
      } catch (_) {}
      final parts = splitLineDescriptionHtml(line.description);
      final name = parts.title.trim().isNotEmpty
          ? parts.title.trim()
          : (notesPlainText(line.description).isEmpty
              ? 'Produit'
              : notesPlainText(line.description));
      return EInvoiceRemoteApi.instance.upsertProduct({
        'uuid': existingUuid,
        'name': name,
        'description': parts.bodyHtml,
        'sale_price': line.unitPrice,
        'photo_paths': merged,
        'updated_at': now,
      });
    }
    if (mode != EiMode.local) {
      throw StateError('e-Invoicing indisponible — impossible de mettre à jour.');
    }
    return _withDb((db) async {
      Map<String, Object?>? row;
      if (uuid != null && uuid.isNotEmpty) {
        final rows = await db.query('products',
            where: 'uuid = ? AND deleted_at IS NULL',
            whereArgs: [uuid],
            limit: 1);
        if (rows.isNotEmpty) row = rows.first;
      }
      if (row == null && id != null) {
        final rows = await db.query('products',
            where: 'id = ? AND deleted_at IS NULL',
            whereArgs: [id],
            limit: 1);
        if (rows.isNotEmpty) row = rows.first;
      }
      if (row == null) throw StateError('Produit introuvable.');
      final existing = EiProduct.fromRow(row);
      final merged = photos.isEmpty
          ? existing.photoPaths
          : {...existing.photoPaths, ...photos}.toList();
      await db.update(
        'products',
        {
          'sale_price': line.unitPrice,
          'photo_paths': jsonEncode(merged),
          'updated_at': now,
        },
        where: 'id = ?',
        whereArgs: [existing.id],
      );
      return EiProduct(
        id: existing.id,
        uuid: existing.uuid,
        name: existing.name,
        ref: existing.ref,
        description: existing.description,
        salePrice: line.unitPrice,
        photoPaths: merged,
      );
    });
  }

  /// Pays vendeur + taux TVA défaut (settings e-Invoicing) — pour la fiche produit.
  Future<({String countryCode, double defaultVatRate})> loadSellerProductDefaults() async {
    const fallback = (countryCode: 'BE', defaultVatRate: 0.0);
    final mode = await resolveMode();
    if (mode == EiMode.local) {
      try {
        return await _withDb((db) async {
          final rows = await db.query('settings');
          final map = {
            for (final r in rows)
              '${r['key']}': '${r['value'] ?? ''}',
          };
          final country =
              (map['company_country'] ?? map['country_code'] ?? 'BE').trim();
          final vat = double.tryParse(
                (map['default_vat_rate'] ?? '21').replaceAll(',', '.'),
              ) ??
              21;
          return (
            countryCode: country.isEmpty ? 'BE' : country.toUpperCase(),
            defaultVatRate: vat,
          );
        });
      } catch (e) {
        debugPrint('loadSellerProductDefaults local: $e');
        return fallback;
      }
    }
    return fallback;
  }

  Future<String> _nextProductRef() async {
    final year = DateTime.now().year;
    final prefix = 'P$year-';
    var seq = 1;
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      final all = await EInvoiceRemoteApi.instance.listProducts();
      for (final p in all) {
        if (!p.ref.toUpperCase().startsWith(prefix.toUpperCase())) continue;
        final tail = p.ref.contains('-') ? p.ref.split('-').last : '';
        final n = int.tryParse(tail) ?? 0;
        if (n >= seq) seq = n + 1;
      }
    } else if (mode == EiMode.local) {
      await _withDb((db) async {
        final rows = await db.rawQuery(
          'SELECT ref FROM products WHERE ref LIKE ? COLLATE NOCASE '
          'ORDER BY length(ref) DESC, ref DESC LIMIT 1',
          ['$prefix%'],
        );
        if (rows.isNotEmpty) {
          final last = (rows.first['ref'] as String?) ?? '';
          final tail = last.contains('-') ? last.split('-').last : '';
          seq = (int.tryParse(tail) ?? 0) + 1;
        }
      });
    }
    String candidate;
    do {
      candidate = '$prefix${seq.toString().padLeft(4, '0')}';
      seq++;
    } while (await _isProductRefTaken(candidate));
    return candidate;
  }

  Future<bool> _isProductRefTaken(
    String ref, {
    int? excludeId,
    String? excludeUuid,
  }) async {
    final needle = ref.trim();
    if (needle.isEmpty) return false;
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      final all = await EInvoiceRemoteApi.instance.listProducts();
      for (final p in all) {
        if (p.ref.trim().toUpperCase() != needle.toUpperCase()) continue;
        if (excludeUuid != null &&
            excludeUuid.isNotEmpty &&
            p.uuid == excludeUuid) {
          continue;
        }
        if (excludeId != null && p.id == excludeId) continue;
        return true;
      }
      return false;
    }
    if (mode != EiMode.local) return false;
    return _withDb((db) async {
      final rows = await db.query(
        'products',
        columns: ['id', 'uuid'],
        where: 'ref = ? COLLATE NOCASE AND deleted_at IS NULL',
        whereArgs: [needle],
      );
      for (final r in rows) {
        final id = (r['id'] as num?)?.toInt();
        final uuid = '${r['uuid'] ?? ''}';
        if (excludeId != null && id == excludeId) continue;
        if (excludeUuid != null &&
            excludeUuid.isNotEmpty &&
            uuid == excludeUuid) {
          continue;
        }
        return true;
      }
      return false;
    });
  }

  /// Crée / met à jour un produit catalogue (mêmes champs que e-Invoicing).
  Future<EiProduct> upsertCatalogProduct({
    int? id,
    String? uuid,
    required String name,
    String ref = '',
    String description = '',
    String hsCode = '',
    double taxRate = 0,
    String taxNote = '',
    required double salePrice,
    List<String> photoPaths = const [],
    String notes = '',
    String cfop = '',
    String cstIcms = '',
    String cstPisCofins = '',
  }) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) throw StateError('Indiquez un nom de produit.');
    var resolvedRef = ref.trim();
    if (resolvedRef.isEmpty) {
      resolvedRef = await _nextProductRef();
    } else if (await _isProductRefTaken(
      resolvedRef,
      excludeId: id,
      excludeUuid: uuid,
    )) {
      throw DuplicateProductRefException(resolvedRef);
    }
    final now = DateTime.now().toUtc().toIso8601String();
    final uid = (uuid != null && uuid.isNotEmpty) ? uuid : newUuid();
    final payload = <String, Object?>{
      'uuid': uid,
      'name': trimmed,
      'ref': resolvedRef,
      'description': description.trim(),
      'hs_code': hsCode.trim(),
      'tax_rate': taxRate,
      'tax_note': taxNote.trim(),
      'sale_price': salePrice,
      'photo_paths': photoPaths,
      'notes': notes.trim(),
      'cfop': cfop.trim(),
      'cst_icms': cstIcms.trim(),
      'cst_pis_cofins': cstPisCofins.trim(),
      'updated_at': now,
    };
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      return EInvoiceRemoteApi.instance.upsertProduct(
        Map<String, dynamic>.from(payload),
      );
    }
    if (mode != EiMode.local) {
      throw StateError('e-Invoicing indisponible — catalogue inaccessible.');
    }
    final row = {
      'name': trimmed,
      'ref': resolvedRef,
      'description': description.trim(),
      'hs_code': hsCode.trim(),
      'tax_rate': taxRate,
      'tax_note': taxNote.trim(),
      'sale_price': salePrice,
      'photo_paths': jsonEncode(photoPaths),
      'notes': notes.trim(),
      'cfop': cfop.trim(),
      'cst_icms': cstIcms.trim(),
      'cst_pis_cofins': cstPisCofins.trim(),
      'updated_at': now,
    };
    EiProduct built({required int productId, required String productUuid}) =>
        EiProduct(
          id: productId,
          uuid: productUuid,
          name: trimmed,
          ref: resolvedRef,
          description: description.trim(),
          hsCode: hsCode.trim(),
          taxRate: taxRate,
          taxNote: taxNote.trim(),
          salePrice: salePrice,
          photoPaths: photoPaths,
          notes: notes.trim(),
          cfop: cfop.trim(),
          cstIcms: cstIcms.trim(),
          cstPisCofins: cstPisCofins.trim(),
        );
    return _withDb((db) async {
      if (id != null) {
        await db.update('products', row, where: 'id = ?', whereArgs: [id]);
        return built(productId: id, productUuid: uid);
      }
      if (uuid != null && uuid.isNotEmpty) {
        final rows = await db.query(
          'products',
          where: 'uuid = ? AND deleted_at IS NULL',
          whereArgs: [uuid],
          limit: 1,
        );
        if (rows.isNotEmpty) {
          final existingId = (rows.first['id'] as num).toInt();
          await db.update(
            'products',
            row,
            where: 'id = ?',
            whereArgs: [existingId],
          );
          return built(productId: existingId, productUuid: uuid);
        }
      }
      final newId = await db.insert('products', {
        'uuid': uid,
        ...row,
      });
      return built(productId: newId, productUuid: uid);
    });
  }

  /// Supprime un produit catalogue (DELETE remote, soft-delete local).
  Future<void> deleteCatalogProduct({int? id, String? uuid}) async {
    if (id == null && (uuid == null || uuid.isEmpty)) {
      throw StateError('Produit introuvable.');
    }
    final now = DateTime.now().toUtc().toIso8601String();
    final mode = await resolveMode();
    if (mode == EiMode.remote) {
      final u = uuid ?? '';
      if (u.isEmpty) throw StateError('UUID produit requis en mode remote.');
      // Le serveur remote n'a pas de colonne deleted_at — vrai DELETE.
      await EInvoiceRemoteApi.instance.deleteProduct(u);
      return;
    }
    if (mode != EiMode.local) {
      throw StateError('e-Invoicing indisponible.');
    }
    await _withDb((db) async {
      if (uuid != null && uuid.isNotEmpty) {
        await db.update(
          'products',
          {'deleted_at': now, 'updated_at': now},
          where: 'uuid = ?',
          whereArgs: [uuid],
        );
      } else if (id != null) {
        await db.update(
          'products',
          {'deleted_at': now, 'updated_at': now},
          where: 'id = ?',
          whereArgs: [id],
        );
      }
    });
  }

  // ---- Création devis / facture (mode remote — API PHP) --------------------

  Future<EiDocumentRef> _createRemoteDoc({
    required Company company,
    required List<EiLine> lines,
    required double vatRate,
    required String? notes,
    required bool isInvoice,
    required DateTime date,
    required DateTime dueOrValid,
    required String status,
    EiCustomerDecision? customerDecision,
    String? quoteUuid,
  }) async {
    final api = EInvoiceRemoteApi.instance;
    final addr = _decodeAddress(company.addressJson);
    final customerUuid = await api.ensureCustomerUuid(
      name: company.name,
      vatNumber: company.vatNumber,
      email: addr['email'],
      phone: addr['phone'],
      phoneCountry: addr['phoneCountry'],
      address: addr['address'],
      district: addr['district'],
      zip: addr['zip'],
      city: addr['city'],
      state: addr['state'],
      countryCode: company.country,
      peppolId: company.peppolId,
      forceCreate: customerDecision?.kind == EiCustomerDecisionKind.createNew,
      preferUuid: customerDecision?.kind == EiCustomerDecisionKind.useExisting
          ? customerDecision?.existing?.uuid
          : (company.einvoiceCustomerUuid),
    );
    await rememberCustomerLink(company, customerUuid);
    final lineJson = [
      for (final l in lines)
        EInvoiceRemoteApi.lineJson(
          description: l.description,
          qty: l.qty,
          unitPrice: l.unitPrice,
          productUuid: l.productUuid,
          photoPath: _storagePhotoPath(l.photoPath),
        ),
    ];
    final row = isInvoice
        ? await api.createInvoice(
            customerUuid: customerUuid,
            lines: lineJson,
            vatRate: vatRate,
            notes: notes,
            date: date,
            dueDate: dueOrValid,
            status: status,
            quoteUuid: quoteUuid,
          )
        : await api.createQuote(
            customerUuid: customerUuid,
            lines: lineJson,
            vatRate: vatRate,
            notes: notes,
            date: date,
            validUntil: dueOrValid,
            status: status,
          );
    return EiDocumentRef(
      id: ((row['id'] as num?) ?? 0).toInt(),
      uuid: (row['uuid'] as String?) ?? customerUuid,
      number: (row['number'] as String?) ?? '',
      isInvoice: isInvoice,
    );
  }

  /// Chemin relatif stockable (`product_photos/…` / `line_photos/…`).
  static String? _storagePhotoPath(String? path) {
    if (path == null || path.trim().isEmpty) return null;
    final t = path.trim().replaceAll('\\', '/');
    if (t.contains('product_photos/') || t.contains('line_photos/')) {
      final i = t.indexOf('product_photos/');
      final j = t.indexOf('line_photos/');
      final start = i >= 0 ? i : j;
      return t.substring(start);
    }
    if (p.isAbsolute(t)) {
      final base = p.basename(t);
      if (base.isEmpty) return null;
      // Dernier recours : si le fichier vient d'un pick non normalisé.
      if (t.contains('/line_photos/') || t.contains('\\line_photos\\')) {
        return 'line_photos/$base';
      }
      if (t.contains('/product_photos/') || t.contains('\\product_photos\\')) {
        return 'product_photos/$base';
      }
      return null;
    }
    return t;
  }

  // ---- Lecture (statuts affichés dans le CRM) — routage local / remote -----

  /// Devis + factures du client CRM [companyId], plus récents en premier.
  /// Vide si client non mappé/trouvé ou e-Invoicing indisponible.
  Future<List<EiDocument>> documentsForCompany(String companyId,
      {int limit = 50}) async {
    final mode = await resolveMode();
    List<EiDocument> docs = const [];
    if (mode == EiMode.local) {
      docs = await _withDb((db) => _queryDocuments(db,
          where: 'c.crm_company_id = ?',
          whereArgs: [companyId],
          limit: limit * 2));
    } else if (mode == EiMode.remote) {
      final company = await AppDatabase.instance.companyById(companyId);
      if (company == null) return const [];
      final api = EInvoiceRemoteApi.instance;
      // Préférer l’uuid mémorisé sur la fiche (posé à la création du devis).
      var customerUuid = (company.einvoiceCustomerUuid ?? '').trim();
      if (customerUuid.isEmpty) {
        customerUuid = await api.findCustomerUuid(
              name: company.name,
              vatNumber: company.vatNumber,
            ) ??
            '';
      }
      if (customerUuid.isEmpty) return const [];
      final all = await _recentRemoteDocuments(limit: 500);
      docs =
          all.where((d) => d.customerUuidForFilter == customerUuid).toList();
    } else {
      return const [];
    }
    docs = _withoutInvoicedQuotes(docs);
    return docs.length > limit ? docs.sublist(0, limit) : docs;
  }

  /// Documents récents (écran module / dashboard).
  ///
  /// [crmRelatedOnly] : uniquement les clients mappés au CRM
  /// (`crm_company_id` en local, uuid lié en remote).
  /// Les devis déjà facturés (`status = invoiced`) sont masqués — comme
  /// dans e-Invoicing (conservés en base, absents de la liste active).
  Future<List<EiDocument>> recentDocuments({
    int limit = 60,
    bool crmRelatedOnly = false,
  }) async {
    final mode = await resolveMode();
    List<EiDocument> docs = const [];
    if (mode == EiMode.local) {
      if (crmRelatedOnly) {
        docs = await _withDb((db) => _queryDocuments(
              db,
              where:
                  "c.crm_company_id IS NOT NULL AND TRIM(c.crm_company_id) != ''",
              limit: limit * 2,
            ));
      } else {
        docs = await _withDb((db) => _queryDocuments(db, limit: limit * 2));
      }
    } else if (mode == EiMode.remote) {
      docs = await _recentRemoteDocuments(limit: crmRelatedOnly ? 2000 : limit * 2);
      if (crmRelatedOnly) {
        final linked = await _linkedRemoteCustomerUuids();
        if (linked.isEmpty) return const [];
        docs = docs
            .where((d) => linked.contains(d.customerUuidForFilter))
            .toList();
      }
    } else {
      return const [];
    }
    docs = _withoutInvoicedQuotes(docs);
    return docs.length > limit ? docs.sublist(0, limit) : docs;
  }

  /// Masque les devis convertis en facture (restent en base, statut invoiced).
  static List<EiDocument> _withoutInvoicedQuotes(List<EiDocument> docs) => [
        for (final d in docs)
          if (d.isInvoice || d.status.toLowerCase() != 'invoiced') d,
      ];

  /// UUIDs e-Invoicing mémorisés sur les fiches CRM (mode remote).
  Future<Set<String>> _linkedRemoteCustomerUuids() async {
    final companies = await AppDatabase.instance.companies();
    return {
      for (final c in companies)
        if ((c.einvoiceCustomerUuid ?? '').trim().isNotEmpty)
          c.einvoiceCustomerUuid!.trim(),
    };
  }

  /// Retrouve un devis/facture par uuid ou id numérique (historique suivi).
  Future<EiDocument?> findDocument({
    required String refId,
    required bool isInvoice,
  }) async {
    final id = refId.trim();
    if (id.isEmpty) return null;
    final mode = await resolveMode();
    if (mode == EiMode.local) {
      return _withDb((db) async {
        final table = isInvoice ? 'invoices' : 'quotes';
        final lineTable = isInvoice ? 'invoice_lines' : 'quote_lines';
        final fk = isInvoice ? 'invoice_id' : 'quote_id';
        final byUuid = await db.rawQuery('''
          SELECT d.id, d.uuid, d.number, d.date, d.status, d.vat_rate, d.notes,
                 c.name AS customer_name, c.crm_company_id,
                 COALESCE(SUM(l.qty * l.unit_price), 0) AS subtotal
          FROM $table d
          JOIN customers c ON c.id = d.customer_id
          LEFT JOIN $lineTable l ON l.$fk = d.id AND l.deleted_at IS NULL
          WHERE d.deleted_at IS NULL AND d.uuid = ?
          GROUP BY d.id LIMIT 1
        ''', [id]);
        if (byUuid.isNotEmpty) {
          return EiDocument.fromRow(byUuid.first, isInvoice: isInvoice);
        }
        final asInt = int.tryParse(id);
        if (asInt == null) return null;
        final byId = await db.rawQuery('''
          SELECT d.id, d.uuid, d.number, d.date, d.status, d.vat_rate, d.notes,
                 c.name AS customer_name, c.crm_company_id,
                 COALESCE(SUM(l.qty * l.unit_price), 0) AS subtotal
          FROM $table d
          JOIN customers c ON c.id = d.customer_id
          LEFT JOIN $lineTable l ON l.$fk = d.id AND l.deleted_at IS NULL
          WHERE d.deleted_at IS NULL AND d.id = ?
          GROUP BY d.id LIMIT 1
        ''', [asInt]);
        if (byId.isEmpty) return null;
        return EiDocument.fromRow(byId.first, isInvoice: isInvoice);
      });
    }
    if (mode == EiMode.remote) {
      final docs = await _recentRemoteDocuments(limit: 2000);
      for (final d in docs) {
        if (d.isInvoice != isInvoice) continue;
        if (d.uuid == id || '${d.id}' == id) return d;
      }
    }
    return null;
  }

  // Cache court — ouverture instantanée, refresh en arrière-plan.
  static List<EiDocument>? _docsCache;
  static DateTime? _docsCacheAt;
  static const _docsCacheTtl = Duration(seconds: 45);
  static final Map<String, Map<String, dynamic>> _remoteQuoteRows = {};
  static final Map<String, Map<String, dynamic>> _remoteInvoiceRows = {};
  static final Map<String, String> _remoteCustomerNames = {};

  Future<List<EiDocument>> _recentRemoteDocuments({required int limit}) async {
    final cached = _docsCache;
    final at = _docsCacheAt;
    if (cached != null &&
        at != null &&
        DateTime.now().difference(at) < _docsCacheTtl) {
      return cached.length > limit ? cached.sublist(0, limit) : cached;
    }
    final api = EInvoiceRemoteApi.instance;
    // Parallel : 3 appels HTTP au lieu d’une file (gros gain à l’ouverture).
    final results = await Future.wait([
      api.listCustomers(),
      api.listQuotes(),
      api.listInvoices(),
      _remoteUuidToCrmCompanyId(),
      AppDatabase.instance.companies(),
    ]);
    final customers = results[0] as List<Map<String, dynamic>>;
    final quotes = results[1] as List<Map<String, dynamic>>;
    final invoices = results[2] as List<Map<String, dynamic>>;
    final uuidToCrm = results[3] as Map<String, String>;
    final crmCompanies = results[4] as List<Company>;
    final crmNameById = {for (final c in crmCompanies) c.id: c.name};
    final names = <String, String>{
      for (final c in customers)
        if (c['uuid'] != null) c['uuid'] as String: (c['name'] ?? '').toString(),
    };
    _remoteCustomerNames
      ..clear()
      ..addAll(names);
    _remoteQuoteRows
      ..clear()
      ..addEntries([
        for (final q in quotes)
          if ((q['uuid'] ?? '').toString().isNotEmpty)
            MapEntry((q['uuid'] as String).trim(), Map<String, dynamic>.from(q)),
      ]);
    _remoteInvoiceRows
      ..clear()
      ..addEntries([
        for (final inv in invoices)
          if ((inv['uuid'] ?? '').toString().isNotEmpty)
            MapEntry(
              (inv['uuid'] as String).trim(),
              Map<String, dynamic>.from(inv),
            ),
      ]);
    final docs = [
      for (final q in quotes)
        EiDocument.fromRemoteJson(
          q,
          isInvoice: false,
          customerNames: names,
          crmCompanyId: uuidToCrm[(q['customer_uuid'] ?? '').toString()],
          customerNameFallback: crmNameById[
              uuidToCrm[(q['customer_uuid'] ?? '').toString()] ?? ''],
        ),
      for (final inv in invoices)
        EiDocument.fromRemoteJson(
          inv,
          isInvoice: true,
          customerNames: names,
          crmCompanyId: uuidToCrm[(inv['customer_uuid'] ?? '').toString()],
          customerNameFallback: crmNameById[
              uuidToCrm[(inv['customer_uuid'] ?? '').toString()] ?? ''],
        ),
    ]..sort((a, b) => b.date.compareTo(a.date));
    _docsCache = docs;
    _docsCacheAt = DateTime.now();
    return docs.length > limit ? docs.sublist(0, limit) : docs;
  }

  /// Invalide le cache liste (après création / facturation / suppression).
  static void invalidateDocumentsCache() {
    _docsCache = null;
    _docsCacheAt = null;
    // Garde les rows brutes un peu — utiles pour devis→facture rapide.
  }

  /// Ligne JSON distante (avec `lines`) depuis le cache, sinon fetch.
  Future<Map<String, dynamic>?> _remoteDocRow({
    required EiDocument doc,
  }) async {
    final uuid = doc.uuid.trim();
    if (uuid.isNotEmpty) {
      final cached = doc.isInvoice
          ? _remoteInvoiceRows[uuid]
          : _remoteQuoteRows[uuid];
      if (cached != null) return cached;
    }
    final list = doc.isInvoice
        ? await EInvoiceRemoteApi.instance.listInvoices()
        : await EInvoiceRemoteApi.instance.listQuotes();
    final map = doc.isInvoice ? _remoteInvoiceRows : _remoteQuoteRows;
    for (final r in list) {
      final u = (r['uuid'] ?? '').toString().trim();
      if (u.isNotEmpty) map[u] = Map<String, dynamic>.from(r);
    }
    if (uuid.isNotEmpty && map.containsKey(uuid)) return map[uuid];
    for (final r in list) {
      final u = (r['uuid'] ?? '').toString();
      final id = ((r['id'] as num?) ?? 0).toInt();
      if ((doc.uuid.isNotEmpty && u == doc.uuid) ||
          (doc.id > 0 && id == doc.id) ||
          (doc.number.isNotEmpty &&
              (r['number'] ?? '').toString() == doc.number)) {
        return Map<String, dynamic>.from(r);
      }
    }
    return null;
  }

  Future<Map<String, String>> _remoteUuidToCrmCompanyId() async {
    final companies = await AppDatabase.instance.companies();
    return {
      for (final c in companies)
        if ((c.einvoiceCustomerUuid ?? '').trim().isNotEmpty)
          c.einvoiceCustomerUuid!.trim(): c.id,
    };
  }

  Future<List<EiDocument>> _queryDocuments(Database db,
      {String? where, List<Object?>? whereArgs, required int limit}) async {
    final filter = where == null ? '' : 'AND $where';
    final args = whereArgs ?? const [];
    final quotes = await db.rawQuery('''
      SELECT q.id, q.uuid, q.number, q.date, q.status, q.vat_rate, q.notes,
             c.name AS customer_name, c.crm_company_id,
             COALESCE(SUM(l.qty * l.unit_price), 0) AS subtotal
      FROM quotes q
      JOIN customers c ON c.id = q.customer_id
      LEFT JOIN quote_lines l ON l.quote_id = q.id AND l.deleted_at IS NULL
      WHERE q.deleted_at IS NULL $filter
      GROUP BY q.id ORDER BY q.date DESC LIMIT $limit
    ''', args);
    final invoices = await db.rawQuery('''
      SELECT i.id, i.uuid, i.number, i.date, i.status, i.vat_rate, i.notes,
             c.name AS customer_name, c.crm_company_id,
             COALESCE(SUM(l.qty * l.unit_price), 0) AS subtotal
      FROM invoices i
      JOIN customers c ON c.id = i.customer_id
      LEFT JOIN invoice_lines l ON l.invoice_id = i.id AND l.deleted_at IS NULL
      WHERE i.deleted_at IS NULL $filter
      GROUP BY i.id ORDER BY i.date DESC LIMIT $limit
    ''', args);
    final docs = [
      for (final r in quotes) EiDocument.fromRow(r, isInvoice: false),
      for (final r in invoices) EiDocument.fromRow(r, isInvoice: true),
    ]..sort((a, b) => b.date.compareTo(a.date));
    return docs.length > limit ? docs.sublist(0, limit) : docs;
  }
}

/// Référence d'un document créé (pour la timeline CRM).
class EiDocumentRef {
  EiDocumentRef({
    required this.id,
    required this.uuid,
    required this.number,
    required this.isInvoice,
  });
  final int id;
  final String uuid;
  final String number;
  final bool isInvoice;
}

/// Document e-Invoicing lu pour affichage dans le CRM (lecture seule).
class EiDocument {
  EiDocument({
    required this.id,
    required this.uuid,
    required this.number,
    required this.date,
    required this.status,
    required this.vatRate,
    required this.subtotal,
    required this.customerName,
    required this.isInvoice,
    this.crmCompanyId,
    this.customerUuidForFilter,
  });

  final int id;
  final String uuid;
  final String number;
  final String date;
  /// Statuts e-Invoicing : devis draft/sent/accepted/rejected/invoiced,
  /// factures draft/sent/partial/paid/overdue/cancelled.
  final String status;
  final double vatRate;
  final double subtotal;
  final String customerName;
  final bool isInvoice;
  final String? crmCompanyId;
  /// customer_uuid distant — filtrage interne uniquement (mode remote, pas
  /// de mappage persistant côté serveur), jamais affiché.
  final String? customerUuidForFilter;

  double get total => subtotal * (1 + vatRate / 100);

  String get refId => uuid.isNotEmpty ? uuid : '$id';

  factory EiDocument.fromRow(Map<String, Object?> r, {required bool isInvoice}) =>
      EiDocument(
        id: r['id'] as int,
        uuid: (r['uuid'] as String?) ?? '',
        number: r['number'] as String,
        date: (r['date'] as String?) ?? '',
        status: (r['status'] as String?) ?? '',
        vatRate: (r['vat_rate'] as num?)?.toDouble() ?? 0,
        subtotal: (r['subtotal'] as num?)?.toDouble() ?? 0,
        customerName: (r['customer_name'] as String?) ?? '',
        isInvoice: isInvoice,
        crmCompanyId: r['crm_company_id'] as String?,
      );

  /// Depuis une ligne JSON de l'API distante — `lines` imbriquées (pas de
  /// somme pré-calculée côté serveur), nom client résolu via [customerNames].
  factory EiDocument.fromRemoteJson(
    Map<String, dynamic> r, {
    required bool isInvoice,
    required Map<String, String> customerNames,
    String? crmCompanyId,
    String? customerNameFallback,
  }) {
    var subtotal = 0.0;
    final lines = r['lines'];
    if (lines is List) {
      for (final l in lines.whereType<Map>()) {
        final qty = (l['qty'] as num?)?.toDouble() ?? 0;
        final price = (l['unit_price'] as num?)?.toDouble() ?? 0;
        subtotal += qty * price;
      }
    }
    final cuuid = (r['customer_uuid'] ?? '').toString();
    final name = (customerNames[cuuid] ?? '').trim().isNotEmpty
        ? customerNames[cuuid]!
        : (customerNameFallback ?? '').trim();
    return EiDocument(
      id: ((r['id'] as num?) ?? 0).toInt(),
      uuid: (r['uuid'] as String?) ?? '',
      number: (r['number'] as String?) ?? '',
      date: (r['date'] as String?) ?? '',
      status: (r['status'] as String?) ?? '',
      vatRate: (r['vat_rate'] as num?)?.toDouble() ?? 0,
      subtotal: subtotal,
      customerName: name,
      isInvoice: isInvoice,
      crmCompanyId: crmCompanyId,
      customerUuidForFilter: r['customer_uuid'] as String?,
    );
  }
}
