import 'package:flutter/material.dart';

import '../l10n/gen/app_localizations.dart';
import '../models/client.dart';
import '../models/task.dart';
import '../theme/crm_tokens.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge._({required this.label, required this.color});

  factory StatusBadge.client(ClientStatus status, AppLocalizations l10n) {
    final color = switch (status) {
      ClientStatus.prospect => CrmTokens.accent,
      ClientStatus.active => CrmTokens.onTrack,
      ClientStatus.inactive => CrmTokens.textTertiaryLight,
    };
    final label = switch (status) {
      ClientStatus.prospect => l10n.clientStatusProspect,
      ClientStatus.active => l10n.clientStatusClient,
      ClientStatus.inactive => l10n.clientStatusInactive,
    };
    return StatusBadge._(label: label, color: color);
  }

  factory StatusBadge.task(TaskStatus status, AppLocalizations l10n) {
    final color = switch (status) {
      TaskStatus.open => CrmTokens.accent,
      TaskStatus.submitted => CrmTokens.dueSoon,
      TaskStatus.approved => CrmTokens.onTrack,
      TaskStatus.dismissed => CrmTokens.textTertiaryLight,
    };
    final label = switch (status) {
      TaskStatus.open => l10n.taskStatusOpen,
      TaskStatus.submitted => l10n.taskStatusToApprove,
      TaskStatus.approved => l10n.taskStatusApproved,
      TaskStatus.dismissed => l10n.taskStatusPassed,
    };
    return StatusBadge._(label: label, color: color);
  }

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(CrmTokens.radiusSm),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}
