import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../db/crm_db.dart';
import '../../models/client.dart' as v2;
import '../../models/contact.dart' as v2;
import '../../models/task.dart' as v2task;
import '../db/app_database.dart';
import '../models/models.dart' as legacy;

/// Miroir bidirectionnel Client (CrmDb) ↔ Company (AppDatabase)
/// et Task v2 (CrmDb) ↔ Task legacy (AppDatabase, sync remote).
///
/// - Écriture UI → [ensureMirrored] / [ensureTaskMirrored]
/// - Avant push remote → [mirrorClientsToAppDatabase] + [mirrorTasksToAppDatabase]
/// - Pull remote → [mirrorFromAppDatabase] (companies + contacts + tasks)
class ClientCompanyBridge {
  ClientCompanyBridge._();

  static Future<void> ensureMirrored(v2.Client client) async {
    final existing = await AppDatabase.instance.companyById(client.id);
    final deleted = (client.deletedAt ?? '').trim();
    if (deleted.isNotEmpty) {
      if (existing == null || (existing.deletedAt ?? '').isEmpty) {
        await AppDatabase.instance.softDeleteCompany(client.id, flushRemote: false);
      }
      return;
    }

    final addressJson = jsonEncode({
      if ((client.address ?? '').isNotEmpty) 'line1': client.address,
      if ((client.district ?? '').isNotEmpty) 'district': client.district,
      if ((client.zip ?? '').isNotEmpty) 'zip': client.zip,
      if ((client.city ?? '').isNotEmpty) 'city': client.city,
      if ((client.state ?? '').isNotEmpty) 'state': client.state,
      if ((client.phone ?? '').isNotEmpty) 'phone': client.phone,
      if ((client.email ?? '').isNotEmpty) 'email': client.email,
    });

    final company = legacy.Company(
      id: client.id,
      name: client.name,
      vatNumber: client.taxId,
      peppolId: client.peppolId,
      website: client.website,
      tags: client.tags,
      notes: client.notes,
      country: client.country,
      addressJson: addressJson == '{}' ? null : addressJson,
      einvoiceCustomerUuid: existing?.einvoiceCustomerUuid,
      createdAt: existing?.createdAt ?? _toIso(client.createdAt),
      updatedAt: legacy.nowIso(),
      deletedAt: null,
    );
    await AppDatabase.instance.upsertCompany(company);
  }

