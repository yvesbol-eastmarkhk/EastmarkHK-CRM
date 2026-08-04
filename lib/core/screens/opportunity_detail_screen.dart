import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../modules/invoicing/screens/quote_editor_screen.dart';
import '../modules/module_registry.dart';
import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../../ui/crm_page.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../services/pipeline_settings.dart';
import '../utils/activity_labels.dart';
import '../utils/formatters.dart';
import '../utils/task_display.dart';
import '../widgets/log_interaction_sheet.dart';
import 'company_detail_screen.dart';
import 'opportunity_dialog.dart';

/// Fiche d'affaire — "tout ce qu'on a fait avec ce client, dans le cadre de
/// cette opportunité précise", en une seule timeline chronologique (notes,
/// appels, e-mails, tâches, devis/factures e-Invoicing). Point de départ :
/// à étoffer (documents/pièces jointes futurs, etc.).
class OpportunityDetailScreen extends StatefulWidget {
  const OpportunityDetailScreen({
    super.key,
    required this.opportunityId,
    this.embedded = false,
    this.onClose,
  });

  final String opportunityId;

  /// true quand affiché dans le panneau détail du workspace (rail + liste
  /// restent visibles) plutôt que poussé en plein écran par-dessus tout.
  final bool embedded;

  /// Ferme la fiche (retour au panneau précédent) — utilisé seulement en
  /// mode intégré, où il n'y a pas de flèche retour de Navigator.
  final VoidCallback? onClose;

  @override
  State<OpportunityDetailScreen> createState() => _OpportunityDetailScreenState();
}

