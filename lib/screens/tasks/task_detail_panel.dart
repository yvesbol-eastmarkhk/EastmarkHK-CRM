import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/data/messaging_platforms.dart';
import '../../core/modules/module_registry.dart';
import '../../core/utils/rich_notes.dart';
import '../../db/crm_db.dart';
import '../../l10n/gen/app_localizations.dart';
import '../../models/client.dart';
import '../../models/contact.dart';
import '../../models/task.dart';
import '../../modules/invoicing/einvoice_connector.dart';
import '../../modules/invoicing/widgets/ei_document_detail_dialog.dart';
import '../../state/crm_state.dart';
import '../../theme/crm_tokens.dart';
import '../../widgets/badges.dart';
import '../../widgets/messaging_brand_badge.dart';
import '../../widgets/section_card.dart';
import '../../widgets/task_reach_actions.dart';
import 'task_editor_dialog.dart';

/// Panneau détail tâche — action, validation, historique.
class TaskDetailPanel extends StatefulWidget {
  const TaskDetailPanel({super.key, required this.state});

  final CrmState state;

  @override
  State<TaskDetailPanel> createState() => _TaskDetailPanelState();
}

class _TaskDetailPanelState extends State<TaskDetailPanel> {
  List<TaskHistoryEvent> _history = [];
  List<Contact> _contacts = [];
  String? _loadedForId;
  String? _contactsForClientId;

