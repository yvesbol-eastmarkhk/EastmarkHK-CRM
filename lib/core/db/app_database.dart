import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:uuid/uuid.dart';

import '../../db/crm_db.dart';
import '../../platform/entitlement_service.dart';
import '../models/models.dart';
import '../models/user_account.dart';
import '../services/auth_service.dart';
import '../services/company_logo_service.dart';
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

  /// Tests uniquement : évite que [_maybeMigrateLegacyDatabase] n'aille lire
  /// (et copier dans la base de test) la vraie base de production trouvée
  /// sur la machine du développeur.
  @visibleForTesting
  static bool debugSkipLegacyMigration = false;

  /// Tests uniquement : ferme la connexion pour repartir d'une base neuve
  /// (chaque test isole son propre `getApplicationSupportDirectory`).
  @visibleForTesting
  Future<void> resetForTests() async {
    await _db?.close();
    _db = null;
  }

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
  static const _schemaVersion = 8;

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
    final dbPath = p.join(dir.path, _dbFileName);
    await _maybeMigrateLegacyDatabase(dbPath);
    _db = await _dbFactory.openDatabase(
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

  /// macOS : sandbox ON (DMG) vs OFF (debug Flutter) = deux dossiers
  /// Application Support distincts. On récupère la base la plus riche
  /// (plus de companies) depuis le chemin non-sandbox ou l’ancien container.
  static Future<void> _maybeMigrateLegacyDatabase(String targetPath) async {
    if (debugSkipLegacyMigration) return;
    if (!Platform.isMacOS) return;
    final home = _realUserHome();
    if (home == null) return;

    const bundleId = 'com.eastmarkhk.eastmarkhkCrm';
    final candidates = <String>[
      '$home/Library/Application Support/$bundleId/$_dbFileName',
      '$home/Library/Containers/$bundleId/Data/Library/Application Support/$bundleId/$_dbFileName',
      '$home/Library/Containers/$bundleId/Data/Documents/$_dbFileName',
      // Bundle ID minuscule (PRODUCT_BUNDLE_IDENTIFIER actuel).
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
      final n = await _rowCountInFile(legacy, 'companies');
      if (n > bestCount) {
        bestCount = n;
        bestPath = legacy;
      }
    }
    if (bestPath == null || bestCount <= 0) return;

    final targetExists = await File(targetPath).exists();
    final targetCount =
        targetExists ? await _rowCountInFile(targetPath, 'companies') : 0;
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
      // Force un push complet au prochain sync : les updated_at de la
      // base restaurée sont souvent plus anciens que last_pushed_at.
      await _resetSyncCursorInFile(targetPath, 'last_pushed_at');
    } catch (_) {}
  }

  static Future<void> _resetSyncCursorInFile(String dbPath, String key) async {
    try {
      await initPlatform();
      final db = await databaseFactoryFfi.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(singleInstance: false),
      );
      try {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS settings (
            key TEXT PRIMARY KEY NOT NULL,
            value TEXT
          )''');
        await db.insert(
          'settings',
          {'key': key, 'value': '1970-01-01T00:00:00.000Z'},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } finally {
        await db.close();
      }
    } catch (_) {}
  }

  static Future<int> _rowCountInFile(String dbPath, String table) async {
    try {
      await initPlatform();
      final db = await databaseFactoryFfi.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(readOnly: true, singleInstance: false),
      );
      try {
        final rows = await db.rawQuery(
          "SELECT COUNT(*) AS c FROM $table WHERE deleted_at IS NULL OR deleted_at = ''",
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
    if (oldVersion < 8) {
      await db.execute(
          'ALTER TABLE companies ADD COLUMN einvoice_customer_uuid TEXT');
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
        einvoice_customer_uuid TEXT,
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
  ///
  /// [flushRemote] : false quand appelé depuis le miroir CrmDb (évite
  /// récursion / push mid-mirror). L’UI passe true (défaut).
  Future<void> softDeleteCompany(String id, {bool flushRemote = true}) async {
    final db = await database;
    final now = nowIso();
    await db.transaction((txn) async {
      for (final table in ['companies', 'contacts', 'opportunities', 'tasks', 'activities']) {
        await txn.update(table, {'deleted_at': now, 'updated_at': now},
            where: table == 'companies' ? 'id = ?' : 'company_id = ?', whereArgs: [id]);
      }
    });
    // Miroir UI (CrmDb) — sinon le push force-miroir ressuscite le client.
    try {
      await CrmDb.instance.softDeleteClient(id);
    } catch (e) {
      debugPrint('softDeleteCompany CrmDb: $e');
    }
    if (!flushRemote) return;
    // Pousser tout de suite — sinon une suppression locale peut rester
    // invisible sur le serveur (debounce / poll).
    await RemoteCrmSyncService.instance.flushPendingPush();
  }

  /// Fusionne les sociétés en double (même nom, insensible à la casse/espaces)
  /// — ex. import CSV répété, ou société créée séparément avant la 1ʳᵉ sync
  /// sur un autre appareil. Garde la plus ancienne, réattribue contacts /
  /// opportunités / tâches / activités des doublons vers elle (jamais de
  /// perte de données), puis les supprime. Retourne les ids fusionnés.
  Future<List<String>> dedupeCompaniesByName() async {
    final db = await database;
    final list = await companies();
    final byKey = <String, List<Company>>{};
    for (final c in list) {
      final key = c.name.trim().toLowerCase();
      if (key.isEmpty) continue;
      (byKey[key] ??= []).add(c);
    }
    final removedIds = <String>[];
    for (final group in byKey.values) {
      if (group.length < 2) continue;
      group.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      final keep = group.first;
      for (final dup in group.skip(1)) {
        await db.transaction((txn) async {
          for (final table in ['contacts', 'opportunities', 'tasks', 'activities']) {
            await txn.update(table, {'company_id': keep.id},
                where: 'company_id = ?', whereArgs: [dup.id]);
          }
        });
        await softDeleteCompany(dup.id, flushRemote: false);
        removedIds.add(dup.id);
      }
    }
    if (removedIds.isNotEmpty) {
      debugPrint('AppDatabase.dedupeCompaniesByName: fusionné ${removedIds.length} doublon(s)');
      await RemoteCrmSyncService.instance.flushPendingPush();
    }
    return removedIds;
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

  Future<Opportunity?> opportunityById(String id) async {
    final db = await database;
    final rows = await db.query('opportunities', where: 'id = ?', whereArgs: [id]);
    return rows.isEmpty ? null : Opportunity.fromMap(rows.first);
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

  Future<List<Activity>> activities({
    String? companyId,
    String? opportunityId,
    int limit = 100,
  }) async {
    final db = await database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (companyId != null) {
      where.write(' AND company_id = ?');
      args.add(companyId);
    }
    if (opportunityId != null) {
      where.write(' AND opportunity_id = ?');
      args.add(opportunityId);
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

  Future<void> softDeleteActivity(String id) => _softDelete('activities', id);

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
      orderBy: 'updated_at DESC',
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
    // Plus récentes d'abord (y compris tâches sans date — elles restaient
    // enterrées en bas avec due_date ASC).
    final rows = await db.query('tasks',
        where: where.toString(),
        whereArgs: args,
        orderBy: 'updated_at DESC');
    return rows.map(CrmTask.fromMap).toList();
  }

  Future<CrmTask?> taskById(String id) async {
    final db = await database;
    final rows = await db.query('tasks', where: 'id = ?', whereArgs: [id]);
    return rows.isEmpty ? null : CrmTask.fromMap(rows.first);
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
    final needle = username.trim();
    if (needle.isEmpty) return null;
    // Correspondance exacte d'abord, puis insensible à la casse (login).
    final exact = await db.query('users',
        where: 'username = ? AND deleted_at IS NULL', whereArgs: [needle]);
    if (exact.isNotEmpty) return UserAccount.fromMap(exact.first);
    // Plusieurs comptes type yvesbol / Yvesbol : garder le plus ancien
    // (évite un doublon sync créé avec un mot de passe aléatoire).
    final rows = await db.query(
      'users',
      where: 'deleted_at IS NULL',
      orderBy: 'created_at ASC',
    );
    UserAccount? match;
    for (final row in rows) {
      final u = row['username']?.toString() ?? '';
      if (u.toLowerCase() == needle.toLowerCase()) {
        match = UserAccount.fromMap(row);
        break;
      }
    }
    return match;
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

  /// Supprime les doublons de login (yvesbol / Yvesbol) : garde le plus ancien,
  /// soft-delete les autres. Retourne les ids désactivés (pour nettoyer passkeys).
  Future<List<String>> dedupeUsersByUsername() async {
    final list = await users();
    final byKey = <String, List<UserAccount>>{};
    for (final u in list) {
      final key = u.username.trim().toLowerCase();
      if (key.isEmpty) continue;
      (byKey[key] ??= []).add(u);
    }
    final removedIds = <String>[];
    for (final group in byKey.values) {
      if (group.length < 2) continue;
      group.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      for (final dup in group.skip(1)) {
        await softDeleteUser(dup.id);
        removedIds.add(dup.id);
      }
    }
    return removedIds;
  }

  /// Réinitialise le mot de passe local d’un compte (cet appareil uniquement).
  Future<UserAccount?> resetLocalPassword({
    required String username,
    required String newPassword,
  }) async {
    final account = await userByUsername(username.trim());
    if (account == null) return null;
    final (hash, salt) = AuthService.hashNewPassword(newPassword);
    account.passwordHash = hash;
    account.passwordSalt = salt;
    account.touchIdEnabled = false;
    await upsertUser(account);
    return account;
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
    // Ne pas créer un 2ᵉ compte même casse (yvesbol / Yvesbol) : le sync
    // mettrait un hash aléatoire et casserait le login sur mobile.
    final remoteName = (row['username'] as String? ?? '').trim();
    if (remoteName.isNotEmpty) {
      final clash = await userByUsername(remoteName);
      if (clash != null) return false;
    }
    // Profil inconnu sans mot de passe — inutile pour le login ; on ignore.
    // (assigned_to peut rester un id opaque jusqu’à création locale du user.)
    return false;
  }

  /// Copie la base SQLite vers un fichier temporaire pour export.
  Future<File> exportBackupCopy() async {
    final db = await database;
    final path = db.path;
    final src = File(path);
    final stamp = DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
    final dest = File(p.join(p.dirname(path), 'emhk_crm_backup_$stamp.db'));
    await src.copy(dest.path);
    return dest;
  }

  // ---- Entitlements (modules payants) --------------------------------------

  Future<List<EntitlementRecord>> entitlements() async {
    final db = await database;
    final rows = await db.query('entitlements');
    return rows.map((r) {
      final src = r['source'] as String? ?? 'trial';
      return EntitlementRecord(
        moduleId: r['module_id'] as String,
        source: EntitlementSource.values.firstWhere(
          (s) => s.name == src,
          orElse: () => EntitlementSource.trial,
        ),
        expiresAt: r['expires_at'] == null ? null : DateTime.tryParse(r['expires_at'] as String),
        payload: r['payload'] as String?,
      );
    }).toList();
  }

  Future<void> upsertEntitlement(EntitlementRecord rec) async {
    final db = await database;
    await db.insert(
      'entitlements',
      {
        'module_id': rec.moduleId,
        'source': rec.source.name,
        'expires_at': rec.expiresAt?.toUtc().toIso8601String(),
        'payload': rec.payload,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> runModuleMigrations(List<String> sqlStatements) async {
    final db = await database;
    for (final sql in sqlStatements) {
      await db.execute(sql);
    }
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

  /// Identifiant singleton du profil entreprise sur le serveur de sync.
  static const companyProfileSyncId = 'company_profile';
  static const companyProfileUpdatedAtKey = 'company_profile_updated_at';

  static const companyProfileSettingKeys = <String>[
    'company_name',
    'company_country',
    'company_tax_id',
    'company_address',
    'company_district',
    'company_zip',
    'company_city',
    'company_state',
    'company_phone',
    'company_phone_country',
    'company_email',
  ];

  /// Marque le profil entreprise comme modifié → inclus au prochain push.
  Future<void> touchCompanyProfileForSync() async {
    await setSetting(companyProfileUpdatedAtKey, nowIso());
    _scheduleRemotePush();
  }

  /// Si des infos société existent déjà sans stamp sync (installs antérieures),
  /// pose un `updated_at` pour qu’elles partent au prochain push.
  Future<void> ensureCompanyProfileSyncStamp() async {
    final at = await getSetting(companyProfileUpdatedAtKey);
    if (at != null && at.isNotEmpty) return;
    final values = await getSettings([
      ...companyProfileSettingKeys,
      'company_logo_path',
    ]);
    final hasText = companyProfileSettingKeys
        .any((k) => (values[k] ?? '').trim().isNotEmpty);
    final hasLogo = (values['company_logo_path'] ?? '').trim().isNotEmpty;
    if (hasText || hasLogo) {
      await setSetting(companyProfileUpdatedAtKey, nowIso());
    }
  }

  /// Ligne `company_profile` à pousser, ou null si rien de plus récent.
  Future<Map<String, Object?>?> companyProfileRowForPush(String sincePush) async {
    await ensureCompanyProfileSyncStamp();
    final updated = await getSetting(companyProfileUpdatedAtKey) ?? '';
    if (updated.isEmpty || updated.compareTo(sincePush) <= 0) return null;

    final values = await getSettings(companyProfileSettingKeys);
    final logo = await CompanyLogoService.logoForSync();
    final created = await getSetting('company_profile_created_at') ?? updated;
    await setSetting('company_profile_created_at', created);

    // Suppression explicite uniquement — sinon on omet le logo pour laisser
    // le serveur conserver l’existant (appareil sans fichier local).
    final row = <String, Object?>{
      'id': companyProfileSyncId,
      'name': values['company_name'] ?? '',
      'country': values['company_country'] ?? '',
      'tax_id': values['company_tax_id'] ?? '',
      'address': values['company_address'] ?? '',
      'district': values['company_district'] ?? '',
      'zip': values['company_zip'] ?? '',
      'city': values['company_city'] ?? '',
      'state': values['company_state'] ?? '',
      'phone': values['company_phone'] ?? '',
      'phone_country': values['company_phone_country'] ?? '',
      'email': values['company_email'] ?? '',
      'created_at': created,
      'updated_at': updated,
      'deleted_at': null,
    };
    if (logo.cleared) {
      row['logo_base64'] = '';
      row['logo_ext'] = '.cleared';
    } else if (logo.base64.isNotEmpty) {
      row['logo_base64'] = logo.base64;
      row['logo_ext'] = logo.ext;
    }
    return row;
  }

  /// Applique un profil distant (LWW sur `company_profile_updated_at`).
  Future<bool> mergeCompanyProfileFromSync(Map<String, Object?> row) async {
    final remoteAt = '${row['updated_at'] ?? ''}';
    if (remoteAt.isEmpty) return false;
    final localAt = await getSetting(companyProfileUpdatedAtKey) ?? '';
    if (localAt.compareTo(remoteAt) >= 0) return false;

    await setSetting('company_name', '${row['name'] ?? ''}');
    await setSetting('company_country', '${row['country'] ?? ''}');
    await setSetting('company_tax_id', '${row['tax_id'] ?? ''}');
    await setSetting('company_address', '${row['address'] ?? ''}');
    await setSetting('company_district', '${row['district'] ?? ''}');
    await setSetting('company_zip', '${row['zip'] ?? ''}');
    await setSetting('company_city', '${row['city'] ?? ''}');
    await setSetting('company_state', '${row['state'] ?? ''}');
    await setSetting('company_phone', '${row['phone'] ?? ''}');
    await setSetting('company_phone_country', '${row['phone_country'] ?? ''}');
    await setSetting('company_email', '${row['email'] ?? ''}');
    await setSetting(
      'company_profile_created_at',
      '${row['created_at'] ?? remoteAt}',
    );

    final b64 = '${row['logo_base64'] ?? ''}';
    final extRaw = '${row['logo_ext'] ?? ''}';
    final cleared = extRaw == '.cleared' || extRaw == '__none__';
    // Ne jamais effacer un logo local juste parce que le distant n’en a pas
    // (appareil sans logo qui a poussé un profil texte plus récent).
    if (cleared) {
      final path = await getSetting('company_logo_path');
      if (path != null) {
        try {
          final f = File(path);
          if (await f.exists()) await f.delete();
        } catch (_) {}
      }
      await setSetting('company_logo_path', null);
      await setSetting('company_logo_cleared', '1');
    } else if (b64.isNotEmpty) {
      try {
        final bytes = base64Decode(b64);
        final ext = extRaw.isEmpty ? '.jpg' : extRaw;
        await CompanyLogoService.saveBytes(
          Uint8List.fromList(bytes),
          ext,
        );
        await setSetting('company_logo_cleared', null);
      } catch (e) {
        debugPrint('mergeCompanyProfileFromSync logo: $e');
      }
    }

    await setSetting(companyProfileUpdatedAtKey, remoteAt);
    await CompanyLogoSettings.instance.refresh();
    return true;
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
