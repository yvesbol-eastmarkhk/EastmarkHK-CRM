import 'package:flutter/material.dart';

import '../core/db/app_database.dart';
import '../core/models/models.dart';
import '../core/screens/tasks_screen.dart';
import '../core/services/remote_crm_sync_service.dart';
import '../core/utils/task_display.dart';
import '../l10n/gen/app_localizations.dart';
import '../state/crm_workspace_state.dart';
import '../theme/app_theme.dart';
import 'list_panel.dart';

/// Liste des tâches / Follow-ups — clic ouvre le client (et la tâche) à droite.
class TasksListPanel extends StatefulWidget {
  const TasksListPanel({
    super.key,
    required this.workspace,
    required this.selectedCompanyId,
    this.selectedTaskId,
    required this.onSelectCompany,
    this.onSelectTask,
    this.expand = false,
  });

  final CrmWorkspaceState workspace;
  final String? selectedCompanyId;
  final String? selectedTaskId;
  final ValueChanged<String> onSelectCompany;
  final ValueChanged<CrmTask>? onSelectTask;
  final bool expand;

  @override
  State<TasksListPanel> createState() => _TasksListPanelState();
}

class _TasksListPanelState extends State<TasksListPanel> {
  List<CrmTask> _tasks = [];
  Map<String, String> _companyNames = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    widget.workspace.addListener(_load);
    _load();
  }

  @override
  void dispose() {
    widget.workspace.removeListener(_load);
    super.dispose();
  }

  Future<void> _load() async {
    final db = AppDatabase.instance;
    final tasks = await db.tasks();
    final companies = await db.companies();
    if (!mounted) return;
    setState(() {
      _tasks = tasks;
      _companyNames = {for (final c in companies) c.id: c.name};
      _loading = false;
    });
  }

  Future<void> _addTask() async {
    final created = await showAddTaskDialog(
      context,
      companyId: widget.selectedCompanyId ?? widget.workspace.selectedCompanyId,
      allowNoClient: true,
    );
    if (created) {
      await _load();
      widget.workspace.bump();
    }
  }

  Future<void> _deleteTask(CrmTask t) async {
    final l10n = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.tasksListDeleteTitle),
        content: Text(l10n.tasksListDeleteBody(t.title)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: Theme.of(ctx).colorScheme.error),
            child: Text(l10n.commonDelete),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await AppDatabase.instance.softDeleteTask(t.id);
    await _load();
    widget.workspace.bump();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final open = _tasks.where((t) => !t.isDone).length;
    return ListPanel(
      title: l10n.tasksListTitle,
      subtitle: l10n.tasksListOpenCount(open),
      primaryActionLabel: l10n.tasksListNew,
      onPrimaryAction: _addTask,
      expand: widget.expand,
      child: _loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : _tasks.isEmpty
              ? Center(
                  child: Text(
                    l10n.tasksListEmpty,
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                )
              : ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (_, i) {
                    final t = _tasks[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: SelectableListTile(
                        selected: widget.selectedTaskId != null
                            ? widget.selectedTaskId == t.id
                            : (t.companyId != null &&
                                widget.selectedCompanyId == t.companyId),
                        isDone: t.isDone,
                        title: t.companyId != null && _companyNames.containsKey(t.companyId)
                            ? _companyNames[t.companyId]!
                            : l10n.tasksListNoClient,
                        subtitle: truncateTaskMessage(taskMessage(t)),
                        subtitleMaxLines: 2,
                        accentColor: t.isDone
                            ? null
                            : t.companyId == null
                                ? Theme.of(context).colorScheme.error
                                : AppTheme.dueDateColor(
                                    t.dueDate,
                                    neutral: Colors.transparent,
                                  ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              tooltip: l10n.commonDelete,
                              icon: const Icon(Icons.delete_outline, size: 18,
                                  color: Color(0xFFDC2626)),
                              onPressed: () => _deleteTask(t),
                              visualDensity: VisualDensity.compact,
                            ),
                            Checkbox(
                              value: t.isDone,
                              onChanged: (v) async {
                                t.doneAt = (v ?? false) ? nowIso() : null;
                                await AppDatabase.instance.upsertTask(t);
                                await RemoteCrmSyncService.instance.flushPendingPush();
                                _load();
                                widget.workspace.bump();
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          final selectTask = widget.onSelectTask;
                          if (selectTask != null) {
                            selectTask(t);
                          } else if (t.companyId != null) {
                            widget.onSelectCompany(t.companyId!);
                          }
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
