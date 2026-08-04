import 'package:flutter/foundation.dart';

import '../core/db/app_database.dart';
import '../core/services/client_company_bridge.dart';
import '../db/crm_db.dart';
import '../models/client.dart';
import '../models/contact.dart';
import '../models/task.dart';

enum AppSection { agenda, dashboard, clients, tasks }

/// État global du nouveau CRM — simple ChangeNotifier.
class CrmState extends ChangeNotifier {
  CrmState();

  final _db = CrmDb.instance;

  /// Accueil quotidien = Agenda (échéances).
  AppSection section = AppSection.agenda;
  String? selectedClientId;
  String? selectedTaskId;
  CrmTask? focusedTask;

  /// Module actif plein écran (ex. `invoicing`) — comme l'ancien CrmShell.
  String? activeModuleId;

  List<Client> clients = [];
  List<Contact> contacts = [];
  List<CrmTask> todayTasks = [];
  List<CrmTask> upcomingTasks = [];
  List<CrmTask> allOpenTasks = [];
  List<CrmTask> clientTasks = [];

  Client? get selectedClient {
    if (selectedClientId == null) return null;
    for (final c in clients) {
      if (c.id == selectedClientId) return c;
    }
    return null;
  }

  CrmTask? get selectedTask => focusedTask;

  Future<void> load() async {
    clients = await _db.listClients();
    todayTasks = await _db.tasksDueToday();
    upcomingTasks = await _db.tasksUpcoming();
    allOpenTasks = await _db.listTasks(openOnly: true);
    if (selectedClientId != null) {
      contacts = await _db.listContacts(selectedClientId!);
      clientTasks = await _db.listTasks(clientId: selectedClientId);
    }
    if (selectedTaskId != null) {
      focusedTask = await _db.getTask(selectedTaskId!);
      if (focusedTask == null) selectedTaskId = null;
    }
    notifyListeners();
  }

  void go(AppSection s) {
    section = s;
    activeModuleId = null;
    // Ne pas laisser une tâche "coller" au-dessus de la fiche client.
    if (s == AppSection.clients) {
      selectedTaskId = null;
      focusedTask = null;
    }
    if (s == AppSection.agenda) {
      selectedClientId = null;
      contacts = [];
      clientTasks = [];
    }
    if (s == AppSection.dashboard) {
      selectedClientId = null;
      selectedTaskId = null;
      focusedTask = null;
      contacts = [];
      clientTasks = [];
    }
    notifyListeners();
  }

  /// Ouvre un suivi dans l’Agenda (depuis le dashboard).
  Future<void> openTaskInAgenda(String taskId) async {
    activeModuleId = null;
    selectedClientId = null;
    contacts = [];
    clientTasks = [];
    section = AppSection.agenda;
    await selectTask(taskId);
  }

  /// Ouvre un module activé (rail / Réglages → « Utiliser »).
  void goToModule(String moduleId) {
    activeModuleId = moduleId;
    selectedTaskId = null;
    focusedTask = null;
    notifyListeners();
  }

  Future<void> selectClient(String? id) async {
    activeModuleId = null;
    selectedClientId = id;
    selectedTaskId = null;
    focusedTask = null;
    if (id == null) {
      contacts = [];
      clientTasks = [];
    } else {
      contacts = await _db.listContacts(id);
      clientTasks = await _db.listTasks(clientId: id);
      section = AppSection.clients;
    }
    notifyListeners();
  }

  Future<void> selectTask(String? id) async {
    selectedTaskId = id;
    focusedTask = id == null ? null : await _db.getTask(id);
    notifyListeners();
  }

  Future<Client> saveClient(Client client) async {
    final previous = await _db.getClient(client.id);
    final notesChanged = (previous?.notes ?? '').trim() !=
        (client.notes ?? '').trim();
    final notesAdded = notesChanged && (client.notes ?? '').trim().isNotEmpty;

    client.updatedAt = nowIso();
    await _db.upsertClient(client);
    try {
      await ClientCompanyBridge.ensureMirrored(client);
    } catch (_) {}

    if (notesAdded) {
      final snippet = client.notes!.trim();
      await _db.logInfoOnClientTasks(
        clientId: client.id,
        title: 'Info ajoutée au dossier',
        detail: snippet.length > 160 ? '${snippet.substring(0, 160)}…' : snippet,
      );
    }

    await load();
    selectedClientId = client.id;
    contacts = await _db.listContacts(client.id);
    clientTasks = await _db.listTasks(clientId: client.id);
    section = AppSection.clients;
    notifyListeners();
    return client;
  }

  Future<void> deleteClient(String id) async {
    await _db.softDeleteClient(id);
    try {
      await AppDatabase.instance.softDeleteCompany(id);
    } catch (_) {}
    if (selectedClientId == id) selectedClientId = null;
    await load();
  }

  Future<Contact> saveContact(Contact contact) async {
    final isNew = await _db.getContact(contact.id) == null;
    contact.updatedAt = nowIso();
    await _db.upsertContact(contact);
    contacts = await _db.listContacts(contact.clientId);
    final label = contact.displayName;
    await _db.logInfoOnClientTasks(
      clientId: contact.clientId,
      title: isNew ? 'Contact ajouté au dossier' : 'Contact mis à jour',
      detail: [
        label,
        if ((contact.phone ?? '').isNotEmpty) contact.phone,
        if ((contact.email ?? '').isNotEmpty) contact.email,
      ].whereType<String>().join(' · '),
    );
    notifyListeners();
    return contact;
  }

  Future<void> deleteContact(String id, String clientId) async {
    await _db.softDeleteContact(id);
    contacts = await _db.listContacts(clientId);
    notifyListeners();
  }

