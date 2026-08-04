import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../../ui/crm_page.dart';
import '../../state/crm_workspace_state.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../models/user_account.dart';
import '../services/current_session.dart';
import '../modules/module_registry.dart';
import '../services/pipeline_settings.dart';
import '../services/remote_crm_sync_service.dart';
import '../utils/formatters.dart';
import '../utils/responsive_layout.dart';
import '../utils/task_display.dart';
import '../widgets/crm_import_export_panel.dart';
import '../widgets/empty_state.dart';
import '../widgets/log_interaction_sheet.dart';
import 'companies_screen.dart';
import 'company_detail_screen.dart';
import 'opportunity_detail_screen.dart';
import 'pipeline_screen.dart';
import 'tasks_screen.dart';

/// Tableau de bord : chiffres clés + funnel du pipeline + agenda des
/// relances (SPECIFICATION §9 étendue — avec 150 clients on ne peut pas
/// parcourir chaque fiche pour savoir ce qu'il y a à faire aujourd'hui).
/// Les modules ajouteront leurs cartes ici via CrmModule.dashboardCards().
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, this.workspace, this.embedded = false});

  /// Quand fourni, la navigation reste dans le workspace (pas de push).
  final CrmWorkspaceState? workspace;
  final bool embedded;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _companies = 0;
  int _openTasks = 0;
  int _overdueTasks = 0;
  List<Opportunity> _opps = [];
  List<Activity> _recentActivities = [];
  Map<String, String> _companyNames = {};
  List<UserAccount> _users = [];
  List<CrmTask> _agendaTasks = [];
  Map<String, Opportunity> _oppsById = {};
  // Nombre total de tâches programmées (avant troncature à
  // _agendaDisplayLimit) — sert à afficher "+N autres" plutôt que de
  // silencieusement couper la liste si quelqu'un a 50 relances en cours.
  int _agendaTotal = 0;
  static const _agendaDisplayLimit = 10;
  // null = "Tous" — n'apparaît en pratique que si des comptes existent.
  String? _agendaFilterUserId;

  @override
  void initState() {
    super.initState();
    // Même pattern que PipelineBoard / ClientsListPanel : recharger les
    // données quand le workspace bump (sync/refresh), SANS remonter le
    // widget — sinon le ListView repart à offset 0 à chaque actualisation.
    widget.workspace?.addListener(_onWorkspaceChanged);
    _load();
  }

  void _onWorkspaceChanged() => _load();

  @override
  void dispose() {
    widget.workspace?.removeListener(_onWorkspaceChanged);
    super.dispose();
  }

  Future<void> _load() async {
    final db = AppDatabase.instance;
    await PipelineSettings.instance.ensureLoaded();
    await CurrentSession.instance.ensureLoaded();
    final companies = await db.companies();
    final allTasks = await db.tasks();
    final agendaTasks = await db.tasks(assignedTo: _agendaFilterUserId);
    final opps = await db.opportunities();
    final activities = await db.activities(limit: 8);
    final users = await db.users();
    if (!mounted) return;
    final now = DateTime.now();
    setState(() {
      _companies = companies.length;
      _companyNames = {for (final c in companies) c.id: c.name};
      _openTasks = allTasks.length;
      _overdueTasks = allTasks.where((t) {
        final d = t.dueDate == null ? null : DateTime.tryParse(t.dueDate!);
        return d != null && d.isBefore(now);
      }).length;
      _opps = opps;
      _oppsById = {for (final o in opps) o.id: o};
      _recentActivities = activities;
      _users = users;
      final scheduled = agendaTasks.where((t) => t.dueDate != null).toList();
      _agendaTotal = scheduled.length;
      _agendaTasks = scheduled.take(_agendaDisplayLimit).toList();
    });
  }

  /// En retard / aujourd'hui / cette semaine / plus tard — regroupement par
  /// urgence (inspiré de Pipedrive/Close : l'écran d'accueil doit dire
  /// directement "qui dois-je contacter", pas juste lister des dates).
  String _agendaBucket(String? iso) {
    final d = iso == null ? null : DateTime.tryParse(iso);
    if (d == null) return 'later';
    final local = d.toLocal();
    final day = DateTime(local.year, local.month, local.day);
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    final diff = day.difference(todayOnly).inDays;
    if (diff < 0) return 'overdue';
    if (diff == 0) return 'today';
    if (diff <= 7) return 'week';
    return 'later';
  }

  Future<void> _logInteraction(CrmTask t) async {
    final opp = t.opportunityId == null ? null : _oppsById[t.opportunityId];
    final done = await showLogInteractionSheet(
      context,
      companyId: t.companyId!,
      opportunityId: t.opportunityId!,
      opportunityTitle: opp?.title ?? t.title,
    );
    if (done) _load();
  }

  Future<void> _markTaskDone(CrmTask t) async {
    t.doneAt = nowIso();
    await AppDatabase.instance.upsertTask(t);
    await RemoteCrmSyncService.instance.flushPendingPush();
    _load();
  }

  double _pipelineValue() => _opps
      .where((o) => o.wonLost == null && o.amount != null)
      .fold(0.0, (sum, o) => sum + o.amount!);

  double _forecastRevenue() => _opps.where((o) => o.wonLost == null && o.amount != null).fold(0.0, (sum, o) {
        final p = (o.probability ?? 50) / 100.0;
        return sum + o.amount! * p;
      });

  /// Affaires en cours, triées par dernier mouvement (stage_updated_at) —
  /// "qu'est-ce qui bouge en ce moment", pas juste un tri par date de
  /// création. Clic → fiche d'affaire (timeline unifiée).
  List<Opportunity> _openOpportunities({int limit = 6}) {
    final open = _opps.where((o) => o.wonLost == null).toList()
      ..sort((a, b) => b.stageUpdatedAt.compareTo(a.stageUpdatedAt));
    return open.take(limit).toList();
  }

  Future<void> _openOpportunity(String opportunityId) async {
    // Dans le workspace, la fiche s'affiche dans le panneau détail (rail +
    // liste restent visibles) — sinon (mobile, écran poussé) plein écran.
    if (widget.workspace != null) {
      widget.workspace!.selectOpportunity(opportunityId);
      return;
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => OpportunityDetailScreen(opportunityId: opportunityId)),
    );
    _load();
  }

  List<(String name, double value)> _topClients({int limit = 5}) {
    final totals = <String, double>{};
    for (final o in _opps.where((o) => o.wonLost == null && o.amount != null)) {
      if (o.companyId == null) continue;
      totals[o.companyId!] = (totals[o.companyId!] ?? 0) + o.amount!;
    }
    final entries = totals.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    return [
      for (final e in entries.take(limit))
        (_companyNames[e.key] ?? 'Client', e.value),
    ];
  }

  /// 6 derniers mois : gagné vs perdu (nombre d'opportunités clôturées).
  List<(String label, int won, int lost)> _wonLostByMonth() {
    final now = DateTime.now();
    final months = <(String, int, int)>[];
    for (var i = 5; i >= 0; i--) {
      final d = DateTime(now.year, now.month - i, 1);
      final label = '${d.month.toString().padLeft(2, '0')}/${d.year.toString().substring(2)}';
      var won = 0;
      var lost = 0;
      for (final o in _opps) {
        if (o.closedAt == null || o.wonLost == null) continue;
        final closed = DateTime.tryParse(o.closedAt!);
        if (closed == null) continue;
        final local = closed.toLocal();
        if (local.year == d.year && local.month == d.month) {
          if (o.wonLost == 'won') won++;
          if (o.wonLost == 'lost') lost++;
        }
      }
      months.add((label, won, lost));
    }
    return months;
  }

  IconData _activityIcon(ActivityType t) => switch (t) {
        ActivityType.note => Icons.sticky_note_2_outlined,
        ActivityType.call => Icons.call_outlined,
        ActivityType.email => Icons.email_outlined,
        ActivityType.meeting => Icons.event_outlined,
        ActivityType.moduleEvent => Icons.extension_outlined,
        ActivityType.quoteSent => Icons.request_quote_outlined,
        ActivityType.reply => Icons.reply_outlined,
        ActivityType.remark => Icons.priority_high_outlined,
      };

  bool get _isEmpty =>
      _companies == 0 && _opps.isEmpty && _openTasks == 0 && _recentActivities.isEmpty;

  Future<void> _openCompany(String companyId) async {
    if (widget.workspace != null) {
      widget.workspace!.selectCompany(companyId);
      return;
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CompanyDetailScreen(companyId: companyId)),
    );
    _load();
  }

  Future<void> _push(Widget screen) async {
    if (widget.workspace != null) return;
    await Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
    _load();
  }

  void _goToSection(CrmSection section) {
    widget.workspace?.goTo(section);
  }

  /// Bloc "affaires en cours" — chaque ligne ouvre la fiche d'affaire
  /// (timeline unifiée : notes, appels, tâches, devis/factures). Objectif :
  /// qu'un coup d'œil au dashboard dise "voilà ce qui bouge en ce moment",
  /// pas seulement des totaux agrégés.
  Widget _buildOpenDeals(BuildContext context, AppLocalizations l10n, ColorScheme scheme) {
    final deals = _openOpportunities();
    final totalOpen = _opps.where((o) => o.wonLost == null).length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(l10n.dashboardOpenDeals, style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            if (totalOpen > deals.length)
              TextButton(
                onPressed: widget.workspace != null
                    ? () => _goToSection(CrmSection.pipeline)
                    : () => _push(const PipelineScreen()),
                child: Text(l10n.dashboardOpenDealsSeeAll),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (deals.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(l10n.dashboardOpenDealsEmpty, style: TextStyle(color: scheme.onSurfaceVariant)),
          )
        else
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.5)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                for (var i = 0; i < deals.length; i++) ...[
                  if (i > 0) Divider(height: 1, color: scheme.outlineVariant.withValues(alpha: 0.4)),
                  _OpenDealRow(
                    opp: deals[i],
                    companyName: deals[i].companyId != null
                        ? _companyNames[deals[i].companyId]
                        : null,
                    stageLabel: PipelineSettings.instance.labelFor(deals[i].stage),
                    stageColor: AppTheme.stageColors[deals[i].stage] ?? scheme.primary,
                    onTap: () => _openOpportunity(deals[i].id),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final me = CurrentSession.instance.user;
    final openStages = PipelineSettings.instance.openStages;
    final stageLabels = PipelineSettings.instance.labels;
    final forecast = _forecastRevenue();
    final topClients = _topClients();
    final wonLostMonths = _wonLostByMonth();
    return CrmPage(
      title: widget.embedded ? l10n.dashboardTitleEmbedded : l10n.dashboardTitle,
      subtitle: _agendaTotal > 0
          ? l10n.dashboardActionsToProcess(_agendaTotal)
          : l10n.productTagline,
      actions: [
        if (_users.isNotEmpty)
          DropdownButton<String?>(
            value: _agendaFilterUserId,
            underline: const SizedBox.shrink(),
            borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
            style: TextStyle(fontSize: CrmTokens.bodySize, color: scheme.onSurfaceVariant),
            items: [
              DropdownMenuItem(value: null, child: Text(l10n.dashboardAllReps)),
              for (final u in _users)
                DropdownMenuItem(
                  value: u.id,
                  child: Text(u.id == me?.id ? l10n.dashboardMeSuffix(u.displayName) : u.displayName),
                ),
            ],
            onChanged: (v) {
              setState(() => _agendaFilterUserId = v);
              _load();
            },
          ),
      ],
      child: RefreshIndicator(
        onRefresh: _load,
        child: _isEmpty
            ? ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EmptyState(
                          icon: Icons.dashboard_customize_outlined,
                          title: l10n.dashboardEmptyTitle,
                          subtitle: l10n.dashboardEmptySubtitle,
                        ),
                        const SizedBox(height: 16),
                        CrmImportExportPanel(
                          compact: true,
                          onChanged: _load,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : ListView(
                padding: const EdgeInsets.fromLTRB(
                  CrmTokens.pagePadding,
                  8,
                  CrmTokens.pagePadding,
                  CrmTokens.pagePadding,
                ),
                children: [
                  if (_agendaTasks.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        l10n.dashboardNothingScheduled,
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      ),
                    )
                  else ...[
                    for (final bucket in [
                      (key: 'overdue', label: l10n.dashboardBucketOverdue),
                      (key: 'today', label: l10n.dashboardBucketToday),
                      (key: 'week', label: l10n.dashboardBucketWeek),
                      (key: 'later', label: l10n.dashboardBucketLater),
                    ])
                      Builder(builder: (context) {
                        final items =
                            _agendaTasks.where((t) => _agendaBucket(t.dueDate) == bucket.key).toList();
                        if (items.isEmpty) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8, left: 2),
                                child: Text(
                                  bucket.label.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6,
                                    color: switch (bucket.key) {
                                      'overdue' => AppTheme.overdueColor,
                                      'today' => AppTheme.dueSoonColor,
                                      _ => scheme.onSurfaceVariant,
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.5)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    for (var i = 0; i < items.length; i++) ...[
                                      if (i > 0)
                                        Divider(
                                            height: 1,
                                            color: scheme.outlineVariant.withValues(alpha: 0.4)),
                                      _AgendaRow(
                                        companyName: items[i].companyId != null &&
                                                _companyNames.containsKey(items[i].companyId)
                                            ? _companyNames[items[i].companyId]!
                                            : taskMessage(items[i]),
                                        isClientName: items[i].companyId != null &&
                                            _companyNames.containsKey(items[i].companyId),
                                        subtitle:
                                            '${taskMessage(items[i])} · ${formatDateFr(items[i].dueDate)}',
                                        accentColor: AppTheme.dueDateColor(
                                          items[i].dueDate,
                                          done: items[i].isDone,
                                          neutral: scheme.outline,
                                        ),
                                        onTap: items[i].companyId == null
                                            ? null
                                            : () => _openCompany(items[i].companyId!),
                                        action: items[i].companyId != null && items[i].opportunityId != null
                                            ? _PillButton(
                                                label: l10n.dashboardContactedButton,
                                                icon: Icons.call_outlined,
                                                onTap: () => _logInteraction(items[i]),
                                              )
                                            : _PillButton(
                                                label: l10n.dashboardDoneButton,
                                                icon: Icons.check,
                                                onTap: () => _markTaskDone(items[i]),
                                              ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    if (_agendaTotal > _agendaTasks.length)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextButton(
                          onPressed: () => _push(TasksScreen(initialFilterUserId: _agendaFilterUserId)),
                          child: Text(
                            l10n.dashboardMoreAgendaItems(_agendaTotal - _agendaTasks.length),
                          ),
                        ),
                      ),
                  ],
                  const SizedBox(height: 28),
                  _buildOpenDeals(context, l10n, scheme),
                  const SizedBox(height: 28),
                  _MetricsRow(
                    labels: (
                      clients: l10n.metricClients,
                      opportunities: l10n.metricOpportunities,
                      pipeline: l10n.metricPipeline,
                      forecast: l10n.metricForecast,
                      tasks: l10n.metricTasks,
                      overdue: l10n.metricOverdue,
                    ),
                    companies: _companies,
                    openOpps: _opps.where((o) => o.wonLost == null).length,
                    pipelineValue: formatAmount(_pipelineValue(), decimals: false),
                    forecastValue: formatAmount(forecast, decimals: false),
                    openTasks: _openTasks,
                    overdueTasks: _overdueTasks,
                    onClients: widget.workspace != null
                        ? () => _goToSection(CrmSection.clients)
                        : () => _push(const CompaniesScreen()),
                    onPipeline: widget.workspace != null
                        ? () => _goToSection(CrmSection.pipeline)
                        : () => _push(const PipelineScreen()),
                    onTasks: widget.workspace != null
                        ? () => _goToSection(CrmSection.tasks)
                        : () => _push(const TasksScreen()),
                  ),
                  if (ModuleRegistry.instance.isUsedInCrm('invoicing')) ...[
                    const SizedBox(height: 24),
                    ...ModuleRegistry.instance.byId('invoicing')!.dashboardCards(context, _load),
                  ],
                  const SizedBox(height: 24),
                  if (topClients.isNotEmpty) ...[
                    Text(l10n.dashboardTopClients, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.5)),
                      ),
                      child: Column(
                        children: [
                          for (var i = 0; i < topClients.length; i++) ...[
                            if (i > 0)
                              Divider(height: 1, color: scheme.outlineVariant.withValues(alpha: 0.4)),
                            ListTile(
                              dense: true,
                              title: Text(
                                topClients[i].$1,
                                style: const TextStyle(
                                  color: CrmTokens.fuchsia,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Text(formatAmount(topClients[i].$2),
                                  style: const TextStyle(fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  Text(l10n.dashboardPipelineByStage, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 220,
                    child: _opps.isEmpty
                        ? Center(child: Text(l10n.dashboardNoOpportunitiesYet))
                        : BarChart(
                            BarChartData(
                              borderData: FlBorderData(show: false),
                              gridData: const FlGridData(show: false),
                              barTouchData: BarTouchData(
                                enabled: true,
                                touchCallback: (event, response) {
                                  if (response?.spot == null) return;
                                  final idx = response!.spot!.touchedBarGroupIndex;
                                  if (idx < 0 || idx >= openStages.length) return;
                                  _goToSection(CrmSection.pipeline);
                                },
                              ),
                              titlesData: FlTitlesData(
                                leftTitles: const AxisTitles(),
                                topTitles: const AxisTitles(),
                                rightTitles: const AxisTitles(),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (v, _) => Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        stageLabels[openStages[v.toInt()]] ??
                                            PipelineSettings.instance.labelFor(openStages[v.toInt()]),
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              barGroups: [
                                for (var i = 0; i < openStages.length; i++)
                                  BarChartGroupData(x: i, barRods: [
                                    BarChartRodData(
                                      toY: _opps
                                          .where((o) => o.stage == openStages[i])
                                          .length
                                          .toDouble(),
                                      color: AppTheme.stageColors[openStages[i]] ?? scheme.primary,
                                      width: 26,
                                      borderRadius:
                                          const BorderRadius.vertical(top: Radius.circular(4)),
                                    ),
                                  ]),
                              ],
                            ),
                          ),
                  ),
                  const SizedBox(height: 28),
                  Text(l10n.dashboardWonLostByMonth, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 200,
                    child: wonLostMonths.every((m) => m.$2 == 0 && m.$3 == 0)
                        ? Center(
                            child: Text(l10n.dashboardNoClosuresYet,
                                style: TextStyle(color: scheme.onSurfaceVariant)),
                          )
                        : BarChart(
                            BarChartData(
                              borderData: FlBorderData(show: false),
                              gridData: const FlGridData(show: false),
                              titlesData: FlTitlesData(
                                leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true)),
                                topTitles: const AxisTitles(),
                                rightTitles: const AxisTitles(),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (v, _) {
                                      final i = v.toInt();
                                      if (i < 0 || i >= wonLostMonths.length) return const SizedBox.shrink();
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(wonLostMonths[i].$1, style: const TextStyle(fontSize: 10)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              barGroups: [
                                for (var i = 0; i < wonLostMonths.length; i++)
                                  BarChartGroupData(x: i, barRods: [
                                    BarChartRodData(
                                      toY: wonLostMonths[i].$2.toDouble(),
                                      color: AppTheme.stageColors['won'] ?? Colors.green,
                                      width: 12,
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
                                    ),
                                    BarChartRodData(
                                      toY: wonLostMonths[i].$3.toDouble(),
                                      color: AppTheme.stageColors['lost'] ?? Colors.red,
                                      width: 12,
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
                                    ),
                                  ]),
                              ],
                            ),
                          ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    l10n.dashboardRecentActivity.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_recentActivities.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(l10n.dashboardNoActivityYet,
                          style: TextStyle(color: scheme.onSurfaceVariant)),
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.5)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          for (var i = 0; i < _recentActivities.length; i++) ...[
                            if (i > 0)
                              Divider(height: 1, color: scheme.outlineVariant.withValues(alpha: 0.4)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              child: Row(
                                children: [
                                  Icon(_activityIcon(_recentActivities[i].type),
                                      size: 18, color: scheme.onSurfaceVariant),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _recentActivities[i].body ?? _recentActivities[i].title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          _recentActivities[i].companyId != null &&
                                                  _companyNames.containsKey(_recentActivities[i].companyId)
                                              ? '${_companyNames[_recentActivities[i].companyId]} · '
                                                  '${formatDateTimeFr(_recentActivities[i].happenedAt)}'
                                              : formatDateTimeFr(_recentActivities[i].happenedAt),
                                          style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

/// Une ligne de l'agenda "Aujourd'hui" — pas de ListTile Material par
/// défaut (padding générique, chrome visible) : une ligne plate, typo
/// resserrée, barre d'accent colorée à gauche plutôt qu'une icône dans un
/// badge. Look Attio/Linear plutôt que Material stock.
class _AgendaRow extends StatelessWidget {
  const _AgendaRow({
    required this.companyName,
    required this.subtitle,
    required this.accentColor,
    required this.action,
    this.isClientName = false,
    this.onTap,
  });

  final String companyName;
  final String subtitle;
  final Color accentColor;
  final Widget action;
  // false quand companyName tient en fait le message de la tâche (aucun
  // client associé) — dans ce cas on garde la couleur de texte par défaut.
  final bool isClientName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
        child: Row(
          children: [
            Container(width: 3, height: 30, color: accentColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isClientName ? CrmTokens.fuchsia : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            action,
          ],
        ),
      ),
    );
  }
}

/// Bouton pilule minimal (fond teinté, pas de bordure Material par défaut)
/// — pour "Contacté"/"Fait" dans l'agenda. Le style de bouton par défaut
/// (TextButton/OutlinedButton) a un chrome trop visible pour un geste censé
/// être rapide et discret.
class _PillButton extends StatelessWidget {
  const _PillButton({required this.label, required this.icon, required this.onTap});

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: scheme.primary),
              const SizedBox(width: 5),
              Text(label,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: scheme.primary)),
            ],
          ),
        ),
      ),
    );
  }
}

class _OpenDealRow extends StatelessWidget {
  const _OpenDealRow({
    required this.opp,
    required this.companyName,
    required this.stageLabel,
    required this.stageColor,
    required this.onTap,
  });

  final Opportunity opp;
  final String? companyName;
  final String stageLabel;
  final Color stageColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Container(width: 3, height: 30, color: stageColor),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      opp.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text.rich(
                      TextSpan(
                        children: [
                          if (companyName != null) ...[
                            TextSpan(
                              text: companyName,
                              style: const TextStyle(
                                color: CrmTokens.fuchsia,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(text: ' · '),
                          ],
                          TextSpan(text: stageLabel),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, color: scheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              if (opp.amount != null) ...[
                const SizedBox(width: 8),
                Text(formatAmount(opp.amount), style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
              const SizedBox(width: 4),
              Icon(Icons.chevron_right, size: 18, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

typedef _MetricLabels = ({
  String clients,
  String opportunities,
  String pipeline,
  String forecast,
  String tasks,
  String overdue,
});

class _MetricsRow extends StatelessWidget {
  const _MetricsRow({
    required this.labels,
    required this.companies,
    required this.openOpps,
    required this.pipelineValue,
    required this.forecastValue,
    required this.openTasks,
    required this.overdueTasks,
    required this.onClients,
    required this.onPipeline,
    required this.onTasks,
  });

  final _MetricLabels labels;
  final int companies;
  final int openOpps;
  final String pipelineValue;
  final String forecastValue;
  final int openTasks;
  final int overdueTasks;
  final VoidCallback onClients;
  final VoidCallback onPipeline;
  final VoidCallback onTasks;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    final items = [
      (labels.clients, '$companies', onClients, false),
      (labels.opportunities, '$openOpps', onPipeline, false),
      (labels.pipeline, pipelineValue, onPipeline, false),
      (labels.forecast, forecastValue, onPipeline, false),
      (labels.tasks, '$openTasks', onTasks, false),
      if (overdueTasks > 0) (labels.overdue, '$overdueTasks', onTasks, true),
    ];
    final phone = CrmLayout.isPhone(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
      ),
      clipBehavior: Clip.antiAlias,
      // Téléphone : grille 2 colonnes — sur 1 seule ligne (5-6 items), les
      // libellés comme « Opportunités » cassaient au milieu du mot.
      child: phone ? _phoneGrid(items, border) : _wideRow(items, border),
    );
  }

  Widget _wideRow(List<(String, String, VoidCallback, bool)> items, Color border) {
    return Row(
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) VerticalDivider(width: 1, color: border),
          Expanded(
            child: _MetricCell(
              label: items[i].$1,
              value: items[i].$2,
              onTap: items[i].$3,
              highlight: items[i].$4,
            ),
          ),
        ],
      ],
    );
  }

  Widget _phoneGrid(List<(String, String, VoidCallback, bool)> items, Color border) {
    const columns = 2;
    final rows = <Widget>[];
    for (var r = 0; r * columns < items.length; r++) {
      if (r > 0) rows.add(Divider(height: 1, color: border));
      final cells = <Widget>[];
      for (var c = 0; c < columns; c++) {
        final idx = r * columns + c;
        if (c > 0) cells.add(VerticalDivider(width: 1, color: border));
        cells.add(Expanded(
          child: idx < items.length
              ? _MetricCell(
                  label: items[idx].$1,
                  value: items[idx].$2,
                  onTap: items[idx].$3,
                  highlight: items[idx].$4,
                )
              : const SizedBox(),
        ));
      }
      rows.add(IntrinsicHeight(child: Row(children: cells)));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: rows);
  }
}

class _MetricCell extends StatelessWidget {
  const _MetricCell({
    required this.label,
    required this.value,
    required this.onTap,
    this.highlight = false,
  });

  final String label;
  final String value;
  final VoidCallback onTap;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = highlight ? AppTheme.overdueColor : scheme.onSurface;
    return Material(
      color: highlight ? AppTheme.overdueColor.withValues(alpha: 0.06) : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 4),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: color,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