  /// CrmDb → AppDatabase : indispensable avant un push, sinon les clients
  /// créés dans l’UI v2 ne partent jamais sur le serveur.
  ///
  /// [force] : re-écrit chaque client (nouveau `updated_at`) pour qu’ils
  /// soient inclus dans le prochain push — utile après restauration d’une
  /// base locale dont les horodatages sont plus anciens que `last_pushed_at`.
  static Future<int> mirrorClientsToAppDatabase({bool force = false}) async {
    final raw = await CrmDb.instance.database;
    final rows = await raw.query('clients');
    var mirrored = 0;

    for (final row in rows) {
      final client = v2.Client.fromMap(row);
      final existing = await AppDatabase.instance.companyById(client.id);
      final deleted = (client.deletedAt ?? '').trim().isNotEmpty;

      if (deleted) {
        if (existing == null || (existing.deletedAt ?? '').isEmpty) {
          await AppDatabase.instance.softDeleteCompany(client.id, flushRemote: false);
          mirrored++;
        }
        continue;
      }

      // AppDatabase déjà tombstoné : ne JAMAIS ressusciter via CrmDb.
      // Aligné CrmDb sur la suppression locale (sinon le push suivant
      // réécrit deleted_at=null sur le serveur).
      if (existing != null && (existing.deletedAt ?? '').isNotEmpty) {
        await CrmDb.instance.softDeleteClient(client.id);
        continue;
      }

      if (force ||
          existing == null ||
          existing.name != client.name ||
          (existing.vatNumber ?? '') != (client.taxId ?? '') ||
          (existing.peppolId ?? '') != (client.peppolId ?? '') ||
          (existing.website ?? '') != (client.website ?? '') ||
          (existing.country ?? '') != (client.country ?? '') ||
          (existing.notes ?? '') != (client.notes ?? '') ||
          !_sameTags(existing.tags, client.tags)) {
        await ensureMirrored(client);
        mirrored++;
      }
    }

    final contactRows = await raw.query('contacts');
    for (final row in contactRows) {
      final c = v2.Contact.fromMap(row);
      final legacyContact = legacy.Contact(
        id: c.id,
        companyId: c.clientId,
        firstName: c.firstName,
        lastName: c.lastName,
        email: c.email,
        phone: c.phone,
        phoneCountry: c.phoneCountry,
        role: c.role,
        notes: c.notes,
        createdAt: _toIso(c.createdAt),
        updatedAt: legacy.nowIso(),
        deletedAt: c.deletedAt == null || c.deletedAt!.isEmpty
            ? null
            : _toIso(c.deletedAt!),
      );
      final existingRows = await (await AppDatabase.instance.database).query(
        'contacts',
        where: 'id = ?',
        whereArgs: [c.id],
        limit: 1,
      );
      final need = existingRows.isEmpty ||
          (existingRows.first['updated_at'] as String? ?? '')
                  .compareTo(legacyContact.updatedAt) <
              0 ||
          (existingRows.first['first_name'] as String?) != c.firstName ||
          (existingRows.first['last_name'] as String?) != c.lastName ||
          (existingRows.first['email'] as String?) != c.email ||
          (existingRows.first['phone'] as String?) != c.phone ||
          (existingRows.first['company_id'] as String?) != c.clientId;
      if (need) {
        await AppDatabase.instance.upsertContact(legacyContact);
        mirrored++;
      }
    }

    debugPrint(
      'ClientCompanyBridge.mirrorClientsToAppDatabase: '
      '$mirrored write(s), ${rows.length} clients, ${contactRows.length} contacts',
    );
    return mirrored;
  }

  /// Copie `companies` / `contacts` (AppDatabase, sync remote) vers CrmDb.
  static Future<int> mirrorFromAppDatabase() async {
    final raw = await AppDatabase.instance.database;
    final companyRows = await raw.query('companies');
    var mirrored = 0;

    for (final row in companyRows) {
      final company = legacy.Company.fromMap(row);
      await _upsertClientFromCompany(company);
      mirrored++;
    }

    final contactRows = await raw.query('contacts');
    for (final row in contactRows) {
      final c = legacy.Contact.fromMap(row);
      final clientId = c.companyId;
      if (clientId == null || clientId.isEmpty) continue;
      await CrmDb.instance.upsertContact(
        v2.Contact(
          id: c.id,
          clientId: clientId,
          firstName: c.firstName,
          lastName: c.lastName,
          email: c.email,
          phone: c.phone,
          phoneCountry: c.phoneCountry,
          role: c.role,
          notes: c.notes,
          isPrimary: false,
          createdAt: c.createdAt,
          updatedAt: c.updatedAt,
          deletedAt: c.deletedAt,
        ),
      );
    }

    debugPrint(
      'ClientCompanyBridge.mirrorFromAppDatabase: $mirrored companies, '
      '${contactRows.length} contacts',
    );
    await mirrorTasksFromAppDatabase();
    return mirrored;
  }

  /// UI v2 → AppDatabase (sync) — à appeler à chaque save de suivi.
  static Future<void> ensureTaskMirrored(v2task.CrmTask task) async {
    final deleted = (task.deletedAt ?? '').trim();
    if (deleted.isNotEmpty) {
      await AppDatabase.instance.softDeleteTask(task.id);
      return;
    }
    final closed = task.status.isClosed;
    final doneAt = closed
        ? (task.approvedAt ?? task.dismissedAt ?? task.updatedAt)
        : null;
    final legacyTask = legacy.CrmTask(
      id: task.id,
      companyId: task.clientId,
      contactId: task.contactId,
      title: task.title.trim().isEmpty ? 'Suivi' : task.title.trim(),
      dueDate: task.dueAt,
      doneAt: doneAt,
      notes: task.notes,
      createdAt: _toIso(task.createdAt),
      updatedAt: legacy.nowIso(),
      deletedAt: null,
    );
    await AppDatabase.instance.upsertTask(legacyTask);
  }

