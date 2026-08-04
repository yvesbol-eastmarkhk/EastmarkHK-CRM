import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../data/countries.dart';
import '../data/messaging_platforms.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../modules/module_registry.dart';
import '../services/pipeline_settings.dart';
import '../utils/formatters.dart';
import '../utils/phone_formatter.dart';
import '../utils/responsive_form.dart';
import '../utils/task_display.dart';
import '../widgets/country_flag_icon.dart';
import '../widgets/country_picker_field.dart';
import '../widgets/dictation_field.dart';
import '../widgets/log_interaction_sheet.dart';
import '../widgets/party_address_fields.dart';
import '../widgets/task_done_toggle.dart';
import '../../platform/desktop_chrome.dart';
import '../../state/crm_workspace_state.dart';
import '../../widgets/messaging_brand_badge.dart';
import 'opportunity_detail_screen.dart';
import 'opportunity_dialog.dart';
import 'tasks_screen.dart';

/// Fiche client — panneau droit du workspace (Attio) ou écran plein (mobile).
class CompanyDetailScreen extends StatefulWidget {
  const CompanyDetailScreen({
    super.key,
    required this.companyId,
    this.embedded = false,
    this.workspace,
    this.onDeleted,
    this.onUpdated,
  });

  final String companyId;
  final bool embedded;
  /// Quand fourni (fiche affichée dans le workspace), les affaires
  /// s'ouvrent dans le panneau détail au lieu d'être poussées en plein écran.
  final CrmWorkspaceState? workspace;
  final VoidCallback? onDeleted;
  final VoidCallback? onUpdated;

  @override
  State<CompanyDetailScreen> createState() => _CompanyDetailScreenState();
}

/// Le nom du client ressort en couleur de marque EastmarkHK, celui de
/// chaque contact en fuchsia — deux repères visuels distincts pour se
/// retrouver d'un coup d'œil sur une fiche dense.
const _contactNameColor = Color(0xFFC2158D);

