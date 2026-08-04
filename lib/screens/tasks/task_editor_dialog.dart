import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/data/messaging_platforms.dart';
import '../../core/utils/rich_notes.dart';
import '../../core/utils/task_display.dart';
import '../../core/widgets/dictation_field.dart';
import '../../core/widgets/eastmark_logo.dart';
import '../../core/widgets/safe_picker_dialog.dart';
import '../../db/crm_db.dart';
import '../../l10n/gen/app_localizations.dart';
import '../../models/client.dart';
import '../../models/contact.dart';
import '../../models/task.dart';
import '../../platform/desktop_chrome.dart';
import '../../widgets/messaging_brand_badge.dart';
import '../../widgets/section_card.dart';
import '../../widgets/task_reach_actions.dart';

/// Ouvre l’éditeur de suivi / tâche plein écran — même style que client / e-Invoicing.
Future<CrmTask?> showTaskEditor(
  BuildContext context, {
  required CrmTask task,
  required List<Client> clients,
}) {
  return Navigator.of(context).push<CrmTask>(
    MaterialPageRoute(
      builder: (_) => TaskEditScreen(task: task, clients: clients),
    ),
  );
}

/// Fiche suivi — action concrète + phase + échéance.
class TaskEditScreen extends StatefulWidget {
  const TaskEditScreen({
    super.key,
    required this.task,
    required this.clients,
  });

  final CrmTask task;
  final List<Client> clients;

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  late final TextEditingController _title =
      TextEditingController(text: widget.task.title);
  late final TextEditingController _notes = TextEditingController(
    text: notesPlainText(widget.task.notes),
  );
  late TaskKind _kind = widget.task.kind;
  late TaskActionType _actionType = widget.task.actionType;
  late String? _channelId = widget.task.channelId;
  late String? _phaseId = widget.task.phase;
  late String? _clientId = widget.task.clientId;
  late DateTime? _due = widget.task.dueDateTime == null
      ? null
      : (widget.task.dueDateTime!.isUtc
          ? widget.task.dueDateTime!.toLocal()
          : widget.task.dueDateTime);
  List<Contact> _contacts = [];

  bool get _isNew => widget.task.title.isEmpty;

  Client? get _selectedClient {
    final id = _clientId;
    if (id == null) return null;
    for (final c in widget.clients) {
      if (c.id == id) return c;
    }
    return null;
  }

