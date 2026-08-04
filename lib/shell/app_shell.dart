import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../l10n/gen/app_localizations.dart';
import '../core/modules/module_registry.dart';
import '../core/screens/modules_screen.dart';
import '../core/screens/settings_screen.dart';
import '../core/services/client_company_bridge.dart';
import '../core/services/company_logo_service.dart';
import '../core/services/remote_crm_sync_service.dart';
import '../core/utils/responsive_layout.dart';
import '../core/widgets/eastmark_logo.dart';
import '../platform/entitlement_service.dart';
import '../screens/clients/client_detail_screen.dart';
import '../screens/clients/client_editor_dialog.dart';
import '../screens/clients/clients_screen.dart';
import '../screens/agenda/agenda_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/tasks/task_detail_panel.dart';
import '../screens/tasks/task_editor_dialog.dart';
import '../screens/tasks/tasks_screen.dart';
import '../state/crm_state.dart';
import '../theme/crm_tokens.dart';

/// Shell — Agenda | Dashboard | Clients | Tâches | Modules actifs.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with WidgetsBindingObserver {
  final _state = CrmState();
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    RemoteCrmSyncService.instance.dataEpoch.addListener(_onRemoteDataChanged);
    _boot();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    RemoteCrmSyncService.instance.dataEpoch.removeListener(_onRemoteDataChanged);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(RemoteCrmSyncService.instance.syncBackgroundPull());
    }
  }

  void _onRemoteDataChanged() {
    unawaited(_state.load());
  }

  Future<void> _boot() async {
    await ModuleRegistry.instance.ensureInitialized();
    try {
      await ClientCompanyBridge.mirrorFromAppDatabase();
    } catch (e, st) {
      debugPrint('AppShell.mirror: $e\n$st');
    }
    await _state.load();
    RemoteCrmSyncService.instance.startAutoSync();
    if (mounted) setState(() => _ready = true);
  }

  Future<void> _createClient() async {
    final draft = _state.newClientDraft();
    final saved = await showClientEditor(context, client: draft);
    if (saved != null) await _state.saveClient(saved);
  }

  Future<void> _editClient() async {
    await editSelectedClient(context, _state);
  }

  Future<void> _createTask() async {
    final draft = _state.newTaskDraft(clientId: _state.selectedClientId);
    final saved = await showTaskEditor(
      context,
      task: draft,
      clients: _state.clients,
    );
    if (saved != null) {
      await _state.saveTask(saved);
      if (_state.section != AppSection.clients) {
        _state.go(AppSection.tasks);
      } else if (saved.clientId != null) {
        await _state.selectClient(saved.clientId);
      }
    }
  }

  Future<void> _openSettings() async {
    final moduleId = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
    await _state.load();
    if (moduleId != null && mounted) _state.goToModule(moduleId);
  }

  Future<void> _openModulesStore() async {
    final moduleId = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const ModulesScreen()),
    );
    if (moduleId != null && mounted) _state.goToModule(moduleId);
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return ListenableBuilder(
      listenable: Listenable.merge([
        _state,
        ModuleRegistry.instance,
        EntitlementService.instance,
      ]),
      builder: (context, _) {
        if (CrmLayout.isPhone(context)) {
          return _buildPhoneShell();
        }
        return _buildTabletOrDesktopShell();
      },
    );
  }

  /// UI téléphone — barre du bas, plein écran, pas de rail latéral.
  Widget _buildPhoneShell() {
    final l10n = AppLocalizations.of(context);
    final state = _state;
    final showingDetail = state.selectedTaskId != null ||
        (state.section == AppSection.clients && state.selectedClientId != null) ||
        state.activeModuleId != null;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: showingDetail
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (state.activeModuleId != null) {
                    state.go(state.section);
                  } else if (state.selectedTaskId != null) {
                    state.selectTask(null);
                  } else {
                    state.selectClient(null);
                  }
                },
              ),
              title: Text(
                state.activeModuleId != null
                    ? l10n.shellModuleTitle
                    : state.selectedTaskId != null
                        ? l10n.shellFollowupTitle
                        : (state.selectedClient?.name ?? l10n.shellClientTitle),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : AppBar(
              titleSpacing: 12,
              title: Row(
                children: [
                  const EastmarkWordmark(height: 22),
                  const Spacer(),
                  IconButton(
                    tooltip: l10n.shellModulesTooltip,
                    onPressed: _openModulesStore,
                    icon: const Icon(Icons.extension_outlined),
                  ),
                  IconButton(
                    tooltip: l10n.shellSettingsLabel,
                    onPressed: _openSettings,
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ],
              ),
            ),
      body: SafeArea(
        top: false,
        child: _buildPhoneBody(),
      ),
      bottomNavigationBar: showingDetail
          ? null
          : NavigationBar(
              selectedIndex: _phoneNavIndex(state.section),
              onDestinationSelected: (i) {
                state.go(switch (i) {
                  0 => AppSection.agenda,
                  1 => AppSection.dashboard,
                  2 => AppSection.clients,
                  _ => AppSection.tasks,
                });
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  selectedIcon: Icon(Icons.calendar_month),
                  label: l10n.shellAgendaLabel,
                ),
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: l10n.dashboardTitleEmbedded,
                ),
                NavigationDestination(
                  icon: Icon(Icons.business_outlined),
                  selectedIcon: Icon(Icons.business),
                  label: l10n.shellClientsLabel,
                ),
                NavigationDestination(
                  icon: Icon(Icons.task_alt_outlined),
                  selectedIcon: Icon(Icons.task_alt),
                  label: l10n.shellTasksLabel,
                ),
              ],
            ),
      floatingActionButton: showingDetail
          ? null
          : FloatingActionButton.extended(
              onPressed: state.section == AppSection.clients
                  ? _createClient
                  : _createTask,
              backgroundColor: CrmTokens.accent,
              foregroundColor: scheme.onPrimary,
              icon: const Icon(Icons.add),
              label: Text(
                state.section == AppSection.clients ? l10n.shellNewClient : l10n.shellNewFollowup,
              ),
            ),
    );
  }

  int _phoneNavIndex(AppSection section) => switch (section) {
        AppSection.agenda => 0,
        AppSection.dashboard => 1,
        AppSection.clients => 2,
        AppSection.tasks => 3,
      };

  Widget _buildPhoneBody() {
    final state = _state;
    final moduleBody = _moduleBody(state.activeModuleId);
    if (moduleBody != null) return moduleBody;

    if (state.selectedTaskId != null) {
      return TaskDetailPanel(state: state);
    }
    if (state.section == AppSection.clients && state.selectedClientId != null) {
      return ClientDetailScreen(
        state: state,
        onEditClient: _editClient,
        onNewTask: _createTask,
      );
    }
    return switch (state.section) {
      AppSection.agenda => AgendaScreen(state: state),
      AppSection.dashboard => DashboardScreen(state: state),
      AppSection.clients => ClientsScreen(state: state, onCreate: _createClient),
      AppSection.tasks => TasksScreen(state: state, onCreate: _createTask),
    };
  }

  /// iPad / desktop — rail latéral + split (inchangé).
  Widget _buildTabletOrDesktopShell() {
    final wide = CrmLayout.isDesktopSplit(context);
    final desktopChrome = !kIsWeb && (Platform.isMacOS || Platform.isWindows);
    return Scaffold(
      body: Column(
        children: [
          if (desktopChrome) const _DesktopTitleBar(),
          Expanded(
            child: Row(
              children: [
                _NavRail(
                  section: _state.section,
                  activeModuleId: _state.activeModuleId,
                  onSelect: _state.go,
                  onModule: _state.goToModule,
                  onNewTask: _createTask,
                  onNewClient: _createClient,
                  onSettings: _openSettings,
                  onBrowseModules: _openModulesStore,
                ),
                Expanded(
                  child: wide ? _buildDesktop() : _buildMobile(),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: wide || _state.activeModuleId != null
          ? null
          : FloatingActionButton(
              onPressed: _state.section == AppSection.clients
                  ? _createClient
                  : _createTask,
              child: const Icon(Icons.add),
            ),
    );
  }

  Widget _buildDesktop() {
    final l10n = AppLocalizations.of(context);
    final state = _state;

    // Module plein écran — destinations du registry (e-Invoicing, Produits…).
    final moduleBody = _moduleBody(state.activeModuleId);
    if (moduleBody != null) {
      return Material(child: moduleBody);
    }

    // Dashboard = vue pleine largeur (pas de panneau détail).
    if (state.section == AppSection.dashboard) {
      return Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: DashboardScreen(state: state),
      );
    }

    Widget listPanel = switch (state.section) {
      AppSection.agenda => AgendaScreen(state: state),
      AppSection.dashboard => const SizedBox.shrink(),
      AppSection.clients => ClientsScreen(
          state: state,
          onCreate: _createClient,
        ),
      AppSection.tasks => TasksScreen(
          state: state,
          onCreate: _createTask,
        ),
    };

    final Widget detail = switch (state.section) {
      AppSection.clients => ClientDetailScreen(
          state: state,
          onEditClient: _editClient,
          onNewTask: _createTask,
        ),
      AppSection.agenda || AppSection.tasks => state.selectedTaskId != null
          ? TaskDetailPanel(state: state)
          : Center(child: Text(l10n.tasksSelectPrompt)),
      AppSection.dashboard => const SizedBox.shrink(),
    };

    return Row(
      children: [
        SizedBox(
          width: state.section == AppSection.agenda
              ? 420
              : state.section == AppSection.clients
                  ? 380
                  : 340,
          child: Material(
            color: Theme.of(context).colorScheme.surface,
            child: listPanel,
          ),
        ),
        VerticalDivider(
          width: 1,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        Expanded(
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: detail,
          ),
        ),
      ],
    );
  }

  Widget? _moduleBody(String? id) {
    if (id == null) return null;
    for (final d in ModuleRegistry.instance.navDestinations(context)) {
      if (d.id == id) return d.builder(context);
    }
    return null;
  }

  Widget _buildMobile() {
    final l10n = AppLocalizations.of(context);
    final state = _state;
    final moduleBody = _moduleBody(state.activeModuleId);
    if (moduleBody != null) return moduleBody;
    if (state.selectedTaskId != null) {
      return TaskDetailPanel(state: state);
    }
    if (state.section == AppSection.clients && state.selectedClientId != null) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => state.selectClient(null),
              icon: const Icon(Icons.arrow_back),
              label: Text(l10n.shellClientsLabel),
            ),
          ),
          Expanded(
            child: ClientDetailScreen(
              state: state,
              onEditClient: _editClient,
              onNewTask: _createTask,
            ),
          ),
        ],
      );
    }
    return switch (state.section) {
      AppSection.agenda => AgendaScreen(state: state),
      AppSection.dashboard => DashboardScreen(state: state),
      AppSection.clients => ClientsScreen(state: state, onCreate: _createClient),
      AppSection.tasks => TasksScreen(state: state, onCreate: _createTask),
    };
  }
}

