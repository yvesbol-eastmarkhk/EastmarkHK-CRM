import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/models/models.dart';
import '../core/screens/company_detail_screen.dart';
import '../core/screens/dashboard_screen.dart';
import '../core/screens/opportunity_detail_screen.dart';
import '../core/modules/module_registry.dart';
import '../core/screens/modules_screen.dart';
import '../core/screens/settings_screen.dart';
import '../modules/invoicing/screens/ei_products_screen.dart';
import '../modules/invoicing/screens/invoicing_home_screen.dart';
import '../core/screens/tasks_screen.dart';
import '../core/services/current_session.dart';
import '../core/services/remote_crm_sync_service.dart';
import '../core/services/sync_editing_guard.dart';
import '../core/services/task_alarm_service.dart';
import '../core/utils/responsive_layout.dart';
import '../core/widgets/login_panel.dart';
import '../core/widgets/command_palette.dart';
import '../l10n/gen/app_localizations.dart';
import '../state/crm_workspace_state.dart';
import '../theme/app_theme.dart';
import '../workspace/clients_list_panel.dart';
import '../workspace/crm_workspace_banner.dart';
import '../workspace/pipeline_board.dart';
import '../workspace/record_placeholder.dart';
import '../workspace/tasks_list_panel.dart';
import '../workspace/today_action_panel.dart';
import '../workspace/today_queue_panel.dart';
import '../widgets/emhk_app_footer.dart';

/// Aperçu tâche à droite pour Aujourd'hui et la section Tâches.
bool showTaskOverviewPanel(
  CrmSection section,
  String? selectedTaskId,
  bool todayFullRecord,
) {
  if (selectedTaskId == null || todayFullRecord) return false;
  return section == CrmSection.today || section == CrmSection.tasks;
}

/// Workspace 3 panneaux — Attio × Linear :
/// [Rail] | [Liste contextuelle] | [Fiche client]
/// Pas de navigation empilée sur desktop / iPad : tout reste visible.
class CrmShell extends StatefulWidget {
  const CrmShell({super.key});

  @override
  State<CrmShell> createState() => _CrmShellState();
}

