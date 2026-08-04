import 'dart:io' show Platform;
import 'dart:math' as math;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../db/app_database.dart';
import '../models/models.dart';
import '../services/ai_assistant_service.dart';
import '../services/current_session.dart';
import '../services/currency_settings.dart';
import '../services/pipeline_settings.dart';
import '../utils/formatters.dart';
import '../utils/responsive_form.dart';
import '../widgets/dictation_field.dart';
import '../widgets/jodit_editor.dart';
import '../../modules/invoicing/invoicing_module.dart';
import '../modules/module_registry.dart';
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
  var aiBusy = false;
  // Assistant IA (Apple Foundation Models) : macOS uniquement, et seulement
  // pour la création — pas de réécriture d'une opportunité existante.
  final aiAvailable = !kIsWeb && Platform.isMacOS && existing == null;
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
  await PipelineSettings.instance.ensureLoaded();
  final pipelineStages = PipelineSettings.instance.stages;
  final stageLabels = PipelineSettings.instance.labels;
  if (!context.mounted) return false;
  final dialogWidth = math.min(1100.0, MediaQuery.sizeOf(context).width * 0.95);
  final dialogHeight = math.min(760.0, MediaQuery.sizeOf(context).height * 0.88);
  final ok = await showDialog<bool>(
    context: context,
    useRootNavigator: true,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setDialogState) {
        final compact = dialogWidth < kCompactFormBreakpoint;
        final l10n = AppLocalizations.of(ctx);
        return AlertDialog(
          title: Text(existing == null ? l10n.pipelineNewOpportunity : l10n.oppEditTitle),
          content: SizedBox(
            width: dialogWidth,
            height: dialogHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (aiAvailable) ...[
                  Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton.icon(
                      onPressed: aiBusy
                          ? null
                          : () async {
                              final prompt = await _askAiPrompt(ctx);
                              if (prompt == null || prompt.trim().isEmpty) return;
                              setDialogState(() => aiBusy = true);
                              final draft = await AiAssistantService.draftOpportunity(prompt);
                              if (!ctx.mounted) return;
                              setDialogState(() {
                                aiBusy = false;
                                if (draft == null) return;
                                title.text = draft.title;
                                if (draft.amount != null) {
                                  amount.text = formatAmountForEditing(draft.amount);
                                }
                                if (draft.probability != null) probability = draft.probability!;
                              });
                              if (draft == null) {
                                ScaffoldMessenger.maybeOf(ctx)?.showSnackBar(SnackBar(
                                  content: Text(l10n.aiUnavailable),
                                ));
                              } else if (draft.notes.isNotEmpty) {
                                notesKey.currentState?.setHtml(_plainTextToHtml(draft.notes));
                              }
                            },
                      icon: aiBusy
                          ? const SizedBox(
                              width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.auto_awesome, size: 18),
                      label: Text(aiBusy ? l10n.aiGenerating : l10n.aiAssistant),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                DictationField(controller: title, label: l10n.pipelineTitleLabel),
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
                          labelText: l10n.pipelineAmountLabel,
                          prefixText: '${CurrencySettings.instance.current.symbol} ',
                        ),
                      ),
                    ),
                    formFlexChild(
                      context: context,
                      compact: compact,
                      child: DropdownButtonFormField<String>(
                        initialValue: stage,
                        decoration: InputDecoration(
                            labelText: l10n.oppStageLabel, border: OutlineInputBorder()),
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
                          Text(l10n.oppProbability(probability),
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
                        title: Text(l10n.oppClosePlannedLabel),
                        subtitle: Text(
                          expectedClose == null
                              ? l10n.oppNotSet
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
                                  hasFollowUp ? l10n.oppFollowupScheduled : l10n.oppFollowupReminder,
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
                                      : l10n.oppFollowupOptional,
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
                              tooltip: l10n.oppRemoveFollowup,
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
                            label: Text(hasFollowUp ? l10n.commonEdit : l10n.oppSchedule),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 4),
                Text(l10n.oppDetailsHint,
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 4),
                Expanded(
                  child: JoditEditor(key: notesKey, initialHtml: existing?.notes ?? ''),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
            FilledButton(
              onPressed: () {
                savedNotesHtml = notesKey.currentState?.getHtml();
                Navigator.pop(ctx, true);
              },
              child: Text(existing == null ? l10n.commonCreate : l10n.commonSave),
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

  if (stage == 'won' && effectiveCompanyId != null && ModuleRegistry.instance.isUsedInCrm('invoicing')) {
    final oppForQuote = existing ??
        Opportunity(
          id: opportunityId,
          companyId: effectiveCompanyId,
          title: title.text.trim(),
          amount: parseFormattedAmount(amount.text),
          currency: CurrencySettings.instance.code,
          stage: stage,
          probability: probability,
          expectedClose: expectedClose?.toUtc().toIso8601String(),
          notes: finalNotes,
          wonLost: stage,
          closedAt: now,
          createdAt: now,
          updatedAt: now,
          stageUpdatedAt: now,
        );
    if (context.mounted) {
      final l10n = AppLocalizations.of(context);
      final create = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.oppWonTitle),
          content: Text(l10n.oppCreateQuotePrompt),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.oppLater)),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.oppCreateQuoteButton)),
          ],
        ),
      );
      if (create == true && context.mounted) {
        await InvoicingModule.createQuoteFromOpportunity(context, oppForQuote);
      }
    }
  }

  return true;
}

/// Petit dialogue de saisie du besoin client pour l'assistant IA.
/// Renvoie la description, ou null si annulé.
Future<String?> _askAiPrompt(BuildContext context) {
  final controller = TextEditingController();
  final l10n = AppLocalizations.of(context);
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l10n.aiAssistant),
      content: SizedBox(
        width: 640,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.aiPromptHint),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              autofocus: true,
              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: l10n.aiPromptExample,
              ),
              onSubmitted: (v) => Navigator.pop(ctx, v),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.commonCancel)),
        FilledButton.icon(
          onPressed: () => Navigator.pop(ctx, controller.text),
          icon: const Icon(Icons.auto_awesome, size: 18),
          label: Text(l10n.aiGenerateButton),
        ),
      ],
    ),
  );
}

/// Convertit les notes texte de l'IA en HTML sûr pour l'éditeur Jodit.
String _plainTextToHtml(String text) {
  final escaped = text
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;');
  return '<p>${escaped.trim().replaceAll('\n', '<br>')}</p>';
}
