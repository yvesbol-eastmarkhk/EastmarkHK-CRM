import 'package:flutter/material.dart';

import '../db/app_database.dart';
import '../../l10n/gen/app_localizations.dart';
import '../models/models.dart';
import '../services/current_session.dart';
import '../utils/formatters.dart';
import 'dictation_field.dart';

/// Un type de contact rapide — voir SPECIFICATION conversationnelle de
/// l'utilisateur (devis envoyé → attendre le retour, appel, réponse
/// client, remarque) : chacun a un délai de relance par défaut réaliste,
/// pour que "Contacté" reste un geste en un clic dans la majorité des cas.
class _InteractionKind {
  const _InteractionKind(this.type, this.label, this.icon, this.defaultDelayDays);
  final ActivityType type;
  final String label;
  final IconData icon;
  final int defaultDelayDays;
}

const _kinds = [
  _InteractionKind(ActivityType.note, 'Note', Icons.sticky_note_2_outlined, 7),
  _InteractionKind(ActivityType.quoteSent, 'Devis envoyé', Icons.request_quote_outlined, 7),
  _InteractionKind(ActivityType.email, 'E-mail', Icons.email_outlined, 5),
  _InteractionKind(ActivityType.call, 'Appel', Icons.call_outlined, 3),
  _InteractionKind(ActivityType.meeting, 'Réunion', Icons.event_outlined, 7),
  _InteractionKind(ActivityType.reply, 'Réponse client', Icons.reply_outlined, 2),
  _InteractionKind(ActivityType.remark, 'Remarque', Icons.priority_high_outlined, 1),
];

const _delayChoices = [
  (days: 1),
  (days: 3),
  (days: 7),
  (days: 14),
];

/// Libellé localisé affiché pour un type de contact (le champ `label` de
/// [_InteractionKind] reste en dur car il est aussi persisté dans la BDD).
String _kindDisplayLabel(AppLocalizations l10n, _InteractionKind k) {
  return switch (k.type) {
    ActivityType.note => l10n.logKindNote,
    ActivityType.quoteSent => l10n.logKindQuoteSent,
    ActivityType.email => l10n.logKindEmail,
    ActivityType.call => l10n.logKindCall,
    ActivityType.meeting => l10n.logKindMeeting,
    ActivityType.reply => l10n.logKindReply,
    ActivityType.remark => l10n.logKindRemark,
    ActivityType.moduleEvent => k.label,
    ActivityType.task => l10n.shellTasksLabel,
  };
}

/// Libellé localisé du délai de relance (les `_delayChoices` ne servent qu'à
/// l'affichage : rien n'est persisté depuis le libellé).
String _delayDisplayLabel(AppLocalizations l10n, int days) {
  return switch (days) {
    1 => l10n.logTomorrow,
    3 => l10n.log3Days,
    7 => l10n.log1Week,
    _ => l10n.log2Weeks,
  };
}

