import 'package:flutter/material.dart';

import '../services/pipeline_settings.dart';
import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../../ui/crm_page.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../services/currency_settings.dart';
import '../utils/formatters.dart';
import '../widgets/dictation_field.dart';
import '../widgets/empty_state.dart';

const _stageColors = AppTheme.stageColors;

/// Pipeline kanban : glisser-déposer une carte d'une colonne à l'autre
/// (souris sur desktop, appui long sur mobile). Menu ⋮ en solution de repli.
class PipelineScreen extends StatefulWidget {
  const PipelineScreen({super.key});

  @override
  State<PipelineScreen> createState() => _PipelineScreenState();
}

class _PipelineScreenState extends State<PipelineScreen> {
  List<Opportunity> _opps = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    PipelineSettings.instance.ensureLoaded().then((_) {
      if (mounted) setState(() {});
    });
    _load();
  }

  Future<void> _load() async {
    final opps = await AppDatabase.instance.opportunities();
    if (!mounted) return;
    setState(() {
      _opps = opps;
      _loading = false;
    });
  }

  Future<void> _addOpportunity() async {
    final title = TextEditingController();
    final amount = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nouvelle opportunité'),
        content: SizedBox(
          width: 420,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DictationField(controller: title, label: 'Titre', autofocus: true),
              const SizedBox(height: 12),
              TextField(
                controller: amount,
                textAlign: TextAlign.center,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [AmountInputFormatter()],
                decoration: InputDecoration(
                  labelText: 'Montant',
                  prefixText: '${CurrencySettings.instance.current.symbol} ',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Créer')),
        ],
      ),
    );
    if (ok != true || title.text.trim().isEmpty) return;
    final now = nowIso();
    await AppDatabase.instance.upsertOpportunity(Opportunity(
      id: AppDatabase.newId(),
      title: title.text.trim(),
      amount: parseFormattedAmount(amount.text),
      currency: CurrencySettings.instance.code,
      createdAt: now,
      updatedAt: now,
    ));
    await _load();
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
  }

  Widget _oppCard(BuildContext context, Opportunity o, {bool dragging = false}) {
    final scheme = Theme.of(context).colorScheme;
    final color = _stageColors[o.stage] ?? scheme.primary;
    return Card(
      elevation: dragging ? 6 : 0,
      color: scheme.surface,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 36,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(o.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  if (o.amount != null)
                    Text(
                      formatAmount(o.amount),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: scheme.onSurfaceVariant),
                    ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              tooltip: 'Déplacer',
              icon: const Icon(Icons.more_vert, size: 18),
              onSelected: (s) => _moveStage(o, s),
              itemBuilder: (_) => [
                for (final s in PipelineSettings.instance.stages)
                  if (s != o.stage)
                    PopupMenuItem(value: s, child: Text(PipelineSettings.instance.labelFor(s))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final openCount = _opps.where((o) => o.wonLost == null).length;
    return CrmPage(
      title: 'Pipeline',
      subtitle: openCount == 0
          ? 'Aucune opportunité ouverte'
          : '$openCount opportunité${openCount > 1 ? 's' : ''} ouverte${openCount > 1 ? 's' : ''}',
      actions: [CrmPrimaryButton(label: 'Nouvelle opportunité', onPressed: _addOpportunity)],
      child: _loading
          ? const Center(child: CircularProgressIndicator())
          : _opps.isEmpty
              ? EmptyState(
                  icon: Icons.view_kanban_outlined,
                  title: 'Votre pipeline est vide',
                  subtitle:
                      'Créez une opportunité puis glissez-la d\'étape en étape.',
                  actionLabel: 'Nouvelle opportunité',
                  onAction: _addOpportunity,
                )
              : ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.fromLTRB(
                    CrmTokens.pagePadding,
                    12,
                    CrmTokens.pagePadding,
                    CrmTokens.pagePadding,
                  ),
                  children: [
                    for (final stage in PipelineSettings.instance.stages)
                      DragTarget<Opportunity>(
                        onWillAcceptWithDetails: (d) => d.data.stage != stage,
                        onAcceptWithDetails: (d) => _moveStage(d.data, stage),
                        builder: (ctx, candidates, _) {
                          final highlight = candidates.isNotEmpty;
                          final stageOpps =
                              _opps.where((o) => o.stage == stage).toList();
                          final color = _stageColors[stage] ?? scheme.primary;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            width: 270,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: highlight
                                  ? color.withValues(alpha: 0.08)
                                  : Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
                              border: Border.all(
                                color: highlight ? color : Theme.of(context).crmBorder,
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: color,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(PipelineSettings.instance.labelFor(stage),
                                          style: Theme.of(ctx)
                                              .textTheme
                                              .titleSmall),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: color.withValues(alpha: 0.14),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          '${stageOpps.length}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                    children: [
                                      for (final o in stageOpps)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8),
                                          child: LongPressDraggable<Opportunity>(
                                            data: o,
                                            delay: const Duration(
                                                milliseconds: 120),
                                            feedback: SizedBox(
                                              width: 250,
                                              child: Material(
                                                color: Colors.transparent,
                                                child: _oppCard(context, o,
                                                    dragging: true),
                                              ),
                                            ),
                                            childWhenDragging: Opacity(
                                              opacity: 0.35,
                                              child: _oppCard(context, o),
                                            ),
                                            child: _oppCard(context, o),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
    );
  }
}
