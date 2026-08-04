import 'package:flutter/material.dart';

import '../core/data/messaging_platforms.dart';
import '../core/utils/client_reachability.dart';
import '../l10n/gen/app_localizations.dart';
import '../models/client.dart';
import '../models/contact.dart';
import '../models/task.dart';

/// Boutons tél / e-mail quand un client est lié au suivi.
class TaskReachActions extends StatelessWidget {
  const TaskReachActions({
    super.key,
    required this.task,
    required this.client,
    this.contacts = const [],
    this.onOpened,
  });

  final CrmTask task;
  final Client client;
  final List<Contact> contacts;

  /// Appelé après ouverture réussie (pour journaliser l’historique).
  final Future<void> Function(String kind, String title, {String? detail})?
      onOpened;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final reach = resolveClientReachability(client, contacts: contacts);
    final showCall = task.actionType == TaskActionType.call ||
        task.actionType == TaskActionType.other ||
        task.kind == TaskKind.info;
    final showEmail = task.actionType == TaskActionType.email ||
        task.actionType == TaskActionType.other ||
        task.kind == TaskKind.info;

    // Pour chat/appel/email ciblés : n’afficher que le canal pertinent.
    final callOnly = task.actionType == TaskActionType.call;
    final emailOnly = task.actionType == TaskActionType.email;

    final tiles = <Widget>[];

    if ((callOnly || (showCall && !emailOnly)) && reach.hasPhone) {
      tiles.add(
        _ReachTile(
          icon: Icons.call,
          color: const Color(0xFF34A853),
          title: reach.phone!,
          subtitle: reach.sourceLabel == null
              ? l10n.taskSuggestedCall
              : l10n.reachCallWithSource(reach.sourceLabel!),
          onTap: () => _call(context, reach.phone!),
        ),
      );
    }

    if ((emailOnly || (showEmail && !callOnly)) && reach.hasEmail) {
      tiles.add(
        _ReachTile(
          icon: Icons.email_outlined,
          color: const Color(0xFFEA4335),
          title: reach.email!,
          subtitle: l10n.taskEmailClientRef(crmEmailRef(task.id)),
          onTap: () => _email(context, reach.email!),
        ),
      );
    }

    if (tiles.isEmpty) {
      if (callOnly && !reach.hasPhone) {
        return Text(
          l10n.reachNoPhone,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        );
      }
      if (emailOnly && !reach.hasEmail) {
        return Text(
          l10n.reachNoEmail,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        );
      }
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < tiles.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          tiles[i],
        ],
      ],
    );
  }

  Future<void> _call(BuildContext context, String phone) async {
    final l10n = AppLocalizations.of(context);
    final digits = phone.replaceAll(RegExp(r'[^\d+]'), '');
    await openExternalUrl(context, 'tel:$digits', label: l10n.commonPhone);
    await onOpened?.call(
      'channel',
      l10n.reachCallLaunched,
      detail: phone,
    );
  }

  Future<void> _email(BuildContext context, String email) async {
    final l10n = AppLocalizations.of(context);
    final url = buildCrmMailto(
      email: email,
      taskId: task.id,
      subjectHint: task.title,
      clientName: client.name,
    );
    await openExternalUrl(context, url, label: l10n.reachEmailLabel);
    await onOpened?.call(
      'channel',
      l10n.reachEmailOpened(crmEmailRef(task.id)),
      detail: email,
    );
  }
}

class _ReachTile extends StatelessWidget {
  const _ReachTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: color,
                child: Icon(icon, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(Icons.open_in_new, size: 18, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