  static List<MessagingPlatformInfo> get _chatPlatforms => messagingPlatforms
      .where((p) => p.id != 'phone')
      .toList(growable: false);

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final id = _clientId;
    if (id == null) {
      if (mounted) setState(() => _contacts = []);
      return;
    }
    final list = await CrmDb.instance.listContacts(id);
    if (!mounted) return;
    setState(() => _contacts = list);
  }

  @override
  void dispose() {
    _title.dispose();
    _notes.dispose();
    super.dispose();
  }

  String _clientLabel(String? id) {
    final l10n = AppLocalizations.of(context);
    if (id == null) return l10n.taskEditorNoClient;
    for (final c in widget.clients) {
      if (c.id == id) return c.name;
    }
    return l10n.taskEditorNoClient;
  }

  void _syncTitleHint() {
    if (_title.text.trim().isNotEmpty && !_isNew) return;
    // Nouveau suivi : préremplir un titre utile selon l’action.
    final l10n = AppLocalizations.of(context);
    final suggested = switch (_actionType) {
      TaskActionType.chat => _channelId == null
          ? l10n.taskSuggestedMessage
          : l10n.taskSuggestedPlatformMessage(platformById(_channelId!).label),
      TaskActionType.call => l10n.taskSuggestedCall,
      TaskActionType.email => l10n.taskSuggestedEmail,
      TaskActionType.meeting => l10n.taskSuggestedMeeting,
      TaskActionType.other => l10n.taskSuggestedFollowup,
    };
    final autoTitles = <String>[
      l10n.taskSuggestedMessage,
      l10n.taskSuggestedCall,
      l10n.taskSuggestedEmail,
      l10n.taskSuggestedMeeting,
      l10n.taskSuggestedFollowup,
      if (_channelId != null)
        l10n.taskSuggestedPlatformMessage(platformById(_channelId!).label),
    ];
    final current = _title.text.trim();
    if (current.isEmpty || autoTitles.contains(current)) {
      _title.text = suggested;
    }
  }

  Future<void> _pickDue() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: _due ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 5),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      // Nouvelle échéance : par défaut maintenant + 1h (ou 09:00 si un
      // autre jour est choisi) — pas l’heure actuelle figée.
      initialTime: _due != null
          ? TimeOfDay.fromDateTime(_due!)
          : defaultDueTimeForDate(date, referenceNow: now),
    );
    if (time == null || !mounted) return;
    setState(() {
      _due = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  Future<void> _pickClient() async {
    final result = await showDialog<_ClientPickResult>(
      context: context,
      builder: (ctx) => _ClientPickDialog(
        clients: widget.clients,
        selectedId: _clientId,
      ),
    );
    if (result == null || !mounted) return;
    setState(() => _clientId = result.clientId);
    await _loadContacts();
  }

  void _save() {
    final l10n = AppLocalizations.of(context);
    if (_kind == TaskKind.action) {
      if (_actionType == TaskActionType.chat &&
          (_channelId == null || _channelId!.isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.taskEditorNeedMessaging)),
        );
        return;
      }
      if (_due == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.taskEditorNeedDue)),
        );
        return;
      }
    }
    final title = _title.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.taskEditorNeedTitle)),
      );
      return;
    }

    final notes = _notes.text.trim();
    final t = widget.task
      ..title = title
      ..clientId = _clientId
      ..kind = _kind
      ..actionType =
          _kind == TaskKind.action ? _actionType : TaskActionType.other
      ..channelId = _kind == TaskKind.action && _actionType == TaskActionType.chat
          ? _channelId
          : null
      ..phase = _phaseId
      ..notes = notes.isEmpty ? null : notes
      ..dueAt = _due?.toUtc().toIso8601String()
      ..updatedAt = nowIso();

    Navigator.of(context).pop(t);
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2BA89A);
    const cancelRed = Color(0xFFB42318);
    final l10n = AppLocalizations.of(context);
    final dueLabel = _due == null
        ? l10n.taskEditorChooseDue
        : DateFormat.yMMMMEEEEd('fr_FR').add_Hm().format(_due!);

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyS, meta: true): _save,
        const SingleActivator(LogicalKeyboardKey.keyS, control: true): _save,
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F6F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: DesktopChrome.appBarLeadingWidth,
          leading: DesktopChrome.backLeading(context),
          title: Text(_isNew ? l10n.taskEditorNewTitle : l10n.taskEditorEditTitle),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: EastmarkWordmark(height: 28),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          children: [
            SectionCard(
              title: l10n.taskEditorClientSection,
              icon: Icons.apartment_outlined,
              children: [
                Material(
                  color: const Color(0xFFF3FBF9),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: _pickClient,
                    borderRadius: BorderRadius.circular(12),
                    child: Ink(
                      padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color.lerp(teal, const Color(0xFF9AABBA), 0.45)!,
                          width: 1.4,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.business_outlined, color: teal),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.taskEditorClientOfTask,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: teal,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _clientLabel(_clientId),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: _pickClient,
                            child: Text(l10n.taskEditorChoose),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SectionCard(
              title: l10n.taskEditorTypeSection,
              icon: Icons.task_alt_outlined,
              children: [
                SegmentedButton<TaskKind>(
                  segments: [
                    for (final k in TaskKind.values)
                      ButtonSegment(
                        value: k,
                        label: Text(_kindLabel(l10n, k)),
                      ),
                  ],
                  selected: {_kind},
                  onSelectionChanged: (v) => setState(() => _kind = v.first),
                ),
                const SizedBox(height: 14),
                DictationField(
                  controller: _title,
                  decoration: InputDecoration(
                    labelText: l10n.taskEditorTitleField,
                    hintText: l10n.taskEditorTitleHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            if (_kind == TaskKind.action)
              SectionCard(
                title: l10n.taskEditorWhatSection,
                icon: Icons.bolt_outlined,
                accent: const Color(0xFF1D4ED8),
                children: [
                  Text(
                    l10n.taskEditorActionHint,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final a in TaskActionType.values)
                        ChoiceChip(
                          avatar: Icon(_actionIcon(a), size: 18),
                          label: Text(_actionLabel(l10n, a)),
                          selected: _actionType == a,
                          onSelected: (_) => setState(() {
                            _actionType = a;
                            if (a != TaskActionType.chat) _channelId = null;
                            _syncTitleHint();
                          }),
                        ),
                    ],
                  ),
                  if (_actionType == TaskActionType.chat) ...[
                    const SizedBox(height: 16),
                    Text(
                      l10n.taskEditorMessaging,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 8),
                    ..._chatPlatforms.map((p) {
                      final selected = _channelId == p.id;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Material(
                          color: selected
                              ? p.color.withValues(alpha: 0.12)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => setState(() {
                              _channelId = p.id;
                              _syncTitleHint();
                            }),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: selected
                                      ? p.color
                                      : const Color(0xFFD0D7DE),
                                  width: selected ? 1.6 : 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  MessagingBrandBadge(platform: p, size: 32),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      p.label,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  if (selected)
                                    Icon(Icons.check_circle, color: p.color),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                  if (_actionType == TaskActionType.call ||
                      _actionType == TaskActionType.email) ...[
                    const SizedBox(height: 14),
                    if (_selectedClient == null)
                      Text(
                        l10n.taskEditorNeedClient,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      )
                    else
                      TaskReachActions(
                        task: CrmTask(
                          id: widget.task.id,
                          title: _title.text.trim().isEmpty
                              ? widget.task.title
                              : _title.text.trim(),
                          clientId: _clientId,
                          kind: _kind,
                          actionType: _actionType,
                          createdAt: widget.task.createdAt,
                          updatedAt: widget.task.updatedAt,
                        ),
                        client: _selectedClient!,
                        contacts: _contacts,
                      ),
                  ],
                ],
              ),
            SectionCard(
              title: l10n.taskEditorPhaseSection,
              icon: Icons.event_outlined,
              accent: const Color(0xFFD97706),
              children: [
                DropdownButtonFormField<String>(
                  // ignore: deprecated_member_use
                  value: _phaseId != null &&
                          kDossierPhases.any((p) => p.id == _phaseId)
                      ? _phaseId
                      : null,
                  decoration: InputDecoration(
                    labelText: l10n.taskEditorPhaseLabel,
                    border: const OutlineInputBorder(),
                  ),
                  items: [
                    for (final p in kDossierPhases)
                      DropdownMenuItem(
                        value: p.id,
                        child: Text(_phaseLabel(l10n, p.id)),
                      ),
                  ],
                  onChanged: (v) => setState(() => _phaseId = v),
                ),
                const SizedBox(height: 14),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: teal,
                    side: BorderSide(color: Color.lerp(teal, Colors.grey, 0.4)!),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: _pickDue,
                  icon: const Icon(Icons.event),
                  label: Text(dueLabel),
                ),
              ],
            ),
            SectionCard(
              title: l10n.taskEditorNotesTitle,
              icon: Icons.notes_outlined,
              children: [
                DictationField(
                  controller: _notes,
                  maxLines: 6,
                  decoration: InputDecoration(
                    labelText: l10n.taskEditorNotesTitle,
                    border: const OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: cancelRed,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.commonCancel),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 14,
                    ),
                  ),
                  onPressed: _save,
                  icon: const Icon(Icons.check),
                  label: Text(l10n.taskEditorSaveShortcut),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _kindLabel(AppLocalizations l10n, TaskKind k) => switch (k) {
        TaskKind.action => l10n.taskKindAction,
        TaskKind.info => l10n.taskKindInfo,
      };

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

  IconData _actionIcon(TaskActionType a) => switch (a) {
        TaskActionType.chat => Icons.chat_outlined,
        TaskActionType.call => Icons.call_outlined,
        TaskActionType.email => Icons.email_outlined,
        TaskActionType.meeting => Icons.event_available_outlined,
        TaskActionType.other => Icons.more_horiz,
      };
}

class _ClientPickResult {
  const _ClientPickResult(this.clientId);
  final String? clientId;
}

class _ClientPickDialog extends StatefulWidget {
  const _ClientPickDialog({required this.clients, this.selectedId});

  final List<Client> clients;
  final String? selectedId;

  @override
  State<_ClientPickDialog> createState() => _ClientPickDialogState();
}

class _ClientPickDialogState extends State<_ClientPickDialog> {
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final q = _q.trim().toLowerCase();
    final filtered = q.isEmpty
        ? widget.clients
        : widget.clients
            .where((c) => c.name.toLowerCase().contains(q))
            .toList();

    return SafePickerDialog(
      title: AppLocalizations.of(context).taskEditorClientOfTask,
      icon: Icons.apartment_outlined,
      searchHint: AppLocalizations.of(context).taskEditorSearchHint,
      onQueryChanged: (v) => setState(() => _q = v),
      width: 440,
      height: 520,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_off_outlined),
            title: Text(AppLocalizations.of(context).taskEditorNoClient),
            selected: widget.selectedId == null,
            onTap: () => Navigator.pop(context, const _ClientPickResult(null)),
          ),
          const Divider(height: 1),
          for (final c in filtered)
            ListTile(
              title: Text(c.name),
              selected: c.id == widget.selectedId,
              onTap: () => Navigator.pop(context, _ClientPickResult(c.id)),
            ),
        ],
      ),
    );
  }
}