class _CompanyDetailScreenState extends State<CompanyDetailScreen> with SingleTickerProviderStateMixin {
  Company? _company;
  List<Contact> _contacts = [];
  List<Activity> _activities = [];
  List<CrmTask> _tasks = [];
  List<Opportunity> _opportunities = [];
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CompanyDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.companyId != widget.companyId) _load();
  }

  Future<void> _load() async {
    final db = AppDatabase.instance;
    final company = await db.companyById(widget.companyId);
    final contacts = await db.contacts(companyId: widget.companyId);
    final activities = await db.activities(companyId: widget.companyId);
    final tasks = await db.tasks(companyId: widget.companyId);
    final opportunities = await db.opportunities(companyId: widget.companyId);
    if (!mounted) return;
    setState(() {
      _company = company;
      _contacts = contacts;
      _activities = activities;
      _tasks = tasks;
      _opportunities = opportunities;
    });
    widget.onUpdated?.call();
  }

  Future<void> _addOrEditOpportunity({Opportunity? existing}) async {
    final saved = await showOpportunityDialog(
      context,
      companyId: widget.companyId,
      existing: existing,
    );
    if (saved) await _load();
  }

  Future<void> _addNote() async {
    final l10n = AppLocalizations.of(context);
    final body = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.companyNewNoteTitle),
        content: SizedBox(
          width: 560,
          child: DictationField(
              controller: body, label: l10n.companyNoteFieldLabel, maxLines: 5, autofocus: true),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.commonAdd)),
        ],
      ),
    );
    if (ok != true || body.text.trim().isEmpty) return;
    final now = nowIso();
    await AppDatabase.instance.upsertActivity(Activity(
      id: AppDatabase.newId(),
      companyId: widget.companyId,
      title: 'Note',
      body: body.text.trim(),
      happenedAt: now,
      createdAt: now,
      updatedAt: now,
    ));
    await _load();
  }

  Future<void> _addOrEditContact({Contact? existing}) async {
    final isNew = existing == null;
    final contact = existing ??
        Contact(
          id: AppDatabase.newId(),
          companyId: widget.companyId,
          createdAt: nowIso(),
          updatedAt: nowIso(),
        );
    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => _ContactEditorDialog(
        contact: contact,
        companyCountry: _company?.country,
        isNew: isNew,
      ),
    );
    if (saved == true) await _load();
  }

  /// Ligne de contact — rôle/email/téléphone puis, sur la même ligne (il y a
  /// la place), les canaux de messagerie juste après le téléphone plutôt que
  /// sur une ligne à part en dessous.
  Widget _contactTile(Contact p) {
    final l10n = AppLocalizations.of(context);
    final channels = decodeMessagingChannels(p.messagingJson);
    final infoText = [
      if (p.role != null) p.role!,
      if (p.email != null) p.email!,
      if (p.phone != null) p.phone!,
    ].join(' · ');
    return ListTile(
      dense: true,
      onTap: () => _viewContact(p),
      leading: const Icon(Icons.person_outline),
      title: Text(
        p.displayName.isEmpty ? l10n.commonNoName : p.displayName,
        style: const TextStyle(color: _contactNameColor, fontWeight: FontWeight.w600),
      ),
      subtitle: channels.isEmpty
          ? (infoText.isEmpty ? null : Text(infoText))
          : Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (infoText.isNotEmpty) Text(infoText),
                  for (final ch in channels) _MessagingChip(channel: ch),
                ],
              ),
            ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: l10n.commonEdit,
            icon: const Icon(Icons.edit_outlined, size: 18, color: Color(0xFF2563EB)),
            onPressed: () => _addOrEditContact(existing: p),
          ),
          IconButton(
            tooltip: l10n.commonDelete,
            icon: const Icon(Icons.delete_outline, size: 18, color: Color(0xFFDC2626)),
            onPressed: () => _deleteContact(p),
          ),
        ],
      ),
    );
  }

  Future<void> _viewContact(Contact p) async {
    final action = await showDialog<String>(
      context: context,
      builder: (_) => _ContactViewerDialog(contact: p),
    );
    if (action == 'edit') await _addOrEditContact(existing: p);
    if (action == 'delete') await _deleteContact(p);
  }

  Future<void> _deleteContact(Contact p) async {
    final ok = await _confirmDelete(AppLocalizations.of(context).companyDeleteContactConfirm, p.displayName);
    if (ok != true) return;
    await AppDatabase.instance.softDeleteContact(p.id);
    await _load();
  }

  Future<void> _addTask() async {
    final created = await showAddTaskDialog(context, companyId: widget.companyId);
    if (created) await _load();
  }

  Future<void> _editCompany() async {
    if (_company == null) return;
    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => CompanyEditorDialog(company: _company!),
    );
    if (saved == true) await _load();
  }

  Future<void> _deleteCompany() async {
    if (_company == null) return;
    final l10n = AppLocalizations.of(context);
    final ok = await _confirmDelete(l10n.companyDeleteConfirmTitle,
        l10n.companyDeleteConfirmDetail(_company!.name));
    if (ok != true) return;
    await AppDatabase.instance.softDeleteCompany(_company!.id);
    if (!mounted) return;
    if (widget.embedded) {
      widget.onDeleted?.call();
    } else {
      Navigator.pop(context);
    }
  }

  Future<bool?> _confirmDelete(String title, String detail) {
    final l10n = AppLocalizations.of(context);
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(detail),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
          FilledButton.tonal(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.commonDelete)),
        ],
      ),
    );
  }

  String _companySummaryLine(Company c) {
    final addr = decodeCompanyAddress(c.addressJson);
    final parts = [
      if ((addr['city'] ?? '').isNotEmpty) addr['city']!,
      if (c.country != null && c.country!.isNotEmpty) c.country!,
      if (c.vatNumber != null && c.vatNumber!.isNotEmpty) c.vatNumber!,
      if ((addr['phone'] ?? '').isNotEmpty) addr['phone']!,
    ];
    return parts.join(' · ');
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

  Widget _buildEmbeddedHeader(Company c) {
    final l10n = AppLocalizations.of(context);
    final border = Theme.of(context).crmBorder;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 12, 0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(c.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: -0.4)),
                    if (_companySummaryLine(c).isNotEmpty)
                      Text(
                        _companySummaryLine(c),
                        style: TextStyle(fontSize: CrmTokens.bodySize, color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    if (c.website != null && c.website!.isNotEmpty)
                      Text(c.website!, style: TextStyle(fontSize: CrmTokens.bodySize, color: Theme.of(context).colorScheme.primary)),
                    if (c.peppolId != null && c.peppolId!.isNotEmpty)
                      Text(l10n.companyPeppolPrefix(c.peppolId!), style: TextStyle(fontSize: CrmTokens.captionSize, color: Theme.of(context).colorScheme.onSurfaceVariant)),
                    if (c.tags.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: [
                            for (final t in c.tags)
                              Chip(label: Text(t), visualDensity: VisualDensity.compact, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: _addNote,
                icon: const Icon(Icons.mic, size: 16),
                label: Text(l10n.companyNoteButtonLabel),
                style: FilledButton.styleFrom(minimumSize: const Size(0, 32)),
              ),
              IconButton(
                tooltip: l10n.commonEdit,
                onPressed: _editCompany,
                icon: const Icon(Icons.edit_outlined, size: 18, color: CrmTokens.accent),
              ),
              IconButton(
                tooltip: l10n.commonDelete,
                onPressed: _deleteCompany,
                icon: const Icon(Icons.delete_outline, size: 18, color: CrmTokens.overdue),
              ),
            ],
          ),
          TabBar(
            controller: _tabs,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: l10n.companyTabOverview),
              Tab(text: l10n.companyTabActivity),
              Tab(text: l10n.companyTabTasks),
              Tab(text: l10n.companyTabDeals),
            ],
          ),
        ],
      ),
    );
  }

  Widget _scrollTab(Widget child) => SelectionArea(
        child: ListView(padding: const EdgeInsets.all(16), children: [child]),
      );

  /// Séparateur entre sections de l'onglet Overview (Contacts / Tâches /
  /// Opportunités / e-Invoicing) — volontairement plus marqué qu'un
  /// [Divider] standard pour que la fin d'une section et le début de la
  /// suivante soient nets d'un coup d'œil.
  Widget get _sectionDivider => Container(
        height: 1,
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.7),
      );

  Widget _buildOverviewTab(Company c) => _scrollTab(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(AppLocalizations.of(context).companyContactsTitle, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              IconButton(onPressed: () => _addOrEditContact(), icon: const Icon(Icons.person_add_outlined)),
            ],
          ),
          if (_contacts.isEmpty)
            Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text(AppLocalizations.of(context).companyNoContacts))
          else
            for (final p in _contacts) _contactTile(p),
          const SizedBox(height: 16),
          _sectionDivider,
          const SizedBox(height: 16),
          Row(
            children: [
              Text(AppLocalizations.of(context).clientNotesSection, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              TextButton(onPressed: () => _tabs.animateTo(1), child: Text(AppLocalizations.of(context).commonSeeAll)),
              IconButton(onPressed: _addNote, icon: const Icon(Icons.mic_none_outlined)),
            ],
          ),
          if (_notesPreview.isEmpty)
            Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text(AppLocalizations.of(context).companyNoActivity))
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                ),
                child: Column(
                  children: [
                    for (var i = 0; i < _notesPreview.length; i++) _activityTile(_notesPreview[i], i),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 16),
          _sectionDivider,
          const SizedBox(height: 16),
          Row(
            children: [
              Text(AppLocalizations.of(context).companyTabTasks, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              TextButton(onPressed: () => _tabs.animateTo(2), child: Text(AppLocalizations.of(context).commonSeeAll)),
              IconButton(onPressed: _addTask, icon: const Icon(Icons.add_task_outlined)),
            ],
          ),
          if (_openTasksPreview.isEmpty)
            Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text(AppLocalizations.of(context).companyNoTasks))
          else
            for (final t in _openTasksPreview) _taskTile(t),
          const SizedBox(height: 16),
          _sectionDivider,
          const SizedBox(height: 16),
          Row(
            children: [
              Text(AppLocalizations.of(context).companyTabDeals, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              TextButton(onPressed: () => _tabs.animateTo(3), child: Text(AppLocalizations.of(context).commonSeeAll)),
              IconButton(onPressed: () => _addOrEditOpportunity(), icon: const Icon(Icons.add_business_outlined)),
            ],
          ),
          if (_openOpportunitiesPreview.isEmpty)
            Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text(AppLocalizations.of(context).companyNoDeals))
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                ),
                child: Column(
                  children: [
                    for (var i = 0; i < _openOpportunitiesPreview.length; i++)
                      _opportunityTile(_openOpportunitiesPreview[i], i),
                  ],
                ),
              ),
            ),
          if (ModuleRegistry.instance.isUsedInCrm('invoicing')) ...[
            const SizedBox(height: 16),
            _sectionDivider,
            const SizedBox(height: 16),
            ...ModuleRegistry.instance.byId('invoicing')!.customerSections(
                  context,
                  c.id,
                  _load,
                ),
          ],
        ],
      ));

  /// Dernières notes (dictées ou écrites) — aperçu limité pour l'onglet Overview.
  List<Activity> get _notesPreview {
    final notes = _activities.where((a) => a.type == ActivityType.note).toList()
      ..sort((a, b) => b.happenedAt.compareTo(a.happenedAt));
    return notes.take(3).toList();
  }

  /// Tâches ouvertes (non faites), triées par échéance — aperçu limité pour l'onglet Overview.
  List<CrmTask> get _openTasksPreview {
    final open = _tasks.where((t) => !t.isDone).toList()
      ..sort((a, b) {
        final ad = a.dueDate;
        final bd = b.dueDate;
        if (ad == null && bd == null) return 0;
        if (ad == null) return 1;
        if (bd == null) return -1;
        return ad.compareTo(bd);
      });
    return open.take(5).toList();
  }

  /// Opportunités ouvertes (non gagnées/perdues) — aperçu limité pour l'onglet Overview.
  List<Opportunity> get _openOpportunitiesPreview {
    final open = _opportunities.where((o) => o.stage != 'won' && o.stage != 'lost').toList();
    return open.take(5).toList();
  }

  Widget _buildActivityTab() => _scrollTab(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_activities.isEmpty)
            Text(AppLocalizations.of(context).companyNoActivity)
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                ),
                child: Column(
                  children: [
                    for (var i = 0; i < _activities.length; i++) _activityTile(_activities[i], i),
                  ],
                ),
              ),
            ),
        ],
      ));

  /// Fond alterné (façon grille) — même repère visuel que la liste d'affaires.
  Widget _activityTile(Activity a, int index) {
    final scheme = Theme.of(context).colorScheme;
    final editable = a.type != ActivityType.moduleEvent;
    final stripe = index.isEven ? scheme.surface : scheme.surfaceContainerLow;
    return Material(
      color: stripe,
      child: ListTile(
        dense: true,
        leading: Icon(_activityIcon(a.type), size: 18),
        title: SelectableText(a.body ?? a.title),
        subtitle: Text(formatDateTimeFr(a.happenedAt)),
        trailing: editable ? const Icon(Icons.chevron_right, size: 18) : null,
        onTap: editable ? () => _editActivity(a) : null,
      ),
    );
  }

  /// Édition complète d'une activité existante (type, texte, suppression)
  /// — les entrées générées automatiquement par un module (`moduleEvent`,
  /// ex. devis créé dans e-Invoicing) restent en lecture seule.
  Future<void> _editActivity(Activity a) async {
    final changed = await showEditActivityDialog(context, a);
    if (changed) await _load();
  }

  Widget _buildTasksTab() => _scrollTab(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(AppLocalizations.of(context).companyTabTasks, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              IconButton(onPressed: _addTask, icon: const Icon(Icons.add_task_outlined)),
            ],
          ),
          if (_tasks.isEmpty)
            Text(AppLocalizations.of(context).companyNoTasks)
          else
            for (final t in _tasks) _taskTile(t),
        ],
      ));

  Widget _taskTile(CrmTask t) {
    Future<void> toggle(bool v) async {
      t.doneAt = v ? nowIso() : null;
      await AppDatabase.instance.upsertTask(t);
      await _load();
    }

    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () => toggle(!t.isDone),
      leading: TaskDoneToggle(done: t.isDone, onChanged: toggle),
      title: Text(
        taskMessage(t),
        style: t.isDone ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      subtitle: t.dueDate == null
          ? null
          : Text(formatDateFr(t.dueDate),
              style: TextStyle(color: AppTheme.dueDateColor(t.dueDate, done: t.isDone, neutral: Theme.of(context).colorScheme.onSurfaceVariant))),
      trailing: IconButton(
        tooltip: 'Modifier',
        icon: const Icon(Icons.edit_outlined, size: 20, color: CrmTokens.accent),
        onPressed: () async {
          final changed = await showAddTaskDialog(
            context,
            companyId: widget.companyId,
            existing: t,
          );
          if (changed) await _load();
        },
      ),
    );
  }

  Widget _buildDealsTab() => _scrollTab(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(AppLocalizations.of(context).companyTabDeals, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              IconButton(onPressed: () => _addOrEditOpportunity(), icon: const Icon(Icons.add_business_outlined)),
            ],
          ),
          if (_opportunities.isEmpty)
            Text(AppLocalizations.of(context).companyNoDeals)
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                ),
                child: Column(
                  children: [
                    for (var i = 0; i < _opportunities.length; i++)
                      _opportunityTile(_opportunities[i], i),
                  ],
                ),
              ),
            ),
        ],
      ));

  Widget _opportunityTile(Opportunity o, int index) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final stripe = index.isEven ? scheme.surface : scheme.surfaceContainerLow;
    return Material(
      color: stripe,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: Icon(Icons.trending_up_outlined, color: AppTheme.stageColors[o.stage]),
        title: Text(o.title),
        subtitle: Text(
          '${PipelineSettings.instance.labelFor(o.stage)}${o.amount != null ? ' · ${formatAmount(o.amount)}' : ''}',
        ),
        trailing: IconButton(
          tooltip: l10n.commonEdit,
          icon: const Icon(Icons.edit_outlined, size: 18, color: CrmTokens.accent),
          onPressed: () => _addOrEditOpportunity(existing: o),
        ),
        onTap: () async {
          if (widget.workspace != null) {
            widget.workspace!.selectOpportunity(o.id);
            return;
          }
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => OpportunityDetailScreen(opportunityId: o.id)),
          );
          if (mounted) _load();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = _company;
    if (c == null) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    if (widget.embedded) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildEmbeddedHeader(c),
          Expanded(
            child: TabBarView(
              controller: _tabs,
              children: [
                _buildOverviewTab(c),
                _buildActivityTab(),
                _buildTasksTab(),
                _buildDealsTab(),
              ],
            ),
          ),
        ],
      );
    }

    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: DesktopChrome.appBarLeadingWidth,
        leading: DesktopChrome.backLeading(context),
        title: Text(c.name),
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: [
            Tab(text: l10n.companyTabOverview),
            Tab(text: l10n.companyTabActivity),
            Tab(text: l10n.companyTabTasks),
            Tab(text: l10n.companyTabDeals),
          ],
        ),
        actions: [
          IconButton(tooltip: l10n.companyNoteButtonLabel, onPressed: _addNote, icon: const Icon(Icons.mic_none_outlined)),
          IconButton(tooltip: l10n.commonEdit, onPressed: _editCompany, icon: const Icon(Icons.edit_outlined, color: CrmTokens.accent)),
        ],
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          _buildOverviewTab(c),
          _buildActivityTab(),
          _buildTasksTab(),
          _buildDealsTab(),
        ],
      ),
    );
  }
}