class _NavRail extends StatelessWidget {
  const _NavRail({
    required this.section,
    required this.activeModuleId,
    required this.onSelect,
    required this.onModule,
    required this.onNewTask,
    required this.onNewClient,
    required this.onSettings,
    required this.onBrowseModules,
  });

  final AppSection section;
  final String? activeModuleId;
  final ValueChanged<AppSection> onSelect;
  final ValueChanged<String> onModule;
  final VoidCallback onNewTask;
  final VoidCallback onNewClient;
  final VoidCallback onSettings;
  final VoidCallback onBrowseModules;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final activeModules = ModuleRegistry.instance.active;
    final l10n = AppLocalizations.of(context);

    return Container(
      width: 188,
      decoration: BoxDecoration(
        color: scheme.surface,
        border: Border(right: BorderSide(color: scheme.outlineVariant)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
            child: ListenableBuilder(
              listenable: CompanyLogoSettings.instance,
              builder: (context, _) {
                final logo = CompanyLogoSettings.instance.file;
                // Logo client agrandi, borné pour ne pas casser le rail.
                return Align(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 168,
                      maxHeight: 56,
                      minHeight: 36,
                    ),
                    child: logo != null
                        ? Image.file(
                            logo,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          )
                        : Icon(
                            Icons.apartment_outlined,
                            size: 36,
                            color: scheme.onSurfaceVariant.withValues(alpha: 0.45),
                          ),
                  ),
                );
              },
            ),
          ),
          _NavItem(
            icon: Icons.calendar_month_outlined,
            selectedIcon: Icons.calendar_month,
            label: l10n.shellAgendaLabel,
            selected: activeModuleId == null && section == AppSection.agenda,
            onTap: () => onSelect(AppSection.agenda),
          ),
          _NavItem(
            icon: Icons.dashboard_outlined,
            selectedIcon: Icons.dashboard,
            label: l10n.dashboardTitleEmbedded,
            selected: activeModuleId == null && section == AppSection.dashboard,
            onTap: () => onSelect(AppSection.dashboard),
          ),
          _NavItem(
            icon: Icons.business_outlined,
            selectedIcon: Icons.business,
            label: l10n.shellClientsLabel,
            selected: activeModuleId == null && section == AppSection.clients,
            onTap: () => onSelect(AppSection.clients),
          ),
          _NavItem(
            icon: Icons.task_alt_outlined,
            selectedIcon: Icons.task_alt,
            label: l10n.shellTasksLabel,
            selected: activeModuleId == null && section == AppSection.tasks,
            onTap: () => onSelect(AppSection.tasks),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton.icon(
                  onPressed: onNewTask,
                  icon: const Icon(Icons.add, size: 18),
                  label: Text(l10n.shellNewFollowup),
                ),
                const SizedBox(height: 8),
                // Sous « Suivi » : alignés à gauche (pas centrés).
                OutlinedButton.icon(
                  onPressed: onNewClient,
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                  ),
                  icon: const Icon(Icons.person_add_alt_1, size: 18),
                  label: Text(l10n.shellNewClient),
                ),
                const SizedBox(height: 4),
                if (activeModules.isNotEmpty) ...[
                  for (final dest
                      in ModuleRegistry.instance.navDestinations(context))
                    TextButton.icon(
                      onPressed: () => onModule(dest.id),
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                      ),
                      icon: Icon(dest.icon, size: 18),
                      label: Text(dest.title),
                    ),
                ],
                TextButton.icon(
                  onPressed: onBrowseModules,
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft,
                  ),
                  icon: const Icon(Icons.extension_outlined, size: 18),
                  label: Text(l10n.shellModulesLabel),
                ),
                TextButton.icon(
                  onPressed: onSettings,
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft,
                  ),
                  icon: const Icon(Icons.settings_outlined, size: 18),
                  label: Text(l10n.shellSettingsLabel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Barre fenêtre — logo EastmarkHK centré ; laisse la place aux boutons
/// système (●●● macOS à gauche, caption Windows à droite).
class _DesktopTitleBar extends StatelessWidget {
  const _DesktopTitleBar();

  static bool get _isMac => !kIsWeb && Platform.isMacOS;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // macOS traffic lights ~78 px ; Windows caption buttons ~138 px.
    final leadingPad = _isMac ? 78.0 : 12.0;
    final trailingPad = _isMac ? 12.0 : 138.0;
    final height = _isMac ? 52.0 : 40.0;

    return DragToMoveArea(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: scheme.surface,
          border: Border(
            bottom: BorderSide(color: scheme.outlineVariant),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Centrage vrai sur toute la largeur fenêtre (pas le contenu restant).
            const IgnorePointer(
              child: EastmarkWordmark(height: 30),
            ),
            // Zones latérales pour ne pas chevaucher les boutons OS.
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: leadingPad,
              child: const SizedBox.expand(),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: trailingPad,
              child: const SizedBox.expand(),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Material(
        color: selected ? CrmTokens.accentMuted : Colors.transparent,
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Icon(
                  selected ? selectedIcon : icon,
                  size: 20,
                  color: selected ? CrmTokens.accent : scheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                      color: selected ? CrmTokens.accent : scheme.onSurface,
                    ),
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