class _OpportunityDetailScreenState extends State<OpportunityDetailScreen> {
  Opportunity? _opp;
  Company? _company;
  List<Activity> _activities = [];
  List<CrmTask> _tasks = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final db = AppDatabase.instance;
    final opp = await db.opportunityById(widget.opportunityId);
    if (opp == null) {
      if (!mounted) return;
      setState(() => _loading = false);
      return;
    }
    final company = opp.companyId == null ? null : await db.companyById(opp.companyId!);
    final activities = await db.activities(opportunityId: opp.id, limit: 200);
    final tasks = await db.tasks(onlyOpen: false, opportunityId: opp.id);
    if (!mounted) return;
    setState(() {
      _opp = opp;
      _company = company;
      _activities = activities;
      _tasks = tasks;
      _loading = false;
    });
  }

  Future<void> _edit() async {
    final opp = _opp;
    if (opp == null) return;
    final saved = await showOpportunityDialog(context, companyId: opp.companyId, existing: opp);
    if (saved) await _load();
  }

  Future<void> _logInteraction() async {
    final opp = _opp;
    if (opp == null || opp.companyId == null) return;
    final done = await showLogInteractionSheet(
      context,
      companyId: opp.companyId!,
      opportunityId: opp.id,
      opportunityTitle: opp.title,
    );
    if (done) await _load();
  }

  Future<void> _markTaskDone(CrmTask t) async {
    t.doneAt = t.doneAt == null ? nowIso() : null;
    await AppDatabase.instance.upsertTask(t);
    await _load();
  }

  /// Édition complète d'une entrée existante — les événements générés par un
  /// module (ex. devis créé dans e-Invoicing) restent en lecture seule.
  Future<void> _editActivity(Activity a) async {
    final changed = await showEditActivityDialog(context, a);
    if (changed) await _load();
  }

  Future<void> _newDocument({required bool asInvoice}) async {
    final opp = _opp;
    if (opp == null || opp.companyId == null) return;
    final ok = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => EiDocumentEditorScreen(
          companyId: opp.companyId,
          opportunityId: opp.id,
          asInvoice: asInvoice,
        ),
      ),
    );
    if (ok == true) await _load();
  }

  void _openCompany() {
    final companyId = _opp?.companyId;
    if (companyId == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CompanyDetailScreen(companyId: companyId)),
    );
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
        ActivityType.task => Icons.task_alt_outlined,
      };

  String _activityTitle(AppLocalizations l10n, Activity a) =>
      localizedActivityTitle(l10n, a.title);

  /// Fusionne activités + tâches en un seul flux chronologique — c'est le
  /// cœur de l'écran : "tout ce qui s'est passé", peu importe le type.
  List<_TimelineItem> get _timeline {
    final items = <_TimelineItem>[
      for (final a in _activities) _TimelineItem.activity(a),
      for (final t in _tasks) _TimelineItem.task(t),
    ];
    items.sort((a, b) => b.date.compareTo(a.date));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final opp = _opp;
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final invoicingActive = ModuleRegistry.instance.isUsedInCrm('invoicing');

    if (_loading) {
      const body = Center(child: CircularProgressIndicator());
      return widget.embedded ? body : const Scaffold(body: body);
    }
    if (opp == null) {
      final body = Center(child: Text(l10n.oppNotFound));
      return widget.embedded ? body : Scaffold(body: body);
    }

    final stageLabel = PipelineSettings.instance.labelFor(opp.stage);
    final stageColor = AppTheme.stageColors[opp.stage] ?? scheme.primary;
    final timeline = _timeline;

    final page = CrmPage(
        title: opp.title,
        subtitle: _company != null
            ? '${_company!.name} · $stageLabel'
            : stageLabel,
        showBackButton: !widget.embedded,
        actions: [
          if (widget.embedded)
            IconButton(
              tooltip: l10n.taskCloseTooltip,
              onPressed: widget.onClose,
              icon: const Icon(Icons.close),
            ),
          if (invoicingActive) ...[
            OutlinedButton.icon(
              onPressed: () => _newDocument(asInvoice: false),
              icon: const Icon(Icons.request_quote_outlined, size: 16),
              label: Text(l10n.oppQuoteButton),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: () => _newDocument(asInvoice: true),
              icon: const Icon(Icons.receipt_outlined, size: 16),
              label: Text(l10n.oppInvoiceButton),
            ),
            const SizedBox(width: 8),
          ],
          FilledButton.tonalIcon(
            onPressed: _logInteraction,
            icon: const Icon(Icons.record_voice_over_outlined, size: 16),
            label: Text(l10n.stageContacted),
          ),
          const SizedBox(width: 8),
          IconButton(onPressed: _edit, icon: const Icon(Icons.edit_outlined, color: Color(0xFF2563EB))),
        ],
        child: RefreshIndicator(
          onRefresh: _load,
          child: ListView(
            padding: const EdgeInsets.all(CrmTokens.pagePadding),
            children: [
              _SummaryCard(
                opp: opp,
                companyName: _company?.name,
                stageLabel: stageLabel,
                stageColor: stageColor,
                onOpenCompany: _company != null ? _openCompany : null,
              ),
              const SizedBox(height: 24),
              Text(
                l10n.oppHistoryTitle,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 10),
              if (timeline.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    l10n.oppEmptyTimeline,
                    style: TextStyle(color: scheme.onSurfaceVariant),
                  ),
                )
              else
                ClipRRect(
                  borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
                  child: DecoratedBox(
                    decoration: BoxDecoration(border: Border.all(color: Theme.of(context).crmBorder)),
                    child: Column(
                      children: [
                        for (var i = 0; i < timeline.length; i++) _timelineRow(timeline[i], scheme, i),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

    return widget.embedded ? page : Scaffold(body: page);
  }

  /// Fond alterné (façon grille) — repère visuel entre les lignes, sans
  /// diviseur en plus (le contraste de fond suffit).
  Color _stripe(ColorScheme scheme, int index) =>
      index.isEven ? scheme.surface : scheme.surfaceContainerLow;

  Widget _timelineRow(_TimelineItem item, ColorScheme scheme, int index) {
    final l10n = AppLocalizations.of(context);
    if (item.task != null) {
      final t = item.task!;
      final done = t.doneAt != null;
      return Material(
        color: _stripe(scheme, index),
        child: ListTile(
          leading: Icon(
            done ? Icons.check_circle_outline : Icons.radio_button_unchecked,
            color: done ? Colors.green : scheme.onSurfaceVariant,
          ),
          title: Text(
            taskMessage(t),
            style: TextStyle(decoration: done ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(
            t.dueDate == null ? l10n.oppTaskLabel : l10n.oppTaskDue(formatDateFr(t.dueDate)),
          ),
          trailing: TextButton(
            onPressed: () => _markTaskDone(t),
            child: Text(done ? l10n.taskReopen : l10n.oppTaskMarkDone),
          ),
        ),
      );
    }
    final a = item.activity!;
    final editable = a.type != ActivityType.moduleEvent;
    return Material(
      color: _stripe(scheme, index),
      child: ListTile(
        leading: Icon(_activityIcon(a.type), color: scheme.onSurfaceVariant),
        title: SelectableText(
          a.body?.isNotEmpty == true ? a.body! : _activityTitle(l10n, a),
        ),
        subtitle: Text(formatDateTimeFr(a.happenedAt)),
        trailing: editable ? Icon(Icons.chevron_right, color: scheme.onSurfaceVariant) : null,
        onTap: editable ? () => _editActivity(a) : null,
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.opp,
    required this.companyName,
    required this.stageLabel,
    required this.stageColor,
    required this.onOpenCompany,
  });

  final Opportunity opp;
  final String? companyName;
  final String stageLabel;
  final Color stageColor;
  final VoidCallback? onOpenCompany;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final probability = opp.probability;
    final expectedClose = opp.expectedClose;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        border: Border.all(color: Theme.of(context).crmBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: stageColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  stageLabel,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: stageColor),
                ),
              ),
              if (opp.wonLost != null) ...[
                const SizedBox(width: 8),
                Text(
                  opp.wonLost == 'won' ? l10n.oppWon : l10n.oppLost,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: opp.wonLost == 'won' ? Colors.green : AppTheme.overdueColor,
                  ),
                ),
              ],
              const Spacer(),
              if (opp.amount != null)
                Text(
                  formatAmount(opp.amount),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (companyName != null)
            InkWell(
              onTap: onOpenCompany,
              child: Row(
                children: [
                  Icon(Icons.apartment_outlined, size: 16, color: scheme.primary),
                  const SizedBox(width: 6),
                  Text(
                    companyName!,
                    style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          if (opp.probability != null || opp.expectedClose != null) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 4,
              children: [
                if (probability != null)
                  Text(l10n.oppProbability(probability),
                      style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13)),
                if (expectedClose != null)
                  Text(l10n.oppClosePlanned(formatDateFr(expectedClose)),
                      style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _TimelineItem {
  _TimelineItem.activity(Activity a)
      : activity = a,
        task = null,
        date = a.happenedAt;
  _TimelineItem.task(CrmTask t)
      : activity = null,
        task = t,
        date = t.dueDate ?? t.createdAt;

  final Activity? activity;
  final CrmTask? task;
  final String date;
}
