import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/models/models.dart';
import '../core/screens/company_detail_screen.dart';
import '../core/screens/dashboard_screen.dart';
import '../core/screens/settings_screen.dart';
import '../core/screens/tasks_screen.dart';
import '../core/services/current_session.dart';
import '../core/services/remote_crm_sync_service.dart';
import '../core/services/sync_editing_guard.dart';
import '../core/services/task_alarm_service.dart';
import '../core/widgets/login_panel.dart';
import '../core/services/workspace_layout_settings.dart';
import '../core/widgets/command_palette.dart';
import '../state/crm_workspace_state.dart';
import '../theme/app_theme.dart';
import '../workspace/clients_list_panel.dart';
import '../workspace/column_width_controls.dart';
import '../workspace/crm_workspace_banner.dart';
import '../workspace/pipeline_board.dart';
import '../workspace/record_placeholder.dart';
import '../workspace/tasks_list_panel.dart';
import '../workspace/today_action_panel.dart';
import '../workspace/today_queue_panel.dart';

/// Workspace 3 panneaux — Attio × Linear :
/// [Rail] | [Liste contextuelle] | [Fiche client]
/// Pas de navigation empilée sur desktop : tout reste visible.
class CrmShell extends StatefulWidget {
  const CrmShell({super.key});

  @override
  State<CrmShell> createState() => _CrmShellState();
}

