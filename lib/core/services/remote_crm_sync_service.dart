import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../db/app_database.dart';
import 'sync_editing_guard.dart';

/// Résultat d'une synchronisation — affiché dans Réglages.
class SyncOutcome {
  const SyncOutcome({required this.ok, required this.message});
  final bool ok;
  final String message;
}

enum CrmSyncMode { pullOnly, pushOnly, full }

/// Synchronisation « base partagée » — alignée sur e-Invoicing :
/// - pull-first (récupère le distant avant de pousser)
/// - poll 25 s en arrière-plan (pull seul)
/// - push différé après chaque écriture locale
/// - pas de pull automatique pendant une saisie
/// - mutex pour éviter les sync concurrentes
class RemoteCrmSyncService extends ChangeNotifier {
  RemoteCrmSyncService._();
  static final RemoteCrmSyncService instance = RemoteCrmSyncService._();

  static const passwordStorageKey = 'crm_sync_password';
  static const _lastSyncSettingKey = 'last_sync_at';
  static const _lastPushedAtKey = 'last_pushed_at';
  static const _epoch = '1970-01-01T00:00:00.000Z';
  static const _pullLimit = 5000;
  static const _pollInterval = Duration(seconds: 25);
  static const _pushDebounce = Duration(seconds: 2);

  static const _dataTables = ['companies', 'contacts', 'opportunities', 'activities', 'tasks'];
  static const _profileTable = 'user_profiles';
  static const _allTables = [..._dataTables, _profileTable];

  static const _storage = FlutterSecureStorage();

  /// Incrémenté après un pull qui a modifié la base — les listes écoutent
  /// cette valeur pour se rafraîchir (comme RemoteDataSyncService.dataEpoch).
  final ValueNotifier<int> dataEpoch = ValueNotifier<int>(0);

  bool _syncing = false;
  bool get isSyncing => _syncing;

  DateTime? lastSyncAt;
  String? lastError;
  bool remoteModeEnabled = false;

  String? _lastSnackbarError;
  DateTime? _lastSnackbarAt;

  Timer? _pollTimer;
  Timer? _pushDebounceTimer;
  Future<void> _syncMutex = Future<void>.value();
  int _mutexGen = 0;

