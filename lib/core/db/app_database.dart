import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';
import '../models/user_account.dart';
import '../services/auth_service.dart';
import '../services/remote_crm_sync_service.dart';

/// Base SQLite du CRM — même patron qu'EastmarkHK e-Invoicing.
/// Nom de fichier volontairement distinct (`emhk_crm.db`) pour ne pas entrer
/// en collision avec l'ancienne base `eastmarkhk_crm.db` migrée par e-Invoicing.
class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();
  static const _uuid = Uuid();

  Database? _db;
  static bool _platformReady = false;

  static const _dbFileName = 'emhk_crm.db';
  // v2 : table users (comptes, rôles).
  // v3 : contacts.phone_country + contacts.messaging_json (canaux WhatsApp,
  // WeChat, iMessage… — la vraie correspondance passe par la messagerie).
  // v4 : opportunities.notes (produit, Incoterms, conditions de paiement…).
  // v5 : tasks.assigned_to (identifie le commercial responsable — utile dès
  // que la base est partagée entre plusieurs utilisateurs).
  // v6 : tasks.opportunity_id (relie une tâche de relance à SON
  // opportunité — sinon rouvrir l'opportunité ne peut pas retrouver la
  // relance déjà programmée et affiche toujours "Pas de rappel").
  // v7 : opportunities.stage_updated_at (dernier changement d'étape —
  // affiché sur les cartes du pipeline).
  static const _schemaVersion = 7;

  static Future<void> initPlatform() async {
    if (_platformReady) return;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      // N'assigne pas databaseFactory globalement — évite l'avertissement sqflite
      // au hot restart et isole la factory FFI à cette app uniquement.
    }
    _platformReady = true;
  }

  DatabaseFactory get _dbFactory {
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
    _db = await _dbFactory.openDatabase(
      p.join(dir.path, _dbFileName),
      options: OpenDatabaseOptions(
        version: _schemaVersion,
        onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      ),
    );
    return _db!;
  }

  /// Migrations pour les bases déjà créées (v1 n'avait pas la table users).
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS users (
          id TEXT PRIMARY KEY, username TEXT NOT NULL UNIQUE, display_name TEXT NOT NULL,
          password_hash TEXT NOT NULL, password_salt TEXT NOT NULL,
          role TEXT NOT NULL DEFAULT 'user', touch_id_enabled INTEGER NOT NULL DEFAULT 0,
          created_at TEXT NOT NULL, updated_at TEXT NOT NULL, deleted_at TEXT)''');
    }
    if (oldVersion < 3) {
      await db.execute('ALTER TABLE contacts ADD COLUMN phone_country TEXT');
      await db.execute('ALTER TABLE contacts ADD COLUMN messaging_json TEXT');
    }
    if (oldVersion < 4) {
      await db.execute('ALTER TABLE opportunities ADD COLUMN notes TEXT');
    }
    if (oldVersion < 5) {
      await db.execute('ALTER TABLE tasks ADD COLUMN assigned_to TEXT');
    }
    if (oldVersion < 6) {
      await db.execute('ALTER TABLE tasks ADD COLUMN opportunity_id TEXT');
    }
    if (oldVersion < 7) {
      await db.execute('ALTER TABLE opportunities ADD COLUMN stage_updated_at TEXT');
      await db.execute('UPDATE opportunities SET stage_updated_at = updated_at');
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    // Tables du cœur. Les modules ajoutent leurs tables préfixées
    // (inv_, scan_, stk_, lead_) via CrmModule.migrations.
    await db.execute('''
      CREATE TABLE companies (
        id TEXT PRIMARY KEY, name TEXT NOT NULL,
        vat_number TEXT, peppol_id TEXT, website TEXT,
        tags TEXT, notes TEXT, country TEXT, address_json TEXT,
        created_at TEXT NOT NULL, updated_at TEXT NOT NULL, deleted_at TEXT)''');
    await db.execute('''
      CREATE TABLE contacts (
        id TEXT PRIMARY KEY, company_id TEXT REFERENCES companies(id),
        first_name TEXT, last_name TEXT, email TEXT, phone TEXT, phone_country TEXT,
        role TEXT, notes TEXT, messaging_json TEXT,
        created_at TEXT NOT NULL, updated_at TEXT NOT NULL, deleted_at TEXT)''');
    await db.execute('''
      CREATE TABLE pipelines (
        id TEXT PRIMARY KEY, name TEXT NOT NULL, stages_json TEXT)''');
    await db.execute('''
      CREATE TABLE opportunities (
        id TEXT PRIMARY KEY, company_id TEXT, contact_id TEXT,
        pipeline_id TEXT, stage TEXT NOT NULL DEFAULT 'lead',
        title TEXT NOT NULL, amount REAL, currency TEXT DEFAULT 'EUR',
        probability INTEGER, expected_close TEXT, won_lost TEXT, closed_at TEXT, notes TEXT,
        created_at TEXT NOT NULL, updated_at TEXT NOT NULL, stage_updated_at TEXT,
        deleted_at TEXT)''');
    await db.execute('''
      CREATE TABLE activities (
        id TEXT PRIMARY KEY, company_id TEXT, contact_id TEXT,
        opportunity_id TEXT, type TEXT NOT NULL DEFAULT 'note',
        module_id TEXT, ref_table TEXT, ref_id TEXT,
        title TEXT NOT NULL, body TEXT, happened_at TEXT NOT NULL,
        created_at TEXT NOT NULL, updated_at TEXT NOT NULL, deleted_at TEXT)''');
    await db.execute('''
      CREATE TABLE tasks (
        id TEXT PRIMARY KEY, company_id TEXT, contact_id TEXT, opportunity_id TEXT,
        title TEXT NOT NULL, due_date TEXT, done_at TEXT, notes TEXT, assigned_to TEXT,
        created_at TEXT NOT NULL, updated_at TEXT NOT NULL, deleted_at TEXT)''');
    await db.execute('''
      CREATE TABLE settings (key TEXT PRIMARY KEY, value TEXT)''');
    await db.execute('''
      CREATE TABLE entitlements (
        module_id TEXT PRIMARY KEY, source TEXT, expires_at TEXT, payload TEXT)''');
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY, username TEXT NOT NULL UNIQUE, display_name TEXT NOT NULL,
        password_hash TEXT NOT NULL, password_salt TEXT NOT NULL,
        role TEXT NOT NULL DEFAULT 'user', touch_id_enabled INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL, updated_at TEXT NOT NULL, deleted_at TEXT)''');
    await db.execute(
        'CREATE INDEX idx_contacts_company ON contacts(company_id)');
    await db.execute(
        'CREATE INDEX idx_activities_company ON activities(company_id, happened_at)');
    await db.execute(
        'CREATE INDEX idx_opps_stage ON opportunities(stage)');
    await db.execute('CREATE INDEX idx_tasks_due ON tasks(due_date)');
  }

  static String newId() => _uuid.v4();

  // ---- Companies -----------------------------------------------------------

  Future<List<Company>> companies({String? search}) async {
    final db = await database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (search != null && search.trim().isNotEmpty) {
      where.write(' AND (name LIKE ? OR notes LIKE ? OR tags LIKE ?)');
      final q = '%${search.trim()}%';
      args.addAll([q, q, q]);
    }
    final rows = await db.query('companies',
        where: where.toString(), whereArgs: args, orderBy: 'name COLLATE NOCASE');
    return rows.map(Company.fromMap).toList();
  }

  Future<Company?> companyById(String id) async {
    final db = await database;
    final rows = await db.query('companies', where: 'id = ?', whereArgs: [id]);
    return rows.isEmpty ? null : Company.fromMap(rows.first);
  }

  Future<void> upsertCompany(Company c) async {
    final db = await database;
    c.updatedAt = nowIso();
    await db.insert('companies', c.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    _scheduleRemotePush();
  }

  /// Supprime le client ET tout ce qui lui est rattaché (contacts,
  /// opportunités, tâches, historique) — sinon ces éléments continuent
  /// d'apparaître dans le Pipeline, le Dashboard et la recherche alors que
  /// le client n'existe plus nulle part dans l'app.
  Future<void> softDeleteCompany(String id) async {
    final db = await database;
    final now = nowIso();
    await db.transaction((txn) async {
      for (final table in ['companies', 'contacts', 'opportunities', 'tasks', 'activities']) {
        await txn.update(table, {'deleted_at': now, 'updated_at': now},
            where: table == 'companies' ? 'id = ?' : 'company_id = ?', whereArgs: [id]);
      }
    });
    _scheduleRemotePush();
  }

  // ---- Contacts ------------------------------------------------------------

  Future<List<Contact>> contacts({String? companyId, String? search}) async {
    final db = await database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (companyId != null) {
      where.write(' AND company_id = ?');
      args.add(companyId);
    }
    if (search != null && search.trim().isNotEmpty) {
      where.write(' AND (first_name LIKE ? OR last_name LIKE ? OR email LIKE ?)');
      final q = '%${search.trim()}%';
      args.addAll([q, q, q]);
    }
    final rows = await db.query('contacts',
        where: where.toString(),
        whereArgs: args,
        orderBy: 'last_name COLLATE NOCASE, first_name COLLATE NOCASE');
    return rows.map(Contact.fromMap).toList();
  }

  Future<void> upsertContact(Contact c) async {
    final db = await database;
    c.updatedAt = nowIso();
    await db.insert('contacts', c.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    _scheduleRemotePush();
  }

  Future<void> softDeleteContact(String id) => _softDelete('contacts', id);

  // ---- Opportunities -------------------------------------------------------

  Future<List<Opportunity>> opportunities({String? companyId, String? stage}) async {
    final db = await database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (companyId != null) {
      where.write(' AND company_id = ?');
      args.add(companyId);
    }
    if (stage != null) {
      where.write(' AND stage = ?');
      args.add(stage);
    }
    final rows = await db.query('opportunities',
        where: where.toString(), whereArgs: args, orderBy: 'updated_at DESC');
    return rows.map(Opportunity.fromMap).toList();
  }

  Future<void> upsertOpportunity(Opportunity o) async {
    final db = await database;
    o.updatedAt = nowIso();
    await db.insert('opportunities', o.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    _scheduleRemotePush();
  }

  Future<void> softDeleteOpportunity(String id) => _softDelete('opportunities', id);

  // ---- Activities (timeline) ----------------------------------------------

  Future<List<Activity>> activities({String? companyId, int limit = 100}) async {
    final db = await database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (companyId != null) {
      where.write(' AND company_id = ?');
      args.add(companyId);
    }
    final rows = await db.query('activities',
        where: where.toString(),
        whereArgs: args,
        orderBy: 'happened_at DESC',
        limit: limit);
    return rows.map(Activity.fromMap).toList();
  }

  Future<void> upsertActivity(Activity a) async {
    final db = await database;
    a.updatedAt = nowIso();
    await db.insert('activities', a.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    _scheduleRemotePush();
  }

  Future<List<Opportunity>> searchOpportunities(String search) async {
    final db = await database;
    final q = '%${search.trim()}%';
    final rows = await db.query(
      'opportunities',
      where: 'deleted_at IS NULL AND (title LIKE ? OR notes LIKE ?)',
      whereArgs: [q, q],
      orderBy: 'updated_at DESC',
      limit: 12,
    );
    return rows.map(Opportunity.fromMap).toList();
  }

  Future<List<CrmTask>> searchTasks(String search) async {
    final db = await database;
    final q = '%${search.trim()}%';
    final rows = await db.query(
      'tasks',
      where: 'deleted_at IS NULL AND done_at IS NULL AND title LIKE ?',
      whereArgs: [q],
      orderBy: 'due_date IS NULL, due_date',
      limit: 12,
    );
    return rows.map(CrmTask.fromMap).toList();
  }

  Future<List<Activity>> searchActivities(String search) async {
    final db = await database;
    final q = '%${search.trim()}%';
    final rows = await db.query(
      'activities',
      where: 'deleted_at IS NULL AND (title LIKE ? OR body LIKE ?)',
      whereArgs: [q, q],
      orderBy: 'happened_at DESC',
      limit: 12,
    );
    return rows.map(Activity.fromMap).toList();
  }

  // ---- Tasks ---------------------------------------------------------------

  Future<List<CrmTask>> tasks({
    bool onlyOpen = true,
    String? companyId,
    String? assignedTo,
    String? opportunityId,
  }) async {
    final db = await database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (onlyOpen) where.write(' AND done_at IS NULL');
    if (companyId != null) {
      where.write(' AND company_id = ?');
      args.add(companyId);
    }
    if (opportunityId != null) {
      where.write(' AND opportunity_id = ?');
      args.add(opportunityId);
    }
    if (assignedTo != null) {
      where.write(' AND assigned_to = ?');
      args.add(assignedTo);
    }
    final rows = await db.query('tasks',
        where: where.toString(),
        whereArgs: args,
        orderBy: 'due_date IS NULL, due_date');
    return rows.map(CrmTask.fromMap).toList();
  }

  Future<void> upsertTask(CrmTask t) async {
    final db = await database;
    t.updatedAt = nowIso();
    await db.insert('tasks', t.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    _scheduleRemotePush();
  }

  Future<void> softDeleteTask(String id) => _softDelete('tasks', id);

  // ---- Users (comptes locaux, rôles) -----------------------------------------

  Future<List<UserAccount>> users() async {
    final db = await database;
    final rows = await db.query('users',
        where: 'deleted_at IS NULL', orderBy: 'display_name COLLATE NOCASE');
    return rows.map(UserAccount.fromMap).toList();
  }

  Future<UserAccount?> userByUsername(String username) async {
    final db = await database;
    final rows = await db.query('users',
        where: 'username = ? AND deleted_at IS NULL', whereArgs: [username]);
    return rows.isEmpty ? null : UserAccount.fromMap(rows.first);
  }

  Future<void> upsertUser(UserAccount u) async {
    final db = await database;
    u.updatedAt = nowIso();
    await db.insert('users', u.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    _scheduleRemotePush();
  }

  Future<void> softDeleteUser(String id) async {
    await _softDelete('users', id);
  }

  /// Fusionne un profil reçu du serveur — jamais le mot de passe local.
  Future<bool> mergeUserProfileFromSync(Map<String, Object?> row) async {
    final id = row['id'] as String?;
    if (id == null) return false;
    final db = await database;
    final remoteUpdatedAt = row['updated_at'] as String? ?? '';
    final existing = await db.query('users', where: 'id = ?', whereArgs: [id], limit: 1);
    if (existing.isNotEmpty) {
      final localUpdatedAt = existing.first['updated_at'] as String? ?? '';
      if (localUpdatedAt.compareTo(remoteUpdatedAt) >= 0) return false;
      final u = UserAccount.fromMap(existing.first);
      u.username = row['username'] as String? ?? u.username;
      u.displayName = row['display_name'] as String? ?? u.displayName;
      u.role = UserRole.fromDb(row['role'] as String?);
      u.updatedAt = remoteUpdatedAt;
      u.deletedAt = row['deleted_at'] as String?;
      await db.insert('users', u.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    }
    final (hash, salt) = AuthService.hashNewPassword(AppDatabase.newId());
    final account = UserAccount(
      id: id,
      username: row['username'] as String? ?? '',
      displayName: row['display_name'] as String? ?? '',
      passwordHash: hash,
      passwordSalt: salt,
      role: UserRole.fromDb(row['role'] as String?),
      createdAt: row['created_at'] as String? ?? nowIso(),
      updatedAt: remoteUpdatedAt,
      deletedAt: row['deleted_at'] as String?,
    );
    await db.insert('users', account.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return true;
  }

  /// Copie la base SQLite vers un fichier temporaire pour export.
  Future<File> exportBackupCopy() async {
    final db = await database;
    final path = db.path;
    if (path == null) throw StateError('Chemin base indisponible');
    final src = File(path);
    final stamp = DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
    final dest = File(p.join(p.dirname(path), 'emhk_crm_backup_$stamp.db'));
    await src.copy(dest.path);
    return dest;
  }

  // ---- Settings (clé/valeur) ------------------------------------------------
  // Profil société, préférences de sync… tout ce qui n'a pas besoin de sa
  // propre table vit ici.

  Future<String?> getSetting(String key) async {
    final db = await database;
    final rows = await db.query('settings', where: 'key = ?', whereArgs: [key]);
    return rows.isEmpty ? null : rows.first['value'] as String?;
  }

  Future<Map<String, String>> getSettings(List<String> keys) async {
    final db = await database;
    final placeholders = List.filled(keys.length, '?').join(',');
    final rows = await db.query('settings',
        where: 'key IN ($placeholders)', whereArgs: keys);
    return {
      for (final r in rows) r['key'] as String: (r['value'] as String?) ?? ''
    };
  }

  Future<void> setSetting(String key, String? value) async {
    final db = await database;
    if (value == null || value.isEmpty) {
      await db.delete('settings', where: 'key = ?', whereArgs: [key]);
    } else {
      await db.insert('settings', {'key': key, 'value': value},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  // ---- Helpers -------------------------------------------------------------

  Future<void> _softDelete(String table, String id) async {
    final db = await database;
    await db.update(table, {'deleted_at': nowIso(), 'updated_at': nowIso()},
        where: 'id = ?', whereArgs: [id]);
    _scheduleRemotePush();
  }

  void _scheduleRemotePush() {
    RemoteCrmSyncService.instance.schedulePushAfterLocalChange();
  }
}
