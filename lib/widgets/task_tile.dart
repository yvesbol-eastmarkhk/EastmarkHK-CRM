import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/gen/app_localizations.dart';
import '../models/task.dart';
import '../theme/crm_tokens.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    this.clientName,
    this.selected = false,
    required this.onTap,
  });

  final CrmTask task;
  final String? clientName;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final due = task.dueDateTime;
    final dueLocal = due == null ? null : (due.isUtc ? due.toLocal() : due);
    final dueLabel = dueLocal == null
        ? null
        : DateFormat.MMMd().add_Hm().format(dueLocal);
    final dueColor = CrmTokens.dueDateColor(
      task.dueAt,
      done: task.status.isClosed,
      neutral: scheme.onSurfaceVariant,
    );

    final bg = selected
        ? CrmTokens.taskSelectedBg
        : task.needsApproval
            ? CrmTokens.dueSoon.withValues(alpha: 0.1)
            : CrmTokens.taskTodoBg;

    final meta = [
      if (task.kind == TaskKind.action) _actionLabel(l10n, task.actionType),
      if (task.phase != null && task.phase!.isNotEmpty)
        _phaseLabel(l10n, task.phase),
      if (task.needsApproval) l10n.taskTileToApprove,
      if (task.kind == TaskKind.info) l10n.taskTileInfo,
    ].join(' · ');

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Icon(
                task.kind == TaskKind.info
                    ? Icons.info_outline
                    : task.needsApproval
                        ? Icons.hourglass_top_outlined
                        : Icons.radio_button_unchecked,
                size: 20,
                color: task.needsApproval ? CrmTokens.dueSoon : scheme.primary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (clientName != null && clientName!.isNotEmpty) ...[
                      Text(
                        clientName!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        task.title,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            ),
                      ),
                    ] else
                      Text(
                        task.title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    if (meta.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        meta,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              if (dueLabel != null)
                Text(
                  dueLabel,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: dueColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _actionLabel(AppLocalizations l10n, TaskActionType a) => switch (a) {
        TaskActionType.chat => l10n.taskActionMessage,
        TaskActionType.call => l10n.taskActionCall,
        TaskActionType.email => l10n.taskActionEmail,
        TaskActionType.meeting => l10n.taskActionMeeting,
        TaskActionType.other => l10n.taskActionOther,
      };

  String _phaseLabel(AppLocalizations l10n, String? id) {
    if (id == null || id.isEmpty) return '';
    return switch (id) {
      'lead' => l10n.phaseProspect,
      'first_contact' => l10n.phaseFirstContact,
      'contacted' => l10n.phaseContacted,
      'qualification' => l10n.phaseQualification,
      'quoted' => l10n.phaseQuote,
      'negotiation' => l10n.phaseNegotiation,
      'closing' => l10n.phaseClosing,
      'won' => l10n.phaseWon,
      'lost' => l10n.phaseLost,
      'after_sales' => l10n.phaseAfterSales,
      _ => id,
    };
  }
}
