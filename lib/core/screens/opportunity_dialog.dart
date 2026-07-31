import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../constants/crm_constants.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../services/current_session.dart';
import '../services/currency_settings.dart';
import '../services/pipeline_settings.dart';
import '../utils/formatters.dart';
import '../utils/responsive_form.dart';
import '../widgets/dictation_field.dart';
import '../widgets/jodit_editor.dart';
import '../../theme/app_theme.dart';

/// Dialogue création / édition d'une opportunité (Jodit, relance, stade…).
/// [companyId] optionnel — absent pour les opportunités créées depuis le pipeline.
Future<bool> showOpportunityDialog(
  BuildContext context, {
  String? companyId,
  Opportunity? existing,
}) async {
  final title = TextEditingController(text: existing?.title ?? '');
  final amount = TextEditingController(text: formatAmountForEditing(existing?.amount));
  final notesKey = GlobalKey<JoditEditorState>();
  String? savedNotesHtml = existing?.notes;
  var stage = existing?.stage ?? 'lead';
  var probability = existing?.probability ?? 50;
  DateTime? expectedClose;
  if (existing?.expectedClose != null) {
    final parsed = DateTime.tryParse(existing!.expectedClose!);
    if (parsed != null) {
      final local = parsed.toLocal();
      expectedClose = DateTime(local.year, local.month, local.day);
    }
  }
  DateTime? followUpDate;
  CrmTask? existingFollowUpTask;
  if (existing != null) {
    final linked = await AppDatabase.instance.tasks(opportunityId: existing.id);
    if (linked.isNotEmpty) {
      existingFollowUpTask = linked.first;
      final parsed = DateTime.tryParse(existingFollowUpTask.dueDate ?? '');
      if (parsed != null) {
        final local = parsed.toLocal();
        followUpDate = DateTime(local.year, local.month, local.day);
      }
    }
  }
  if (!context.mounted) return false;
  await PipelineSettings.instance.ensureLoaded();
  final pipelineStages = PipelineSettings.instance.stages;
  final stageLabels = PipelineSettings.instance.labels;
  final dialogWidth = math.min(1100.0, MediaQuery.sizeOf(context).width * 0.95);
  final dialogHeight = math.min(760.0, MediaQuery.sizeOf(context).height * 0.88);
  final ok = await showDialog<bool>(
    context: context,
    useRootNavigator: true,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setDialogState) {
        final compact = dialogWidth < kCompactFormBreakpoint;
        return AlertDialog(
          title: Text(existing == null ? 'Nouvelle opportunité' : 'Modifier l\'opportunité'),
          content: SizedBox(
            width: dialogWidth,
            height: dialogHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DictationField(controller: title, label: 'Titre'),
                const SizedBox(height: 12),
                formRowOrColumn(
                  context: context,
                  compact: compact,
                  children: [
                    formFlexChild(
                      context: context,
                      compact: compact,
                      child: TextField(
                        controller: amount,
                        textAlign: TextAlign.center,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [AmountInputFormatter()],
                        decoration: InputDecoration(
                          labelText: 'Montant',
                          prefixText: '${CurrencySettings.instance.current.symbol} ',
                        ),
                      ),
                    ),
                    formFlexChild(
                      context: context,
                      compact: compact,
                      child: DropdownButtonFormField<String>(
                        initialValue: stage,
                        decoration:
                            const InputDecoration(labelText: 'Stade', border: OutlineInputBorder()),
                        items: [
                          for (final s in pipelineStages)
                            DropdownMenuItem(
                              value: s,
                              child: Text(stageLabels[s] ?? PipelineSettings.instance.labelFor(s)),
                            ),
                        ],
                        onChanged: (v) => setDialogState(() => stage = v ?? stage),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                formRowOrColumn(
                  context: context,
                  compact: compact,
                  children: [
                    formFlexChild(
                      context: context,
                      compact: compact,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Probabilité : $probability %',
                              style: Theme.of(context).textTheme.bodySmall),
                          Slider(
                            value: probability.toDouble(),
                            min: 0,
                            max: 100,
                            divisions: 20,
                            label: '$probability %',
                            onChanged: (v) => setDialogState(() => probability = v.round()),
                          ),
                        ],
                      ),
                    ),
                    formFlexChild(
                      context: context,
                      compact: compact,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Clôture prévue'),
                        subtitle: Text(
                          expectedClose == null
                              ? 'Non définie'
                              : formatDateFr(expectedClose!.toIso8601String()),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.calendar_today_outlined),
                          onPressed: () async {
                            final picked = await showDatePicker(
                              context: ctx,
                              initialDate: expectedClose ?? DateTime.now().add(const Duration(days: 30)),
                              firstDate: DateTime.now().subtract(const Duration(days: 365)),
                              lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
                            );
                            if (picked != null) setDialogState(() => expectedClose = picked);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Builder(
                  builder: (context) {
                    final scheme = Theme.of(context).colorScheme;
                    final hasFollowUp = followUpDate != null;
                    final dueColor = hasFollowUp
                        ? AppTheme.dueDateColor(
                            followUpDate!.toIso8601String(),
                            neutral: scheme.onSurface,
                          )
                        : scheme.onSurfaceVariant;
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: hasFollowUp
                            ? dueColor.withValues(alpha: 0.08)
                            : scheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: hasFollowUp ? dueColor.withValues(alpha: 0.35) : scheme.outlineVariant,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            hasFollowUp ? Icons.event_available : Icons.notifications_outlined,
                            size: 20,
                            color: dueColor,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hasFollowUp ? 'Relance programmée' : 'Rappel de relance',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: scheme.onSurfaceVariant,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  hasFollowUp
                                      ? formatDateFr(followUpDate!.toIso8601String())
                                      : 'Optionnel — planifiez un suivi client',
                                  style: TextStyle(
                                    color: dueColor,
                                    fontWeight: hasFollowUp ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (hasFollowUp)
                            IconButton(
                              tooltip: 'Retirer la relance',
                              visualDensity: VisualDensity.compact,
                              icon: Icon(Icons.close, size: 18, color: scheme.onSurfaceVariant),
                              onPressed: () => setDialogState(() => followUpDate = null),
                            ),
                          const SizedBox(width: 4),
                          FilledButton.tonalIcon(
                            onPressed: () async {
                              final picked = await showDatePicker(
                                context: ctx,
                                initialDate:
                                    followUpDate ?? DateTime.now().add(const Duration(days: 3)),
                                firstDate: DateTime.now().subtract(const Duration(days: 1)),
                                lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
                              );
                              if (picked != null) setDialogState(() => followUpDate = picked);
                            },
                            icon: const Icon(Icons.calendar_today_outlined, size: 18),
                            label: Text(hasFollowUp ? 'Modifier' : 'Programmer'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 4),
                Text('Détails (produit, Incoterms, conditions de paiement, tableau…)',
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 4),
                Expanded(
                  child: JoditEditor(key: notesKey, initialHtml: existing?.notes ?? ''),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
            FilledButton(
              onPressed: () {
                savedNotesHtml = notesKey.currentState?.getHtml();
                Navigator.pop(ctx, true);
              },
              child: Text(existing == null ? 'Créer' : 'Enregistrer'),
            ),
          ],
        );
      },
    ),
  );
  if (ok != true || title.text.trim().isEmpty) return false;

  final now = nowIso();
  final trimmedNotes = savedNotesHtml?.trim();
  final finalNotes = (trimmedNotes == null || trimmedNotes.isEmpty) ? null : trimmedNotes;
  final effectiveCompanyId = companyId ?? existing?.companyId;
  String opportunityId;

  if (existing != null) {
    final previousStage = existing.stage;
    opportunityId = existing.id;
    existing.title = title.text.trim();
    existing.amount = parseFormattedAmount(amount.text);
    existing.stage = stage;
    existing.probability = probability;
    existing.expectedClose = expectedClose?.toUtc().toIso8601String();
    existing.notes = finalNotes;
    if (previousStage != stage) {
      existing.stageUpdatedAt = now;
    }
    if (stage == 'won' || stage == 'lost') {
      existing.wonLost = stage;
      existing.closedAt = now;
    } else {
      existing.wonLost = null;
      existing.closedAt = null;
    }
    await AppDatabase.instance.upsertOpportunity(existing);
    if (effectiveCompanyId != null && previousStage != stage) {
      await AppDatabase.instance.upsertActivity(Activity(
        id: AppDatabase.newId(),
        companyId: effectiveCompanyId,
        opportunityId: opportunityId,
        type: ActivityType.note,
        title: 'Changement de stade',
        body: '${title.text.trim()} : '
            '${stageLabels[previousStage] ?? PipelineSettings.instance.labelFor(previousStage)} → '
            '${stageLabels[stage] ?? PipelineSettings.instance.labelFor(stage)}',
        happenedAt: now,
        createdAt: now,
        updatedAt: now,
      ));
    }
  } else {
    opportunityId = AppDatabase.newId();
    final isClosed = stage == 'won' || stage == 'lost';
    await AppDatabase.instance.upsertOpportunity(Opportunity(
      id: opportunityId,
      companyId: effectiveCompanyId,
      title: title.text.trim(),
      amount: parseFormattedAmount(amount.text),
      currency: CurrencySettings.instance.code,
      stage: stage,
      probability: probability,
      expectedClose: expectedClose?.toUtc().toIso8601String(),
      notes: finalNotes,
      wonLost: isClosed ? stage : null,
      closedAt: isClosed ? now : null,
      createdAt: now,
      updatedAt: now,
      stageUpdatedAt: now,
    ));
    if (effectiveCompanyId != null) {
      await AppDatabase.instance.upsertActivity(Activity(
        id: AppDatabase.newId(),
        companyId: effectiveCompanyId,
        opportunityId: opportunityId,
        type: ActivityType.note,
        title: 'Opportunité créée',
        body: title.text.trim(),
        happenedAt: now,
        createdAt: now,
        updatedAt: now,
      ));
    }
  }

  if (stage == 'won' || stage == 'lost') {
    if (existingFollowUpTask != null) {
      await AppDatabase.instance.softDeleteTask(existingFollowUpTask.id);
    }
  } else if (followUpDate != null) {
    await AppDatabase.instance.upsertTask(CrmTask(
      id: existingFollowUpTask?.id ?? AppDatabase.newId(),
      companyId: effectiveCompanyId,
      opportunityId: opportunityId,
      title: 'Relancer : ${title.text.trim()}',
      dueDate: followUpDate!.toUtc().toIso8601String(),
      assignedTo: existingFollowUpTask?.assignedTo ?? CurrentSession.instance.user?.id,
      createdAt: existingFollowUpTask?.createdAt ?? now,
      updatedAt: now,
    ));
  } else if (existingFollowUpTask != null) {
    await AppDatabase.instance.softDeleteTask(existingFollowUpTask.id);
  }

  return true;
}
