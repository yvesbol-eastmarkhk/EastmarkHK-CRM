import 'package:flutter/material.dart';

import '../core/db/app_database.dart';
import '../core/models/models.dart';
import '../core/utils/formatters.dart';
import '../core/utils/responsive_layout.dart';
import '../core/utils/task_display.dart';
import '../core/widgets/log_interaction_sheet.dart';
import '../l10n/gen/app_localizations.dart';
import '../state/crm_workspace_state.dart';
import '../theme/app_theme.dart';
import '../theme/crm_tokens.dart';
import 'list_panel.dart';

/// File d'attente « Aujourd'hui » — qui contacter, dans quel ordre.
class TodayQueuePanel extends StatefulWidget {
  const TodayQueuePanel({
    super.key,
    required this.workspace,
    required this.selectedTaskId,
    required this.onSelectTask,
    required this.onRefresh,
    this.expand = false,
  });

  final CrmWorkspaceState workspace;
  final String? selectedTaskId;
  final ValueChanged<CrmTask> onSelectTask;
  final VoidCallback onRefresh;
  final bool expand;

  @override
  State<TodayQueuePanel> createState() => _TodayQueuePanelState();
}

class _TodayQueuePanelState extends State<TodayQueuePanel> {
  List<CrmTask> _tasks = [];
  Map<String, String> _companyNames = {};
  Map<String, Opportunity> _oppsById = {};
  bool _loading = true;

  List<(String, String)> get _groups {
    final l10n = AppLocalizations.of(context);
    return [
      ('overdue', l10n.queueGroupOverdue),
      ('today', l10n.queueGroupToday),
      ('tomorrow', l10n.queueGroupTomorrow),
      ('week', l10n.queueGroupWeek),
      ('later', l10n.queueGroupLater),
    ];
  }

  @override
  void initState() {
    super.initState();
    widget.workspace.addListener(_onExternalRefresh);
    _load();
  }

  @override
  void dispose() {
    widget.workspace.removeListener(_onExternalRefresh);
    super.dispose();
  }

  void _onExternalRefresh() => _load();

  Future<void> _load() async {
    final db = AppDatabase.instance;
    final companies = await db.companies();
    final opps = await db.opportunities();
    final tasks = await db.tasks();
    if (!mounted) return;

    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    final horizon = todayOnly.add(const Duration(days: 30));

    final scheduled = tasks.where((t) {
      if (t.isDone || t.dueDate == null) return false;
      final parsed = DateTime.tryParse(t.dueDate!);
      if (parsed == null) return false;
      final local = parsed.toLocal();
      final day = DateTime(local.year, local.month, local.day);
      return !day.isAfter(horizon);
    }).toList()
      ..sort((a, b) => (a.dueDate ?? '').compareTo(b.dueDate ?? ''));

    setState(() {
      _companyNames = {for (final c in companies) c.id: c.name};
      _oppsById = {for (final o in opps) o.id: o};
      _tasks = scheduled;
      _loading = false;
    });

    // Auto-sélection de la 1ère tâche : uniquement en layout 3-panneaux
    // (desktop/iPad), où le panneau détail doit toujours montrer quelque
    // chose. Sur téléphone (plein écran empilé), ça enfermait l'utilisateur :
    // « Retour » vide la sélection → la liste se recharge → ré-auto-sélectionne
    // aussitôt la même tâche → impossible de revenir à la liste.
    if (widget.selectedTaskId == null &&
        scheduled.isNotEmpty &&
        mounted &&
        !CrmLayout.isPhone(context)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.onSelectTask(scheduled.first);
      });
    }
  }

  String _bucket(String? iso) {
    final d = iso == null ? null : DateTime.tryParse(iso);
    if (d == null) return 'later';
    final local = d.toLocal();
    final day = DateTime(local.year, local.month, local.day);
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    final diff = day.difference(todayOnly).inDays;
    if (diff < 0) return 'overdue';
    if (diff == 0) return 'today';
    if (diff == 1) return 'tomorrow';
    if (diff <= 7) return 'week';
    return 'later';
  }

  Future<void> _logContact(CrmTask t) async {
    if (t.companyId == null || t.opportunityId == null) return;
    final opp = _oppsById[t.opportunityId];
    final done = await showLogInteractionSheet(
      context,
      companyId: t.companyId!,
      opportunityId: t.opportunityId!,
      opportunityTitle: opp?.title ?? t.title,
    );
    if (done) {
      await _load();
      widget.onRefresh();
    }
  }

  Future<void> _deleteTask(CrmTask t) async {
    final l10n = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.queueDeleteTitle),
        content: Text(l10n.queueDeleteBody(t.title)),
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
    if (widget.selectedTaskId == t.id) widget.workspace.clearSelection();
    await _load();
    widget.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListPanel(
      title: l10n.agendaToday,
      subtitle: _tasks.isEmpty ? l10n.queueNothingScheduled : l10n.queueCount(_tasks.length),
      expand: widget.expand,
      child: _loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : _tasks.isEmpty
              ? _EmptyToday(onRefresh: _load)
              : ListView(
                  children: [
                    for (final group in _groups) ..._buildGroup(group.$1, group.$2),
                  ],
                ),
    );
  }

  List<Widget> _buildGroup(String key, String fallbackLabel) {
    final items = _tasks.where((t) => _bucket(t.dueDate) == key).toList();
    if (items.isEmpty) return [];
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final headerColor = key == 'overdue'
        ? AppTheme.overdueColor
        : key == 'today'
            ? AppTheme.dueSoonColor
            : scheme.onSurfaceVariant;
    final label = formatDueGroupLabel(
      key,
      items.map((t) => t.dueDate).whereType<String>().toList(),
      l10n,
    );

    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.6,
            color: headerColor,
          ),
        ),
      ),
      for (final t in items)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: SelectableListTile(
            selected: widget.selectedTaskId == t.id,
            isDone: t.isDone,
          title: t.companyId != null && _companyNames.containsKey(t.companyId)
              ? _companyNames[t.companyId]!
              : l10n.queuePersonal,
            titleColor: t.companyId != null && _companyNames.containsKey(t.companyId)
                ? CrmTokens.fuchsia
                : null,
            subtitle: taskListSubtitle(
              message: taskMessage(t),
              dueLabel: formatDueLabel(
                t.dueDate,
                l10n,
                locale: Localizations.localeOf(context).toString(),
              ),
              createdLabel: formatDateTimeFr(t.createdAt),
            ),
            subtitleMaxLines: 3,
            accentColor: t.companyId == null
                ? Theme.of(context).colorScheme.error
                : AppTheme.dueDateColor(
                    t.dueDate,
                    neutral: Colors.transparent,
                  ),
            onTap: () => widget.onSelectTask(t),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (t.companyId != null && t.opportunityId != null && !t.isDone)
                  TextButton(
                    onPressed: () => _logContact(t),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(0, 28),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(l10n.stageContacted, style: TextStyle(fontSize: 11)),
                  ),
                IconButton(
                  tooltip: l10n.commonDelete,
                  icon: Icon(Icons.delete_outline, size: 18, color: CrmTokens.overdue),
                  onPressed: () => _deleteTask(t),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ),
    ];
  }
}

class _EmptyToday extends StatelessWidget {
  const _EmptyToday({required this.onRefresh});
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline,
                size: 40, color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4)),
            const SizedBox(height: 12),
            Text(l10n.queueEmpty, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              l10n.queueEmptySubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: CrmTokens.captionSize, color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
