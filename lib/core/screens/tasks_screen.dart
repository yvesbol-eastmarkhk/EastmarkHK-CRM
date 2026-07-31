import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../../ui/crm_page.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../models/user_account.dart';
import '../services/current_session.dart';
import '../utils/formatters.dart';
import '../utils/task_display.dart';
import '../widgets/company_avatar.dart';
import '../widgets/dictation_field.dart';
import '../widgets/empty_state.dart';

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

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final me = CurrentSession.instance.user;
    return CrmPage(
      title: 'Tâches',
      subtitle: '${_tasks.where((t) => !t.isDone).length} ouverte${_tasks.where((t) => !t.isDone).length > 1 ? 's' : ''}',
      actions: [CrmPrimaryButton(label: 'Nouvelle tâche', onPressed: _addTask)],
      child: Column(
        children: [
          // Filtre par utilisateur — invisible tant qu'aucun compte
          // n'existe (usage local), utile dès que la base est partagée
          // entre plusieurs commerciaux.
          if (_users.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Icon(Icons.filter_list, size: 18, color: scheme.onSurfaceVariant),
                  const SizedBox(width: 8),
                  DropdownButton<String?>(
                    value: _filterUserId,
                    underline: const SizedBox.shrink(),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('Tous les commerciaux')),
                      for (final u in _users)
                        DropdownMenuItem(
                          value: u.id,
                          child: Text(u.id == me?.id ? '${u.displayName} (moi)' : u.displayName),
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
                    title: 'Tout est fait !',
                    subtitle: 'Ajoutez une tâche — ou dictez-la après un appel.',
                    actionLabel: 'Nouvelle tâche',
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
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: t.isDone,
                        title: Text(t.title),
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
                        secondary: assignee == null
                            ? IconButton(
                                tooltip: 'Supprimer',
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () async {
                                  await AppDatabase.instance.softDeleteTask(t.id);
                                  _load();
                                },
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Tooltip(
                                    message: assignee.displayName,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: AppTheme.avatarColor(assignee.displayName),
                                      child: Text(
                                        assignee.displayName.isEmpty
                                            ? '?'
                                            : assignee.displayName[0].toUpperCase(),
                                        style: const TextStyle(fontSize: 11, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    tooltip: 'Supprimer',
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () async {
                                      await AppDatabase.instance.softDeleteTask(t.id);
                                      _load();
                                    },
                                  ),
                                ],
                              ),
                        onChanged: (v) async {
                          t.doneAt = (v ?? false) ? nowIso() : null;
                          await AppDatabase.instance.upsertTask(t);
                          _load();
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

/// Dialogue de création de tâche — client optionnel, date + heure, dictée.
Future<bool> showAddTaskDialog(
  BuildContext context, {
  String? companyId,
  bool allowNoClient = false,
}) async {
  final message = TextEditingController();
  DateTime? dueDate;
  TimeOfDay? dueTime;
  await CurrentSession.instance.ensureLoaded();
  final db = AppDatabase.instance;
  final users = await db.users();
  final companies = await db.companies();
  String? selectedCompanyId = companyId;
  String? lockedCompanyName;
  if (companyId != null) {
    final match = companies.where((c) => c.id == companyId);
    lockedCompanyName = match.isEmpty ? null : match.first.name;
  }
  String? assignedTo = CurrentSession.instance.user?.id;
  if (!context.mounted) return false;

  String dueSummary() {
    if (dueDate == null) return 'Pas d\'échéance';
    final combined = combineDueDateTime(dueDate, dueTime);
    return formatDateTimeFr(combined!.toUtc().toIso8601String());
  }

  DateTime? buildDueUtc() {
    final combined = combineDueDateTime(dueDate, dueTime, referenceNow: DateTime.now());
    return combined?.toUtc();
  }

  if (!context.mounted) return false;
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setLocal) {
        final canCreate = message.text.trim().isNotEmpty;
        return AlertDialog(
          title: const Text('Nouvelle tâche'),
          content: SizedBox(
            width: 480,
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
                              Text('Client', style: Theme.of(ctx).textTheme.bodySmall),
                              Text(lockedCompanyName, style: const TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    Text(allowNoClient ? 'Client (optionnel)' : 'Client *',
                        style: Theme.of(ctx).textTheme.bodySmall),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String?>(
                      value: selectedCompanyId,
                      decoration: const InputDecoration(isDense: true),
                      items: [
                        if (allowNoClient)
                          const DropdownMenuItem(
                            value: null,
                            child: Text('Sans client (ex. exécuter une tâche perso)'),
                          ),
                        for (final c in companies)
                          DropdownMenuItem(value: c.id, child: Text(c.name)),
                      ],
                      onChanged: (v) => setLocal(() => selectedCompanyId = v),
                    ),
                  ],
                  const SizedBox(height: 16),
                  DictationField(
                    controller: message,
                    label: 'Message (ex. Appeler le client, exécuter une tâche…)',
                    maxLines: 5,
                    autofocus: true,
                    onChanged: () => setLocal(() {}),
                  ),
                  const SizedBox(height: 12),
                  Text('Échéance', style: Theme.of(ctx).textTheme.bodySmall),
                  const SizedBox(height: 6),
                  Text(dueSummary(), style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () async {
                          final picked = await showDatePicker(
                            context: ctx,
                            initialDate: dueDate ?? DateTime.now(),
                            firstDate: DateTime.now().subtract(const Duration(days: 1)),
                            lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
                          );
                          if (picked != null) setLocal(() => dueDate = picked);
                        },
                        icon: const Icon(Icons.calendar_today_outlined, size: 16),
                        label: const Text('Date'),
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
                                if (picked != null) setLocal(() => dueTime = picked);
                              },
                        icon: const Icon(Icons.schedule, size: 16),
                        label: Text(
                          dueDate == null
                              ? 'Heure'
                              : (dueTime ?? defaultDueTimeForDate(dueDate!)).format(ctx),
                        ),
                      ),
                      if (dueDate != null)
                        TextButton(
                          onPressed: () => setLocal(() {
                            dueDate = null;
                            dueTime = null;
                          }),
                          child: const Text('Effacer'),
                        ),
                    ],
                  ),
                  if (users.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Text('Assigné à'),
                        const Spacer(),
                        DropdownButton<String?>(
                          value: assignedTo,
                          underline: const SizedBox.shrink(),
                          items: [
                            const DropdownMenuItem(value: null, child: Text('Non assigné')),
                            for (final u in users)
                              DropdownMenuItem(
                                value: u.id,
                                child: Text(u.id == CurrentSession.instance.user?.id
                                    ? '${u.displayName} (moi)'
                                    : u.displayName),
                              ),
                          ],
                          onChanged: (v) => setLocal(() => assignedTo = v),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
            FilledButton(
              onPressed: canCreate ? () => Navigator.pop(ctx, true) : null,
              child: const Text('Créer'),
            ),
          ],
        );
      },
    ),
  );
  if (ok != true || message.text.trim().isEmpty) return false;
  if (!allowNoClient && selectedCompanyId == null && lockedCompanyName == null) return false;
  final fullMessage = message.text.trim();
  final dueUtc = buildDueUtc();
  final now = nowIso();
  await AppDatabase.instance.upsertTask(CrmTask(
    id: AppDatabase.newId(),
    companyId: selectedCompanyId,
    title: taskTitleFromMessage(fullMessage),
    notes: fullMessage,
    dueDate: dueUtc?.toIso8601String(),
    assignedTo: assignedTo,
    createdAt: now,
    updatedAt: now,
  ));
  return true;
}
