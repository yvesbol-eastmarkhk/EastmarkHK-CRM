import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../l10n/gen/app_localizations.dart';
import '../constants/sync_defaults.dart';
import '../db/app_database.dart';
import 'client_company_bridge.dart';
import 'secure_credential_storage.dart';
import 'sync_editing_guard.dart';

enum SyncOutcomeKind {
  serverOk,
  invalidResponse,
  cancelled,
  inProgress,
  upToDate,
  received,
  sentNothing,
  sent,
  combined,
  pullFailed,
  pushFailed,
  auth401,
  timeout,
  formatError,
  connectError,
  serverStatus,
  raw,
}

/// Résultat d'une synchronisation — affiché dans Réglages (messages via l10n).
class SyncOutcome {
  const SyncOutcome({
    required this.ok,
    required this.kind,
    this.count,
    this.count2,
    this.detail,
    this.statusCode,
  });

  final bool ok;
  final SyncOutcomeKind kind;
  final int? count;
  final int? count2;
  final String? detail;
  final int? statusCode;

  /// Texte pour logs / fallback — préférer [localizedMessage] dans l’UI.
  String get message {
    switch (kind) {
      case SyncOutcomeKind.serverOk:
        return 'server ok';
      case SyncOutcomeKind.upToDate:
        return 'up to date';
      case SyncOutcomeKind.received:
        return 'received ${count ?? 0}';
      case SyncOutcomeKind.sent:
        return 'sent ${count ?? 0}';
      case SyncOutcomeKind.sentNothing:
        return 'sent nothing';
      case SyncOutcomeKind.combined:
        return 'sent ${count ?? 0}, received ${count2 ?? 0}';
      case SyncOutcomeKind.timeout:
        return 'timeout';
      case SyncOutcomeKind.auth401:
        return '401';
      case SyncOutcomeKind.raw:
      case SyncOutcomeKind.connectError:
        return detail ?? kind.name;
      default:
        return detail ?? kind.name;
    }
  }

  String localizedMessage(AppLocalizations l10n) {
    switch (kind) {
      case SyncOutcomeKind.serverOk:
        return l10n.syncServerOk;
      case SyncOutcomeKind.invalidResponse:
        return l10n.syncInvalidResponse;
      case SyncOutcomeKind.cancelled:
        return l10n.syncCancelled;
      case SyncOutcomeKind.inProgress:
        return l10n.syncInProgress;
      case SyncOutcomeKind.upToDate:
        return l10n.syncUpToDate;
      case SyncOutcomeKind.received:
        return l10n.syncReceived(count ?? 0);
      case SyncOutcomeKind.sentNothing:
        return l10n.syncSentNothingNew;
      case SyncOutcomeKind.sent:
        return l10n.syncSent(count ?? 0);
      case SyncOutcomeKind.combined:
        final parts = <String>[];
        if ((count ?? 0) > 0) parts.add(l10n.syncSentPart(count!));
        if ((count2 ?? 0) > 0) parts.add(l10n.syncReceivedPart(count2!));
        return parts.isEmpty ? l10n.syncUpToDate : parts.join(', ');
      case SyncOutcomeKind.pullFailed:
        return detail?.isNotEmpty == true ? detail! : l10n.syncPullFailed;
      case SyncOutcomeKind.pushFailed:
        return detail?.isNotEmpty == true ? detail! : l10n.syncPushFailed;
      case SyncOutcomeKind.auth401:
        return l10n.sync401;
      case SyncOutcomeKind.timeout:
        return l10n.syncTimeout;
      case SyncOutcomeKind.formatError:
        return l10n.syncInvalidResponse;
      case SyncOutcomeKind.connectError:
        return l10n.syncConnectError(detail ?? '');
      case SyncOutcomeKind.serverStatus:
        return l10n.syncServerStatus(statusCode ?? 0);
      case SyncOutcomeKind.raw:
        return detail ?? l10n.syncInvalidResponse;
    }
  }
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
  /// Une sync complète = pull + push (+ pull si push). Timeout raisonnable.
  static const _httpTimeout = Duration(seconds: 25);
  static const _syncJobTimeout = Duration(seconds: 90);

