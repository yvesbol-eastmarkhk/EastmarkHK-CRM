/// Tâche de suivi — phase planifiée d'un dossier.
///
/// Workflow :
/// - [TaskKind.action] : à exécuter par nous → marquer « faite » puis
///   approuver pour confirmer.
/// - [TaskKind.info] : information / rappel → marquer « vue / passée »
///   (dismiss), sans exécution.
enum TaskKind {
  action,
  info;

  static TaskKind fromName(String? name) {
    for (final v in values) {
      if (v.name == name) return v;
    }
    return TaskKind.action;
  }

  String get label => switch (this) {
        TaskKind.action => 'À faire',
        TaskKind.info => 'Info',
      };
}

/// Ce qu’il faut faire concrètement (si [TaskKind.action]).
enum TaskActionType {
  chat,
  call,
  email,
  meeting,
  other;

  static TaskActionType fromName(String? name) {
    for (final v in values) {
      if (v.name == name) return v;
    }
    return TaskActionType.other;
  }

  String get label => switch (this) {
        TaskActionType.chat => 'Message chat',
        TaskActionType.call => 'Téléphoner',
        TaskActionType.email => 'E-mail',
        TaskActionType.meeting => 'Rendez-vous',
        TaskActionType.other => 'Autre',
      };
}

enum TaskStatus {
  /// Ouverte — à traiter.
  open,

  /// Exécutée par nous, en attente d'approbation.
  submitted,

  /// Approuvée / confirmée faite.
  approved,

  /// Info passée / annulée / écartée.
  dismissed;

  static TaskStatus fromName(String? name) {
    for (final v in values) {
      if (v.name == name) return v;
    }
    return TaskStatus.open;
  }

  String get label => switch (this) {
        TaskStatus.open => 'Ouverte',
        TaskStatus.submitted => 'À approuver',
        TaskStatus.approved => 'Approuvée',
        TaskStatus.dismissed => 'Passée',
      };

  bool get isClosed => this == TaskStatus.approved || this == TaskStatus.dismissed;
}

/// Phases du dossier proposées dans le sélecteur de suivi.
const kDossierPhases = <({String id, String label})>[
  (id: 'lead', label: 'Prospect'),
  (id: 'first_contact', label: 'Premier contact'),
  (id: 'contacted', label: 'Contacté'),
  (id: 'qualification', label: 'Qualification'),
  (id: 'quoted', label: 'Devis'),
  (id: 'negotiation', label: 'Négociation'),
  (id: 'closing', label: 'Closing'),
  (id: 'won', label: 'Gagné'),
  (id: 'lost', label: 'Perdu'),
  (id: 'after_sales', label: 'Suivi post-vente'),
];

String dossierPhaseLabel(String? id) {
  if (id == null || id.isEmpty) return '';
  for (final p in kDossierPhases) {
    if (p.id == id) return p.label;
  }
  return id;
}

/// Entrée d’historique rattachée à une tâche.
class TaskHistoryEvent {
  TaskHistoryEvent({
    required this.id,
    required this.taskId,
    required this.kind,
    required this.title,
    this.detail,
    this.refType,
    this.refId,
    required this.createdAt,
  });

  final String id;
  final String taskId;

  /// created | scheduled | status | note | document | channel
  final String kind;
  final String title;
  final String? detail;

  /// quote | invoice | …
  final String? refType;
  final String? refId;
  final String createdAt;

  Map<String, Object?> toMap() => {
        'id': id,
        'task_id': taskId,
        'kind': kind,
        'title': title,
        'detail': detail,
        'ref_type': refType,
        'ref_id': refId,
        'created_at': createdAt,
      };

  factory TaskHistoryEvent.fromMap(Map<String, Object?> m) => TaskHistoryEvent(
        id: m['id'] as String,
        taskId: m['task_id'] as String,
        kind: (m['kind'] as String?) ?? 'note',
        title: (m['title'] as String?) ?? '',
        detail: m['detail'] as String?,
        refType: m['ref_type'] as String?,
        refId: m['ref_id'] as String?,
        createdAt: m['created_at'] as String,
      );
}

class CrmTask {
  CrmTask({
    required this.id,
    required this.title,
    this.clientId,
    this.contactId,
    this.dueAt,
    this.kind = TaskKind.action,
    this.status = TaskStatus.open,
    this.actionType = TaskActionType.other,
    this.channelId,
    this.notes,
    this.phase,
    this.submittedAt,
    this.approvedAt,
    this.dismissedAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String title;
  String? clientId;
  String? contactId;

  /// Échéance ISO-8601 (date ou datetime UTC).
  String? dueAt;
  TaskKind kind;
  TaskStatus status;

  /// Type d’action concrète (chat, appel, e-mail…).
  TaskActionType actionType;

  /// Plateforme chat (`whatsapp`, `wechat`…) si [actionType] == chat.
  String? channelId;

  String? notes;

  /// Phase / étape du dossier (id de [kDossierPhases]).
  String? phase;
  String? submittedAt;
  String? approvedAt;
  String? dismissedAt;
  final String createdAt;
  String updatedAt;
  String? deletedAt;

  bool get needsApproval => status == TaskStatus.submitted;
  bool get isOpen => status == TaskStatus.open;

  DateTime? get dueDateTime {
    if (dueAt == null) return null;
    return DateTime.tryParse(dueAt!);
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'title': title,
        'client_id': clientId,
        'contact_id': contactId,
        'due_at': dueAt,
        'kind': kind.name,
        'status': status.name,
        'action_type': actionType.name,
        'channel_id': channelId,
        'notes': notes,
        'phase': phase,
        'submitted_at': submittedAt,
        'approved_at': approvedAt,
        'dismissed_at': dismissedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory CrmTask.fromMap(Map<String, Object?> m) => CrmTask(
        id: m['id'] as String,
        title: m['title'] as String,
        clientId: m['client_id'] as String?,
        contactId: m['contact_id'] as String?,
        dueAt: m['due_at'] as String?,
        kind: TaskKind.fromName(m['kind'] as String?),
        status: TaskStatus.fromName(m['status'] as String?),
        actionType: TaskActionType.fromName(m['action_type'] as String?),
        channelId: m['channel_id'] as String?,
        notes: m['notes'] as String?,
        phase: m['phase'] as String?,
        submittedAt: m['submitted_at'] as String?,
        approvedAt: m['approved_at'] as String?,
        dismissedAt: m['dismissed_at'] as String?,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

String nowIso() => DateTime.now().toUtc().toIso8601String();
