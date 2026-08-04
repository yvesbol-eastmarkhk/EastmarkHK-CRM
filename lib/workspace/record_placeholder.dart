import 'package:flutter/material.dart';

import '../l10n/gen/app_localizations.dart';
import '../state/crm_workspace_state.dart';
import '../theme/crm_tokens.dart';

/// Panneau droit vide — guide l'utilisateur selon la section active.
class RecordPlaceholder extends StatelessWidget {
  const RecordPlaceholder({super.key, required this.section});

  final CrmSection section;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final (icon, title, hint) = switch (section) {
      CrmSection.dashboard => (
          Icons.dashboard_outlined,
          l10n.dashboardTitleEmbedded,
          l10n.placeholderDashboardHint,
        ),
      CrmSection.today => (
          Icons.wb_sunny_outlined,
          l10n.placeholderTodayTitle,
          l10n.placeholderTodayHint,
        ),
      CrmSection.clients => (
          Icons.business_outlined,
          l10n.placeholderClientsTitle,
          l10n.placeholderClientsHint,
        ),
      CrmSection.pipeline => (
          Icons.view_kanban_outlined,
          l10n.metricPipeline,
          l10n.placeholderPipelineHint,
        ),
      CrmSection.tasks => (
          Icons.check_circle_outline,
          l10n.metricTasks,
          l10n.placeholderTasksHint,
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
              l10n.productTagline,
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
