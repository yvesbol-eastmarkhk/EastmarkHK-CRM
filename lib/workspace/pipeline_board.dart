import 'package:flutter/material.dart';

import '../core/services/pipeline_settings.dart';
import '../core/db/app_database.dart';
import '../core/models/models.dart';
import '../core/screens/opportunity_dialog.dart';
import '../core/utils/formatters.dart';
import '../core/widgets/empty_state.dart';
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
    super.dispose();
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
    final scheme = Theme.of(context).colorScheme;
    final openCount = _opps.where((o) => o.wonLost == null).length;

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
                    const Text('Pipeline', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    Text(
                      openCount == 0 ? 'Aucune opportunité' : '$openCount ouverte${openCount > 1 ? 's' : ''}',
                      style: TextStyle(fontSize: CrmTokens.captionSize, color: scheme.onSurfaceVariant),
                    ),
                  ],
                ),
                const Spacer(),
                FilledButton(
                  onPressed: _addOpportunity,
                  child: const Text('Nouvelle opportunité', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
          Expanded(
            child: _opps.isEmpty
                ? EmptyState(
                    icon: Icons.view_kanban_outlined,
                    title: 'Pipeline vide',
                    subtitle: 'Créez une opportunité, puis glissez-la entre les étapes.',
                    actionLabel: 'Créer',
                    onAction: _addOpportunity,
                  )
                : ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    children: [
                      for (final stage in PipelineSettings.instance.stages) _buildColumn(context, stage),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(BuildContext context, String stage) {
    final scheme = Theme.of(context).colorScheme;
    final stageOpps = _opps.where((o) => o.stage == stage).toList();
    final color = _stageColors[stage] ?? scheme.primary;
    final colWidth = widget.compact ? 220.0 : 260.0;

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
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
                  children: [
                    for (final o in stageOpps)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: _oppTile(o, colWidth, key: ValueKey(o.id)),
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

  Widget _oppTile(Opportunity o, double colWidth, {Key? key}) {
    return KeyedSubtree(
      key: key,
      child: _oppCard(
        o,
        onOpen: () => _openOpportunity(o),
        dragHandle: LongPressDraggable<Opportunity>(
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
            'Glisser pour déplacer',
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
  }) {
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
                        'Créée le ${formatDateFr(o.createdAt)}',
                        style: TextStyle(fontSize: 10, color: scheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Stade depuis le ${formatDateFr(o.stageUpdatedAt)}',
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
