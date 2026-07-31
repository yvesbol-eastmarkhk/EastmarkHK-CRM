import 'package:flutter/material.dart';

import '../db/app_database.dart';
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
  _InteractionKind(ActivityType.quoteSent, 'Devis envoyé', Icons.request_quote_outlined, 7),
  _InteractionKind(ActivityType.email, 'E-mail', Icons.email_outlined, 5),
  _InteractionKind(ActivityType.call, 'Appel', Icons.call_outlined, 3),
  _InteractionKind(ActivityType.meeting, 'Réunion', Icons.event_outlined, 7),
  _InteractionKind(ActivityType.reply, 'Réponse client', Icons.reply_outlined, 2),
  _InteractionKind(ActivityType.remark, 'Remarque', Icons.priority_high_outlined, 1),
];

const _delayChoices = [
  (label: 'Demain', days: 1),
  (label: '3 jours', days: 3),
  (label: '1 semaine', days: 7),
  (label: '2 semaines', days: 14),
];

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
          title: Text('Contacté — $opportunityTitle'),
          content: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Type de contact', style: Theme.of(ctx).textTheme.bodySmall),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final k in _kinds)
                      ChoiceChip(
                        label: Text(k.label),
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
                  label: 'Note (optionnel, ou dictez-la)',
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                Text('Prochaine relance', style: Theme.of(ctx).textTheme.bodySmall),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final d in _delayChoices)
                      ChoiceChip(
                        label: Text(d.label),
                        selected: customDate == null && selectedDelayDays == d.days,
                        onSelected: (_) => setLocal(() {
                          selectedDelayDays = d.days;
                          customDate = null;
                        }),
                      ),
                    ChoiceChip(
                      label: Text(customDate == null
                          ? 'Personnalisé'
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
                    'Remplace la relance déjà programmée le '
                    '${formatDateFr(existingTask.dueDate)}.',
                    style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Enregistrer')),
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
    title: 'Relancer : $opportunityTitle',
    dueDate: next.toUtc().toIso8601String(),
    assignedTo: existingTask?.assignedTo ?? CurrentSession.instance.user?.id,
    createdAt: existingTask?.createdAt ?? now,
    updatedAt: now,
  ));
  return true;
}