class _CrmShellState extends State<CrmShell> with WidgetsBindingObserver {
  final _workspace = CrmWorkspaceState();
  final _sync = RemoteCrmSyncService.instance;
  static const _railStep = 84.0;
  static const _breakpoint = 900.0;
  final _layout = WorkspaceLayoutSettings.instance;
  double _railWidth = WorkspaceLayoutSettings.railMin;
  static const _listWidth = 320.0;
  bool _lockShowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SyncEditingGuard.isUserEditing = _isUserEditing;
    _sync.dataEpoch.addListener(_onRemoteDataChanged);
    _sync.addListener(_onSyncStatusChanged);
    // ignore: unawaited_futures
    _sync.refreshRemoteModeFlag();
    _loadLayout();
    WidgetsBinding.instance.addPostFrameCallback((_) => TaskAlarmService.instance.start());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _sync.dataEpoch.removeListener(_onRemoteDataChanged);
    _sync.removeListener(_onSyncStatusChanged);
    SyncEditingGuard.isUserEditing = null;
    TaskAlarmService.instance.stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.hidden) {
      CurrentSession.instance.lockSession();
      // ignore: unawaited_futures
      _sync.flushPendingPush();
    } else if (state == AppLifecycleState.resumed) {
      // ignore: unawaited_futures
      _maybeShowLoginLock();
      // ignore: unawaited_futures
      _sync.syncBackgroundPull();
    }
  }

  Future<void> _maybeShowLoginLock() async {
    if (_lockShowing || !mounted) return;
    await CurrentSession.instance.ensureLoaded();
    if (!CurrentSession.instance.needsLogin || !mounted) return;
    _lockShowing = true;
    try {
      await Navigator.of(context).push<void>(
        PageRouteBuilder<void>(
          opaque: true,
          barrierDismissible: false,
          pageBuilder: (_, __, ___) => Scaffold(
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: LoginPanel(
                      onSuccess: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } finally {
      _lockShowing = false;
    }
  }

  void _onSyncStatusChanged() {
    if (!mounted || _sync.lastError == null) return;
    if (!_sync.hasBackgroundErrorNotice) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sync : ${_sync.lastError}'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: _sync.clearBackgroundErrorNotice,
        ),
      ),
    );
  }

  /// Reporte les pulls automatiques pendant une saisie ou un dialogue ouvert.
  bool _isUserEditing() {
    if (!mounted) return false;
    if (Navigator.of(context).canPop()) return true;
    final focused = FocusManager.instance.primaryFocus?.context;
    return focused != null &&
        focused.findAncestorWidgetOfExactType<EditableText>() != null;
  }

  void _onRemoteDataChanged() {
    if (_isUserEditing()) return;
    _refreshAll();
  }

  Future<void> _loadLayout() async {
    await _layout.ensureLoaded();
    if (!mounted) return;
    setState(() => _railWidth = _layout.railWidth);
  }

  Future<void> _addTaskFromHeader() async {
    final created = await showAddTaskDialog(context, allowNoClient: true);
    if (created) _refreshAll();
  }

  void _selectCompany(String id) {
    _workspace.selectCompany(id);
  }

  void _selectTask(CrmTask task) {
    _workspace.selectTask(task);
  }

  void _refreshAll() => _workspace.bump();

  void _widenRail() {
    final next = (_railWidth + _railStep).clamp(WorkspaceLayoutSettings.railMin, WorkspaceLayoutSettings.railMax);
    setState(() => _railWidth = next);
    _layout.setRailWidth(next);
  }

  void _narrowRail() {
    final next = (_railWidth - _railStep).clamp(WorkspaceLayoutSettings.railMin, WorkspaceLayoutSettings.railMax);
    setState(() => _railWidth = next);
    _layout.setRailWidth(next);
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= _breakpoint;
    return ListenableBuilder(
      listenable: _workspace,
      builder: (context, _) {
        final section = _workspace.section;
        final selectedId = _workspace.selectedCompanyId;
        final selectedTaskId = _workspace.selectedTaskId;
        final todayFullRecord = _workspace.todayFullRecord;

        // Mobile : liste OU fiche / panneau relance plein écran
        if (!wide) {
          return _MobileShell(
            workspace: _workspace,
            onCommandPalette: () => showCommandPalette(context, _workspace, _refreshAll),
            onAddTask: _addTaskFromHeader,
            onRefresh: _refreshAll,
            child: section == CrmSection.today && selectedTaskId != null && !todayFullRecord
                ? TodayActionPanel(
                    key: ValueKey(selectedTaskId),
                    taskId: selectedTaskId,
                    workspace: _workspace,
                    onRefresh: _refreshAll,
                  )
                : selectedId != null
                    ? CompanyDetailScreen(
                        key: ValueKey(selectedId),
                        companyId: selectedId,
                        embedded: true,
                        onDeleted: () {
                          _workspace.clearSelection();
                          _refreshAll();
                        },
                        onUpdated: _refreshAll,
                      )
                    : _MobileList(
                        workspace: _workspace,
                        onSelectCompany: _selectCompany,
                        onSelectTask: _selectTask,
                        onRefresh: _refreshAll,
                      ),
          );
        }

        // Desktop : rail + liste (sauf pipeline / dashboard plein) + panneau droit
        final showList = section != CrmSection.pipeline && section != CrmSection.dashboard;
        final showTodayAction = section == CrmSection.today &&
            selectedTaskId != null &&
            !todayFullRecord;
        final showSplitRecord = selectedId != null && !showTodayAction;

        return CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.keyK, meta: true): () =>
                showCommandPalette(context, _workspace, _refreshAll),
            const SingleActivator(LogicalKeyboardKey.keyK, control: true): () =>
                showCommandPalette(context, _workspace, _refreshAll),
            const SingleActivator(LogicalKeyboardKey.escape): () => _workspace.clearSelection(),
          },
          child: Focus(
            autofocus: true,
            child: Scaffold(
              body: Column(
                children: [
                  CrmWorkspaceBanner(
                    onAddTask: _addTaskFromHeader,
                    onTaskCreated: _refreshAll,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _IconRail(
                          width: _railWidth,
                          section: section,
                          onSection: (s) {
                            _workspace.goTo(s);
                            if (s == CrmSection.pipeline) _workspace.clearSelection();
                          },
                          onCommandPalette: () => showCommandPalette(context, _workspace, _refreshAll),
                          onSettings: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SettingsScreen()),
                          ),
                          onWider: _widenRail,
                          onNarrower: _narrowRail,
                          canWider: _railWidth < WorkspaceLayoutSettings.railMax,
                          canNarrower: _railWidth > WorkspaceLayoutSettings.railMin,
                        ),
                        if (showList) ...[
                          SizedBox(
                            width: _listWidth,
                            child: SelectionArea(
                              child: _ListForSection(
                                workspace: _workspace,
                                selectedCompanyId: selectedId,
                                selectedTaskId: selectedTaskId,
                                onSelectCompany: _selectCompany,
                                onSelectTask: _selectTask,
                                onRefresh: _refreshAll,
                                fullWidth: true,
                              ),
                            ),
                          ),
                        ],
                        Expanded(
                          child: _WorkspaceDetailPanel(
                            section: section,
                            showSplitRecord: showSplitRecord,
                            showTodayAction: showTodayAction,
                            selectedId: selectedId,
                            selectedTaskId: selectedTaskId,
                            workspace: _workspace,
                            onSelectCompany: _selectCompany,
                            onRefresh: _refreshAll,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WorkspaceDetailPanel extends StatelessWidget {
  const _WorkspaceDetailPanel({
    required this.section,
    required this.showSplitRecord,
    required this.showTodayAction,
    required this.selectedId,
    required this.selectedTaskId,
    required this.workspace,
    required this.onSelectCompany,
    required this.onRefresh,
  });

  final CrmSection section;
  final bool showSplitRecord;
  final bool showTodayAction;
  final String? selectedId;
  final String? selectedTaskId;
  final CrmWorkspaceState workspace;
  final ValueChanged<String> onSelectCompany;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;

    if (section == CrmSection.dashboard && !showTodayAction && !showSplitRecord) {
      return DashboardScreen(
        key: ValueKey('dashboard-${workspace.version}'),
        workspace: workspace,
        embedded: true,
      );
    }

    if (section == CrmSection.pipeline && !showTodayAction) {
      final pipeline = PipelineBoard(
        key: const ValueKey('workspace-pipeline'),
        workspace: workspace,
        onSelectCompany: onSelectCompany,
        compact: showSplitRecord,
      );
      if (showSplitRecord) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: showSplitRecord ? 280 : 320, child: pipeline),
            VerticalDivider(width: 1, color: border),
            Expanded(
              child: CompanyDetailScreen(
                key: ValueKey(selectedId),
                companyId: selectedId!,
                embedded: true,
                onDeleted: () {
                  workspace.clearSelection();
                  onRefresh();
                },
                onUpdated: onRefresh,
              ),
            ),
          ],
        );
      }
      return pipeline;
    }

    final Widget panel;
    if (showTodayAction) {
      panel = TodayActionPanel(
        key: ValueKey(selectedTaskId),
        taskId: selectedTaskId!,
        workspace: workspace,
        onRefresh: onRefresh,
      );
    } else if (showSplitRecord) {
      panel = CompanyDetailScreen(
        key: ValueKey(selectedId),
        companyId: selectedId!,
        embedded: true,
        onDeleted: () {
          workspace.clearSelection();
          onRefresh();
        },
        onUpdated: onRefresh,
      );
    } else {
      panel = RecordPlaceholder(section: section);
    }

    return SelectionArea(child: panel);
  }
}

class _ListForSection extends StatelessWidget {
  const _ListForSection({
    required this.workspace,
    required this.selectedCompanyId,
    this.selectedTaskId,
    required this.onSelectCompany,
    this.onSelectTask,
    required this.onRefresh,
    this.fullWidth = false,
  });

  final CrmWorkspaceState workspace;
  final String? selectedCompanyId;
  final String? selectedTaskId;
  final ValueChanged<String> onSelectCompany;
  final ValueChanged<CrmTask>? onSelectTask;
  final VoidCallback onRefresh;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return switch (workspace.section) {
      CrmSection.dashboard => const SizedBox.shrink(),
      CrmSection.today => TodayQueuePanel(
          workspace: workspace,
          selectedTaskId: selectedTaskId,
          onSelectTask: onSelectTask ?? (_) {},
          onRefresh: onRefresh,
          expand: fullWidth,
        ),
      CrmSection.clients => ClientsListPanel(
          workspace: workspace,
          selectedCompanyId: selectedCompanyId,
          onSelectCompany: onSelectCompany,
          expand: fullWidth,
        ),
      CrmSection.tasks => TasksListPanel(
          workspace: workspace,
          selectedCompanyId: selectedCompanyId,
          onSelectCompany: onSelectCompany,
          expand: fullWidth,
        ),
      CrmSection.pipeline => const SizedBox.shrink(),
    };
  }
}

class _IconRail extends StatelessWidget {
  const _IconRail({
    required this.width,
    required this.section,
    required this.onSection,
    required this.onCommandPalette,
    required this.onSettings,
    required this.onWider,
    required this.onNarrower,
    required this.canWider,
    required this.canNarrower,
  });

  final double width;
  final CrmSection section;
  final ValueChanged<CrmSection> onSection;
  final VoidCallback onCommandPalette;
  final VoidCallback onSettings;
  final VoidCallback onWider;
  final VoidCallback onNarrower;
  final bool canWider;
  final bool canNarrower;

  bool get _expanded => width >= 120;

  static const _items = [
    (CrmSection.dashboard, Icons.dashboard_outlined, 'Tableau de bord'),
    (CrmSection.today, Icons.wb_sunny_outlined, 'Aujourd\'hui'),
    (CrmSection.clients, Icons.business_outlined, 'Clients'),
    (CrmSection.pipeline, Icons.view_kanban_outlined, 'Pipeline'),
    (CrmSection.tasks, Icons.check_circle_outline, 'Tâches'),
  ];

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).crmSidebar,
        border: Border(right: BorderSide(color: border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          _RailButton(
            width: width,
            icon: Icons.search,
            label: 'Rechercher',
            expanded: _expanded,
            selected: false,
            onTap: onCommandPalette,
          ),
          const Divider(height: 1, indent: 8, endIndent: 8),
          for (final item in _items)
            _RailButton(
              width: width,
              icon: item.$2,
              label: item.$3,
              expanded: _expanded,
              selected: section == item.$1,
              onTap: () => onSection(item.$1),
            ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _expanded ? 6 : 2, vertical: 4),
            child: ColumnWidthControls(
              compact: !_expanded,
              onWider: onWider,
              onNarrower: onNarrower,
              canWider: canWider,
              canNarrower: canNarrower,
            ),
          ),
          _RailButton(
            width: width,
            icon: Icons.settings_outlined,
            label: 'Réglages',
            expanded: _expanded,
            selected: false,
            onTap: onSettings,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _RailButton extends StatefulWidget {
  const _RailButton({
    required this.width,
    required this.icon,
    required this.label,
    required this.expanded,
    required this.selected,
    required this.onTap,
  });

  final double width;
  final IconData icon;
  final String label;
  final bool expanded;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_RailButton> createState() => _RailButtonState();
}

class _RailButtonState extends State<_RailButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = widget.selected ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant;
    return Tooltip(
      message: widget.label,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            width: widget.width,
            height: 44,
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: EdgeInsets.symmetric(horizontal: widget.expanded ? 12 : 0),
            decoration: BoxDecoration(
              color: widget.selected
                  ? theme.colorScheme.primary.withValues(alpha: 0.12)
                  : _hover
                      ? theme.crmHover
                      : null,
              border: Border(
                left: BorderSide(
                  color: widget.selected ? theme.colorScheme.primary : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: widget.expanded
                ? Row(
                    children: [
                      Icon(widget.icon, size: 20, color: color),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: widget.selected ? FontWeight.w600 : FontWeight.w500,
                            color: color,
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(child: Icon(widget.icon, size: 20, color: color)),
          ),
        ),
      ),
    );
  }
}

class _MobileShell extends StatelessWidget {
  const _MobileShell({
    required this.workspace,
    required this.onCommandPalette,
    required this.onAddTask,
    required this.onRefresh,
    required this.child,
  });

  final CrmWorkspaceState workspace;
  final VoidCallback onCommandPalette;
  final Future<void> Function() onAddTask;
  final VoidCallback onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: workspace,
      builder: (context, _) {
        final hasDetail = workspace.selectedCompanyId != null &&
            (workspace.section != CrmSection.today ||
                workspace.todayFullRecord ||
                workspace.selectedTaskId == null);
        final hasTodayPanel = workspace.section == CrmSection.today &&
            workspace.selectedTaskId != null &&
            !workspace.todayFullRecord;
        return Scaffold(
          body: Column(
            children: [
              CrmWorkspaceBanner(
                leading: hasDetail || hasTodayPanel
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: workspace.clearSelection,
                      )
                    : null,
                onAddTask: onAddTask,
                onTaskCreated: onRefresh,
              ),
              Expanded(child: child),
            ],
          ),
          bottomNavigationBar: hasDetail || hasTodayPanel
              ? null
              : NavigationBar(
                  selectedIndex: workspace.section.index,
                  onDestinationSelected: (i) => workspace.goTo(CrmSection.values[i]),
                  destinations: const [
                    NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
                    NavigationDestination(icon: Icon(Icons.wb_sunny_outlined), label: 'Aujourd\'hui'),
                    NavigationDestination(icon: Icon(Icons.business_outlined), label: 'Clients'),
                    NavigationDestination(icon: Icon(Icons.view_kanban_outlined), label: 'Pipeline'),
                    NavigationDestination(icon: Icon(Icons.check_circle_outline), label: 'Tâches'),
                  ],
                ),
        );
      },
    );
  }
}

class _MobileList extends StatelessWidget {
  const _MobileList({
    required this.workspace,
    required this.onSelectCompany,
    required this.onSelectTask,
    required this.onRefresh,
  });

  final CrmWorkspaceState workspace;
  final ValueChanged<String> onSelectCompany;
  final ValueChanged<CrmTask> onSelectTask;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    if (workspace.section == CrmSection.pipeline) {
      return PipelineBoard(workspace: workspace, onSelectCompany: onSelectCompany);
    }
    if (workspace.section == CrmSection.dashboard) {
      return DashboardScreen(
        key: ValueKey('mobile-dashboard-${workspace.version}'),
        workspace: workspace,
        embedded: true,
      );
    }
    return SizedBox(
      width: double.infinity,
      child: _ListForSection(
        workspace: workspace,
        selectedCompanyId: workspace.selectedCompanyId,
        selectedTaskId: workspace.selectedTaskId,
        onSelectCompany: onSelectCompany,
        onSelectTask: onSelectTask,
        onRefresh: onRefresh,
        fullWidth: true,
      ),
    );
  }
}
