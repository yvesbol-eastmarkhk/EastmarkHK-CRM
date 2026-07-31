import 'package:flutter/material.dart';

import '../core/constants/crm_constants.dart';
import '../state/crm_workspace_state.dart';
import '../theme/crm_tokens.dart';

/// Panneau droit vide — guide l'utilisateur selon la section active.
class RecordPlaceholder extends StatelessWidget {
  const RecordPlaceholder({super.key, required this.section});

  final CrmSection section;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (icon, title, hint) = switch (section) {
      CrmSection.dashboard => (
          Icons.dashboard_outlined,
          'Tableau de bord',
          'Vue d\'ensemble : pipeline, relances et activité récente.',
        ),
      CrmSection.today => (
          Icons.wb_sunny_outlined,
          'Votre journée',
          'Choisissez une relance à gauche.\nLe client s\'ouvre ici — sans changer d\'écran.',
        ),
      CrmSection.clients => (
          Icons.business_outlined,
          'Fiche client',
          'Sélectionnez un client dans la liste,\n ou créez-en un avec le bouton +.',
        ),
      CrmSection.pipeline => (
          Icons.view_kanban_outlined,
          'Pipeline',
          'Glissez une carte entre les colonnes.\nCliquez pour ouvrir la fiche client.',
        ),
      CrmSection.tasks => (
          Icons.check_circle_outline,
          'Tâches',
          'Sélectionnez une tâche pour voir le client concerné.',
        ),
    };

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: scheme.onSurfaceVariant.withValues(alpha: 0.35)),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: -0.3),
            ),
            const SizedBox(height: 8),
            Text(
              hint,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: CrmTokens.bodySize,
                color: scheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              kProductTagline,
              style: TextStyle(
                fontSize: CrmTokens.captionSize,
                color: scheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