/// Panneau de saisie rapide "Contacté" — le geste central du suivi de
/// prospection : on choisit ce qui vient de se passer, et la prochaine
/// relance est reprogrammée en un clic (pas un formulaire complet). Réutilise
/// la tâche de relance déjà liée à l'opportunité (opportunity_id) au lieu
/// d'en empiler une nouvelle. Retourne `true` si un contact a été enregistré.
Future<bool> showLogInteractionSheet(
  BuildContext context, {
  required String companyId,
  required String opportunityId,
  required String opportunityTitle,
}) async {
  final existingTasks = await AppDatabase.instance.tasks(opportunityId: opportunityId);
  final existingTask = existingTasks.isNotEmpty ? existingTasks.first : null;
  if (!context.mounted) return false;
  final l10n = AppLocalizations.of(context);

  final note = TextEditingController();
  var selectedKind = _kinds.first;
  var selectedDelayDays = selectedKind.defaultDelayDays;
  DateTime? customDate;

  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setLocal) {
        final scheme = Theme.of(ctx).colorScheme;
        return AlertDialog(
          title: Text(l10n.logContactedTitle(opportunityTitle)),
          content: SizedBox(
            width: 560,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.logTypeLabel, style: Theme.of(ctx).textTheme.bodySmall),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final k in _kinds)
                      ChoiceChip(
                        label: Text(_kindDisplayLabel(l10n, k)),
                        avatar: Icon(k.icon, size: 16),
                        selected: selectedKind == k,
                        onSelected: (_) => setLocal(() {
                          selectedKind = k;
                          selectedDelayDays = k.defaultDelayDays;
                          customDate = null;
                        }),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                DictationField(
                  controller: note,
                  label: l10n.logNoteLabel,
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                Text(l10n.logNextFollowup, style: Theme.of(ctx).textTheme.bodySmall),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final d in _delayChoices)
                      ChoiceChip(
                        label: Text(_delayDisplayLabel(l10n, d.days)),
                        selected: customDate == null && selectedDelayDays == d.days,
                        onSelected: (_) => setLocal(() {
                          selectedDelayDays = d.days;
                          customDate = null;
                        }),
                      ),
                    ChoiceChip(
                      label: Text(customDate == null
                          ? l10n.logCustom
                          : formatDateFr(customDate!.toIso8601String())),
                      selected: customDate != null,
                      onSelected: (_) async {
                        final picked = await showDatePicker(
                          context: ctx,
                          initialDate: DateTime.now().add(const Duration(days: 7)),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null) setLocal(() => customDate = picked);
                      },
                    ),
                  ],
                ),
                if (existingTask != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    l10n.logReplacesHint(formatDateFr(existingTask.dueDate)),
                    style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.commonSave)),
          ],
        );
      },
    ),
  );
  if (ok != true) return false;

  final now = nowIso();
  await AppDatabase.instance.upsertActivity(Activity(
    id: AppDatabase.newId(),
    companyId: companyId,
    opportunityId: opportunityId,
    type: selectedKind.type,
    title: selectedKind.label,
    body: note.text.trim().isEmpty ? null : note.text.trim(),
    happenedAt: now,
    createdAt: now,
    updatedAt: now,
  ));

  final next = customDate ??
      () {
        final base = DateTime.now();
        return DateTime(base.year, base.month, base.day).add(Duration(days: selectedDelayDays));
      }();
  await AppDatabase.instance.upsertTask(CrmTask(
    id: existingTask?.id ?? AppDatabase.newId(),
    companyId: companyId,
    opportunityId: opportunityId,
    title: l10n.logRelanceTitle(opportunityTitle),
    notes: note.text.trim().isEmpty ? existingTask?.notes : note.text.trim(),
    dueDate: next.toUtc().toIso8601String(),
    assignedTo: existingTask?.assignedTo ?? CurrentSession.instance.user?.id,
    createdAt: existingTask?.createdAt ?? now,
    updatedAt: now,
    doneAt: null,
  ));
  return true;
}

enum _EditActivityAction { cancel, save, delete }

/// Édition complète d'une entrée de timeline déjà enregistrée — même esprit
/// que "Contacté" (type + texte), avec suppression possible. Ne touche pas
/// à la relance programmée (gérée séparément, comme sa propre ligne de
/// timeline). Retourne `true` si la ligne a été modifiée ou supprimée.
Future<bool> showEditActivityDialog(BuildContext context, Activity activity) async {
  final l10n = AppLocalizations.of(context);
  final note = TextEditingController(text: activity.body ?? '');
  var selectedKind = _kinds.firstWhere(
    (k) => k.type == activity.type,
    orElse: () => _kinds.first,
  );

  final action = await showDialog<_EditActivityAction>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setLocal) => AlertDialog(
        title: Text(l10n.commonEdit),
        content: SizedBox(
          width: 680,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.logTypeField, style: Theme.of(ctx).textTheme.bodySmall),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final k in _kinds)
                    ChoiceChip(
                      label: Text(_kindDisplayLabel(l10n, k)),
                      avatar: Icon(k.icon, size: 16),
                      selected: selectedKind == k,
                      onSelected: (_) => setLocal(() => selectedKind = k),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              DictationField(
                controller: note,
                label: l10n.logContentLabel,
                maxLines: 6,
                autofocus: true,
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, _EditActivityAction.delete),
            style: TextButton.styleFrom(foregroundColor: Colors.red.shade700),
            child: Text(l10n.commonDelete),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, _EditActivityAction.cancel),
                child: Text(l10n.commonCancel),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, _EditActivityAction.save),
                child: Text(l10n.commonSave),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  if (action == null || action == _EditActivityAction.cancel) return false;
  if (!context.mounted) return false;

  if (action == _EditActivityAction.delete) {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.logDeleteTitle),
        content: Text(l10n.logDeleteBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red.shade700),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.commonDelete),
          ),
        ],
      ),
    );
    if (confirmed != true) return false;
    await AppDatabase.instance.softDeleteActivity(activity.id);
    return true;
  }

  activity.type = selectedKind.type;
  activity.title = selectedKind.label;
  activity.body = note.text.trim().isEmpty ? null : note.text.trim();
  await AppDatabase.instance.upsertActivity(activity);
  return true;
}
