/// Rôles — deux au départ, d'autres pourront s'ajouter (par module) plus
/// tard sans changer le schéma (le champ reste une chaîne libre en base).
enum UserRole {
  administrator,
  user;

  String get label => switch (this) {
        UserRole.administrator => 'Administrateur',
        UserRole.user => 'Utilisateur',
      };

  static UserRole fromDb(String? v) =>
      v == 'administrator' ? UserRole.administrator : UserRole.user;
}

class UserAccount {
  UserAccount({
    required this.id,
    required this.username,
    required this.displayName,
    required this.passwordHash,
    required this.passwordSalt,
    this.role = UserRole.user,
    this.touchIdEnabled = false,
    this.deviceToken,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String username;
  String displayName;
  String passwordHash;
  String passwordSalt;
  UserRole role;
  bool touchIdEnabled;

  /// Jeton d'appareil aléatoire créé à la création du compte — sert de
  /// base au déverrouillage rapide local (Touch ID). Ce n'est PAS un
  /// passkey WebAuthn/FIDO2 portable : juste un secret lié à cet appareil,
  /// stocké dans le trousseau, jamais dans la base SQLite elle-même.
  String? deviceToken;

  final String createdAt;
  String updatedAt;
  String? deletedAt;

  bool get isAdmin => role == UserRole.administrator;

  Map<String, Object?> toMap() => {
        'id': id,
        'username': username,
        'display_name': displayName,
        'password_hash': passwordHash,
        'password_salt': passwordSalt,
        'role': role.name,
        'touch_id_enabled': touchIdEnabled ? 1 : 0,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory UserAccount.fromMap(Map<String, Object?> m) => UserAccount(
        id: m['id'] as String,
        username: m['username'] as String,
        displayName: m['display_name'] as String,
        passwordHash: m['password_hash'] as String,
        passwordSalt: m['password_salt'] as String,
        role: UserRole.fromDb(m['role'] as String?),
        touchIdEnabled: (m['touch_id_enabled'] as int?) == 1,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}
