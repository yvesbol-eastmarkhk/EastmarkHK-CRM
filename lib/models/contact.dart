/// Contact rattaché à un client — un ou plusieurs, avec leur rôle.
class Contact {
  Contact({
    required this.id,
    required this.clientId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.phoneCountry,
    this.role,
    this.notes,
    this.isPrimary = false,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String clientId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? phoneCountry;
  String? role;
  String? notes;
  bool isPrimary;
  final String createdAt;
  String updatedAt;
  String? deletedAt;

  String get displayName {
    final name = [firstName, lastName].whereType<String>().join(' ').trim();
    return name.isEmpty ? (email ?? 'Sans nom') : name;
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'client_id': clientId,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'phone_country': phoneCountry,
        'role': role,
        'notes': notes,
        'is_primary': isPrimary ? 1 : 0,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory Contact.fromMap(Map<String, Object?> m) => Contact(
        id: m['id'] as String,
        clientId: m['client_id'] as String,
        firstName: m['first_name'] as String?,
        lastName: m['last_name'] as String?,
        email: m['email'] as String?,
        phone: m['phone'] as String?,
        phoneCountry: m['phone_country'] as String?,
        role: m['role'] as String?,
        notes: m['notes'] as String?,
        isPrimary: (m['is_primary'] as int?) == 1,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

/// Rôles courants — saisie libre aussi possible.
const kContactRoleSuggestions = [
  'Directeur / CEO',
  'Gérant',
  'Acheteur',
  'Commercial',
  'Comptabilité',
  'Technique',
  'Assistante',
  'Décideur',
  'Autre',
];