  static const _dataTables = ['companies', 'contacts', 'opportunities', 'activities', 'tasks'];
  static const _profileTable = 'user_profiles';
  static const _companyProfileTable = 'company_profile';
  static const _allTables = [..._dataTables, _profileTable, _companyProfileTable];

  static final _storage = createSecureCredentialStorage();

  /// Incrémenté après un pull qui a modifié la base — les listes écoutent
  /// cette valeur pour se rafraîchir (comme RemoteDataSyncService.dataEpoch).
  final ValueNotifier<int> dataEpoch = ValueNotifier<int>(0);

  bool _syncing = false;
  bool get isSyncing => _syncing;

  /// Sous-ensemble de [isSyncing] à afficher dans l'en-tête : uniquement les
  /// actions explicites (Réglages → Synchroniser). Le poll auto (25 s) et le
  /// push différé après saisie sont silencieux — avec un serveur parfois
  /// lent (cold start PHP-FPM après le regroupement des sous-domaines), les
  /// afficher faisait tourner l'icône bien plus qu'elle ne s'arrêtait, alors
  /// qu'avant elle restait discrète pour ces syncs de routine.
  bool _visibleSyncing = false;
  bool get isSyncingVisible => _visibleSyncing;

  DateTime? lastSyncAt;
  String? lastError;
  bool remoteModeEnabled = false;

  /// Mode remote demandé mais mot de passe / serveur manquant (ex. après réinstall).
  bool credentialsIncomplete = false;

  String? _lastSnackbarError;
  DateTime? _lastSnackbarAt;

  Timer? _pollTimer;
  Timer? _pushDebounceTimer;
  Future<void> _syncMutex = Future<void>.value();
  final int _mutexGen = 0;

  /// Nombre de tâches en attente + en cours dans la file (`_syncMutex`).
  /// Sans ce compteur, le poll auto (25 s) et le push différé pouvaient
  /// s'empiler plus vite qu'ils ne se vident quand le serveur est lent
  /// (proche du timeout) — `isSyncing` restait alors vrai en continu et
  /// le spinner de l'en-tête ne s'arrêtait jamais. Les tâches de fond
  /// (poll, push différé) sont maintenant ignorées si la file n'est pas
  /// vide plutôt que d'être empilées ; les actions explicites de
  /// l'utilisateur (Sync now, flush avant mise en arrière-plan) restent
  /// mises en file pour garantir qu'elles s'exécutent.
  int _queueDepth = 0;
  bool get _syncQueueBusy => _queueDepth > 0;

