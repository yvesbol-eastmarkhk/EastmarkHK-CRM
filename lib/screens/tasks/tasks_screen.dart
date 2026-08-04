import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../core/widgets/empty_state.dart';
import '../../models/client.dart';
import '../../state/crm_state.dart';
import '../../widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({
    super.key,
    required this.state,
    required this.onCreate,
  });

  final CrmState state;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tasks = state.allOpenTasks;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.tasksOpenTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FilledButton.icon(
                onPressed: onCreate,
                icon: const Icon(Icons.add, size: 18),
                label: Text(l10n.tasksPlanButton),
              ),
            ],
          ),
        ),
        Expanded(
          child: tasks.isEmpty
              ? EmptyState(
                  icon: Icons.task_alt,
                  title: l10n.tasksNoneOpenTitle,
                  subtitle: l10n.tasksNoneOpenSubtitle,
                  actionLabel: l10n.tasksNewButton,
                  onAction: onCreate,
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: tasks.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final task = tasks[i];
                    Client? client;
                    if (task.clientId != null) {
                      for (final c in state.clients) {
                        if (c.id == task.clientId) {
                          client = c;
                          break;
                        }
                      }
                    }
                    return TaskTile(
                      task: task,
                      clientName: client?.name,
                      selected: state.selectedTaskId == task.id,
                      onTap: () => state.selectTask(task.id),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
