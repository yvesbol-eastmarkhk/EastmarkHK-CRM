/// Modèles du cœur CRM — conventions communes à toutes les tables :
/// - id : UUID (jamais d'auto-increment, indispensable pour la sync)
/// - createdAt / updatedAt : ISO-8601 UTC
/// - deletedAt : soft delete (tombstone pour la sync)
library;

String nowIso() => DateTime.now().toUtc().toIso8601String();

class Company {
  Company({
    required this.id,
    required this.name,
    this.vatNumber,
    this.peppolId,
    this.website,
    this.tags = const [],
    this.notes,
    this.country,
    this.addressJson,
    this.einvoiceCustomerUuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String name;
  String? vatNumber;
  String? peppolId;
  String? website;
  List<String> tags;
  String? notes;
  String? country;
  String? addressJson;

  /// UUID du customer e-Invoicing lié — lien stable quand le pays n'a pas
  /// de n° fiscal (HK…) ou quand le nom commercial diverge.
  String? einvoiceCustomerUuid;
  final String createdAt;
  String updatedAt;
  String? deletedAt;

  Map<String, Object?> toMap() => {
        'id': id,
        'name': name,
        'vat_number': vatNumber,
        'peppol_id': peppolId,
        'website': website,
        'tags': tags.join(','),
        'notes': notes,
        'country': country,
        'address_json': addressJson,
        'einvoice_customer_uuid': einvoiceCustomerUuid,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory Company.fromMap(Map<String, Object?> m) => Company(
        id: m['id'] as String,
        name: m['name'] as String,
        vatNumber: m['vat_number'] as String?,
        peppolId: m['peppol_id'] as String?,
        website: m['website'] as String?,
        tags: ((m['tags'] as String?) ?? '')
            .split(',')
            .where((t) => t.isNotEmpty)
            .toList(),
        notes: m['notes'] as String?,
        country: m['country'] as String?,
        addressJson: m['address_json'] as String?,
        einvoiceCustomerUuid: m['einvoice_customer_uuid'] as String?,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

/// Un canal de contact — au-delà du téléphone/email classiques, la
/// correspondance réelle passe aujourd'hui par une messagerie (WhatsApp,
/// WeChat, iMessage…). [platformId] référence [messagingPlatforms],
/// [value] est le numéro ou l'identifiant à utiliser sur cette plateforme.
class MessagingChannel {
  MessagingChannel({required this.platformId, required this.value});

  String platformId;
  String value;

  Map<String, String> toJson() => {'platform': platformId, 'value': value};

  factory MessagingChannel.fromJson(Map<String, dynamic> m) => MessagingChannel(
        platformId: (m['platform'] as String?) ?? '',
        value: (m['value'] as String?) ?? '',
      );
}

class Contact {
  Contact({
    required this.id,
    this.companyId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.phoneCountry,
    this.role,
    this.notes,
    this.messagingJson,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String? companyId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  /// Pays ISO-2 utilisé pour formater [phone] (indicatif international) —
  /// suit le pays du client par défaut, modifiable indépendamment (contact
  /// basé ailleurs que le siège de la société).
  String? phoneCountry;
  String? role;
  String? notes;
  /// Canaux de messagerie sous forme JSON brute — voir
  /// `decodeMessagingChannels`/`encodeMessagingChannels` (messaging_platforms.dart)
  /// pour la liste décodée de [MessagingChannel].
  String? messagingJson;
  final String createdAt;
  String updatedAt;
  String? deletedAt;

  String get displayName =>
      [firstName, lastName].whereType<String>().join(' ').trim();

  Map<String, Object?> toMap() => {
        'id': id,
        'company_id': companyId,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'phone_country': phoneCountry,
        'role': role,
        'notes': notes,
        'messaging_json': messagingJson,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory Contact.fromMap(Map<String, Object?> m) => Contact(
        id: m['id'] as String,
        companyId: m['company_id'] as String?,
        firstName: m['first_name'] as String?,
        lastName: m['last_name'] as String?,
        email: m['email'] as String?,
        phone: m['phone'] as String?,
        phoneCountry: m['phone_country'] as String?,
        role: m['role'] as String?,
        notes: m['notes'] as String?,
        messagingJson: m['messaging_json'] as String?,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

/// Étapes par défaut du pipeline (personnalisables via la table pipelines).
const kDefaultStages = [
  'lead',
  'contacted',
  'quoted',
  'negotiation',
  'won',
  'lost',
];

class Opportunity {
  Opportunity({
    required this.id,
    this.companyId,
    this.contactId,
    this.pipelineId,
    this.stage = 'lead',
    required this.title,
    this.amount,
    this.currency = 'EUR',
    this.probability,
    this.expectedClose,
    this.wonLost,
    this.closedAt,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    String? stageUpdatedAt,
    this.deletedAt,
  }) : stageUpdatedAt = stageUpdatedAt ?? createdAt;

  final String id;
  String? companyId;
  String? contactId;
  String? pipelineId;
  String stage;
  String title;
  double? amount;
  String currency;
  int? probability;
  String? expectedClose;
  String? wonLost;
  String? closedAt;
  /// Détails libres — produit, Incoterms, conditions de paiement…
  String? notes;
  final String createdAt;
  String updatedAt;
  /// Dernier passage à l'étape actuelle (pipeline, dialogue opportunité…).
  String stageUpdatedAt;
  String? deletedAt;

  Map<String, Object?> toMap() => {
        'id': id,
        'company_id': companyId,
        'contact_id': contactId,
        'pipeline_id': pipelineId,
        'stage': stage,
        'title': title,
        'amount': amount,
        'currency': currency,
        'probability': probability,
        'expected_close': expectedClose,
        'won_lost': wonLost,
        'closed_at': closedAt,
        'notes': notes,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'stage_updated_at': stageUpdatedAt,
        'deleted_at': deletedAt,
      };

  factory Opportunity.fromMap(Map<String, Object?> m) => Opportunity(
        id: m['id'] as String,
        companyId: m['company_id'] as String?,
        contactId: m['contact_id'] as String?,
        pipelineId: m['pipeline_id'] as String?,
        stage: (m['stage'] as String?) ?? 'lead',
        title: m['title'] as String,
        amount: (m['amount'] as num?)?.toDouble(),
        currency: (m['currency'] as String?) ?? 'EUR',
        probability: m['probability'] as int?,
        expectedClose: m['expected_close'] as String?,
        wonLost: m['won_lost'] as String?,
        closedAt: m['closed_at'] as String?,
        notes: m['notes'] as String?,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        stageUpdatedAt: m['stage_updated_at'] as String?,
        deletedAt: m['deleted_at'] as String?,
      );
}

/// Types d'activités de la timeline. `moduleEvent` = publié par un module
/// (facture, scan, lead salon…) via ref_table/ref_id. `quoteSent`/`reply`/
/// `remark` alimentent le panneau de saisie rapide "Contacté" (voir
/// log_interaction_sheet.dart) — stockés en TEXT libre, donc les ajouter
/// ne nécessite aucune migration DB.
enum ActivityType {
  note,
  call,
  email,
  meeting,
  moduleEvent,
  quoteSent,
  reply,
  remark,
  /// Création / suivi de tâche (timeline + activité récente).
  task,
}

class Activity {
  Activity({
    required this.id,
    this.companyId,
    this.contactId,
    this.opportunityId,
    this.type = ActivityType.note,
    this.moduleId,
    this.refTable,
    this.refId,
    required this.title,
    this.body,
    required this.happenedAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String? companyId;
  String? contactId;
  String? opportunityId;
  ActivityType type;
  String? moduleId;
  String? refTable;
  String? refId;
  String title;
  String? body;
  String happenedAt;
  final String createdAt;
  String updatedAt;
  String? deletedAt;

  Map<String, Object?> toMap() => {
        'id': id,
        'company_id': companyId,
        'contact_id': contactId,
        'opportunity_id': opportunityId,
        'type': type.name,
        'module_id': moduleId,
        'ref_table': refTable,
        'ref_id': refId,
        'title': title,
        'body': body,
        'happened_at': happenedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory Activity.fromMap(Map<String, Object?> m) => Activity(
        id: m['id'] as String,
        companyId: m['company_id'] as String?,
        contactId: m['contact_id'] as String?,
        opportunityId: m['opportunity_id'] as String?,
        type: ActivityType.values.firstWhere(
          (t) => t.name == m['type'],
          orElse: () => ActivityType.note,
        ),
        moduleId: m['module_id'] as String?,
        refTable: m['ref_table'] as String?,
        refId: m['ref_id'] as String?,
        title: m['title'] as String,
        body: m['body'] as String?,
        happenedAt: m['happened_at'] as String,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

class CrmTask {
  CrmTask({
    required this.id,
    this.companyId,
    this.contactId,
    this.opportunityId,
    required this.title,
    this.dueDate,
    this.doneAt,
    this.notes,
    this.assignedTo,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String? companyId;
  String? contactId;
  /// Opportunité liée — utilisé pour les relances programmées depuis le
  /// dialogue Opportunité (voir company_detail_screen.dart) : permet de
  /// retrouver la relance déjà programmée en rouvrant l'opportunité, et de
  /// la mettre à jour plutôt que d'en créer une en double à chaque
  /// enregistrement.
  String? opportunityId;
  String title;
  String? dueDate;
  String? doneAt;
  String? notes;
  /// Identifiant du compte (UserAccount) responsable de cette tâche — sert
  /// à filtrer "mes tâches" une fois la base partagée entre plusieurs
  /// commerciaux. `null` tant qu'aucun compte n'est identifié (usage local
  /// mono-utilisateur, sans friction).
  String? assignedTo;
  final String createdAt;
  String updatedAt;
  String? deletedAt;

  bool get isDone => doneAt != null;

  Map<String, Object?> toMap() => {
        'id': id,
        'company_id': companyId,
        'contact_id': contactId,
        'opportunity_id': opportunityId,
        'title': title,
        'due_date': dueDate,
        'done_at': doneAt,
        'notes': notes,
        'assigned_to': assignedTo,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory CrmTask.fromMap(Map<String, Object?> m) => CrmTask(
        id: m['id'] as String,
        companyId: m['company_id'] as String?,
        contactId: m['contact_id'] as String?,
        opportunityId: m['opportunity_id'] as String?,
        title: m['title'] as String,
        dueDate: m['due_date'] as String?,
        doneAt: m['done_at'] as String?,
        notes: m['notes'] as String?,
        assignedTo: m['assigned_to'] as String?,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}