  /// CrmDb → AppDatabase avant push (follow-ups créés seulement en UI v2).
  /// N’écrase jamais une ligne AppDatabase plus récente (source de vérité live).
  static Future<int> mirrorTasksToAppDatabase({bool force = false}) async {
    final raw = await CrmDb.instance.database;
    final rows = await raw.query('tasks');
    var mirrored = 0;
    for (final row in rows) {
      final task = v2task.CrmTask.fromMap(row);
      final existing = await AppDatabase.instance.taskById(task.id);
      final deleted = (task.deletedAt ?? '').trim().isNotEmpty;

      // AppDatabase plus récent → ne pas toucher (évite de réouvrir une tâche faite).
      if (existing != null &&
          (existing.updatedAt).compareTo(task.updatedAt) > 0) {
        continue;
      }

      if (deleted) {
        if (existing == null || (existing.deletedAt ?? '').isEmpty) {
          await AppDatabase.instance.softDeleteTask(task.id);
          mirrored++;
        }
        continue;
      }
      final closed = task.status.isClosed;
      final wantDone = closed
          ? (task.approvedAt ?? task.dismissedAt ?? task.updatedAt)
          : null;
      // Ne jamais effacer un done_at local avec une tâche v2 encore ouverte.
      if (!closed &&
          existing != null &&
          (existing.doneAt ?? '').trim().isNotEmpty) {
        continue;
      }
      if (force ||
          existing == null ||
          (existing.deletedAt ?? '').isNotEmpty ||
          existing.title != task.title ||
          (existing.companyId ?? '') != (task.clientId ?? '') ||
          (existing.contactId ?? '') != (task.contactId ?? '') ||
          (existing.dueDate ?? '') != (task.dueAt ?? '') ||
          (existing.notes ?? '') != (task.notes ?? '') ||
          (existing.doneAt ?? '') != (wantDone ?? '')) {
        await ensureTaskMirrored(task);
        mirrored++;
      }
    }
    if (mirrored > 0) {
      debugPrint('ClientCompanyBridge.mirrorTasksToAppDatabase: $mirrored');
    }
    return mirrored;
  }

  /// AppDatabase (sync) → CrmDb UI — après pull remote.
  static Future<int> mirrorTasksFromAppDatabase() async {
    final raw = await AppDatabase.instance.database;
    final rows = await raw.query('tasks');
    var mirrored = 0;
    for (final row in rows) {
      final t = legacy.CrmTask.fromMap(row);
      final existing = await _uiTaskById(t.id);
      final deleted = (t.deletedAt ?? '').trim().isNotEmpty;

      if (deleted) {
        if (existing != null && (existing.deletedAt ?? '').isEmpty) {
          await CrmDb.instance.softDeleteTask(t.id);
          mirrored++;
        }
        continue;
      }

      final remoteUpdated = t.updatedAt;
      final localUpdated = existing?.updatedAt ?? '';
      if (existing != null &&
          localUpdated.isNotEmpty &&
          localUpdated.compareTo(remoteUpdated) > 0) {
        // Local UI plus récent — ne pas écraser phase / action_type.
        continue;
      }

      final isDone = (t.doneAt ?? '').trim().isNotEmpty;
      final wasClosed = existing?.status.isClosed ?? false;
      final v2 = v2task.CrmTask(
        id: t.id,
        title: t.title,
        clientId: t.companyId,
        contactId: t.contactId,
        dueAt: t.dueDate,
        kind: existing?.kind ?? v2task.TaskKind.action,
        status: isDone
            ? v2task.TaskStatus.approved
            : (wasClosed
                ? v2task.TaskStatus.open
                : (existing?.status ?? v2task.TaskStatus.open)),
        actionType: existing?.actionType ?? v2task.TaskActionType.other,
        channelId: existing?.channelId,
        notes: t.notes ?? existing?.notes,
        phase: existing?.phase,
        submittedAt: isDone ? existing?.submittedAt : existing?.submittedAt,
        approvedAt: isDone ? (t.doneAt ?? existing?.approvedAt) : null,
        dismissedAt: isDone ? existing?.dismissedAt : null,
        createdAt: t.createdAt,
        updatedAt: t.updatedAt,
        deletedAt: null,
      );
      await CrmDb.instance.upsertTask(v2);
      mirrored++;
    }
    if (mirrored > 0) {
      debugPrint('ClientCompanyBridge.mirrorTasksFromAppDatabase: $mirrored');
    }
    return mirrored;
  }

