import 'package:flutter/material.dart';

import '../core/db/app_database.dart';
import '../core/models/models.dart';
import '../core/screens/tasks_screen.dart';
import '../core/utils/task_display.dart';
import '../state/crm_workspace_state.dart';
import '../theme/app_theme.dart';
import 'list_panel.dart';

/// Liste des tâches — clic ouvre le client lié à droite.
class TasksListPanel extends StatefulWidget {
  const TasksListPanel({
    super.key,
    required this.workspace,
    required this.selectedCompanyId,
    required this.onSelectCompany,
    this.expand = false,
  });

  final CrmWorkspaceState workspace;
  final String? selectedCompanyId;
  final ValueChanged<String> onSelectCompany;
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
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Supprimer cette tâche ?'),
        content: Text('« ${t.title} »'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: Theme.of(ctx).colorScheme.error),
            child: const Text('Supprimer'),
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
    final open = _tasks.where((t) => !t.isDone).length;
    return ListPanel(
      title: 'Tâches',
      subtitle: '$open ouverte${open > 1 ? 's' : ''}',
      primaryActionLabel: '+ Tâche',
      onPrimaryAction: _addTask,
      expand: widget.expand,
      child: _loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : _tasks.isEmpty
              ? Center(
                  child: Text(
                    'Aucune tâche',
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
                        selected: t.companyId != null && widget.selectedCompanyId == t.companyId,
                        isDone: t.isDone,
                        title: t.companyId != null && _companyNames.containsKey(t.companyId)
                            ? _companyNames[t.companyId]!
                            : 'Sans client',
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
                              tooltip: 'Supprimer',
                              icon: Icon(Icons.delete_outline, size: 18,
                                  color: Theme.of(context).colorScheme.error.withValues(alpha: 0.7)),
                              onPressed: () => _deleteTask(t),
                              visualDensity: VisualDensity.compact,
                            ),
                            Checkbox(
                              value: t.isDone,
                              onChanged: (v) async {
                                t.doneAt = (v ?? false) ? nowIso() : null;
                                await AppDatabase.instance.upsertTask(t);
                                _load();
                                widget.workspace.bump();
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          if (t.companyId != null) widget.onSelectCompany(t.companyId!);
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