  /// Poll pull-only toutes les 25 s.
  /// Au démarrage : pull léger seulement (comme avant) — PAS une sync full
  /// qui monopolisait le mutex >1 min et bloquait « Tester la connexion ».
  void startAutoSync() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(_pollInterval, (_) => syncBackgroundPull());
    Future<void>.delayed(const Duration(seconds: 5), () {
      // ignore: discarded_futures
      syncBackgroundPull();
    });
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
    _pushDebounceTimer = Timer(_pushDebounce, _runDeferredPush);
  }

  /// Exécute le push différé, ou se re-planifie si une sync est déjà en
  /// file — évite d'empiler un push derrière un poll/push déjà en cours
  /// (ce qui gardait le spinner allumé) sans jamais perdre la donnée : la
  /// ligne modifiée garde son `updated_at` et sera reprise dès que la file
  /// se libère.
  void _runDeferredPush() {
    if (_syncQueueBusy) {
      _pushDebounceTimer = Timer(_pushDebounce, _runDeferredPush);
      return;
    }
    // ignore: discarded_futures
    syncFromSettings(mode: CrmSyncMode.pushOnly, silent: true);
  }

  /// Au passage en arrière-plan : pousse immédiatement les changements en attente.
  Future<void> flushPendingPush() async {
    _pushDebounceTimer?.cancel();
    _pushDebounceTimer = null;
    await syncFromSettings(mode: CrmSyncMode.pushOnly, silent: true);
  }

  /// Pull automatique — ignoré si l'utilisateur est en train de saisir.
  /// Même endpoint HTTPS / mêmes identifiants (trousseau) que Réglages.
  /// Un timeout ponctuel est retenté 1× avant d’afficher l’erreur (le test
  /// Réglages est un POST vide ; le poll tire de vraies données).
  Future<SyncOutcome?> syncBackgroundPull() async {
    if (SyncEditingGuard.shouldDeferPull) {
      debugPrint('CRM sync: pull reporté — saisie en cours');
      return null;
    }
    if (_syncQueueBusy) {
      // Une sync précédente (poll, push différé ou action utilisateur) est
      // encore en file/en cours : on saute ce cycle de poll plutôt que de
      // l'empiler. Sinon, avec un serveur lent, la file grossit plus vite
      // qu'elle ne se vide et le spinner de l'en-tête ne s'arrête jamais.
      debugPrint('CRM sync: poll ignoré — sync déjà en file');
      return null;
    }
    var outcome = await syncFromSettings(mode: CrmSyncMode.pullOnly, silent: true);
    if (outcome != null &&
        !outcome.ok &&
        outcome.kind == SyncOutcomeKind.timeout) {
      debugPrint('CRM sync: timeout poll — nouvel essai…');
      outcome = await syncFromSettings(mode: CrmSyncMode.pullOnly, silent: true);
    }
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
  /// [silent] : ne pas animer l'icône de l'en-tête (poll auto / push différé).
  Future<SyncOutcome?> syncFromSettings({
    CrmSyncMode mode = CrmSyncMode.full,
    bool silent = false,
  }) async {
    await refreshRemoteModeFlag();
    final creds = await _loadCredentials();
    if (creds == null) return null;
    return _enqueueSync(
      () => _syncBody(
        server: creds.server,
        account: creds.account,
        password: creds.password,
        mode: mode,
        silent: silent,
      ),
      silent: silent,
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
        silent: false,
      ),
    );
  }

  /// Test immédiat — hors mutex. Persiste d’abord les mêmes réglages que
  /// le poll auto utilisera (sinon Test OK avec l’URL du champ, mais l’app
  /// continue avec l’ancienne URL / sans MDP en trousseau).
  Future<SyncOutcome> testConnection({
    required String server,
    required String account,
    required String password,
  }) async {
    try {
      final since = DateTime.now().toUtc().toIso8601String();
      final decoded = await _post(
        server: server,
        account: account,
        password: password,
        since: since,
        push: _emptyPush(),
        timeout: const Duration(seconds: 20),
      );
      if (decoded['ok'] == true) {
        _markSyncSuccess();
        return const SyncOutcome(ok: true, kind: SyncOutcomeKind.serverOk);
      }
      final message = (decoded['message'] as String?) ?? '';
      lastError = message.isEmpty ? 'invalid' : message;
      notifyListeners();
      return SyncOutcome(
        ok: false,
        kind: SyncOutcomeKind.raw,
        detail: message.isEmpty ? null : message,
      );
    } catch (e) {
      final outcome = _outcomeFromError(e);
      lastError = outcome.message;
      notifyListeners();
      return outcome;
    }
  }

  void _markSyncSuccess() {
    lastError = null;
    _lastSnackbarError = null;
    lastSyncAt = DateTime.now();
    notifyListeners();
  }

  Future<SyncOutcome> _enqueueSync(
    Future<SyncOutcome> Function() body, {
    bool silent = false,
  }) {
    final done = Completer<SyncOutcome>();
    final gen = _mutexGen;
    _queueDepth++;
    _syncMutex = _syncMutex.catchError((_) {}).then((_) async {
      if (gen != _mutexGen) {
        if (!done.isCompleted) {
          done.complete(const SyncOutcome(ok: false, kind: SyncOutcomeKind.cancelled));
        }
        _queueDepth--;
        return;
      }
      _syncing = true;
      if (!silent) _visibleSyncing = true;
      notifyListeners();
      try {
        final outcome = await body().timeout(_syncJobTimeout);
        if (!done.isCompleted) done.complete(outcome);
      } catch (e) {
        if (!done.isCompleted) {
          done.complete(_outcomeFromError(e));
        }
      } finally {
        _syncing = false;
        if (!silent) _visibleSyncing = false;
        _queueDepth--;
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
    bool silent = false,
  }) async {
    try {
      switch (mode) {
        case CrmSyncMode.pullOnly:
          final pull = await _pullPhase(
            server: server,
            account: account,
            password: password,
            recordError: !silent,
          );
          if (!pull.ok) {
            return SyncOutcome(
              ok: false,
              kind: SyncOutcomeKind.pullFailed,
              detail: pull.message.isEmpty ? null : pull.message,
            );
          }
          // Miroir UI seulement s’il y a du nouveau — sinon le poll 25 s
          // coûtait cher pour rien et pouvait faire croire à un timeout.
          if (pull.applied > 0) {
            await _mirrorUiDb();
          }
          _markSyncSuccess();
          return pull.applied == 0
              ? const SyncOutcome(ok: true, kind: SyncOutcomeKind.upToDate)
              : SyncOutcome(ok: true, kind: SyncOutcomeKind.received, count: pull.applied);
        case CrmSyncMode.pushOnly:
          await _preparePushFromUiDb();
          final push = await _pushPhase(
            server: server,
            account: account,
            password: password,
            applyPull: false,
            recordError: !silent,
          );
          if (!push.ok) {
            return SyncOutcome(
              ok: false,
              kind: SyncOutcomeKind.pushFailed,
              detail: push.message.isEmpty ? null : push.message,
            );
          }
          _markSyncSuccess();
          return push.pushed == 0
              ? const SyncOutcome(ok: true, kind: SyncOutcomeKind.sentNothing)
              : SyncOutcome(ok: true, kind: SyncOutcomeKind.sent, count: push.pushed);
        case CrmSyncMode.full:
          final pull1 = await _pullPhase(
            server: server,
            account: account,
            password: password,
            recordError: !silent,
          );
          if (!pull1.ok) {
            return SyncOutcome(
              ok: false,
              kind: SyncOutcomeKind.pullFailed,
              detail: pull1.message.isEmpty ? null : pull1.message,
            );
          }
          await _preparePushFromUiDb();
          final push = await _pushPhase(
            server: server,
            account: account,
            password: password,
            applyPull: false,
            recordError: !silent,
          );
          if (!push.ok) {
            return SyncOutcome(
              ok: false,
              kind: SyncOutcomeKind.pushFailed,
              detail: push.message.isEmpty ? null : push.message,
            );
          }
          // Pas de 2ᵉ pull si rien n’a été poussé — évite un aller-retour inutile.
          var totalApplied = pull1.applied;
          if (push.pushed > 0) {
            final pull2 = await _pullPhase(
              server: server,
              account: account,
              password: password,
              recordError: !silent,
            );
            if (!pull2.ok) {
              return SyncOutcome(
                ok: false,
                kind: SyncOutcomeKind.pullFailed,
                detail: pull2.message.isEmpty ? null : pull2.message,
              );
            }
            totalApplied += pull2.applied;
          }
          if (totalApplied > 0 || push.pushed > 0) {
            await _mirrorUiDb();
          }
          _markSyncSuccess();
          if (push.pushed == 0 && totalApplied == 0) {
            return const SyncOutcome(ok: true, kind: SyncOutcomeKind.upToDate);
          }
          if (push.pushed > 0 && totalApplied > 0) {
            return SyncOutcome(
              ok: true,
              kind: SyncOutcomeKind.combined,
              count: push.pushed,
              count2: totalApplied,
            );
          }
          if (push.pushed > 0) {
            return SyncOutcome(ok: true, kind: SyncOutcomeKind.sent, count: push.pushed);
          }
          return SyncOutcome(ok: true, kind: SyncOutcomeKind.received, count: totalApplied);
      }
    } catch (e) {
      final outcome = _outcomeFromError(e);
      if (!silent) {
        lastError = outcome.message;
        notifyListeners();
      }
      return outcome;
    }
  }

  Future<({bool ok, String message, int applied})> _pullPhase({
    required String server,
    required String account,
    required String password,
    bool recordError = true,
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
        if (recordError) lastError = message;
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
    bool recordError = true,
  }) async {
    final db = AppDatabase.instance;
    final rawDb = await db.database;
    final sincePush = await db.getSetting(_lastPushedAtKey) ?? _epoch;
    final sincePull = await db.getSetting(_lastSyncSettingKey) ?? _epoch;

    final push = <String, List<Map<String, Object?>>>{};
    var pushed = 0;
    // Horodatage « maintenant » : sinon le serveur garde d’anciens updated_at
    // et les mobiles dont last_sync_at est plus récent ne reçoivent jamais
    // les lignes (WHERE updated_at > since).
    final stamp = DateTime.now().toUtc().toIso8601String();
    for (final table in _dataTables) {
      final rows = await rawDb.query(table, where: 'updated_at > ?', whereArgs: [sincePush]);
      final stamped = rows
          .map((r) => Map<String, Object?>.from(r)..['updated_at'] = stamp)
          .toList();
      if (stamped.isNotEmpty) {
        final batch = rawDb.batch();
        for (final row in stamped) {
          batch.update(
            table,
            {'updated_at': stamp},
            where: 'id = ?',
            whereArgs: [row['id']],
          );
        }
        await batch.commit(noResult: true);
      }
      push[table] = stamped;
      pushed += stamped.length;
    }
    final profiles = await _userProfilesToPush(rawDb, sincePush);
    final stampedProfiles = profiles
        .map((r) => Map<String, Object?>.from(r)..['updated_at'] = stamp)
        .toList();
    push[_profileTable] = stampedProfiles;
    pushed += stampedProfiles.length;

    final companyRow = await db.companyProfileRowForPush(sincePush);
    if (companyRow != null) {
      final stampedCompany = Map<String, Object?>.from(companyRow)
        ..['updated_at'] = stamp;
      // Aligne le stamp local avec celui poussé (LWW).
      await db.setSetting(AppDatabase.companyProfileUpdatedAtKey, stamp);
      push[_companyProfileTable] = [stampedCompany];
      pushed += 1;
    } else {
      push[_companyProfileTable] = const [];
    }

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
      if (recordError) lastError = message;
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

    final companyRows = (pull[_companyProfileTable] as List?) ?? const [];
    for (final row in companyRows) {
      if (row is! Map) continue;
      final merged = await AppDatabase.instance.mergeCompanyProfileFromSync(
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

  /// AppDatabase (sync) → CrmDb (UI Clients). Toujours notifier l’UI.
  Future<void> _mirrorUiDb() async {
    try {
      await ClientCompanyBridge.mirrorFromAppDatabase();
    } catch (e, st) {
      debugPrint('RemoteCrmSyncService._mirrorUiDb: $e\n$st');
    }
    dataEpoch.value++;
  }

  /// CrmDb (UI) → AppDatabase avant push — sinon les clients v2 restent locaux.
  /// `force: true` pour les clients uniquement.
  /// Les tâches live sont dans AppDatabase (CrmShell) : ne pas forcer le miroir
  /// v2→legacy (sinon une tâche marquée faite est réouverte avant le push).
  Future<void> _preparePushFromUiDb() async {
    try {
      final n = await ClientCompanyBridge.mirrorClientsToAppDatabase(force: true);
      // Pas de force : n’écrire AppDatabase que si CrmDb est plus récent.
      final t = await ClientCompanyBridge.mirrorTasksToAppDatabase(force: false);
      if (n > 0 || t > 0) {
        debugPrint(
          'RemoteCrmSyncService._preparePushFromUiDb: $n client(s), $t task(s)',
        );
      }
    } catch (e, st) {
      debugPrint('RemoteCrmSyncService._preparePushFromUiDb: $e\n$st');
    }
  }

  Future<Map<String, dynamic>> _post({
    required String server,
    required String account,
    required String password,
    required String since,
    required Map<String, List<Map<String, Object?>>> push,
    Duration? timeout,
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
        .timeout(timeout ?? _httpTimeout);

    Map<String, dynamic>? body;
    try {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) body = decoded;
    } catch (_) {}

    if (response.statusCode != 200) {
      final serverMsg = body?['message'] as String?;
      if (response.statusCode == 401) {
        throw SyncServerException(
          serverMsg ?? '401',
          kind: SyncOutcomeKind.auth401,
        );
      }
      throw SyncServerException(
        serverMsg ?? 'status ${response.statusCode}',
        kind: SyncOutcomeKind.serverStatus,
        statusCode: response.statusCode,
      );
    }

    return body ?? (jsonDecode(response.body) as Map<String, dynamic>);
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
    final mode = values['sync_mode'];
    // Défaut produit = remote (comme l’UI Réglages). null = jamais sauvegardé
    // (typique après réinstall) → on pousse vers la config, pas le silence.
    final wantsRemote = mode == null || mode == 'remote';
    if (!wantsRemote) {
      _setCredentialsIncomplete(false);
      return null;
    }
    if (mode == null) {
      await db.setSetting('sync_mode', 'remote');
    }
    var server = (values['sync_server'] ?? '').trim();
    var account = (values['sync_account'] ?? '').trim();
    // Migration silencieuse ancien sous-domaine → emhk (sans attendre Réglages).
    if (server.contains('crm.eastmarkhk.com')) {
      server = SyncDefaults.legacyMigratedServerUrl;
      await db.setSetting('sync_server', server);
    }
    if (account == 'crm@eastmarkhk.com') {
      account = SyncDefaults.legacyMigratedAccount;
      await db.setSetting('sync_account', account);
    }
    // Nouvelle install : ne pas injecter d'identifiants EastmarkHK —
    // l'utilisateur saisit serveur / compte / mot de passe dans Réglages.
    if (server.isEmpty || account.isEmpty) {
      _setCredentialsIncomplete(true);
      return null;
    }
    String? password;
    try {
      password = await _storage.read(key: passwordStorageKey);
    } catch (_) {
      _setCredentialsIncomplete(true);
      return null;
    }
    if (password == null || password.isEmpty) {
      _setCredentialsIncomplete(true);
      return null;
    }
    _setCredentialsIncomplete(false);
    return (server: server, account: account, password: password);
  }

  void _setCredentialsIncomplete(bool value) {
    if (credentialsIncomplete == value) return;
    credentialsIncomplete = value;
    if (value) {
      lastError = 'needs_password';
    } else if (lastError == 'needs_password') {
      lastError = null;
    }
    notifyListeners();
  }

  String _normalizeServer(String server) {
    var s = server.trim();
    if (s.endsWith('/')) s = s.substring(0, s.length - 1);
    return s;
  }

  SyncOutcome _outcomeFromError(Object e) {
    if (e is TimeoutException) {
      return const SyncOutcome(ok: false, kind: SyncOutcomeKind.timeout);
    }
    if (e is FormatException) {
      return const SyncOutcome(ok: false, kind: SyncOutcomeKind.formatError);
    }
    if (e is SyncServerException) {
      return SyncOutcome(
        ok: false,
        kind: e.kind,
        detail: e.message,
        statusCode: e.statusCode,
      );
    }
    return SyncOutcome(
      ok: false,
      kind: SyncOutcomeKind.connectError,
      detail: '$e',
    );
  }
}

class SyncServerException implements Exception {
  SyncServerException(
    this.message, {
    this.kind = SyncOutcomeKind.raw,
    this.statusCode,
  });
  final String message;
  final SyncOutcomeKind kind;
  final int? statusCode;
  @override
  String toString() => message;
}
