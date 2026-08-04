import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/utils/responsive_layout.dart';
import '../../l10n/gen/app_localizations.dart';
import '../../models/client.dart';
import '../../models/task.dart';
import '../../state/crm_state.dart';
import '../../theme/crm_tokens.dart';
import '../../widgets/section_card.dart';
import '../../widgets/task_tile.dart';

/// Agenda — uniquement les échéances (aujourd’hui + prochains jours).
class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key, required this.state});

  final CrmState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final today = state.todayTasks;
    final upcoming = state.upcomingTasks;
    final pending = today.where((t) => t.needsApproval).length;
    const todayAccent = Color(0xFF1D4ED8);
    const upcomingAccent = Color(0xFFD97706);
    final locale = Localizations.localeOf(context).toString();
    final monthLabel = DateFormat.yMMMM(locale).format(DateTime.now());
    final phone = CrmLayout.isPhone(context);
    final pad = phone
        ? const EdgeInsets.fromLTRB(16, 12, 16, 88)
        : const EdgeInsets.fromLTRB(28, 28, 28, 40);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: pad,
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.agendaTitle,
                  style: phone
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 6),
                Text(
                  monthLabel[0].toUpperCase() + monthLabel.substring(1),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: scheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat.yMMMMEEEEd(locale).format(DateTime.now()),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
                if (pending > 0) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: CrmTokens.dueSoon.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
                    ),
                    child: Text(
                      l10n.agendaPendingCount(pending),
                      style: TextStyle(
                        color: CrmTokens.dueSoon,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                SectionCard(
                  title: l10n.agendaToday,
                  icon: Icons.today_outlined,
                  accent: todayAccent,
                  trailing: _CountBadge(count: today.length, accent: todayAccent),
                  children: [
                    if (today.isEmpty)
                      _EmptyHint(text: l10n.agendaEmptyToday)
                    else
                      ..._taskTiles(today),
                  ],
                ),
                SectionCard(
                  title: l10n.agendaUpcoming,
                  icon: Icons.calendar_month_outlined,
                  accent: upcomingAccent,
                  trailing:
                      _CountBadge(count: upcoming.length, accent: upcomingAccent),
                  margin: EdgeInsets.zero,
                  children: [
                    if (upcoming.isEmpty)
                      _EmptyHint(text: l10n.agendaEmptyUpcoming)
                    else
                      ..._taskTiles(upcoming),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _taskTiles(List<CrmTask> tasks) {
    final out = <Widget>[];
    for (var i = 0; i < tasks.length; i++) {
      if (i > 0) out.add(const SizedBox(height: 8));
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
      out.add(
        TaskTile(
          task: task,
          clientName: client?.name,
          selected: state.selectedTaskId == task.id,
          onTap: () => state.selectTask(task.id),
        ),
      );
    }
    return out;
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.count, required this.accent});

  final int count;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        '$count',
        style: TextStyle(
          color: accent,
          fontWeight: FontWeight.w800,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _EmptyHint extends StatelessWidget {
  const _EmptyHint({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }
}