  CrmState get state => widget.state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _maybeLoadHistory();
  }

  @override
  void didUpdateWidget(covariant TaskDetailPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    _maybeLoadHistory();
  }

  Future<void> _maybeLoadHistory() async {
    final id = state.selectedTaskId;
    if (id == null) {
      if (_history.isNotEmpty || _loadedForId != null) {
        setState(() {
          _history = [];
          _loadedForId = null;
          _contacts = [];
          _contactsForClientId = null;
        });
      }
      return;
    }
    if (_loadedForId == id) return;
    _loadedForId = id;
    final list = await _buildHistory(id);
    final clientId = state.selectedTask?.clientId;
    var contacts = <Contact>[];
    if (clientId != null) {
      contacts = await CrmDb.instance.listContacts(clientId);
    }
    if (!mounted) return;
    setState(() {
      _history = list;
      _contacts = contacts;
      _contactsForClientId = clientId;
    });
  }

  Future<void> _reloadHistory() async {
    final id = state.selectedTaskId;
    if (id == null) return;
    final list = await _buildHistory(id);
    if (!mounted) return;
    setState(() {
      _history = list;
      _loadedForId = id;
    });
  }

  /// Historique CRM + devis/factures e-Invoicing du client (même hors CRM).
  Future<List<TaskHistoryEvent>> _buildHistory(String taskId) async {
    final stored = await state.taskHistory(taskId);
    final task = state.selectedTask;
    final clientId = task?.clientId;
    if (clientId == null ||
        clientId.isEmpty ||
        !ModuleRegistry.instance.isUsedInCrm('invoicing')) {
      return stored;
    }

    List<EiDocument> docs = const [];
    try {
      docs = await EInvoiceConnector.instance
          .documentsForCompany(clientId, limit: 40);
    } catch (_) {
      return stored;
    }

    final knownRefs = <String>{
      for (final e in stored)
        if (e.kind == 'document' && (e.refId ?? '').isNotEmpty) e.refId!,
    };

    final merged = List<TaskHistoryEvent>.from(stored);
    for (final d in docs) {
      final ref = d.refId;
      if (knownRefs.contains(ref) || knownRefs.contains('${d.id}')) continue;
      knownRefs.add(ref);
      merged.add(
        TaskHistoryEvent(
          id: 'ei-$ref',
          taskId: taskId,
          kind: 'document',
          title: d.isInvoice ? 'Facture ${d.number}' : 'Devis ${d.number}',
          detail: '${d.status} · ${d.customerName}'.trim(),
          refType: d.isInvoice ? 'invoice' : 'quote',
          refId: ref,
          createdAt: d.date.isNotEmpty
              ? (DateTime.tryParse(d.date)?.toIso8601String() ?? d.date)
              : DateTime.now().toIso8601String(),
        ),
      );
    }

    merged.sort((a, b) {
      final da = DateTime.tryParse(a.createdAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
      final db = DateTime.tryParse(b.createdAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
      return db.compareTo(da);
    });
    return merged;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final task = state.selectedTask;
    if (task == null) {
      return Center(child: Text(l10n.tasksSelectPrompt));
    }

    // Recharge si la sélection a changé pendant le build.
    if (_loadedForId != task.id) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _maybeLoadHistory());
    }

    Client? client;
    if (task.clientId != null) {
      for (final c in state.clients) {
        if (c.id == task.clientId) {
          client = c;
          break;
        }
      }
    }

    final due = task.dueDateTime;
    final dueLocal = due == null ? null : (due.isUtc ? due.toLocal() : due);
    final scheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(28, 24, 28, 40),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                task.title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            IconButton(
              tooltip: l10n.taskEditTooltip,
              onPressed: () => _edit(context, task),
              icon: const Icon(Icons.edit_outlined, color: Color(0xFF2563EB)),
            ),
            IconButton(
              tooltip: l10n.taskCloseTooltip,
              onPressed: () => state.selectTask(null),
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            StatusBadge.task(task.status, l10n),
            Chip(
              label: Text(_kindLabel(l10n, task.kind)),
              visualDensity: VisualDensity.compact,
            ),
            if (task.kind == TaskKind.action)
              Chip(
                avatar: task.actionType == TaskActionType.chat &&
                        task.channelId != null
                    ? MessagingBrandBadge(
                        platform: platformById(task.channelId!),
                        size: 22,
                      )
                    : Icon(_actionIcon(task), size: 16),
                label: Text(_actionLabel(l10n, task)),
                visualDensity: VisualDensity.compact,
              ),
            if (task.phase != null && task.phase!.isNotEmpty)
              Chip(
                label: Text(_phaseLabel(l10n, task.phase)),
                visualDensity: VisualDensity.compact,
              ),
          ],
        ),
        const SizedBox(height: 16),
        if (client != null) ...[
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.business_outlined),
            title: Text(
              client.name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(l10n.taskClientSubtitle),
            onTap: () => state.selectClient(client!.id),
          ),
          if (task.kind == TaskKind.action &&
              (task.actionType == TaskActionType.call ||
                  task.actionType == TaskActionType.email ||
                  task.actionType == TaskActionType.other)) ...[
            const SizedBox(height: 8),
            TaskReachActions(
              task: task,
              client: client,
              contacts: _contactsForClientId == client.id ? _contacts : const [],
              onOpened: (kind, title, {detail}) async {
                await state.appendTaskHistory(
                  task.id,
                  kind: kind,
                  title: title,
                  detail: detail,
                );
                await _reloadHistory();
              },
            ),
            const SizedBox(height: 8),
          ],
        ],
        if (dueLocal != null)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.event),
            title: Text(DateFormat.yMMMMEEEEd().add_Hm().format(dueLocal)),
            subtitle: Text(l10n.taskDueSubtitle),
          ),
        if (!isBlankNotesHtml(task.notes)) ...[
          const SizedBox(height: 8),
          Text(l10n.taskNotesTitle, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          buildNotesPreview(context, task.notes!),
        ],
        const SizedBox(height: 28),
        Text(l10n.taskValidationTitle, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(
          task.kind == TaskKind.info
              ? l10n.taskInfoHint
              : l10n.taskActionHint,
          style: TextStyle(color: scheme.onSurfaceVariant),
        ),
        const SizedBox(height: 16),
        ..._actions(context, task),
        const SizedBox(height: 28),
        SectionCard(
          title: l10n.taskHistoryTitle,
          icon: Icons.history,
          accent: const Color(0xFF6366F1),
          margin: EdgeInsets.zero,
          children: [
            if (_history.isEmpty)
              Text(
                l10n.taskNoHistory,
                style: TextStyle(color: scheme.onSurfaceVariant),
              )
            else
              for (var i = 0; i < _history.length; i++) ...[
                if (i > 0) const Divider(height: 20),
                _HistoryTile(
                  event: _history[i],
                  onOpenDocument: _history[i].kind == 'document' &&
                          (_history[i].refId ?? '').isNotEmpty
                      ? () => showEiDocumentByRef(
                            context,
                            refType: _history[i].refType ?? 'quote',
                            refId: _history[i].refId!,
                          )
                      : null,
                ),
              ],
          ],
        ),
      ],
    );
  }

  String _actionLabel(AppLocalizations l10n, CrmTask task) {
    if (task.actionType == TaskActionType.chat && task.channelId != null) {
      return platformById(task.channelId!).label;
    }
    return switch (task.actionType) {
      TaskActionType.chat => l10n.taskActionMessage,
      TaskActionType.call => l10n.taskActionCall,
      TaskActionType.email => l10n.taskActionEmail,
      TaskActionType.meeting => l10n.taskActionMeeting,
      TaskActionType.other => l10n.taskActionOther,
    };
  }

  String _kindLabel(AppLocalizations l10n, TaskKind k) => switch (k) {
        TaskKind.action => l10n.taskKindAction,
        TaskKind.info => l10n.taskKindInfo,
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

  IconData _actionIcon(CrmTask task) {
    if (task.actionType == TaskActionType.chat && task.channelId != null) {
      return platformById(task.channelId!).icon;
    }
    return switch (task.actionType) {
      TaskActionType.chat => Icons.chat_outlined,
      TaskActionType.call => Icons.call_outlined,
      TaskActionType.email => Icons.email_outlined,
      TaskActionType.meeting => Icons.event_available_outlined,
      TaskActionType.other => Icons.more_horiz,
    };
  }

  List<Widget> _actions(BuildContext context, CrmTask task) {
    final l10n = AppLocalizations.of(context);
    final widgets = <Widget>[];

    if (task.status == TaskStatus.open) {
      if (task.kind == TaskKind.action) {
        widgets.add(
          FilledButton.icon(
            onPressed: () async {
              await state.submitTask(task);
              await _reloadHistory();
            },
            icon: const Icon(Icons.check),
            label: Text(l10n.taskDoneByUs),
          ),
        );
        widgets.add(const SizedBox(height: 8));
      }
      widgets.add(
        OutlinedButton.icon(
          onPressed: () async {
            await state.dismissTask(task);
            await _reloadHistory();
          },
          icon: const Icon(Icons.visibility_outlined),
          label: Text(l10n.taskInfoOnly),
        ),
      );
    }

    if (task.status == TaskStatus.submitted) {
      widgets.add(
        FilledButton.icon(
          style: FilledButton.styleFrom(backgroundColor: CrmTokens.onTrack),
          onPressed: () async {
            await state.approveTask(task);
            await _reloadHistory();
          },
          icon: const Icon(Icons.verified_outlined),
          label: Text(l10n.taskApprove),
        ),
      );
      widgets.add(const SizedBox(height: 8));
      widgets.add(
        OutlinedButton.icon(
          onPressed: () async {
            await state.reopenTask(task);
            await _reloadHistory();
          },
          icon: const Icon(Icons.undo),
          label: Text(l10n.taskReopen),
        ),
      );
    }

    if (task.status.isClosed) {
      widgets.add(
        OutlinedButton.icon(
          onPressed: () async {
            await state.reopenTask(task);
            await _reloadHistory();
          },
          icon: const Icon(Icons.undo),
          label: Text(l10n.taskReopenTask),
        ),
      );
    }

    widgets.add(const SizedBox(height: 24));
    widgets.add(
      TextButton.icon(
        onPressed: () async {
          final ok = await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(l10n.taskDeleteTitle),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text(l10n.commonCancel),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: Text(l10n.commonDelete),
                ),
              ],
            ),
          );
          if (ok == true) await state.deleteTask(task.id);
        },
        icon: const Icon(Icons.delete_outline, color: CrmTokens.overdue),
        label: Text(l10n.commonDelete, style: TextStyle(color: CrmTokens.overdue)),
      ),
    );

    return widgets;
  }

  Future<void> _edit(BuildContext context, CrmTask task) async {
    final saved = await showTaskEditor(
      context,
      task: task,
      clients: state.clients,
    );
    if (saved != null) {
      await state.saveTask(saved);
      await _reloadHistory();
    }
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.event, this.onOpenDocument});

  final TaskHistoryEvent event;
  final VoidCallback? onOpenDocument;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final when = DateTime.tryParse(event.createdAt);
    final whenLocal = when == null
        ? event.createdAt
        : DateFormat.yMMMd('fr_FR').add_Hm().format(
              when.isUtc ? when.toLocal() : when,
            );    final icon = switch (event.kind) {
      'document' => Icons.receipt_long_outlined,
      'status' => Icons.flag_outlined,
      'scheduled' => Icons.event_outlined,
      'created' => Icons.add_circle_outline,
      'channel' => Icons.chat_outlined,
      _ => Icons.notes_outlined,
    };
    final color = switch (event.kind) {
      'document' => const Color(0xFF2BA89A),
      'status' => CrmTokens.accent,
      'scheduled' => const Color(0xFFD97706),
      _ => Theme.of(context).colorScheme.onSurfaceVariant,
    };

    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _localizedTitle(l10n, event.title),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              if (event.detail != null && event.detail!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    _localizedDetail(l10n, event.detail!),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              const SizedBox(height: 2),
              Text(
                whenLocal,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              if (onOpenDocument != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    l10n.taskViewDocument,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (onOpenDocument != null)
          Icon(Icons.chevron_right, color: color.withValues(alpha: 0.8)),
      ],
    );

    if (onOpenDocument == null) return row;
    return InkWell(
      onTap: onOpenDocument,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: row,
      ),
    );
  }

  /// Les événements d'historique persistent leur titre en dur dans la base
  /// (écrits au moment de l'action). Pour que la langue de l'app soit bien
  /// reflétée, on re-traduit les titres connus à l'affichage.
  String _localizedTitle(AppLocalizations l10n, String title) {
    return switch (title) {
      'Info ajoutée au dossier' => l10n.activityInfoAdded,
      'Suivi créé' => l10n.activityFollowupCreated,
      'Échéance planifiée' => l10n.activityDuePlanned,
      'Suivi mis à jour' => l10n.activityFollowupUpdated,
      'Marquée exécutée' => l10n.activityMarkedDone,
      'Approuvée — confirmée faite' => l10n.activityApproved,
      'Passée / info seulement' => l10n.activityPassed,
      'Rouverte' => l10n.activityReopened,
      'Contact ajouté au dossier' => l10n.activityContactAdded,
      'Contact mis à jour' => l10n.activityContactUpdated,
      _ => title,
    };
  }

  String _localizedDetail(AppLocalizations l10n, String detail) {
    return switch (detail) {
      'En attente d\'approbation' => l10n.activityPendingApproval,
      _ => detail,
    };
  }
}
