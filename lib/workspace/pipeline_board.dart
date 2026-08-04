import 'package:flutter/material.dart';

import '../core/services/pipeline_settings.dart';
import '../core/db/app_database.dart';
import '../core/models/models.dart';
import '../core/screens/opportunity_dialog.dart';
import '../core/utils/formatters.dart';
import '../core/utils/responsive_layout.dart';
import '../core/widgets/empty_state.dart';
import '../l10n/gen/app_localizations.dart';
import '../state/crm_workspace_state.dart';
import '../theme/app_theme.dart';
import '../theme/crm_tokens.dart';
import '../ui/crm_data_table.dart';

const _stageColors = AppTheme.stageColors;
const _clientNameColor = Color(0xFFC026D3);

/// Kanban pipeline — clic sur une carte ouvre l'opportunité ; glisser pour changer d'étape.
class PipelineBoard extends StatefulWidget {
  const PipelineBoard({
    super.key,
    required this.workspace,
    required this.onSelectCompany,
    this.compact = false,
  });

  final CrmWorkspaceState workspace;
  final ValueChanged<String> onSelectCompany;
  final bool compact;

  @override
  State<PipelineBoard> createState() => _PipelineBoardState();
}

class _PipelineBoardState extends State<PipelineBoard> {
  List<Opportunity> _opps = [];
  Map<String, String> _companyNames = {};
  bool _loading = true;
  final _scrollController = ScrollController();
  double _colWidth = 260;

  @override
  void initState() {
    super.initState();
    PipelineSettings.instance.ensureLoaded().then((_) {
      if (mounted) setState(() {});
    });
    PipelineSettings.instance.addListener(_onPipelineChanged);
    widget.workspace.addListener(_load);
    _load();
  }