  Future<void> _mirrorTask(CrmTask task) async {
    try {
      await ClientCompanyBridge.ensureTaskMirrored(task);
    } catch (_) {}
  }

  Future<CrmTask> saveTask(CrmTask task) async {
    final existing = await _db.getTask(task.id);
    final isNew = existing == null;
    task.updatedAt = nowIso();
    await _db.upsertTask(task);
    await _mirrorTask(task);
    if (isNew) {
      await _db.addTaskHistory(
        taskId: task.id,
        kind: 'created',
        title: 'Suivi créé',
        detail: _taskActionSummary(task),
      );
      if (task.dueAt != null) {
        await _db.addTaskHistory(
          taskId: task.id,
          kind: 'scheduled',
          title: 'Échéance planifiée',
          detail: task.dueAt,
        );
      }
    } else {
      await _db.addTaskHistory(
        taskId: task.id,
        kind: 'note',
        title: 'Suivi mis à jour',
        detail: _taskActionSummary(task),
      );
    }
    selectedTaskId = task.id;
    focusedTask = task;
    await load();
    return task;
  }

  String _taskActionSummary(CrmTask task) {
    if (task.kind != TaskKind.action) return TaskKind.info.label;
    final phase = dossierPhaseLabel(task.phase);
    final action = task.actionType.label;
    final channel = task.channelId;
    final bits = <String>[action];
    if (channel != null && channel.isNotEmpty) bits.add(channel);
    if (phase.isNotEmpty) bits.add(phase);
    return bits.join(' · ');
  }

  /// Marquer comme exécutée → en attente d'approbation.
  Future<void> submitTask(CrmTask task) async {
    final now = nowIso();
    task
      ..status = TaskStatus.submitted
      ..kind = TaskKind.action
      ..submittedAt = now
      ..updatedAt = now;
    await _db.upsertTask(task);
    await _mirrorTask(task);
    await _db.addTaskHistory(
      taskId: task.id,
      kind: 'status',
      title: 'Marquée exécutée',
      detail: 'En attente d\'approbation',
    );
    focusedTask = task;
    selectedTaskId = task.id;
    await load();
  }

  /// Approuver (confirmer que c'est fait).
  Future<void> approveTask(CrmTask task) async {
    final now = nowIso();
    task
      ..status = TaskStatus.approved
      ..approvedAt = now
      ..updatedAt = now;
    await _db.upsertTask(task);
    await _mirrorTask(task);
    await _db.addTaskHistory(
      taskId: task.id,
      kind: 'status',
      title: 'Approuvée — confirmée faite',
    );
    focusedTask = task;
    selectedTaskId = task.id;
    await load();
  }

  /// Info seulement / passée — sans exécution.
  Future<void> dismissTask(CrmTask task) async {
    final now = nowIso();
    task
      ..status = TaskStatus.dismissed
      ..kind = TaskKind.info
      ..dismissedAt = now
      ..updatedAt = now;
    await _db.upsertTask(task);
    await _mirrorTask(task);
    await _db.addTaskHistory(
      taskId: task.id,
      kind: 'status',
      title: 'Passée / info seulement',
    );
    focusedTask = task;
    selectedTaskId = task.id;
    await load();
  }

  Future<void> reopenTask(CrmTask task) async {
    task
      ..status = TaskStatus.open
      ..submittedAt = null
      ..approvedAt = null
      ..dismissedAt = null
      ..updatedAt = nowIso();
    await _db.upsertTask(task);
    await _mirrorTask(task);
    await _db.addTaskHistory(
      taskId: task.id,
      kind: 'status',
      title: 'Rouverte',
    );
    focusedTask = task;
    selectedTaskId = task.id;
    await load();
  }

  /// Historique d’une tâche (devis/facture liés + événements manuels).
  Future<List<TaskHistoryEvent>> taskHistory(String taskId) =>
      _db.listTaskHistory(taskId);

  Future<void> appendTaskHistory(
    String taskId, {
    required String kind,
    required String title,
    String? detail,
    String? refType,
    String? refId,
  }) async {
    await _db.addTaskHistory(
      taskId: taskId,
      kind: kind,
      title: title,
      detail: detail,
      refType: refType,
      refId: refId,
    );
  }

  Future<void> deleteTask(String id) async {
    await _db.softDeleteTask(id);
    try {
      await AppDatabase.instance.softDeleteTask(id);
    } catch (_) {}
    if (selectedTaskId == id) {
      selectedTaskId = null;
      focusedTask = null;
    }
    await load();
  }

  Client newClientDraft() {
    final now = nowIso();
    return Client(
      id: CrmDb.newId(),
      name: '',
      status: ClientStatus.prospect,
      createdAt: now,
      updatedAt: now,
    );
  }

  Contact newContactDraft(String clientId, {String? phoneCountry}) {
    final now = nowIso();
    return Contact(
      id: CrmDb.newId(),
      clientId: clientId,
      phoneCountry: phoneCountry,
      isPrimary: contacts.isEmpty,
      createdAt: now,
      updatedAt: now,
    );
  }

  CrmTask newTaskDraft({String? clientId}) {
    final now = nowIso();
    final today = DateTime.now();
    final due = DateTime(today.year, today.month, today.day, 18)
        .toUtc()
        .toIso8601String();
    return CrmTask(
      id: CrmDb.newId(),
      title: '',
      clientId: clientId ?? selectedClientId,
      dueAt: due,
      kind: TaskKind.action,
      status: TaskStatus.open,
      createdAt: now,
      updatedAt: now,
    );
  }
}