  /// Poll pull-only toutes les 25 s + premier tick après le démarrage.
  void startAutoSync() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(_pollInterval, (_) => syncBackgroundPull());
    Future<void>.delayed(const Duration(seconds: 5), syncBackgroundPull);
  }

  void stopAutoSync() {
    _pollTimer?.cancel();
    _pollTimer = null;
    _pushDebounceTimer?.cancel();
    _pushDebounceTimer = null;
  }

  /// Après une écriture locale : push différé (debounce 2 s).
  void schedulePushAfterLocalChange() {
    _pushDebounceTimer?.cancel();
    _pushDebounceTimer = Timer(_pushDebounce, () {
      // ignore: discarded_futures
      syncFromSettings(mode: CrmSyncMode.pushOnly);
    });
  }

  /// Au passage en arrière-plan : pousse immédiatement les changements en attente.
  Future<void> flushPendingPush() async {
    _pushDebounceTimer?.cancel();
    _pushDebounceTimer = null;
    await syncFromSettings(mode: CrmSyncMode.pushOnly);
  }

  /// Pull automatique — ignoré si l'utilisateur est en train de saisir.
  Future<SyncOutcome?> syncBackgroundPull() async {
    if (SyncEditingGuard.shouldDeferPull) {
      debugPrint('CRM sync: pull reporté — saisie en cours');
      return null;
    }
    final outcome = await syncFromSettings(mode: CrmSyncMode.pullOnly);
    if (outcome != null && !outcome.ok) {
      _maybeShowBackgroundError(outcome.message);
    }
    return outcome;
  }

  Future<bool> refreshRemoteModeFlag() async {
    final creds = await _loadCredentials();
    final enabled = creds != null;
    if (remoteModeEnabled != enabled) {
      remoteModeEnabled = enabled;
      notifyListeners();
    }
    return enabled;
  }

  /// Sync complète depuis les réglages (pull → push → pull).
  Future<SyncOutcome?> syncFromSettings({CrmSyncMode mode = CrmSyncMode.full}) async {
    await refreshRemoteModeFlag();
    final creds = await _loadCredentials();
    if (creds == null) return null;
    return _enqueueSync(
      () => _syncBody(
        server: creds.server,
        account: creds.account,
        password: creds.password,
        mode: mode,
      ),
    );
  }

  Future<SyncOutcome> syncNow({
    required String server,
    required String account,
    required String password,
  }) {
    return _enqueueSync(
      () => _syncBody(
        server: server,
        account: account,
        password: password,
        mode: CrmSyncMode.full,
      ),
    );
  }

  Future<SyncOutcome> _enqueueSync(Future<SyncOutcome> Function() body) {
    final done = Completer<SyncOutcome>();
    final gen = _mutexGen;
    _syncMutex = _syncMutex.catchError((_) {}).then((_) async {
      if (gen != _mutexGen) {
        if (!done.isCompleted) {
          done.complete(const SyncOutcome(ok: false, message: 'Synchronisation annulée'));
        }
        return;
      }
      if (_syncing) {
        if (!done.isCompleted) {
          done.complete(const SyncOutcome(ok: false, message: 'Synchronisation déjà en cours'));
        }
        return;
      }
      _syncing = true;
      notifyListeners();
      try {
        final outcome = await body().timeout(const Duration(seconds: 25));
        if (!done.isCompleted) done.complete(outcome);
      } catch (e) {
        if (!done.isCompleted) {
          done.complete(SyncOutcome(ok: false, message: _friendlyError(e)));
        }
      } finally {
        _syncing = false;
        notifyListeners();
      }
    });
    return done.future;
  }

  Future<SyncOutcome> _syncBody({
    required String server,
    required String account,
    required String password,
    required CrmSyncMode mode,
  }) async {
    try {
      switch (mode) {
        case CrmSyncMode.pullOnly:
          final pull = await _pullPhase(server: server, account: account, password: password);
          if (!pull.ok) return SyncOutcome(ok: false, message: pull.message);
          lastError = null;
          notifyListeners();
          return SyncOutcome(
            ok: true,
            message: pull.applied == 0 ? 'À jour' : '${pull.applied} élément(s) reçu(s)',
          );
        case CrmSyncMode.pushOnly:
          final push = await _pushPhase(
            server: server,
            account: account,
            password: password,
            applyPull: false,
          );
          if (!push.ok) return SyncOutcome(ok: false, message: push.message);
          lastError = null;
          notifyListeners();
          return SyncOutcome(
            ok: true,
            message: push.pushed == 0 ? 'Envoyé (rien de nouveau)' : '${push.pushed} élément(s) envoyé(s)',
          );
        case CrmSyncMode.full:
          final pull1 = await _pullPhase(server: server, account: account, password: password);
          if (!pull1.ok) return SyncOutcome(ok: false, message: pull1.message);
          final push = await _pushPhase(
            server: server,
            account: account,
            password: password,
            applyPull: false,
          );
          if (!push.ok) return SyncOutcome(ok: false, message: push.message);
          final pull2 = await _pullPhase(server: server, account: account, password: password);
          if (!pull2.ok) return SyncOutcome(ok: false, message: pull2.message);
          final totalApplied = pull1.applied + pull2.applied;
          lastError = null;
          notifyListeners();
          final parts = <String>[];
          if (push.pushed > 0) parts.add('${push.pushed} envoyé(s)');
          if (totalApplied > 0) parts.add('$totalApplied reçu(s)');
          return SyncOutcome(
            ok: true,
            message: parts.isEmpty ? 'À jour' : parts.join(', '),
          );
      }
    } catch (e) {
      final message = _friendlyError(e);
      lastError = message;
      notifyListeners();
      return SyncOutcome(ok: false, message: message);
    }
  }

  Future<({bool ok, String message, int applied})> _pullPhase({
    required String server,
    required String account,
    required String password,
  }) async {
    final db = AppDatabase.instance;
    final rawDb = await db.database;
    var since = await db.getSetting(_lastSyncSettingKey) ?? _epoch;
    var totalApplied = 0;

    while (true) {
      final decoded = await _post(
        server: server,
        account: account,
        password: password,
        since: since,
        push: _emptyPush(),
      );
      if (decoded['ok'] != true) {
        final message = (decoded['message'] as String?) ?? 'Échec du pull';
        lastError = message;
        return (ok: false, message: message, applied: totalApplied);
      }

      final pull = (decoded['pull'] as Map<String, dynamic>?) ?? {};
      final applied = await _applyPull(rawDb, pull);
      totalApplied += applied;

      final hitLimit = _pullHitLimit(pull);
      if (!hitLimit) {
        final serverTime =
            (decoded['server_time'] as String?) ?? DateTime.now().toUtc().toIso8601String();
        await db.setSetting(_lastSyncSettingKey, serverTime);
        lastSyncAt = DateTime.tryParse(serverTime)?.toLocal();
        if (applied > 0) dataEpoch.value++;
        return (ok: true, message: '', applied: totalApplied);
      }

      final nextSince = _maxUpdatedAtInPull(pull);
      if (nextSince.compareTo(since) <= 0) {
        final serverTime =
            (decoded['server_time'] as String?) ?? DateTime.now().toUtc().toIso8601String();
        await db.setSetting(_lastSyncSettingKey, serverTime);
        lastSyncAt = DateTime.tryParse(serverTime)?.toLocal();
        if (totalApplied > 0) {
          dataEpoch.value++;
          notifyListeners();
        }
        return (ok: true, message: '', applied: totalApplied);
      }
      since = nextSince;
    }
  }

  Future<List<Map<String, Object?>>> _userProfilesToPush(Database rawDb, String sincePush) async {
    final rows = await rawDb.query('users', where: 'updated_at > ?', whereArgs: [sincePush]);
    return rows
        .map((r) => {
              'id': r['id'],
              'username': r['username'],
              'display_name': r['display_name'],
              'role': r['role'],
              'created_at': r['created_at'],
              'updated_at': r['updated_at'],
              'deleted_at': r['deleted_at'],
            })
        .toList();
  }

  Future<({bool ok, String message, int pushed})> _pushPhase({
    required String server,
    required String account,
    required String password,
    required bool applyPull,
  }) async {
    final db = AppDatabase.instance;
    final rawDb = await db.database;
    final sincePush = await db.getSetting(_lastPushedAtKey) ?? _epoch;
    final sincePull = await db.getSetting(_lastSyncSettingKey) ?? _epoch;

    final push = <String, List<Map<String, Object?>>>{};
    var pushed = 0;
    for (final table in _dataTables) {
      final rows = await rawDb.query(table, where: 'updated_at > ?', whereArgs: [sincePush]);
      push[table] = rows;
      pushed += rows.length;
    }
    final profiles = await _userProfilesToPush(rawDb, sincePush);
    push[_profileTable] = profiles;
    pushed += profiles.length;

    if (pushed == 0) {
      return (ok: true, message: '', pushed: 0);
    }

    final decoded = await _post(
      server: server,
      account: account,
      password: password,
      since: sincePull,
      push: push,
    );

    if (decoded['ok'] != true) {
      final message = (decoded['message'] as String?) ?? 'Échec du push';
      lastError = message;
      return (ok: false, message: message, pushed: 0);
    }

    final serverTime =
        (decoded['server_time'] as String?) ?? DateTime.now().toUtc().toIso8601String();
    await db.setSetting(_lastPushedAtKey, serverTime);

    if (applyPull) {
      final pull = (decoded['pull'] as Map<String, dynamic>?) ?? {};
      final applied = await _applyPull(rawDb, pull);
      if (applied > 0) dataEpoch.value++;
    }

    return (ok: true, message: '', pushed: pushed);
  }

  Future<int> _applyPull(Database rawDb, Map<String, dynamic> pull) async {
    var applied = 0;
    final profileRows = (pull[_profileTable] as List?) ?? const [];
    for (final row in profileRows) {
      if (row is! Map) continue;
      final merged = await AppDatabase.instance.mergeUserProfileFromSync(
        Map<String, Object?>.from(row),
      );
      if (merged) applied++;
    }

    await rawDb.transaction((txn) async {
      for (final table in _dataTables) {
        final rows = (pull[table] as List?) ?? const [];
        for (final row in rows) {
          if (row is! Map) continue;
          final map = Map<String, Object?>.from(row);
          final id = map['id'] as String?;
          if (id == null) continue;
          final existing = await txn.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
          if (existing.isNotEmpty) {
            final localUpdatedAt = existing.first['updated_at'] as String? ?? '';
            final remoteUpdatedAt = map['updated_at'] as String? ?? '';
            if (localUpdatedAt.compareTo(remoteUpdatedAt) >= 0) continue;
          }
          await txn.insert(table, map, conflictAlgorithm: ConflictAlgorithm.replace);
          applied++;
        }
      }
    });
    return applied;
  }

  Future<Map<String, dynamic>> _post({
    required String server,
    required String account,
    required String password,
    required String since,
    required Map<String, List<Map<String, Object?>>> push,
  }) async {
    final uri = Uri.parse('${_normalizeServer(server)}/sync.php');
    final response = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'auth': {'account': account, 'password': password},
            'since': since,
            'push': push,
          }),
        )
        .timeout(const Duration(seconds: 25));

    if (response.statusCode != 200) {
      throw SyncServerException('Le serveur a répondu ${response.statusCode}');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Map<String, List<Map<String, Object?>>> _emptyPush() {
    return {for (final t in _allTables) t: <Map<String, Object?>>[]};
  }

  bool _pullHitLimit(Map<String, dynamic> pull) {
    for (final table in _allTables) {
      final rows = (pull[table] as List?) ?? const [];
      if (rows.length >= _pullLimit) return true;
    }
    return false;
  }

  String _maxUpdatedAtInPull(Map<String, dynamic> pull) {
    var max = _epoch;
    for (final table in _allTables) {
      final rows = (pull[table] as List?) ?? const [];
      for (final row in rows) {
        if (row is! Map) continue;
        final at = row['updated_at'] as String? ?? '';
        if (at.compareTo(max) > 0) max = at;
      }
    }
    return max;
  }

  void _maybeShowBackgroundError(String message) {
    final now = DateTime.now();
    if (_lastSnackbarError == message &&
        _lastSnackbarAt != null &&
        now.difference(_lastSnackbarAt!) < const Duration(minutes: 5)) {
      return;
    }
    _lastSnackbarError = message;
    _lastSnackbarAt = now;
    notifyListeners();
  }

  void clearBackgroundErrorNotice() {
    _lastSnackbarError = null;
    notifyListeners();
  }

  bool get hasBackgroundErrorNotice => _lastSnackbarError != null && lastError != null;

  Future<({String server, String account, String password})?> _loadCredentials() async {
    final db = AppDatabase.instance;
    final values = await db.getSettings(['sync_mode', 'sync_server', 'sync_account']);
    if (values['sync_mode'] != 'remote') return null;
    final server = values['sync_server'] ?? '';
    final account = values['sync_account'] ?? '';
    if (server.isEmpty || account.isEmpty) return null;
    String? password;
    try {
      password = await _storage.read(key: passwordStorageKey);
    } catch (_) {
      return null;
    }
    if (password == null || password.isEmpty) return null;
    return (server: server, account: account, password: password);
  }

  String _normalizeServer(String server) {
    var s = server.trim();
    if (s.endsWith('/')) s = s.substring(0, s.length - 1);
    return s;
  }

  String _friendlyError(Object e) {
    if (e is TimeoutException) return 'Le serveur ne répond pas (délai dépassé)';
    if (e is FormatException) return 'Réponse du serveur invalide';
    if (e is SyncServerException) return e.message;
    return 'Connexion impossible : $e';
  }
}

class SyncServerException implements Exception {
  SyncServerException(this.message);
  final String message;
  @override
  String toString() => message;
}