  void _onPipelineChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    PipelineSettings.instance.removeListener(_onPipelineChanged);
    widget.workspace.removeListener(_load);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToStage(int index) {
    if (!_scrollController.hasClients) return;
    final target = index * (_colWidth + 8);
    final max = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      target.clamp(0, max),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> _load() async {
    final opps = await AppDatabase.instance.opportunities();
    final companies = await AppDatabase.instance.companies();
    if (!mounted) return;
    setState(() {
      _opps = opps;
      _companyNames = {for (final c in companies) c.id: c.name};
      _loading = false;
    });
  }

  Future<void> _addOpportunity() async {
    final saved = await showOpportunityDialog(context);
    if (!saved) return;
    await _load();
    widget.workspace.bump();
  }

  Future<void> _openOpportunity(Opportunity o) async {
    final saved = await showOpportunityDialog(
      context,
      companyId: o.companyId,
      existing: o,
    );
    if (!saved || !mounted) return;
    await _load();
    widget.workspace.bump();
  }

  Future<void> _moveStage(Opportunity o, String stage) async {
    if (o.stage == stage) return;
    final now = nowIso();
    o.stage = stage;
    o.stageUpdatedAt = now;
    if (stage == 'won' || stage == 'lost') {
      o.wonLost = stage;
      o.closedAt = now;
    } else {
      o.wonLost = null;
      o.closedAt = null;
    }
    await AppDatabase.instance.upsertOpportunity(o);
    await _load();
    widget.workspace.bump();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final openCount = _opps.where((o) => o.wonLost == null).length;
    final phone = CrmLayout.isPhone(context);
    final stages = PipelineSettings.instance.stages;

    if (_loading) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    return SelectionContainer.disabled(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.pipelineTitle, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    Text(
                      openCount == 0 ? l10n.boardNoOpenOpps : l10n.boardOpenCount(openCount),
                      style: TextStyle(fontSize: CrmTokens.captionSize, color: scheme.onSurfaceVariant),
                    ),
                  ],
                ),
                const Spacer(),
                FilledButton(
                  onPressed: _addOpportunity,
                  child: Text(l10n.pipelineNewOpportunity, style: const TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
          // Sur téléphone, une seule colonne tient à l'écran : on ajoute des
          // onglets par étape pour naviguer sans deviner qu'il faut glisser
          // horizontalement (sinon la colonne suivante n'est visible qu'à
          // moitié, cf. retour utilisateur — "Pipeline pas utilisable").
          if (phone && _opps.isNotEmpty) _buildStageTabs(context, stages),
          Expanded(
            child: _opps.isEmpty
                ? EmptyState(
                    icon: Icons.view_kanban_outlined,
                    title: l10n.pipelineBoardEmptyTitle,
                    subtitle: l10n.pipelineBoardEmptySubtitle,
                    actionLabel: l10n.commonCreate,
                    onAction: _addOpportunity,
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      _colWidth = phone
                          ? constraints.maxWidth - 24
                          : (widget.compact ? 220.0 : 260.0);
                      return ListView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                        children: [
                          for (final stage in stages) _buildColumn(context, stage, phone),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Grille (2 lignes) plutôt qu'un scroll horizontal — pour que les 6 étapes
  // soient toutes visibles dès l'ouverture, sans deviner qu'il faut glisser
  // (retour utilisateur). Nombre de colonnes calculé pour tenir sur 2 lignes
  // quel que soit le nombre d'étapes configurées.
  Widget _buildStageTabs(BuildContext context, List<String> stages) {
    final border = Theme.of(context).crmBorder;
    // Peu d'étapes (≤3) : une seule ligne suffit déjà à tout montrer.
    // Au-delà, 2 lignes plutôt qu'une seule très large ou un scroll caché.
    final columns = stages.length <= 3 ? stages.length : (stages.length / 2).ceil();
    final rows = <List<int>>[];
    for (var i = 0; i < stages.length; i += columns) {
      rows.add(List.generate(
        (i + columns).clamp(0, stages.length) - i,
        (k) => i + k,
      ));
    }
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: border))),
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Column(
        children: [
          for (var r = 0; r < rows.length; r++) ...[
            if (r > 0) const SizedBox(height: 6),
            Row(
              children: [
                for (var c = 0; c < columns; c++) ...[
                  if (c > 0) const SizedBox(width: 6),
                  Expanded(
                    child: c < rows[r].length
                        ? _stageTabChip(context, stages[rows[r][c]], rows[r][c])
                        : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _stageTabChip(BuildContext context, String stage, int index) {
    final scheme = Theme.of(context).colorScheme;
    final color = _stageColors[stage] ?? scheme.primary;
    final count = _opps.where((o) => o.stage == stage).length;
    return Material(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
      child: InkWell(
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        onTap: () => _scrollToStage(index),
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
            border: Border.all(color: color.withValues(alpha: 0.35)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  PipelineSettings.instance.labelFor(stage),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 4),
              // Quantité en fuchsia — attire l'œil, distincte de la couleur
              // (neutre) de l'étape elle-même.
              Text(
                '$count',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: CrmTokens.fuchsia,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(BuildContext context, String stage, bool phone) {
    final scheme = Theme.of(context).colorScheme;
    final stageOpps = _opps.where((o) => o.stage == stage).toList();
    final color = _stageColors[stage] ?? scheme.primary;
    final colWidth = _colWidth;

    return DragTarget<Opportunity>(
      onWillAcceptWithDetails: (d) => d.data.stage != stage,
      onAcceptWithDetails: (d) => _moveStage(d.data, stage),
      builder: (ctx, candidates, _) {
        final highlight = candidates.isNotEmpty;
        return Container(
          width: colWidth,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: highlight ? color.withValues(alpha: 0.08) : scheme.surface,
            borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
            border: Border.all(color: highlight ? color : Theme.of(context).crmBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 6),
                    Text(PipelineSettings.instance.labelFor(stage),
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                    const Spacer(),
                    CrmBadge(
                      label: '${stageOpps.length}',
                      color: color,
                      background: color.withValues(alpha: 0.18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: stageOpps.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            AppLocalizations.of(context).boardNoOpenOpps,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant),
                          ),
                        ),
                      )
                    : ListView(
                        padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
                        children: [
                          for (final o in stageOpps)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: _oppTile(o, colWidth, phone, key: ValueKey(o.id)),
                            ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _oppTile(Opportunity o, double colWidth, bool phone, {Key? key}) {
    return KeyedSubtree(
      key: key,
      child: _oppCard(
        o,
        onOpen: () => _openOpportunity(o),
        onMoveStage: phone ? (s) => _moveStage(o, s) : null,
        dragHandle: phone
            ? null
            : LongPressDraggable<Opportunity>(
                data: o,
                delay: const Duration(milliseconds: 120),
                feedback: Material(
                  elevation: 8,
                  color: Colors.transparent,
                  child: SizedBox(width: colWidth - 20, child: _oppCard(o, dragging: true)),
                ),
                childWhenDragging: Opacity(
                  opacity: 0.35,
                  child: _dragHandle(o, active: false),
                ),
                child: _dragHandle(o),
              ),
      ),
    );
  }

  Widget _dragHandle(Opportunity o, {bool active = true}) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final color = _stageColors[o.stage] ?? scheme.primary;
    final border = Theme.of(context).crmBorder;
    return Container(
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? color.withValues(alpha: 0.08) : scheme.surfaceContainerHighest,
        border: Border(top: BorderSide(color: border.withValues(alpha: 0.8))),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(CrmTokens.radiusSm)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.drag_indicator, size: 16, color: active ? color : scheme.outline),
          const SizedBox(width: 4),
          Text(
            l10n.pipelineDragHint,
            style: TextStyle(fontSize: 10, color: active ? color : scheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _oppCard(
    Opportunity o, {
    bool dragging = false,
    VoidCallback? onOpen,
    Widget? dragHandle,
    ValueChanged<String>? onMoveStage,
  }) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final color = _stageColors[o.stage] ?? scheme.primary;
    final companyName = o.companyId == null ? null : _companyNames[o.companyId!];
    final border = Theme.of(context).crmBorder;
    return Material(
      elevation: dragging ? 4 : 0,
      color: Color.alphaBlend(color.withValues(alpha: 0.06), scheme.surface),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CrmTokens.radiusSm),
        side: BorderSide(color: color.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 6, color: color),
          MouseRegion(
            cursor: onOpen == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: dragging ? null : onOpen,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CrmBadge(
                              label: PipelineSettings.instance.labelFor(o.stage),
                              color: color,
                              background: color.withValues(alpha: 0.2),
                            ),
                          ),
                          if (onMoveStage != null)
                            PopupMenuButton<String>(
                              icon: Icon(Icons.swap_horiz_rounded, size: 18, color: scheme.primary),
                              tooltip: l10n.pipelineMoveTooltip,
                              onSelected: onMoveStage,
                              itemBuilder: (ctx) => [
                                for (final s in PipelineSettings.instance.stages)
                                  if (s != o.stage)
                                    PopupMenuItem(
                                      value: s,
                                      child: Text(PipelineSettings.instance.labelFor(s)),
                                    ),
                              ],
                            ),
                          Icon(
                            Icons.open_in_new_rounded,
                            size: 18,
                            color: scheme.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (companyName != null) ...[
                        Text(
                          companyName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: _clientNameColor,
                            letterSpacing: 0.1,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      Text(
                        o.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      if (o.amount != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          formatAmount(o.amount),
                          style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Divider(height: 1, color: border.withValues(alpha: 0.7)),
                      const SizedBox(height: 6),
                      Text(
                        l10n.pipelineCreatedOn(formatDateFr(o.createdAt)),
                        style: TextStyle(fontSize: 10, color: scheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.pipelineStageSince(formatDateFr(o.stageUpdatedAt)),
                        style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ?dragHandle,
        ],
      ),
    );
  }
}