/// L'adresse d'un client (pays, CP, ville, téléphone…) est stockée en JSON
/// dans `Company.addressJson` — le pays et le n° TVA/CNPJ ont leurs propres
/// colonnes. Décodage tolérant : renvoie une map vide si absent/invalide.
Map<String, String> decodeCompanyAddress(String? json) {
  if (json == null || json.isEmpty) return {};
  try {
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    return decoded.map((k, v) => MapEntry(k, (v ?? '').toString()));
  } catch (_) {
    return {};
  }
}

/// Édition complète du client : identité, pays, TVA/CNPJ, adresse,
/// téléphone, email — même moteur que le profil société des Réglages
/// (PartyAddressFields). Réutilisé pour la création ET l'édition d'un
/// client, afin que le premier écran de saisie propose déjà tous les
/// champs (pays, TVA/CNPJ, adresse, téléphone) plutôt qu'un simple nom.
class CompanyEditorDialog extends StatefulWidget {
  const CompanyEditorDialog({super.key, required this.company, this.isNew = false});

  final Company company;
  final bool isNew;

  @override
  State<CompanyEditorDialog> createState() => _CompanyEditorDialogState();
}

class _CompanyEditorDialogState extends State<CompanyEditorDialog> {
  late final _name = TextEditingController(text: widget.company.name);
  late final _notes = TextEditingController(text: widget.company.notes ?? '');
  late final _website = TextEditingController(text: widget.company.website ?? '');
  late final _peppol = TextEditingController(text: widget.company.peppolId ?? '');
  late final _tags = TextEditingController(text: widget.company.tags.join(', '));
  late final Map<String, String> _addr = decodeCompanyAddress(widget.company.addressJson);

