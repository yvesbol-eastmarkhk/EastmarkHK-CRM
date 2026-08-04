import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../state/crm_workspace_state.dart';
import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../modules/crm_module.dart';
import '../modules/module_registry.dart';
import '../../modules/invoicing/invoicing_module.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../screens/company_detail_screen.dart';
import '../screens/tasks_screen.dart';
import '../utils/activity_labels.dart';

/// Palette de commandes ⌘K — naviguer, créer, rechercher (Linear-style).
Future<void> showCommandPalette(
  BuildContext context,
  CrmWorkspaceState workspace,
  VoidCallback onRefresh,
) {
  return showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    builder: (_) => _CommandPalette(workspace: workspace, onRefresh: onRefresh),
  );
}

class _CommandPalette extends StatefulWidget {
  const _CommandPalette({required this.workspace, required this.onRefresh});

  final CrmWorkspaceState workspace;
  final VoidCallback onRefresh;

  @override
  State<_CommandPalette> createState() => _CommandPaletteState();
}

class _CommandPaletteState extends State<_CommandPalette> {
  final _query = TextEditingController();
  List<Company> _companies = [];
  List<Contact> _contacts = [];
  List<Opportunity> _opportunities = [];
  List<CrmTask> _tasks = [];
  List<Activity> _activities = [];
  List<ModuleSearchHit> _moduleHits = [];

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  Future<void> _search(String q) async {
    if (q.trim().isEmpty) {
      setState(() {
        _companies = [];
        _contacts = [];
        _opportunities = [];
        _tasks = [];
        _activities = [];
        _moduleHits = [];
      });
      return;
    }
    final db = AppDatabase.instance;
    final companies = await db.companies(search: q);
    final contacts = await db.contacts(search: q);
    final opps = await db.searchOpportunities(q);
    final tasks = await db.searchTasks(q);
    final activities = await db.searchActivities(q);
    if (!mounted) return;
    final moduleHits = await ModuleRegistry.instance.searchAll(context, q);
    if (!mounted) return;
    setState(() {
      _companies = companies.take(6).toList();
      _contacts = contacts.take(6).toList();
      _opportunities = opps.take(6).toList();
      _tasks = tasks.take(6).toList();
      _activities = activities.take(6).toList();
      _moduleHits = moduleHits.take(6).toList();
    });
  }

  void _close() => Navigator.of(context, rootNavigator: true).pop();

  void _go(CrmSection section, {String? companyId}) {
    _close();
    widget.workspace.goTo(section);
    if (companyId != null) widget.workspace.selectCompany(companyId);
  }

  Future<void> _newClient() async {
    _close();
    final now = nowIso();
    final draft = Company(
      id: AppDatabase.newId(),
      name: '',
      createdAt: now,
      updatedAt: now,
    );
    if (!context.mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => CompanyEditorDialog(company: draft, isNew: true),
    );
    if (ok == true) {
      widget.onRefresh();
      widget.workspace.goTo(CrmSection.clients);
      widget.workspace.selectCompany(draft.id);
    }
  }

