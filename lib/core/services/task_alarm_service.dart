import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../db/app_database.dart';
import '../../l10n/gen/app_localizations.dart';
import '../models/models.dart';
import '../utils/formatters.dart';
import '../utils/task_display.dart';
import 'remote_crm_sync_service.dart';
import 'sync_editing_guard.dart';

/// Alarmes tâches — vérifie chaque minute les échéances dépassées et affiche
/// un rappel jusqu'à ce que la tâche soit faite ou reprogrammée.
class TaskAlarmService {
  TaskAlarmService._();
  static final TaskAlarmService instance = TaskAlarmService._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Timer? _timer;
  bool _checking = false;
  bool _dialogOpen = false;
  final Set<String> _alertedTaskIds = {};
  final Map<String, DateTime> _snoozedUntil = {};

  void start() {
    _timer?.cancel();
    _check();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) => _check());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  /// Ignore une tâche en retard jusqu’à [until] (ex. fermeture du dialogue).
  void snooze(String taskId, DateTime until) {
    _snoozedUntil[taskId] = until;
  }

  void clearAlerted(String taskId) {
    _alertedTaskIds.remove(taskId);
  }

  Future<void> _check() async {
    if (_checking) return;
    _checking = true;
    try {
      // Pull d’abord (même si un dialogue est ouvert) pour retirer les tâches
      // marquées faites sur Mac / autre appareil — sinon « Task reminder » boucle.
      final prevGuard = SyncEditingGuard.isUserEditing;
      SyncEditingGuard.isUserEditing = null;
      try {
        await RemoteCrmSyncService.instance.syncBackgroundPull();
      } catch (_) {
        // Hors-ligne / pas configuré — on continue avec la base locale.
      } finally {
        SyncEditingGuard.isUserEditing = prevGuard;
      }

      final tasks = await AppDatabase.instance.tasks();
      final now = DateTime.now();
      _snoozedUntil.removeWhere((_, until) => !until.isAfter(now));
      final overdue = tasks.where((t) {
        if (t.isDone || t.dueDate == null || t.dueDate!.isEmpty) return false;
        final snoozeUntil = _snoozedUntil[t.id];
        if (snoozeUntil != null && snoozeUntil.isAfter(now)) return false;
        final due = DateTime.tryParse(t.dueDate!);
        if (due == null) return false;
        return !due.toLocal().isAfter(now);
      }).toList()
        ..sort((a, b) => (a.dueDate ?? '').compareTo(b.dueDate ?? ''));

      if (overdue.isEmpty) {
        _alertedTaskIds.clear();
        return;
      }

      // Le son ne retentit qu'une fois par tâche devenue en retard : une tâche
      // marquée faite (ou reprogrammée) ne fait plus sonner l'appareil.
      final overdueIds = overdue.map((t) => t.id).toSet();
      final hasNewAlarm = overdueIds.difference(_alertedTaskIds).isNotEmpty;
      if (hasNewAlarm) {
        await SystemSound.play(SystemSoundType.alert);
        _alertedTaskIds.addAll(overdueIds);
      }
      _alertedTaskIds.retainAll(overdueIds);

      if (_dialogOpen) return;

      final ctx = navigatorKey.currentContext;
      if (ctx == null || !ctx.mounted) return;

      _dialogOpen = true;
      try {
        await showTaskAlarmDialog(ctx, overdue);
      } finally {
        _dialogOpen = false;
      }
    } finally {
      _checking = false;
    }
  }
}

/// Dialogue d'alarme — réapparaît chaque minute tant que des tâches sont en retard.
Future<void> showTaskAlarmDialog(BuildContext context, List<CrmTask> tasks) async {
  if (tasks.isEmpty) return;
  final companies = await AppDatabase.instance.companies();
  final names = {for (final c in companies) c.id: c.name};

  if (!context.mounted) return;
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => _TaskAlarmDialog(tasks: tasks, companyNames: names),
  );
}

class _TaskAlarmDialog extends StatefulWidget {
  const _TaskAlarmDialog({required this.tasks, required this.companyNames});

  final List<CrmTask> tasks;
  final Map<String, String> companyNames;

  @override
  State<_TaskAlarmDialog> createState() => _TaskAlarmDialogState();
}

class _TaskAlarmDialogState extends State<_TaskAlarmDialog> {
  late List<CrmTask> _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = List.of(widget.tasks);
  }

  Future<void> _markDone(CrmTask t) async {
    t.doneAt = nowIso();
    t.updatedAt = nowIso();
    await AppDatabase.instance.upsertTask(t);
    // Push immédiat — sinon un autre appareil peut renvoyer la version « ouverte ».
    await RemoteCrmSyncService.instance.flushPendingPush();
    TaskAlarmService.instance.clearAlerted(t.id);
    setState(() => _remaining.removeWhere((x) => x.id == t.id));
    if (_remaining.isEmpty && mounted) Navigator.pop(context);
  }

  Future<void> _postpone(CrmTask t, Duration delta) async {
    final due = DateTime.tryParse(t.dueDate ?? '');
    final base = due?.toLocal() ?? DateTime.now();
    final next = base.add(delta);
    t.dueDate = next.toUtc().toIso8601String();
    t.updatedAt = nowIso();
    await AppDatabase.instance.upsertTask(t);
    await RemoteCrmSyncService.instance.flushPendingPush();
    TaskAlarmService.instance.clearAlerted(t.id);
    setState(() => _remaining.removeWhere((x) => x.id == t.id));
    if (_remaining.isEmpty && mounted) Navigator.pop(context);
  }

  void _closeSnooze() {
    final until = DateTime.now().add(const Duration(minutes: 10));
    for (final t in _remaining) {
      TaskAlarmService.instance.snooze(t.id, until);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.alarm, color: scheme.error, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.alarmTitle(_remaining.length),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 600,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _remaining.length,
          separatorBuilder: (_, _) => const Divider(height: 16),
          itemBuilder: (_, i) {
            final t = _remaining[i];
            final client = t.companyId != null ? widget.companyNames[t.companyId] : null;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (client != null)
                  Text(client, style: TextStyle(fontSize: 11, color: scheme.onSurfaceVariant)),
                Text(taskMessage(t), style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(
                  formatDateTimeFr(t.dueDate),
                  style: TextStyle(fontSize: 12, color: scheme.error, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    FilledButton(
                      onPressed: () => _markDone(t),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF059669),
                        minimumSize: const Size(0, 32),
                      ),
                      child: Text(l10n.alarmMarkDone),
                    ),
                    OutlinedButton(
                      onPressed: () => _postpone(t, const Duration(minutes: 15)),
                      child: Text(l10n.alarmPostpone15),
                    ),
                    OutlinedButton(
                      onPressed: () => _postpone(t, const Duration(hours: 1)),
                      child: Text(l10n.alarmPostpone1h),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: _closeSnooze,
          child: Text(l10n.alarmClose1min),
        ),
      ],
    );
  }
}