class _CrmShellState extends State<CrmShell> with WidgetsBindingObserver {
  final _workspace = CrmWorkspaceState();
  final _sync = RemoteCrmSyncService.instance;
  /// Largeur fixe du rail (comme avant) — plus de redimensionnement.
  static const _railWidth = 188.0;
  static const _listWidth = 320.0;
  static const _listWidthCompact = 260.0;
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
    _sync.startAutoSync();
    WidgetsBinding.instance.addPostFrameCallback((_) => TaskAlarmService.instance.start());
    // ignore: unawaited_futures
    ModuleRegistry.instance.ensureInitialized();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _sync.stopAutoSync();
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
          pageBuilder: (_, _, _) => Scaffold(
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
    final lastError = _sync.lastError;
    if (!mounted || lastError == null) return;
    if (!_sync.hasBackgroundErrorNotice) return;
    final l10n = AppLocalizations.of(context);
    final detail = switch (lastError) {
      'timeout' => l10n.syncTimeout,
      'needs_password' => l10n.shellSyncNeedsPassword,
      '401' => l10n.sync401,
      'invalid' => l10n.syncInvalidResponse,
      _ => lastError,
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.shellSyncError(detail)),
        action: SnackBarAction(
          label: l10n.shellOk,
          onPressed: _sync.clearBackgroundErrorNotice,
        ),
      ),
    );
  }

  /// Reporte les pulls automatiques pendant une saisie texte.
  /// Ne bloque PAS sur un dialogue ouvert (sinon l’alarme « Task reminder »
  /// empêche le pull des tâches marquées faites sur un autre appareil).
  bool _isUserEditing() {
    if (!mounted) return false;
    final focused = FocusManager.instance.primaryFocus?.context;
    return focused != null &&
        focused.findAncestorWidgetOfExactType<EditableText>() != null;
  }

  void _onRemoteDataChanged() {
    if (_isUserEditing()) return;
    _refreshAll();
  }

  Future<void> _addTaskFromHeader() async {
    final created = await showAddTaskDialog(
      context,
      allowNoClient: true,
      onCreated: _selectTask,
    );
    if (created) _refreshAll();
  }

  void _selectCompany(String id) {
    _workspace.selectCompany(id);
  }

  void _selectTask(CrmTask task) {
    _workspace.selectTask(task);
  }

  void _refreshAll() => _workspace.bump();

  Future<void> _openModules() async {
    final moduleId = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const ModulesScreen()),
    );
    if (moduleId != null) _workspace.goToModule(moduleId);
  }

  Future<void> _openSettings() async {
    final moduleId = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
    if (moduleId != null) _workspace.goToModule(moduleId);
  }

  @override
  Widget build(BuildContext context) {
    // Téléphone seulement → chrome mobile. iPad (même portrait) = layout Mac.
    final phone = CrmLayout.isPhone(context);
    final compactTablet = CrmLayout.isCompactTablet(context);
    final listWidth = compactTablet ? _listWidthCompact : _listWidth;
    return ListenableBuilder(
      listenable: _workspace,
      builder: (context, _) {
        final section = _workspace.section;
        final selectedId = _workspace.selectedCompanyId;
        final selectedTaskId = _workspace.selectedTaskId;
        final todayFullRecord = _workspace.todayFullRecord;

        // Mobile téléphone : liste OU fiche / panneau relance plein écran
        if (phone) {
          return _MobileShell(
            workspace: _workspace,
            onCommandPalette: () => showCommandPalette(context, _workspace, _refreshAll),
            onAddTask: _addTaskFromHeader,
            onRefresh: _refreshAll,
            onSettings: _openSettings,
            child: showTaskOverviewPanel(section, selectedTaskId, todayFullRecord)
                ? TodayActionPanel(
                    key: ValueKey(selectedTaskId),
                    taskId: selectedTaskId!,
                    workspace: _workspace,
                    onRefresh: _refreshAll,
                  )
                : _moduleScreen(_workspace.activeModuleId) ??
                    (selectedId != null
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
                      )),
          );
        }

        // Desktop / iPad : rail + liste (sauf pipeline / dashboard plein) + panneau droit
        final showList = _workspace.activeModuleId == null &&
            section != CrmSection.pipeline &&
            section != CrmSection.dashboard;
        // Aperçu tâche : Aujourd'hui ET liste Tâches (sinon clic = rien si pas de client).
        final showTodayAction = showTaskOverviewPanel(
          section,
          selectedTaskId,
          todayFullRecord,
        );
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
                    onSettings: _openSettings,
                  ),
                  ListenableBuilder(
                    listenable: _sync,
                    builder: (context, _) {
                      if (!_sync.credentialsIncomplete) return const SizedBox.shrink();
                      final l10n = AppLocalizations.of(context);
                      final scheme = Theme.of(context).colorScheme;
                      return Material(
                        color: scheme.errorContainer,
                        child: ListTile(
                          dense: true,
                          leading: Icon(Icons.cloud_off_outlined, color: scheme.onErrorContainer),
                          title: Text(
                            l10n.shellSyncNeedsPassword,
                            style: TextStyle(color: scheme.onErrorContainer, fontSize: 13),
                          ),
                          trailing: TextButton(
                            onPressed: _openSettings,
                            child: Text(l10n.shellSettingsLabel),
                          ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _IconRail(
                          width: _railWidth,
                          section: section,
                          activeModuleId: _workspace.activeModuleId,
                          onSection: (s) {
                            _workspace.goTo(s);
                            if (s == CrmSection.pipeline) _workspace.clearSelection();
                          },
                          onModule: _workspace.goToModule,
                          onCommandPalette: () => showCommandPalette(context, _workspace, _refreshAll),
                          onModules: _openModules,
                          onSettings: () async {
                            final moduleId = await Navigator.push<String>(
                              context,
                              MaterialPageRoute(builder: (_) => const SettingsScreen()),
                            );
                            if (moduleId != null) _workspace.goToModule(moduleId);
                          },
                        ),
                        if (showList) ...[
                          SizedBox(
                            width: listWidth,
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
                  const EmhkAppFooter(),
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

    if (workspace.activeModuleId != null) {
      return _moduleScreen(workspace.activeModuleId) ?? const SizedBox.shrink();
    }

    final selectedOpportunityId = workspace.selectedOpportunityId;
    if (selectedOpportunityId != null) {
      return OpportunityDetailScreen(
        key: ValueKey('opp-$selectedOpportunityId'),
        opportunityId: selectedOpportunityId,
        embedded: true,
        onClose: () => workspace.selectOpportunity(null),
      );
    }

    if (section == CrmSection.dashboard && !showTodayAction && !showSplitRecord) {
      return DashboardScreen(
        // Clé stable (comme `workspace-pipeline`) — ne PAS y coller
        // `workspace.version` : ça remontait le State à chaque sync et
        // faisait remonter le scroll en haut.
        key: const ValueKey('workspace-dashboard'),
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
                workspace: workspace,
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
        key: ValueKey('co-$selectedId-t-$selectedTaskId'),
        companyId: selectedId!,
        embedded: true,
        workspace: workspace,
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
          selectedTaskId: selectedTaskId,
          onSelectCompany: onSelectCompany,
          onSelectTask: onSelectTask,
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
    required this.activeModuleId,
    required this.onSection,
    required this.onModule,
    required this.onCommandPalette,
    required this.onModules,
    required this.onSettings,
  });

  final double width;
  final CrmSection section;
  final String? activeModuleId;
  final ValueChanged<CrmSection> onSection;
  final ValueChanged<String> onModule;
  final VoidCallback onCommandPalette;
  final VoidCallback onModules;
  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    return ListenableBuilder(
      listenable: ModuleRegistry.instance,
      builder: (context, _) {
        final l10n = AppLocalizations.of(context);
        // Agenda (calendrier) — pas « Today » / « Aujourd’hui ».
        final items = [
          (CrmSection.dashboard, Icons.dashboard_outlined, l10n.shellDashboard),
          (CrmSection.today, Icons.calendar_month_outlined, l10n.shellAgendaLabel),
          (CrmSection.clients, Icons.business_outlined, l10n.shellClientsLabel),
          (CrmSection.pipeline, Icons.view_kanban_outlined, l10n.pipelineTitle),
          (CrmSection.tasks, Icons.task_alt_outlined, l10n.shellTasksLabel),
        ];
        // Toutes les destinations module (ex. e-Invoicing + Produits).
        final moduleDests = ModuleRegistry.instance.navDestinations(context);
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
                label: l10n.shellSearch,
                expanded: true,
                selected: false,
                onTap: onCommandPalette,
              ),
              const Divider(height: 1, indent: 8, endIndent: 8),
              for (final item in items)
                _RailButton(
                  width: width,
                  icon: item.$2,
                  label: item.$3,
                  expanded: true,
                  selected: activeModuleId == null && section == item.$1,
                  onTap: () => onSection(item.$1),
                ),
              if (moduleDests.isNotEmpty) ...[
                const Divider(height: 1, indent: 8, endIndent: 8),
                for (final dest in moduleDests)
                  _RailButton(
                    width: width,
                    icon: dest.icon,
                    label: dest.title,
                    expanded: true,
                    selected: activeModuleId == dest.id,
                    onTap: () => onModule(dest.id),
                  ),
              ],
              const Spacer(),
              _RailButton(
                width: width,
                icon: Icons.extension_outlined,
                label: l10n.shellModulesLabel,
                expanded: true,
                selected: false,
                onTap: onModules,
              ),
              _RailButton(
                width: width,
                icon: Icons.settings_outlined,
                label: l10n.shellSettingsLabel,
                expanded: true,
                selected: false,
                onTap: onSettings,
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}

/// Écran module actif (e-Invoicing, Produits…).
Widget? _moduleScreen(String? moduleId) {
  switch (moduleId) {
    case 'invoicing':
      return const InvoicingHomeScreen();
    case 'invoicing_products':
      return const EiProductsScreen();
    default:
      return null;
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

/// Barre de nav mobile maison — remplace `NavigationBar` (Material) dont le
/// libellé (`Text` sans `maxLines`) casse sur 2 lignes pour les traductions
/// à plusieurs mots (ex. « Tableau de bord »), au lieu de tronquer avec « … ».
class _MobileNavItem {
  const _MobileNavItem(this.icon, this.label);
  final IconData icon;
  final String label;
}

class _MobileNavBar extends StatelessWidget {
  const _MobileNavBar({
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<_MobileNavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(border: Border(top: BorderSide(color: border))),
          child: Row(
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: _MobileNavButton(
                    item: items[i],
                    selected: i == selectedIndex,
                    onTap: () => onSelected(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileNavButton extends StatelessWidget {
  const _MobileNavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _MobileNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = selected ? scheme.primary : scheme.onSurfaceVariant;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: selected ? scheme.primary.withValues(alpha: 0.12) : null,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(item.icon, size: 22, color: color),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: color,
                ),
              ),
            ),
          ],
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
    required this.onSettings,
    required this.child,
  });

  final CrmWorkspaceState workspace;
  final VoidCallback onCommandPalette;
  final Future<void> Function() onAddTask;
  final VoidCallback onRefresh;
  final VoidCallback onSettings;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([workspace, RemoteCrmSyncService.instance]),
      builder: (context, _) {
        final l10n = AppLocalizations.of(context);
        final sync = RemoteCrmSyncService.instance;
        final hasTaskPanel = showTaskOverviewPanel(
          workspace.section,
          workspace.selectedTaskId,
          workspace.todayFullRecord,
        );
        final hasDetail = workspace.selectedCompanyId != null &&
            !hasTaskPanel;
        final hasTodayPanel = hasTaskPanel;
        final scheme = Theme.of(context).colorScheme;
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                CrmWorkspaceBanner(
                  compact: true,
                  leading: hasDetail || hasTodayPanel
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: workspace.clearSelection,
                        )
                      : null,
                  onAddTask: onAddTask,
                  onTaskCreated: onRefresh,
                  onSettings: onSettings,
                ),
                if (sync.credentialsIncomplete)
                  Material(
                    color: scheme.errorContainer,
                    child: ListTile(
                      dense: true,
                      leading: Icon(Icons.cloud_off_outlined, color: scheme.onErrorContainer),
                      title: Text(
                        l10n.shellSyncNeedsPassword,
                        style: TextStyle(color: scheme.onErrorContainer, fontSize: 13),
                      ),
                      trailing: TextButton(
                        onPressed: onSettings,
                        child: Text(l10n.shellSettingsLabel),
                      ),
                    ),
                  ),
                Expanded(child: child),
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const EmhkAppFooter(),
              if (!hasDetail && !hasTodayPanel)
                _MobileNavBar(
                  selectedIndex: workspace.section.index.clamp(0, 4),
                  onSelected: (i) => workspace.goTo(CrmSection.values[i]),
                  items: [
                    _MobileNavItem(Icons.dashboard_outlined, l10n.shellDashboard),
                    _MobileNavItem(Icons.calendar_month_outlined, l10n.shellAgendaLabel),
                    _MobileNavItem(Icons.business_outlined, l10n.shellClientsLabel),
                    _MobileNavItem(Icons.view_kanban_outlined, l10n.pipelineTitle),
                    _MobileNavItem(Icons.task_alt_outlined, l10n.shellTasksLabel),
                  ],
                ),
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
    final module = _moduleScreen(workspace.activeModuleId);
    if (module != null) return module;
    if (workspace.section == CrmSection.pipeline) {
      return PipelineBoard(workspace: workspace, onSelectCompany: onSelectCompany);
    }
    if (workspace.section == CrmSection.dashboard) {
      return DashboardScreen(
        key: const ValueKey('mobile-dashboard'),
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