  // Pas de pays par défaut : un client peut être n'importe où dans le
  // monde, imposer la Belgique (pays de la société elle-même) n'a pas de
  // sens ici — l'utilisateur choisit explicitement via le sélecteur pays.
  late String _country = widget.company.country ?? '';
  late String _taxId = widget.company.vatNumber ?? '';
  late String _address = _addr['address'] ?? '';
  late String _district = _addr['district'] ?? '';
  late String _zip = _addr['zip'] ?? '';
  late String _city = _addr['city'] ?? '';
  late String _state = _addr['state'] ?? '';
  late String _phone = _addr['phone'] ?? '';
  late String _phoneCountry = _addr['phoneCountry'] ?? '';
  late String _email = _addr['email'] ?? '';

  Future<void> _save() async {
    if (_name.text.trim().isEmpty) return;
    final c = widget.company;
    c.name = _name.text.trim();
    c.notes = _notes.text.trim().isEmpty ? null : _notes.text.trim();
    c.website = _website.text.trim().isEmpty ? null : _website.text.trim();
    c.peppolId = _peppol.text.trim().isEmpty ? null : _peppol.text.trim();
    c.tags = _tags.text
        .split(',')
        .map((t) => t.trim())
        .where((t) => t.isNotEmpty)
        .toList();
    c.country = _country;
    c.vatNumber = _taxId.trim().isEmpty ? null : _taxId.trim();
    c.addressJson = jsonEncode({
      'address': _address,
      'district': _district,
      'zip': _zip,
      'city': _city,
      'state': _state,
      'phone': _phone,
      'phoneCountry': _phoneCountry,
      'email': _email,
    });
    await AppDatabase.instance.upsertCompany(c);
    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    // Assez large pour que la ligne CP/Bairro/État/Ville (PartyAddressFields)
    // ait la place de respirer plutôt que d'écraser 4 champs sur 680px —
    // tout en restant contenu sur un petit écran (90% de la largeur dispo).
    final l10n = AppLocalizations.of(context);
    final dialogWidth = math.min(820.0, MediaQuery.sizeOf(context).width * 0.9);
    return AlertDialog(
      title: Text(widget.isNew ? l10n.companyNewClientTitle : l10n.companyEditClientTitle),
      content: SizedBox(
        width: dialogWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PartyAddressFields(
                name: DictationField(controller: _name, label: l10n.commonCompanyNameLabel, autofocus: true),
                countryCode: _country,
                taxId: _taxId,
                address: _address,
                district: _district,
                zip: _zip,
                city: _city,
                state: _state,
                phone: _phone,
                phoneCountryCode: _phoneCountry,
                email: _email,
                onCountryChanged: (v) => setState(() => _country = v),
                onTaxIdChanged: (v) => _taxId = v,
                onAddressChanged: (v) => _address = v,
                onDistrictChanged: (v) => _district = v,
                onZipChanged: (v) => _zip = v,
                onCityChanged: (v) => _city = v,
                onStateChanged: (v) => _state = v,
                onPhoneChanged: (v) => _phone = v,
                onPhoneCountryChanged: (v) => setState(() => _phoneCountry = v),
                onEmailChanged: (v) => _email = v,
              ),
              const SizedBox(height: 12),
              formRowOrColumn(
                context: context,
                compact: dialogWidth < 640,
                children: [
                  formFlexChild(
                    context: context,
                    compact: dialogWidth < 640,
                    child: DictationField(controller: _website, label: l10n.companyWebsiteLabel),
                  ),
                  formFlexChild(
                    context: context,
                    compact: dialogWidth < 640,
                    child: DictationField(controller: _peppol, label: l10n.companyPeppolLabel),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              DictationField(
                controller: _tags,
                label: l10n.companyTagsLabel,
              ),
              const SizedBox(height: 12),
              DictationField(controller: _notes, label: l10n.commonNotesLabel, maxLines: 3),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
        FilledButton(
          onPressed: _save,
          child: Text(widget.isNew ? l10n.commonCreate : l10n.commonSave),
        ),
      ],
    );
  }
}

/// Édition d'un contact : identité, téléphone (indicatif aligné sur le pays
/// du client par défaut, modifiable), et canaux de messagerie — la vraie
/// correspondance passe aujourd'hui par WhatsApp/WeChat/iMessage bien plus
/// que par l'email seul.
class _ContactEditorDialog extends StatefulWidget {
  const _ContactEditorDialog({
    required this.contact,
    required this.companyCountry,
    this.isNew = false,
  });

  final Contact contact;
  final String? companyCountry;
  final bool isNew;

  @override
  State<_ContactEditorDialog> createState() => _ContactEditorDialogState();
}

class _ContactEditorDialogState extends State<_ContactEditorDialog> {
  late final _first = TextEditingController(text: widget.contact.firstName ?? '');
  late final _last = TextEditingController(text: widget.contact.lastName ?? '');
  late final _role = TextEditingController(text: widget.contact.role ?? '');
  late final _email = TextEditingController(text: widget.contact.email ?? '');

  late String _phoneCountry = widget.contact.phoneCountry ?? '';
  late final PhoneInputFormatter _phoneFormatter = PhoneInputFormatter(_phoneIso);
  late final TextEditingController _phoneCtrl =
      TextEditingController(text: formatPhoneInternational(widget.contact.phone ?? '', _phoneIso));

  late final List<MessagingChannel> _channels = decodeMessagingChannels(widget.contact.messagingJson);

  /// Indicatif effectif : celui choisi manuellement pour ce contact, sinon
  /// celui du client — cascade réelle (pas un pays imposé arbitrairement).
  String get _phoneIso => effectivePhoneCountry(_phoneCountry, widget.companyCountry);

  Future<void> _pickPhoneCountry() async {
    final picked = await showCountrySearchSheet(context, selected: CountryInfo.byCode(_phoneIso));
    if (picked == null || !mounted) return;
    setState(() {
      _phoneCountry = picked.code;
      _phoneFormatter.countryCode = _phoneIso;
      final reformatted = formatPhoneInternational(_phoneCtrl.text, _phoneIso);
      _phoneCtrl.value = TextEditingValue(
          text: reformatted, selection: TextSelection.collapsed(offset: reformatted.length));
    });
  }

  void _addChannel() {
    setState(() => _channels.add(MessagingChannel(platformId: messagingPlatforms.first.id, value: '')));
  }

  void _removeChannel(int i) => setState(() => _channels.removeAt(i));

  Future<void> _save() async {
    if (_first.text.trim().isEmpty && _last.text.trim().isEmpty) return;
    final c = widget.contact;
    c.firstName = _first.text.trim().isEmpty ? null : _first.text.trim();
    c.lastName = _last.text.trim().isEmpty ? null : _last.text.trim();
    c.role = _role.text.trim().isEmpty ? null : _role.text.trim();
    c.email = _email.text.trim().isEmpty ? null : _email.text.trim();
    c.phone = _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim();
    c.phoneCountry = _phoneCountry.isEmpty ? null : _phoneCountry;
    c.messagingJson = encodeMessagingChannels(_channels);
    await AppDatabase.instance.upsertContact(c);
    if (mounted) Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _first.dispose();
    _last.dispose();
    _role.dispose();
    _email.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Widget _phoneField() => TextFormField(
        controller: _phoneCtrl,
        keyboardType: TextInputType.phone,
        inputFormatters: [_phoneFormatter],
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).commonPhoneLabel,
          hintText: phoneExampleHint(_phoneIso),
          border: const OutlineInputBorder(),
          prefixIcon: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: _pickPhoneCountry,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CountryFlagIcon(countryCode: _phoneIso, width: 24, height: 17),
                    Icon(Icons.arrow_drop_down, size: 20, color: Theme.of(context).hintColor),
                  ],
                ),
              ),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 58, minHeight: 24),
        ),
      );

  Widget _channelRow(int i, bool compact) {
    final l10n = AppLocalizations.of(context);
    final c = _channels[i];
    final platform = platformById(c.platformId);
    final canOpen = buildMessagingUrl(c.platformId, c.value) != null;
    return Padding(
      // Clé sur l'objet canal (pas l'index) : sans ça, supprimer un canal
      // au milieu de la liste décale les widgets suivants qui gardent leur
      // ancien texte en cache (Flutter réutilise l'Element par position).
      key: ObjectKey(c),
      padding: const EdgeInsets.only(bottom: 10),
      child: formRowOrColumn(
        context: context,
        compact: compact,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          formFlexChild(
            context: context,
            compact: compact,
            flex: 2,
            child: DropdownButtonFormField<String>(
              initialValue: c.platformId,
              decoration: InputDecoration(labelText: l10n.companyAppLabel, border: const OutlineInputBorder()),
              items: [
                for (final p in messagingPlatforms)
                  DropdownMenuItem(
                    value: p.id,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MessagingBrandBadge(platform: p, size: 20),
                        const SizedBox(width: 8),
                        Text(platformLabel(context, p.id), overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
              ],
              onChanged: (v) => setState(() => c.platformId = v ?? c.platformId),
            ),
          ),
          formFlexChild(
            context: context,
            compact: compact,
            flex: 3,
            child: TextFormField(
              initialValue: c.value,
              decoration: InputDecoration(
                labelText: l10n.companyIdentifierNumberLabel,
                hintText: platform.hint,
                border: const OutlineInputBorder(),
              ),
              onChanged: (v) => c.value = v,
            ),
          ),
          // Pas de formFlexChild ici : Expanded exige flex > 0, et ce bloc
          // de boutons doit garder sa taille intrinsèque, pas s'étirer.
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: l10n.companyOpenTooltip,
                icon: const Icon(Icons.open_in_new),
                color: canOpen ? platform.color : null,
                onPressed: () => openMessagingChannel(context, c),
              ),
              IconButton(
                tooltip: l10n.companyRemoveTooltip,
                icon: const Icon(Icons.close),
                onPressed: () => _removeChannel(i),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dialogWidth = math.min(760.0, MediaQuery.sizeOf(context).width * 0.9);
    return AlertDialog(
      title: Text(widget.isNew ? l10n.companyNewContactTitle : l10n.companyEditContactTitle),
      content: SizedBox(
        width: dialogWidth,
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < kCompactFormBreakpoint;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  formRowOrColumn(
                    context: context,
                    compact: compact,
                    children: [
                      formFlexChild(
                        context: context,
                        compact: compact,
                        child: DictationField(controller: _first, label: l10n.commonFirstNameLabel, autofocus: true),
                      ),
                      formFlexChild(
                        context: context,
                        compact: compact,
                        child: DictationField(controller: _last, label: l10n.commonLastNameLabel),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  DictationField(controller: _role, label: l10n.companyRoleFieldLabel),
                  const SizedBox(height: 12),
                  formRowOrColumn(
                    context: context,
                    compact: compact,
                    children: [
                      formFlexChild(
                        context: context,
                        compact: compact,
                        child: DictationField(controller: _email, label: l10n.commonEmailLabel),
                      ),
                      formFlexChild(context: context, compact: compact, child: _phoneField()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(l10n.companyMessagingTitle, style: Theme.of(context).textTheme.titleSmall),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: _addChannel,
                        icon: const Icon(Icons.add, size: 18),
                        label: Text(l10n.commonAdd),
                      ),
                    ],
                  ),
                  if (_channels.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        l10n.companyNoMessagingHint,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Theme.of(context).hintColor),
                      ),
                    )
                  else
                    for (var i = 0; i < _channels.length; i++) _channelRow(i, compact),
                ],
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
        FilledButton(onPressed: _save, child: Text(widget.isNew ? l10n.commonCreate : l10n.commonSave)),
      ],
    );
  }
}

/// Badge compact d'un canal de messagerie — icône + couleur de marque,
/// tap pour ouvrir directement WhatsApp/Telegram/etc. avec l'identifiant
/// du contact, sans repasser par le formulaire d'édition.
class _MessagingChip extends StatelessWidget {
  const _MessagingChip({required this.channel});

  final MessagingChannel channel;

  @override
  Widget build(BuildContext context) {
    final platform = platformById(channel.platformId);
    return Material(
      color: platform.color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => openMessagingChannel(context, channel),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MessagingBrandBadge(platform: platform, size: 18),
              const SizedBox(width: 6),
              Text(
                channel.value.isEmpty ? platformLabel(context, platform.id) : channel.value,
                style: TextStyle(fontSize: 12, color: platform.color, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Visionneuse en lecture d'un contact — s'ouvre au clic sur sa ligne
/// (l'édition reste réservée au crayon dédié). Email/téléphone/canaux de
/// messagerie sont directement cliquables pour joindre le contact sans
/// détour par le formulaire. Retourne 'edit' ou 'delete' au parent selon
/// l'action choisie, ou rien si l'utilisateur ferme simplement le modal.
class _ContactViewerDialog extends StatelessWidget {
  const _ContactViewerDialog({required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = contact;
    final channels = decodeMessagingChannels(p.messagingJson);
    final dialogWidth = math.min(480.0, MediaQuery.sizeOf(context).width * 0.9);
    return AlertDialog(
      title: Text(
        p.displayName.isEmpty ? l10n.commonNoName : p.displayName,
        style: const TextStyle(color: _contactNameColor, fontWeight: FontWeight.w700),
      ),
      content: SizedBox(
        width: dialogWidth,
        child: SelectionArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (p.role != null) ...[
              Text(p.role!, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 12),
            ],
            if (p.email != null)
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: const Icon(Icons.email_outlined),
                title: Text(p.email!),
                onTap: () => openExternalUrl(context, 'mailto:${p.email}', label: l10n.messagingEmailAppLabel),
              ),
            if (p.phone != null)
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: const Icon(Icons.call_outlined),
                title: Text(p.phone!),
                onTap: () => openExternalUrl(context, 'tel:${p.phone}', label: l10n.messagingPhoneAppLabel),
              ),
            if (channels.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(l10n.companyMessagingTitle, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [for (final ch in channels) _MessagingChip(channel: ch)],
              ),
            ],
            if (p.email == null && p.phone == null && channels.isEmpty)
              Text(
                l10n.companyNoContactInfo,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).hintColor),
              ),
          ],
        ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'delete'),
          child: Text(l10n.commonDelete),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'edit'),
          child: Text(l10n.commonEdit),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.commonClose),
        ),
      ],
    );
  }
}