  /// Inclut les soft-deleted (contrairement à [CrmDb.getTask]).
  static Future<v2task.CrmTask?> _uiTaskById(String id) async {
    final raw = await CrmDb.instance.database;
    final rows = await raw.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return v2task.CrmTask.fromMap(rows.first);
  }

  static Future<void> _upsertClientFromCompany(legacy.Company company) async {
    final addr = _parseAddress(company.addressJson);
    final existing = await CrmDb.instance.getClient(company.id);
    final client = v2.Client(
      id: company.id,
      name: company.name,
      contactName: existing?.contactName,
      country: company.country ?? existing?.country,
      taxId: company.vatNumber ?? existing?.taxId,
      peppolId: company.peppolId ?? existing?.peppolId,
      website: company.website ?? existing?.website,
      email: (addr['email'] as String?)?.trim().isNotEmpty == true
          ? addr['email'] as String
          : existing?.email,
      phone: (addr['phone'] as String?)?.trim().isNotEmpty == true
          ? addr['phone'] as String
          : existing?.phone,
      phoneCountry: existing?.phoneCountry,
      address: (addr['line1'] as String?) ??
          (addr['address'] as String?) ??
          existing?.address,
      district: (addr['district'] as String?) ?? existing?.district,
      zip: (addr['zip'] as String?) ?? existing?.zip,
      city: (addr['city'] as String?) ?? existing?.city,
      state: (addr['state'] as String?) ?? existing?.state,
      tags: company.tags.isNotEmpty ? company.tags : (existing?.tags ?? const []),
      notes: company.notes ?? existing?.notes,
      useEInvoicing: existing?.useEInvoicing ?? false,
      status: existing?.status ?? v2.ClientStatus.prospect,
      createdAt: company.createdAt,
      updatedAt: company.updatedAt,
      deletedAt: company.deletedAt,
    );
    await CrmDb.instance.upsertClient(client);
  }

  static bool _sameTags(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    final sa = [...a]..sort();
    final sb = [...b]..sort();
    for (var i = 0; i < sa.length; i++) {
      if (sa[i] != sb[i]) return false;
    }
    return true;
  }

  /// Normalise les horodatages CrmDb (`yyyy-MM-dd HH:mm:ss`) en ISO-8601 UTC.
  static String _toIso(String raw) {
    final t = raw.trim();
    if (t.isEmpty) return legacy.nowIso();
    if (t.contains('T')) {
      return t.endsWith('Z') || t.contains('+') ? t : '${t}Z';
    }
    final parsed = DateTime.tryParse(t.replaceFirst(' ', 'T'));
    return (parsed ?? DateTime.now().toUtc()).toUtc().toIso8601String();
  }

  static Map<String, dynamic> _parseAddress(String? json) {
    if (json == null || json.trim().isEmpty) return {};
    try {
      final decoded = jsonDecode(json);
      if (decoded is Map) {
        return decoded.map((k, v) => MapEntry('$k', v));
      }
    } catch (_) {}
    return {};
  }
}