  Future<void> _newTask() async {
    _close();
    final created = await showAddTaskDialog(
      context,
      companyId: widget.workspace.selectedCompanyId,
      allowNoClient: true,
    );
    if (created) {
      widget.onRefresh();
      widget.workspace.goTo(CrmSection.tasks);
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = _query.text.trim();
    final hasSearch = q.isNotEmpty;
    final l10n = AppLocalizations.of(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 72),
        child: Material(
          color: Theme.of(context).colorScheme.surface,
          elevation: 12,
          shadowColor: Colors.black.withValues(alpha: 0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CrmTokens.radiusLg),
            side: BorderSide(color: Theme.of(context).crmBorder),
          ),
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560, maxHeight: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: _query,
                    autofocus: true,
                    onChanged: _search,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, size: 18),
                      hintText: l10n.cmdSearchHint,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      filled: false,
                    ),
                  ),
                ),
                const Divider(height: 1),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      if (!hasSearch) ...[
                        _section(l10n.cmdSectionNavigation),
                        _action(Icons.dashboard_outlined, l10n.cmdGoDashboard, () => _go(CrmSection.dashboard)),
                        _action(Icons.wb_sunny_outlined, l10n.cmdGoToday, () => _go(CrmSection.today)),
                        _action(Icons.business_outlined, l10n.cmdGoClients, () => _go(CrmSection.clients)),
                        _action(Icons.view_kanban_outlined, l10n.cmdGoPipeline, () => _go(CrmSection.pipeline)),
                        _action(Icons.check_circle_outline, l10n.cmdGoTasks, () => _go(CrmSection.tasks)),
                        _section(l10n.cmdSectionCreate),
                        _action(Icons.add_business_outlined, l10n.cmdNewClient, _newClient),
                        _action(Icons.add_task_outlined, l10n.cmdNewTask, _newTask),
                      ],
                      if (hasSearch && _companies.isNotEmpty) ...[
                        _section(l10n.cmdSectionClients),
                        for (final c in _companies)
                          _action(Icons.business_outlined, c.name, () => _go(CrmSection.clients, companyId: c.id)),
                      ],
                      if (hasSearch && _contacts.isNotEmpty) ...[
                        _section(l10n.cmdSectionContacts),
                        for (final p in _contacts)
                          _action(
                            Icons.person_outline,
                            p.displayName.isEmpty ? l10n.cmdNoName : p.displayName,
                            () {
                              if (p.companyId != null) _go(CrmSection.clients, companyId: p.companyId);
                            },
                          ),
                      ],
                      if (hasSearch && _opportunities.isNotEmpty) ...[
                        _section(l10n.cmdSectionOpportunities),
                        for (final o in _opportunities)
                          _action(Icons.trending_up, o.title, () {
                            if (o.companyId != null) {
                              _go(CrmSection.clients, companyId: o.companyId);
                            } else {
                              _go(CrmSection.pipeline);
                            }
                          }),
                      ],
                      if (hasSearch && _tasks.isNotEmpty) ...[
                        _section(l10n.cmdSectionTasks),
                        for (final t in _tasks)
                          _action(Icons.check_circle_outline, t.title, () {
                            if (t.companyId != null) {
                              _go(CrmSection.clients, companyId: t.companyId);
                            } else {
                              _go(CrmSection.tasks);
                            }
                          }),
                      ],
                      if (hasSearch && _activities.isNotEmpty) ...[
                        _section(l10n.cmdSectionNotes),
                        for (final a in _activities)
                          _action(
                            Icons.sticky_note_2_outlined,
                            (a.body != null && a.body!.isNotEmpty)
                                ? a.body!
                                : localizedActivityTitle(
                                    AppLocalizations.of(context), a.title),
                            () {
                              if (a.companyId != null) _go(CrmSection.clients, companyId: a.companyId);
                            },
                          ),
                      ],
                      if (hasSearch && _moduleHits.isNotEmpty) ...[
                        _section(InvoicingModule.displayName),
                        for (final h in _moduleHits)
                          _action(h.icon, '${h.title} — ${h.subtitle}', () {
                            _close();
                            h.onOpen();
                          }),
                      ],
                      if (hasSearch &&
                          _companies.isEmpty &&
                          _contacts.isEmpty &&
                          _opportunities.isEmpty &&
                          _tasks.isEmpty &&
                          _activities.isEmpty &&
                          _moduleHits.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(l10n.cmdNoResults),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _section(String label) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
        child: Text(label.toUpperCase(), style: Theme.of(context).textTheme.labelSmall),
      );

  Widget _action(IconData icon, String label, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        dense: true,
        leading: Icon(icon, size: 18),
        title: Text(label, style: const TextStyle(fontSize: CrmTokens.bodySize)),
        onTap: onTap,
      ),
    );
  }
}
