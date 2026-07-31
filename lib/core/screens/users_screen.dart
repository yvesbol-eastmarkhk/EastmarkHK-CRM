import 'package:flutter/material.dart';

import '../db/app_database.dart';
import '../models/models.dart' show nowIso;
import '../models/user_account.dart';
import '../services/auth_service.dart';
import '../services/current_session.dart';
import '../services/device_passkey_service.dart';
import '../widgets/dictation_field.dart';
import '../widgets/eastmark_logo.dart';
import '../widgets/empty_state.dart';
import '../widgets/password_field.dart';

/// Gestion des utilisateurs — réservée aux administrateurs. Un compte
/// "user" n'a même pas accès à cet écran (voir garde dans settings_screen).
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserAccount> _users = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final users = await AppDatabase.instance.users();
    if (!mounted) return;
    setState(() {
      _users = users;
      _loading = false;
    });
  }

  Future<void> _openEditor({UserAccount? existing}) async {
    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => _UserEditorDialog(existing: existing),
    );
    if (saved == true) {
      await _load();
      // Si on vient de modifier le compte actuellement connecté, on
      // rafraîchit la session pour refléter le changement (nom, rôle…).
      if (existing != null && existing.id == CurrentSession.instance.user?.id) {
        await CurrentSession.instance.refresh();
      }
    }
  }

  Future<void> _delete(UserAccount u) async {
    final isSelf = u.id == CurrentSession.instance.user?.id;
    if (isSelf) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible de supprimer votre propre compte')),
      );
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Supprimer cet utilisateur ?'),
        content: Text('${u.displayName} (${u.username}) perdra l\'accès au CRM.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
          FilledButton.tonal(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await AppDatabase.instance.softDeleteUser(u.id);
    await DevicePasskeyService.removeToken(u.id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const EastmarkWordmark(height: 24), centerTitle: true),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openEditor(),
        icon: const Icon(Icons.person_add_alt_outlined),
        label: const Text('Utilisateur'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _users.isEmpty
              ? EmptyState(
                  icon: Icons.people_outline,
                  title: 'Aucun utilisateur',
                  subtitle: 'Créez le premier compte — il sera administrateur.',
                  actionLabel: 'Nouvel utilisateur',
                  onAction: () => _openEditor(),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _users.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 4),
                  itemBuilder: (ctx, i) {
                    final u = _users[i];
                    final isSelf = u.id == CurrentSession.instance.user?.id;
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(u.displayName.isEmpty ? '?' : u.displayName[0].toUpperCase()),
                        ),
                        title: Text('${u.displayName}${isSelf ? ' (vous)' : ''}'),
                        subtitle: Text('${u.username} · ${u.role.label}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              tooltip: 'Modifier',
                              icon: const Icon(Icons.edit_outlined),
                              onPressed: () => _openEditor(existing: u),
                            ),
                            IconButton(
                              tooltip: 'Supprimer',
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () => _delete(u),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

class _UserEditorDialog extends StatefulWidget {
  const _UserEditorDialog({this.existing});

  final UserAccount? existing;

  @override
  State<_UserEditorDialog> createState() => _UserEditorDialogState();
}

class _UserEditorDialogState extends State<_UserEditorDialog> {
  late final _username = TextEditingController(text: widget.existing?.username ?? '');
  late final _displayName = TextEditingController(text: widget.existing?.displayName ?? '');
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();
  late UserRole _role = widget.existing?.role ?? UserRole.user;
  late bool _touchIdEnabled = widget.existing?.touchIdEnabled ?? false;
  bool _touchIdSupported = false;
  bool _saving = false;
  String? _error;

  bool get _isNew => widget.existing == null;

  /// Le bouton Touch ID n'a de sens que sur SON PROPRE compte, sur CET
  /// appareil — le jeton d'appareil (DevicePasskeyService) n'est pas
  /// portable, l'activer pour quelqu'un d'autre depuis ce poste n'aurait
  /// aucun effet le jour où cette personne se connecte depuis le sien.
  bool get _isSelf => widget.existing != null && widget.existing!.id == CurrentSession.instance.user?.id;

  @override
  void initState() {
    super.initState();
    if (_isSelf) {
      DevicePasskeyService.deviceSupportsBiometrics().then((supported) {
        if (mounted) setState(() => _touchIdSupported = supported);
      });
    }
  }

  Future<void> _save() async {
    final username = _username.text.trim();
    final displayName = _displayName.text.trim();
    if (username.isEmpty || displayName.isEmpty) {
      setState(() => _error = 'Nom et identifiant sont obligatoires');
      return;
    }
    if (_isNew && _password.text.isEmpty) {
      setState(() => _error = 'Choisissez un mot de passe');
      return;
    }
    if (_password.text.isNotEmpty && _password.text != _passwordConfirm.text) {
      setState(() => _error = 'Les mots de passe ne correspondent pas');
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });

    final db = AppDatabase.instance;
    final now = nowIso();

    // Unicité de l'identifiant.
    final other = await db.userByUsername(username);
    if (other != null && other.id != widget.existing?.id) {
      setState(() {
        _saving = false;
        _error = 'Cet identifiant est déjà utilisé';
      });
      return;
    }

    if (widget.existing != null) {
      final u = widget.existing!;
      u.username = username;
      u.displayName = displayName;
      u.role = _role;
      if (_password.text.isNotEmpty) {
        final (hash, salt) = AuthService.hashNewPassword(_password.text);
        u.passwordHash = hash;
        u.passwordSalt = salt;
      }
      if (_isSelf && _touchIdEnabled != u.touchIdEnabled) {
        if (_touchIdEnabled) {
          await DevicePasskeyService.createToken(u.id);
        } else {
          await DevicePasskeyService.removeToken(u.id);
        }
        u.touchIdEnabled = _touchIdEnabled;
      }
      await db.upsertUser(u);
    } else {
      final (hash, salt) = AuthService.hashNewPassword(_password.text);
      final isFirstUser = (await db.users()).isEmpty;
      final u = UserAccount(
        id: AppDatabase.newId(),
        username: username,
        displayName: displayName,
        passwordHash: hash,
        passwordSalt: salt,
        // Le tout premier compte créé est administrateur d'office.
        role: isFirstUser ? UserRole.administrator : _role,
        createdAt: now,
        updatedAt: now,
      );
      await db.upsertUser(u);
      if (isFirstUser) {
        await CurrentSession.instance.adoptAfterBootstrap(u);
      }
    }

    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isNew ? 'Nouvel utilisateur' : 'Modifier l\'utilisateur'),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DictationField(controller: _displayName, label: 'Nom affiché', autofocus: true),
            const SizedBox(height: 12),
            TextField(
              controller: _username,
              decoration: const InputDecoration(labelText: 'Identifiant de connexion'),
              autocorrect: false,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<UserRole>(
              initialValue: _role,
              decoration: const InputDecoration(labelText: 'Rôle'),
              items: [
                for (final r in UserRole.values) DropdownMenuItem(value: r, child: Text(r.label)),
              ],
              onChanged: (v) => setState(() => _role = v!),
            ),
            const SizedBox(height: 12),
            PasswordField(
              controller: _password,
              label: _isNew ? 'Mot de passe' : 'Nouveau mot de passe (laisser vide pour ne pas changer)',
            ),
            const SizedBox(height: 12),
            PasswordField(controller: _passwordConfirm, label: 'Confirmer le mot de passe'),
            if (_isSelf && _touchIdSupported) ...[
              const SizedBox(height: 12),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Touch ID sur cet appareil'),
                subtitle: const Text('Déverrouiller sans retaper le mot de passe, ici uniquement.'),
                value: _touchIdEnabled,
                onChanged: (v) => setState(() => _touchIdEnabled = v),
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Annuler')),
        FilledButton(onPressed: _saving ? null : _save, child: const Text('Enregistrer')),
      ],
    );
  }
}
