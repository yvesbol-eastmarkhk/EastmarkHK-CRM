import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:uuid/uuid.dart';

import '../models/client.dart';
import '../models/contact.dart';
import '../models/task.dart';

/// Nouvelle base CRM (v2) — schéma propre, indépendant de l'ancienne `emhk_crm.db`.
class CrmDb {
  CrmDb._();
  static final CrmDb instance = CrmDb._();
  static const _uuid = Uuid();

  Database? _db;
  static bool _platformReady = false;
  static const _dbFileName = 'emhk_crm_v2.db';
  // v2 : peppol_id + tags.
  // v3 : contact_name + use_einvoicing (fiche client = e-Invoicing).
  // v4 : action_type / channel_id sur tasks + historique task_history.
  static const _schemaVersion = 4;

  static String newId() => _uuid.v4();

  static Future<void> initPlatform() async {
    if (_platformReady) return;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
    }
    _platformReady = true;
  }

  DatabaseFactory get _factory {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return databaseFactoryFfi;
    }
    return databaseFactory;
  }

  Future<Database> get database async {
    if (_db != null) return _db!;
    await initPlatform();
    final dir = await getApplicationSupportDirectory();
    await dir.create(recursive: true);
    final dbPath = p.join(dir.path, _dbFileName);
    await _maybeMigrateLegacyDatabase(dbPath);
    _db = await _factory.openDatabase(
      dbPath,
      options: OpenDatabaseOptions(
        version: _schemaVersion,
        onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      ),
    );
    return _db!;
  }

  /// macOS : récupère `emhk_crm_v2.db` depuis Application Support non-sandbox
  /// (builds debug) quand le container sandbox a moins de clients.
  static Future<void> _maybeMigrateLegacyDatabase(String targetPath) async {
    if (!Platform.isMacOS) return;
    final home = _realUserHome();
    if (home == null) return;

    const bundleId = 'com.eastmarkhk.eastmarkhkCrm';
    final candidates = <String>[
      '$home/Library/Application Support/$bundleId/$_dbFileName',
      '$home/Library/Containers/$bundleId/Data/Library/Application Support/$bundleId/$_dbFileName',
      '$home/Library/Application Support/com.eastmarkhk.eastmarkhkcrm/$_dbFileName',
      '$home/Library/Containers/com.eastmarkhk.eastmarkhkcrm/Data/Library/Application Support/com.eastmarkhk.eastmarkhkcrm/$_dbFileName',
    ];

    final targetCanon = File(targetPath).absolute.path;
    String? bestPath;
    var bestCount = -1;
    for (final legacy in candidates) {
      final canon = File(legacy).absolute.path;
      if (canon == targetCanon) continue;
      if (!await File(legacy).exists()) continue;
      final n = await _clientCountInFile(legacy);
      if (n > bestCount) {
        bestCount = n;
        bestPath = legacy;
      }
    }
    if (bestPath == null || bestCount <= 0) return;

    final targetExists = await File(targetPath).exists();
    final targetCount =
        targetExists ? await _clientCountInFile(targetPath) : 0;
    if (bestCount <= targetCount) return;

    try {
      if (targetExists) {
        await File(targetPath).copy('$targetPath.pre_migrate.bak');
      }
      await File(bestPath).copy(targetPath);
      for (final suffix in ['-wal', '-shm']) {
        final side = File('$targetPath$suffix');
        if (await side.exists()) await side.delete();
      }
    } catch (_) {}
  }

  static Future<int> _clientCountInFile(String dbPath) async {
    try {
      await initPlatform();
      final db = await databaseFactoryFfi.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(readOnly: true, singleInstance: false),
      );
      try {
        final rows = await db.rawQuery(
          "SELECT COUNT(*) AS c FROM clients WHERE deleted_at IS NULL OR deleted_at = ''",
        );
        final c = rows.first['c'];
        if (c is int) return c;
        if (c is num) return c.toInt();
      } finally {
        await db.close();
      }
    } catch (_) {}
    return 0;
  }

  static String? _realUserHome() {
    final home = Platform.environment['HOME'];
    if (home == null || home.isEmpty) return null;
    const marker = '/Library/Containers/';
    final idx = home.indexOf(marker);
    if (idx > 0) return home.substring(0, idx);
    return home;
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE clients ADD COLUMN peppol_id TEXT');
      await db.execute(
        "ALTER TABLE clients ADD COLUMN tags TEXT NOT NULL DEFAULT ''",
      );
    }
    if (oldVersion < 3) {
      await db.execute('ALTER TABLE clients ADD COLUMN contact_name TEXT');
      await db.execute(
        'ALTER TABLE clients ADD COLUMN use_einvoicing INTEGER NOT NULL DEFAULT 0',
      );
    }
    if (oldVersion < 4) {
      await db.execute(
        "ALTER TABLE tasks ADD COLUMN action_type TEXT NOT NULL DEFAULT 'other'",
      );
      await db.execute('ALTER TABLE tasks ADD COLUMN channel_id TEXT');
      await _createTaskHistoryTable(db);
    }
  }

  Future<void> _createTaskHistoryTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS task_history (
        id TEXT PRIMARY KEY NOT NULL,
        task_id TEXT NOT NULL,
        kind TEXT NOT NULL,
        title TEXT NOT NULL,
        detail TEXT,
        ref_type TEXT,
        ref_id TEXT,
        created_at TEXT NOT NULL,
        FOREIGN KEY (task_id) REFERENCES tasks(id)
      )
    ''');
    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_task_history_task ON task_history(task_id, created_at DESC)',
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE clients (
        id TEXT PRIMARY KEY NOT NULL,
        name TEXT NOT NULL,
        contact_name TEXT,
        country TEXT,
        tax_id TEXT,
        peppol_id TEXT,
        website TEXT,
        email TEXT,
        phone TEXT,
        phone_country TEXT,
        address TEXT,
        district TEXT,
        zip TEXT,
        city TEXT,
        state TEXT,
        tags TEXT NOT NULL DEFAULT '',
        notes TEXT,
        use_einvoicing INTEGER NOT NULL DEFAULT 0,
        status TEXT NOT NULL DEFAULT 'prospect',
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        deleted_at TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE contacts (
        id TEXT PRIMARY KEY NOT NULL,
        client_id TEXT NOT NULL,
        first_name TEXT,
        last_name TEXT,
        email TEXT,
        phone TEXT,
        phone_country TEXT,
        role TEXT,
        notes TEXT,
        is_primary INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        deleted_at TEXT,
        FOREIGN KEY (client_id) REFERENCES clients(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE tasks (
        id TEXT PRIMARY KEY NOT NULL,
        title TEXT NOT NULL,
        client_id TEXT,
        contact_id TEXT,
        due_at TEXT,
        kind TEXT NOT NULL DEFAULT 'action',
        status TEXT NOT NULL DEFAULT 'open',
        action_type TEXT NOT NULL DEFAULT 'other',
        channel_id TEXT,
        notes TEXT,
        phase TEXT,
        submitted_at TEXT,
        approved_at TEXT,
        dismissed_at TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        deleted_at TEXT,
        FOREIGN KEY (client_id) REFERENCES clients(id),
        FOREIGN KEY (contact_id) REFERENCES contacts(id)
      )
    ''');
    await db.execute(
      'CREATE INDEX idx_contacts_client ON contacts(client_id)',
    );
    await db.execute(
      'CREATE INDEX idx_tasks_due ON tasks(due_at)',
    );
    await db.execute(
      'CREATE INDEX idx_tasks_status ON tasks(status)',
    );
    await _createTaskHistoryTable(db);
  }

  // ── Clients ────────────────────────────────────────────────────────────

  Future<List<Client>> listClients({String? query}) async {
    final db = await database;
    final q = query?.trim().toLowerCase();
    final rows = await db.query(
      'clients',
      where: 'deleted_at IS NULL',
      orderBy: 'name COLLATE NOCASE ASC',
    );
    var list = rows.map(Client.fromMap).toList();
    if (q != null && q.isNotEmpty) {
      list = list
          .where(
            (c) =>
                c.name.toLowerCase().contains(q) ||
                (c.city?.toLowerCase().contains(q) ?? false) ||
                (c.country?.toLowerCase().contains(q) ?? false) ||
                (c.taxId?.toLowerCase().contains(q) ?? false),
          )
          .toList();
    }
    return list;
  }

  Future<Client?> getClient(String id) async {
    final db = await database;
    final rows = await db.query(
      'clients',
      where: 'id = ? AND deleted_at IS NULL',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return Client.fromMap(rows.first);
  }

  Future<void> upsertClient(Client client) async {
    final db = await database;
    await db.insert(
      'clients',
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> softDeleteClient(String id) async {
    final db = await database;
    final now = nowIso();
    await db.update(
      'clients',
      {'deleted_at': now, 'updated_at': now},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ── Contacts ───────────────────────────────────────────────────────────

  Future<List<Contact>> listContacts(String clientId) async {
    final db = await database;
    final rows = await db.query(
      'contacts',
      where: 'client_id = ? AND deleted_at IS NULL',
      whereArgs: [clientId],
      orderBy: 'is_primary DESC, last_name COLLATE NOCASE ASC, first_name COLLATE NOCASE ASC',
    );
    return rows.map(Contact.fromMap).toList();
  }

  Future<Contact?> getContact(String id) async {
    final db = await database;
    final rows = await db.query(
      'contacts',
      where: 'id = ? AND deleted_at IS NULL',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return Contact.fromMap(rows.first);
  }

  Future<void> upsertContact(Contact contact) async {
    final db = await database;
    if (contact.isPrimary) {
      await db.update(
        'contacts',
        {'is_primary': 0, 'updated_at': nowIso()},
        where: 'client_id = ? AND deleted_at IS NULL',
        whereArgs: [contact.clientId],
      );
    }
    await db.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> softDeleteContact(String id) async {
    final db = await database;
    final now = nowIso();
    await db.update(
      'contacts',
      {'deleted_at': now, 'updated_at': now},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ── Tasks ──────────────────────────────────────────────────────────────

  Future<List<CrmTask>> listTasks({
    String? clientId,
    bool openOnly = false,
  }) async {
    final db = await database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (clientId != null) {
      where.write(' AND client_id = ?');
      args.add(clientId);
    }
    if (openOnly) {
      where.write(" AND status IN ('open', 'submitted')");
    }
    final rows = await db.query(
      'tasks',
      where: where.toString(),
      whereArgs: args,
      orderBy: 'due_at IS NULL, due_at ASC, created_at DESC',
    );
    return rows.map(CrmTask.fromMap).toList();
  }

  Future<CrmTask?> getTask(String id) async {
    final db = await database;
    final rows = await db.query(
      'tasks',
      where: 'id = ? AND deleted_at IS NULL',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return CrmTask.fromMap(rows.first);
  }

  Future<void> upsertTask(CrmTask task) async {
    final db = await database;
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> softDeleteTask(String id) async {
    final db = await database;
    final now = nowIso();
    await db.update(
      'tasks',
      {'deleted_at': now, 'updated_at': now},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Aujourd'hui + en retard (ouverts / à approuver).
  Future<List<CrmTask>> tasksDueToday() async {
    final all = await listTasks(openOnly: true);
    final now = DateTime.now();
    final todayEnd = DateTime(now.year, now.month, now.day, 23, 59, 59);
    return all.where((t) {
      final d = t.dueDateTime;
      if (d == null) return false;
      final local = d.isUtc ? d.toLocal() : d;
      return !local.isAfter(todayEnd);
    }).toList();
  }

  /// Prochains jours (après aujourd'hui), ouverts / à approuver.
  Future<List<CrmTask>> tasksUpcoming({int days = 14}) async {
    final all = await listTasks(openOnly: true);
    final now = DateTime.now();
    final todayEnd = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final horizon = todayEnd.add(Duration(days: days));
    return all.where((t) {
      final d = t.dueDateTime;
      if (d == null) return false;
      final local = d.isUtc ? d.toLocal() : d;
      return local.isAfter(todayEnd) && !local.isAfter(horizon);
    }).toList();
  }

  // ── Historique tâche ───────────────────────────────────────────────────

  Future<List<TaskHistoryEvent>> listTaskHistory(String taskId) async {
    final db = await database;
    final rows = await db.query(
      'task_history',
      where: 'task_id = ?',
      whereArgs: [taskId],
      orderBy: 'created_at DESC',
    );
    return rows.map(TaskHistoryEvent.fromMap).toList();
  }

  /// Derniers événements tous suivis confondus (dashboard).
  Future<List<TaskHistoryEvent>> listRecentHistory({int limit = 20}) async {
    final db = await database;
    final rows = await db.query(
      'task_history',
      orderBy: 'created_at DESC',
      limit: limit,
    );
    return rows.map(TaskHistoryEvent.fromMap).toList();
  }

  /// Suivis clôturés récemment (faits / approuvés / passés).
  Future<List<CrmTask>> listRecentlyClosedTasks({int limit = 12}) async {
    final db = await database;
    final rows = await db.query(
      'tasks',
      where: "deleted_at IS NULL AND status IN ('approved','dismissed')",
      orderBy: 'updated_at DESC',
      limit: limit,
    );
    return rows.map(CrmTask.fromMap).toList();
  }

  Future<void> addTaskHistory({
    required String taskId,
    required String kind,
    required String title,
    String? detail,
    String? refType,
    String? refId,
  }) async {
    final db = await database;
    final event = TaskHistoryEvent(
      id: newId(),
      taskId: taskId,
      kind: kind,
      title: title,
      detail: detail,
      refType: refType,
      refId: refId,
      createdAt: nowIso(),
    );
    await db.insert('task_history', event.toMap());
  }

  /// Relie un devis/facture aux suivis ouverts du client (historique).
  Future<void> logDocumentOnClientTasks({
    required String clientId,
    required String refType,
    required String refId,
    required String title,
    String? detail,
  }) async {
    final open = await listTasks(clientId: clientId, openOnly: true);
    for (final t in open) {
      await addTaskHistory(
        taskId: t.id,
        kind: 'document',
        title: title,
        detail: detail,
        refType: refType,
        refId: refId,
      );
    }
  }

  /// Info ajoutée au dossier client → historique des suivis ouverts.
  Future<void> logInfoOnClientTasks({
    required String clientId,
    required String title,
    String? detail,
  }) async {
    final open = await listTasks(clientId: clientId, openOnly: true);
    for (final t in open) {
      await addTaskHistory(
        taskId: t.id,
        kind: 'note',
        title: title,
        detail: detail,
      );
    }
  }
}
