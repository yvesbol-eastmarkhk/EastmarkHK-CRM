import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../../ui/crm_page.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../models/user_account.dart';
import '../services/current_session.dart';
import '../services/desktop_speech_service.dart';
import '../utils/formatters.dart';
import '../utils/task_display.dart';
import '../widgets/company_avatar.dart';
import '../widgets/company_picker_field.dart';
import '../widgets/dictation_field.dart';
import '../widgets/empty_state.dart';
import '../widgets/task_done_toggle.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key, this.initialFilterUserId});

  /// Pré-sélectionne le filtre par utilisateur en arrivant depuis l'agenda
  /// du Dashboard (pour arriver sur la même liste que celle qu'on vient de
  /// tronquer là-bas — voir dashboard_screen.dart, bouton "Voir tout").
  final String? initialFilterUserId;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<CrmTask> _tasks = [];
  List<UserAccount> _users = [];
  // null = "Tous" — le filtre par utilisateur ne s'affiche que si des
  // comptes existent (voir build()) : en usage local mono-utilisateur, rien
  // ne change.
  String? _filterUserId;

  @override
  void initState() {
    super.initState();
    _filterUserId = widget.initialFilterUserId;
    _load();
  }

  Future<void> _load() async {
    await CurrentSession.instance.ensureLoaded();
    final users = await AppDatabase.instance.users();
    final tasks = await AppDatabase.instance.tasks(assignedTo: _filterUserId);
    if (!mounted) return;
    setState(() {
      _users = users;
      _tasks = tasks;
    });
  }

  Future<void> _addTask() async {
    final created = await showAddTaskDialog(context);
    if (created) await _load();
  }

  Future<void> _editTask(CrmTask t) async {
    final changed = await showAddTaskDialog(context, existing: t);
    if (changed) await _load();
  }

  Future<void> _deleteTask(CrmTask t) async {
    await AppDatabase.instance.softDeleteTask(t.id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final me = CurrentSession.instance.user;
    return CrmPage(
      title: l10n.tasksTitle,
      subtitle: l10n
          .tasksOpenCount(_tasks.where((t) => !t.isDone).length),
      actions: [
        CrmPrimaryButton(label: l10n.tasksNewButton, onPressed: _addTask)
      ],
      child: Column(
        children: [
          if (_users.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Icon(Icons.filter_list,
                      size: 18, color: scheme.onSurfaceVariant),
                  const SizedBox(width: 8),
                  DropdownButton<String?>(
                    value: _filterUserId,
                    underline: const SizedBox.shrink(),
                    items: [
                      DropdownMenuItem(
                          value: null, child: Text(l10n.tasksAllReps)),
                      for (final u in _users)
                        DropdownMenuItem(
                          value: u.id,
                          child: Text(u.id == me?.id
                              ? l10n.dashboardMeSuffix(u.displayName)
                              : u.displayName),
                        ),
                    ],
                    onChanged: (v) {
                      setState(() => _filterUserId = v);
                      _load();
                    },
                  ),
                ],
              ),
            ),
          Expanded(
            child: _tasks.isEmpty
                ? EmptyState(
                    icon: Icons.check_circle_outline,
                    title: l10n.tasksAllDoneTitle,
                    subtitle: l10n.tasksAllDoneSubtitle,
                    actionLabel: l10n.tasksNewButton,
                    onAction: _addTask,
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      CrmTokens.pagePadding,
                      4,
                      CrmTokens.pagePadding,
                      CrmTokens.pagePadding,
                    ),
                    itemCount: _tasks.length,
                    itemBuilder: (ctx, i) {
                      final t = _tasks[i];
                      UserAccount? assignee;
                      if (t.assignedTo != null) {
                        for (final u in _users) {
                          if (u.id == t.assignedTo) {
                            assignee = u;
                            break;
                          }
                        }
                      }
                      return ListTile(
                        onTap: () async {
                          t.doneAt = t.isDone ? null : nowIso();
                          await AppDatabase.instance.upsertTask(t);
                          _load();
                        },
                        leading: TaskDoneToggle(
                          done: t.isDone,
                          onChanged: (v) async {
                            t.doneAt = v ? nowIso() : null;
                            await AppDatabase.instance.upsertTask(t);
                            _load();
                          },
                        ),
                        title: Text(
                          taskMessage(t),
                          style: TextStyle(
                            decoration: t.isDone
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        subtitle: t.dueDate == null
                            ? null
                            : Text(
                                formatDateFr(t.dueDate),
                                style: TextStyle(
                                  color: AppTheme.dueDateColor(
                                    t.dueDate,
                                    done: t.isDone,
                                    neutral: scheme.onSurfaceVariant,
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (assignee != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Tooltip(
                                  message: assignee.displayName,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: AppTheme.avatarColor(
                                        assignee.displayName),
                                    child: Text(
                                      assignee.displayName.isEmpty
                                          ? '?'
                                          : assignee.displayName[0]
                                              .toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            IconButton(
                              tooltip: l10n.commonEdit,
                              icon: const Icon(Icons.edit_outlined, size: 20, color: Color(0xFF2563EB)),
                              onPressed: () => _editTask(t),
                            ),
                            IconButton(
                              tooltip: l10n.commonDelete,
                              icon: const Icon(Icons.delete_outline, size: 20, color: Color(0xFFDC2626)),
                              onPressed: () => _deleteTask(t),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

enum _TaskDialogAction { cancel, save, delete }

/// Dialogue création / édition de tâche — client optionnel, date + heure, dictée.
Future<bool> showAddTaskDialog(
  BuildContext context, {
  String? companyId,
  bool allowNoClient = false,
  CrmTask? existing,
}) async {
  final isEdit = existing != null;
  final message = TextEditingController(
    text: existing == null ? '' : taskMessage(existing),
  );
  DateTime? dueDate;
  TimeOfDay? dueTime;
  if (existing?.dueDate != null) {
    final parsed = DateTime.tryParse(existing!.dueDate!);
    if (parsed != null) {
      final local = parsed.toLocal();
      dueDate = DateTime(local.year, local.month, local.day);
      dueTime = TimeOfDay(hour: local.hour, minute: local.minute);
    }
  }
  await CurrentSession.instance.ensureLoaded();
  final db = AppDatabase.instance;
  final users = await db.users();
  final companies = await db.companies();
  String? selectedCompanyId = existing?.companyId ?? companyId;
  String? lockedCompanyName;
  if (companyId != null) {
    final match = companies.where((c) => c.id == companyId);
    lockedCompanyName = match.isEmpty ? null : match.first.name;
  }
  String? assignedTo =
      existing?.assignedTo ?? CurrentSession.instance.user?.id;
  if (!context.mounted) return false;
  final l10n = AppLocalizations.of(context);

  String dueSummary() {
    if (dueDate == null) return l10n.tasksNoDue;
    final combined = combineDueDateTime(dueDate, dueTime);
    return formatDateTimeFr(combined!.toUtc().toIso8601String());
  }

  DateTime? buildDueUtc() {
    final combined =
        combineDueDateTime(dueDate, dueTime, referenceNow: DateTime.now());
    return combined?.toUtc();
  }

  if (!context.mounted) return false;
  final action = await showDialog<_TaskDialogAction>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setLocal) {
        final canSave = message.text.trim().isNotEmpty;
        return AlertDialog(
          title: Text(
              isEdit ? l10n.tasksEditTaskTitle : l10n.tasksNewTaskTitle),
          content: SizedBox(
            width: 620,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (lockedCompanyName != null) ...[
                    Row(
                      children: [
                        CompanyAvatar(name: lockedCompanyName, radius: 16),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.tasksClientLabel,
                                  style: Theme.of(ctx).textTheme.bodySmall),
                              Text(lockedCompanyName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    Text(
                        allowNoClient || isEdit
                            ? l10n.tasksClientOptional
                            : l10n.tasksClientRequired,
                        style: Theme.of(ctx).textTheme.bodySmall),
                    const SizedBox(height: 6),
                    CompanyPickerField(
                      companies: companies,
                      selectedId: selectedCompanyId,
                      allowNoClient: allowNoClient || isEdit,
                      onSelected: (v) => setLocal(() => selectedCompanyId = v),
                    ),
                  ],
                  const SizedBox(height: 16),
                  DictationField(
                    controller: message,
                    label: l10n.tasksMessageHint,
                    maxLines: 5,
                    autofocus: true,
                    onChanged: (_) => setLocal(() {}),
                  ),
                  const SizedBox(height: 12),
                  Text(l10n.tasksDueLabel,
                      style: Theme.of(ctx).textTheme.bodySmall),
                  const SizedBox(height: 6),
                  Text(dueSummary(),
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () async {
                          final picked = await showDatePicker(
                            context: ctx,
                            initialDate: dueDate ?? DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 1)),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 365 * 2)),
                          );
                          if (picked != null) {
                            setLocal(() => dueDate = picked);
                          }
                        },
                        icon: const Icon(Icons.calendar_today_outlined,
                            size: 16),
                        label: Text(l10n.tasksDateButton),
                      ),
                      OutlinedButton.icon(
                        onPressed: dueDate == null
                            ? null
                            : () async {
                                final picked = await showTimePicker(
                                  context: ctx,
                                  initialTime: dueTime ??
                                      defaultDueTimeForDate(dueDate!),
                                );
                                if (picked != null) {
                                  setLocal(() => dueTime = picked);
                                }
                              },
                        icon: const Icon(Icons.schedule, size: 16),
                        label: Text(
                          dueDate == null
                              ? l10n.tasksTimeButton
                              : (dueTime ?? defaultDueTimeForDate(dueDate!))
                                  .format(ctx),
                        ),
                      ),
                      if (dueDate != null)
                        TextButton(
                          onPressed: () => setLocal(() {
                            dueDate = null;
                            dueTime = null;
                          }),
                          child: Text(l10n.tasksClearButton),
                        ),
                    ],
                  ),
                  if (users.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(l10n.tasksAssignedTo),
                        const Spacer(),
                        DropdownButton<String?>(
                          value: assignedTo,
                          underline: const SizedBox.shrink(),
                          items: [
                            DropdownMenuItem(
                                value: null,
                                child: Text(l10n.tasksUnassigned)),
                            for (final u in users)
                              DropdownMenuItem(
                                value: u.id,
                                child: Text(u.id ==
                                        CurrentSession.instance.user?.id
                                    ? l10n.dashboardMeSuffix(u.displayName)
                                    : u.displayName),
                              ),
                          ],
                          onChanged: (v) =>
                              setLocal(() => assignedTo = v),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          actionsAlignment:
              isEdit ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
          actions: [
            if (isEdit)
              TextButton(
                onPressed: () async {
                  // Arrête la dictée AVANT le pop — sinon WinRT Stop()
                  // crashe l'app Windows (c0000005) pendant le dispose.
                  await DesktopSpeechService.instance.stop();
                  if (ctx.mounted) {
                    Navigator.pop(ctx, _TaskDialogAction.delete);
                  }
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.red.shade700),
                child: Text(l10n.commonDelete),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () async {
                    await DesktopSpeechService.instance.stop();
                    if (ctx.mounted) {
                      Navigator.pop(ctx, _TaskDialogAction.cancel);
                    }
                  },
                  child: Text(l10n.commonCancel),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: canSave
                      ? () async {
                          await DesktopSpeechService.instance.stop();
                          if (ctx.mounted) {
                            Navigator.pop(ctx, _TaskDialogAction.save);
                          }
                        }
                      : null,
                  child: Text(isEdit ? l10n.commonSave : l10n.commonCreate),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  if (action == null || action == _TaskDialogAction.cancel) return false;

  if (action == _TaskDialogAction.delete && existing != null) {
    await AppDatabase.instance.softDeleteTask(existing.id);
    return true;
  }

  if (message.text.trim().isEmpty) return false;
  if (!allowNoClient &&
      !isEdit &&
      selectedCompanyId == null &&
      lockedCompanyName == null) {
    return false;
  }
  final fullMessage = message.text.trim();
  final dueUtc = buildDueUtc();
  final now = nowIso();
  final isCreate = existing == null;
  final taskId = existing?.id ?? AppDatabase.newId();
  await AppDatabase.instance.upsertTask(CrmTask(
    id: taskId,
    companyId: selectedCompanyId,
    opportunityId: existing?.opportunityId,
    contactId: existing?.contactId,
    title: taskTitleFromMessage(fullMessage),
    notes: fullMessage,
    dueDate: dueUtc?.toIso8601String(),
    assignedTo: assignedTo,
    doneAt: existing?.doneAt,
    createdAt: existing?.createdAt ?? now,
    updatedAt: now,
  ));

  // Création → activité récente / timeline client (comme « Opportunité créée »).
  if (isCreate) {
    await AppDatabase.instance.upsertActivity(Activity(
      id: AppDatabase.newId(),
      companyId: selectedCompanyId,
      opportunityId: existing?.opportunityId,
      contactId: existing?.contactId,
      type: ActivityType.task,
      title: 'Tâche créée',
      body: fullMessage,
      refTable: 'tasks',
      refId: taskId,
      happenedAt: now,
      createdAt: now,
      updatedAt: now,
    ));
  }
  return true;
}
