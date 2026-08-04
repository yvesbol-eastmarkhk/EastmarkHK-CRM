import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../core/modules/module_registry.dart';
import '../../db/crm_db.dart';
import '../../models/client.dart';
import '../../models/task.dart';
import '../../modules/invoicing/einvoice_connector.dart';
import '../../modules/invoicing/widgets/invoicing_dashboard_card.dart';
import '../../platform/einvoice_display_prefs.dart';
import '../../state/crm_state.dart';
import '../../theme/crm_tokens.dart';
import '../../widgets/section_card.dart';

/// Tableau de bord — synthèse (pas l’agenda) : stats, activité, modules.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.state});

  final CrmState state;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<TaskHistoryEvent> _recent = [];
  List<CrmTask> _closed = [];
  int _quoteCount = 0;
  int _invoiceOpen = 0;
  int _invoicePaid = 0;
  bool _loadingDocs = true;

  CrmState get state => widget.state;

  @override
  void initState() {
    super.initState();
    _loadExtra();
  }

  @override
  void didUpdateWidget(covariant DashboardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadExtra();
  }

  Future<void> _loadExtra() async {
    final recent = await CrmDb.instance.listRecentHistory(limit: 18);
    final closed = await CrmDb.instance.listRecentlyClosedTasks(limit: 10);
    var quotes = 0;
    var openInv = 0;
    var paidInv = 0;
    if (ModuleRegistry.instance.isUsedInCrm('invoicing')) {
      try {
        await EinvoiceDisplayPrefs.instance.ensureLoaded();
        final docs = await EInvoiceConnector.instance.recentDocuments(
          limit: 400,
          crmRelatedOnly: EinvoiceDisplayPrefs.instance.crmRelatedOnly,
        );
        for (final d in docs) {
          if (!d.isInvoice) {
            quotes++;
          } else if (d.status == 'paid') {
            paidInv++;
          } else if (d.status != 'cancelled') {
            openInv++;
          }
        }
      } catch (_) {}
    }
    if (!mounted) return;
    setState(() {
      _recent = recent;
      _closed = closed;
      _quoteCount = quotes;
      _invoiceOpen = openInv;
      _invoicePaid = paidInv;
      _loadingDocs = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final clients = state.clients;
    final prospects =
        clients.where((c) => c.status == ClientStatus.prospect).length;
    final active =
        clients.where((c) => c.status == ClientStatus.active).length;
    final inactive =
        clients.where((c) => c.status == ClientStatus.inactive).length;
    final open = state.allOpenTasks;
    final overdue = state.todayTasks
        .where((t) {
          final d = t.dueDateTime;
          if (d == null) return false;
          final local = d.isUtc ? d.toLocal() : d;
          return local.isBefore(DateTime.now()) && t.status == TaskStatus.open;
        })
        .length;
    final pendingApproval =
        open.where((t) => t.status == TaskStatus.submitted).length;
    final showInvoicing = ModuleRegistry.instance.isUsedInCrm('invoicing');
    final locale = Localizations.localeOf(context).toString();
    final monthLabel = DateFormat.yMMMM(locale).format(DateTime.now());

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 40),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.dashboardTitleEmbedded,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.dashOverviewSubtitle(monthLabel[0].toUpperCase() + monthLabel.substring(1)),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _StatChip(
                      label: l10n.dashOpenFollowups,
                      value: '${open.length}',
                      color: CrmTokens.accent,
                      icon: Icons.task_alt_outlined,
                      onTap: () => state.go(AppSection.tasks),
                    ),
                    _StatChip(
                      label: l10n.dashOverdue,
                      value: '$overdue',
                      color: CrmTokens.overdue,
                      icon: Icons.warning_amber_outlined,
                      onTap: () => state.go(AppSection.agenda),
                    ),
                    _StatChip(
                      label: l10n.dashToApprove,
                      value: '$pendingApproval',
                      color: CrmTokens.dueSoon,
                      icon: Icons.hourglass_top_outlined,
                      onTap: () => state.go(AppSection.agenda),
                    ),
                    _StatChip(
                      label: l10n.dashProspects,
                      value: '$prospects',
                      color: const Color(0xFF7C3AED),
                      icon: Icons.person_search_outlined,
                      onTap: () => state.go(AppSection.clients),
                    ),
                    _StatChip(
                      label: l10n.dashActiveClients,
                      value: '$active',
                      color: CrmTokens.onTrack,
                      icon: Icons.business_outlined,
                      onTap: () => state.go(AppSection.clients),
                    ),
                    _StatChip(
                      label: l10n.dashInactive,
                      value: '$inactive',
                      color: scheme.onSurfaceVariant,
                      icon: Icons.heart_broken_outlined,
                      onTap: () => state.go(AppSection.clients),
                    ),
                  ],
                ),
                if (showInvoicing) ...[
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _StatChip(
                        label: l10n.dashQuotes,
                        value: _loadingDocs ? '…' : '$_quoteCount',
                        color: const Color(0xFF0EA5E9),
                        icon: Icons.description_outlined,
                        onTap: () => state.goToModule('invoicing'),
                      ),
                      _StatChip(
                        label: l10n.dashOpenInvoices,
                        value: _loadingDocs ? '…' : '$_invoiceOpen',
                        color: const Color(0xFF2BA89A),
                        icon: Icons.receipt_long_outlined,
                        onTap: () => state.goToModule('invoicing'),
                      ),
                      _StatChip(
                        label: l10n.dashPaidInvoices,
                        value: _loadingDocs ? '…' : '$_invoicePaid',
                        color: CrmTokens.onTrack,
                        icon: Icons.payments_outlined,
                        onTap: () => state.goToModule('invoicing'),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 28),
                SectionCard(
                  title: l10n.dashRecentActions,
                  icon: Icons.history,
                  accent: const Color(0xFF6366F1),
                  children: [
                    if (_recent.isEmpty)
                      Text(
                        l10n.dashNoRecentActions,
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      )
                    else
                      for (var i = 0; i < _recent.length; i++) ...[
                        if (i > 0) const Divider(height: 18),
                        _ActivityRow(
                          event: _recent[i],
                          taskTitle: _taskTitle(_recent[i].taskId),
                          onTap: () =>
                              state.openTaskInAgenda(_recent[i].taskId),
                        ),
                      ],
                  ],
                ),
                const SizedBox(height: 16),
                SectionCard(
                  title: l10n.dashRecentDone,
                  icon: Icons.verified_outlined,
                  accent: CrmTokens.onTrack,
                  children: [
                    if (_closed.isEmpty)
                      Text(
                        l10n.dashNoClosed,
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      )
                    else
                      for (var i = 0; i < _closed.length; i++) ...[
                        if (i > 0) const Divider(height: 18),
                        _ClosedRow(
                          task: _closed[i],
                          clientName: _clientName(_closed[i].clientId),
                          onTap: () async {
                            state.go(AppSection.tasks);
                            await state.selectTask(_closed[i].id);
                          },
                        ),
                      ],
                  ],
                ),
                if (showInvoicing) ...[
                  const SizedBox(height: 28),
                  Text(
                    l10n.dashModules,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                  ),
                  const SizedBox(height: 12),
                  InvoicingDashboardCard(onRefresh: _loadExtra),
                  const SizedBox(height: 8),
                  Text(
                    l10n.dashOpenCaHint,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  String? _taskTitle(String taskId) {
    for (final t in [
      ...state.allOpenTasks,
      ...state.todayTasks,
      ..._closed,
    ]) {
      if (t.id == taskId) return t.title;
    }
    return null;
  }

  String? _clientName(String? id) {
    if (id == null) return null;
    for (final c in state.clients) {
      if (c.id == id) return c.name;
    }
    return null;
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String value;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: 158,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 18, color: color),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({
    required this.event,
    required this.taskTitle,
    required this.onTap,
  });

  final TaskHistoryEvent event;
  final String? taskTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final when = DateTime.tryParse(event.createdAt);
    final whenLabel = when == null
        ? event.createdAt
        : DateFormat.MMMd(Localizations.localeOf(context).toString())
            .add_Hm()
            .format(
              when.isUtc ? when.toLocal() : when,
            );
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              switch (event.kind) {
                'document' => Icons.receipt_long_outlined,
                'status' => Icons.flag_outlined,
                'channel' => Icons.call_outlined,
                'created' => Icons.add_circle_outline,
                _ => Icons.notes_outlined,
              },
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  if (taskTitle != null)
                    Text(
                      taskTitle!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  if (event.detail != null && event.detail!.isNotEmpty)
                    Text(
                      event.detail!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                    ),
                ],
              ),
            ),
            Text(
              whenLabel,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClosedRow extends StatelessWidget {
  const _ClosedRow({
    required this.task,
    required this.clientName,
    required this.onTap,
  });

  final CrmTask task;
  final String? clientName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Icon(
              task.status == TaskStatus.approved
                  ? Icons.verified_outlined
                  : Icons.visibility_outlined,
              size: 18,
              color: CrmTokens.onTrack,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clientName ?? task.title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  if (clientName != null)
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            Text(
              task.status == TaskStatus.approved ? l10n.dashDoneBadge : l10n.dashPassedBadge,
              style: TextStyle(
                color: CrmTokens.onTrack,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
