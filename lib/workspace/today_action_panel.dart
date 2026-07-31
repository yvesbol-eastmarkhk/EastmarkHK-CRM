import 'package:flutter/material.dart';

import '../core/data/messaging_platforms.dart';
import '../core/db/app_database.dart';
import '../core/models/models.dart';
import '../core/utils/formatters.dart';
import '../core/utils/task_display.dart';
import '../core/widgets/company_avatar.dart';
import '../core/widgets/log_interaction_sheet.dart';
import '../state/crm_workspace_state.dart';
import '../theme/app_theme.dart';
import '../theme/crm_tokens.dart';
import 'crm_workspace_banner.dart';

/// Panneau droit « Aujourd'hui » — focalisé sur la relance (Attio / Pipedrive).
/// Client · contact · relance · actions rapides — pas la fiche complète.
class TodayActionPanel extends StatefulWidget {
  const TodayActionPanel({
    super.key,
    required this.taskId,
    required this.workspace,
    required this.onRefresh,
  });

  final String taskId;
  final CrmWorkspaceState workspace;
  final VoidCallback onRefresh;

  @override
  State<TodayActionPanel> createState() => _TodayActionPanelState();
}

class _TodayActionPanelState extends State<TodayActionPanel> {
  CrmTask? _task;
  Company? _company;
  Contact? _contact;
  Opportunity? _opportunity;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    widget.workspace.addListener(_load);
    _load();
  }

  @override
  void didUpdateWidget(TodayActionPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.taskId != widget.taskId) _load();
  }

  @override
  void dispose() {
    widget.workspace.removeListener(_load);
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final db = AppDatabase.instance;
    final tasks = await db.tasks();
    final matches = tasks.where((t) => t.id == widget.taskId);
    final task = matches.isEmpty ? null : matches.first;
    if (!mounted) return;
    if (task == null) {
      setState(() {
        _task = null;
        _loading = false;
      });
      return;
    }

    Company? company;
    Contact? contact;
    Opportunity? opp;
    if (task.companyId != null) {
      final companies = await db.companies();
      final companyMatches = companies.where((c) => c.id == task.companyId);
      company = companyMatches.isEmpty ? null : companyMatches.first;
      final contacts = await db.contacts(companyId: task.companyId);
      if (task.contactId != null) {
        final contactMatches = contacts.where((c) => c.id == task.contactId);
        contact = contactMatches.isEmpty ? null : contactMatches.first;
      }
      contact ??= contacts.isNotEmpty ? contacts.first : null;
    }
    if (task.opportunityId != null) {
      final opps = await db.opportunities();
      final oppMatches = opps.where((o) => o.id == task.opportunityId);
      opp = oppMatches.isEmpty ? null : oppMatches.first;
    }

    if (!mounted) return;
    setState(() {
      _task = task;
      _company = company;
      _contact = contact;
      _opportunity = opp;
      _loading = false;
    });
  }

  Future<bool> _confirmDelete() async {
    final t = _task;
    if (t == null) return false;
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Supprimer cette relance ?'),
            content: Text('« ${t.title} » sera retirée de votre file.'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: FilledButton.styleFrom(backgroundColor: Theme.of(ctx).colorScheme.error),
                child: const Text('Supprimer'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<void> _deleteTask() async {
    final t = _task;
    if (t == null) return;
    if (!await _confirmDelete()) return;
    await AppDatabase.instance.softDeleteTask(t.id);
    widget.workspace.clearSelection();
    widget.onRefresh();
  }

  Future<void> _markDone() async {
    final t = _task;
    if (t == null) return;
    t.doneAt = nowIso();
    t.updatedAt = nowIso();
    await AppDatabase.instance.upsertTask(t);
    widget.workspace.clearSelection();
    widget.onRefresh();
  }

  Future<void> _logContact() async {
    final t = _task;
    if (t == null || t.companyId == null || t.opportunityId == null) return;
    final done = await showLogInteractionSheet(
      context,
      companyId: t.companyId!,
      opportunityId: t.opportunityId!,
      opportunityTitle: _opportunity?.title ?? t.title,
    );
    if (done) {
      await _load();
      widget.onRefresh();
    }
  }

  Future<void> _linkClient() async {
    final t = _task;
    if (t == null) return;
    final companies = await AppDatabase.instance.companies();
    if (!mounted || companies.isEmpty) return;
    String? picked = t.companyId;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          title: const Text('Associer à un client'),
          content: DropdownButtonFormField<String>(
            value: picked,
            decoration: const InputDecoration(labelText: 'Client'),
            items: [
              for (final c in companies)
                DropdownMenuItem(value: c.id, child: Text(c.name)),
            ],
            onChanged: (v) => setLocal(() => picked = v),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
            FilledButton(
              onPressed: picked != null ? () => Navigator.pop(ctx, true) : null,
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
    if (ok != true || picked == null) return;
    t.companyId = picked;
    t.updatedAt = nowIso();
    await AppDatabase.instance.upsertTask(t);
    widget.workspace.selectTask(t);
    await _load();
    widget.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    if (_loading) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    final t = _task;
    if (t == null) {
      return Center(
        child: Text(
          'Relance introuvable',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      );
    }

    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(
            company: _company,
            onFullRecord: widget.workspace.openFullCompanyRecord,
            onDelete: _deleteTask,
            onLinkClient: _linkClient,
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _SectionLabel('Message'),
                const SizedBox(height: 8),
                TaskMessageCard(message: taskMessage(t)),
                const SizedBox(height: 20),
                _SectionLabel('Échéance'),
                const SizedBox(height: 8),
                _RelanceCard(task: t, opportunity: _opportunity),
                const SizedBox(height: 20),
                _SectionLabel('Contact'),
                const SizedBox(height: 8),
                _ContactCard(contact: _contact),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: border)),
              color: Theme.of(context).crmSidebar,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (t.companyId != null && t.opportunityId != null) ...[
                  FilledButton.icon(
                    onPressed: _logContact,
                    icon: const Icon(Icons.call_outlined, size: 18),
                    label: const Text('Contacté — reprogrammer'),
                  ),
                  const SizedBox(height: 10),
                ],
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _markDone,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppTheme.eastmarkGreen,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(0, 48),
                          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        icon: const Icon(Icons.check_circle_outline, size: 22),
                        label: const Text('Marquer fait'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: _deleteTask,
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 48),
                        foregroundColor: Theme.of(context).colorScheme.error,
                        side: BorderSide(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.6)),
                      ),
                      icon: const Icon(Icons.delete_outline, size: 20),
                      label: const Text('Supprimer'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.company,
    required this.onFullRecord,
    required this.onDelete,
    required this.onLinkClient,
  });

  final Company? company;
  final VoidCallback onFullRecord;
  final VoidCallback onDelete;
  final VoidCallback onLinkClient;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final missingClient = company == null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (company != null) CompanyAvatar(name: company!.name, radius: 20),
          if (company != null) const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Client',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: scheme.onSurfaceVariant),
                ),
                Text(
                  company?.name ?? 'Non associé',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: missingClient ? scheme.error : null,
                  ),
                ),
                if (missingClient)
                  TextButton(
                    onPressed: onLinkClient,
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.only(top: 4),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Associer à un client →', style: TextStyle(fontSize: 12)),
                  )
                else
                  TextButton(
                    onPressed: onFullRecord,
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.only(top: 4),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Voir fiche complète →', style: TextStyle(fontSize: 12)),
                  ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Supprimer',
            onPressed: onDelete,
            icon: Icon(Icons.delete_outline, color: scheme.error.withValues(alpha: 0.8)),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _RelanceCard extends StatelessWidget {
  const _RelanceCard({required this.task, this.opportunity});

  final CrmTask task;
  final Opportunity? opportunity;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final dueColor = AppTheme.dueDateColor(task.dueDate, neutral: scheme.onSurfaceVariant);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).crmBorder),
        borderRadius: BorderRadius.circular(8),
        color: dueColor.withValues(alpha: 0.06),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (opportunity != null) ...[
            Text(
              opportunity!.title,
              style: TextStyle(fontSize: CrmTokens.captionSize, color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
          ],
          Row(
            children: [
              Icon(Icons.event_outlined, size: 14, color: dueColor),
              const SizedBox(width: 6),
              Text(
                formatDueLabel(task.dueDate),
                style: TextStyle(
                  fontSize: CrmTokens.captionSize,
                  fontWeight: FontWeight.w600,
                  color: dueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({this.contact});

  final Contact? contact;

  @override
  Widget build(BuildContext context) {
    if (contact == null) {
      return Text(
        'Aucun contact — ajoutez-en depuis la fiche client.',
        style: TextStyle(fontSize: CrmTokens.captionSize, color: Theme.of(context).colorScheme.onSurfaceVariant),
      );
    }

    final channels = decodeMessagingChannels(contact!.messagingJson);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).crmBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contact!.displayName, style: const TextStyle(fontWeight: FontWeight.w600)),
          if (contact!.role != null && contact!.role!.isNotEmpty)
            Text(contact!.role!, style: TextStyle(fontSize: CrmTokens.captionSize, color: Theme.of(context).colorScheme.onSurfaceVariant)),
          if (contact!.phone != null && contact!.phone!.isNotEmpty) ...[
            const SizedBox(height: 8),
            _ContactLink(
              icon: Icons.phone_outlined,
              label: contact!.phone!,
              onTap: () => openExternalUrl(context, 'tel:${contact!.phone}', label: 'téléphone'),
            ),
          ],
          if (contact!.email != null && contact!.email!.isNotEmpty)
            _ContactLink(
              icon: Icons.mail_outline,
              label: contact!.email!,
              onTap: () => openExternalUrl(context, 'mailto:${contact!.email}', label: 'email'),
            ),
          for (final ch in channels)
            _ContactLink(
              icon: platformById(ch.platformId).icon,
              label: '${platformById(ch.platformId).label} · ${ch.value}',
              onTap: () => openMessagingChannel(context, ch),
            ),
        ],
      ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  const _ContactLink({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(child: Text(label, style: const TextStyle(fontSize: 13))),
          ],
        ),
      ),
    );
  }
}
