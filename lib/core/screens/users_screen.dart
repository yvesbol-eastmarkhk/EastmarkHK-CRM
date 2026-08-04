import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../db/app_database.dart';
import '../models/models.dart' show nowIso;
import '../models/user_account.dart';
import '../services/auth_service.dart';
import '../services/current_session.dart';
import '../services/device_passkey_service.dart';
import '../widgets/dictation_field.dart';
import '../../ui/crm_overlay_page.dart';
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
    final l10n = AppLocalizations.of(context);
    final isSelf = u.id == CurrentSession.instance.user?.id;
    if (isSelf) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.usersDeleteSelfError)),
      );
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.usersDeleteConfirmTitle),
        content: Text(l10n.usersDeleteConfirmDetail(u.displayName, u.username)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
          FilledButton.tonal(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.commonDelete),
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
    final l10n = AppLocalizations.of(context);
    return CrmOverlayPage(
      title: l10n.usersTitle,
      subtitle: l10n.usersSubtitle,
      actions: [
        FilledButton.tonalIcon(
          onPressed: () => _openEditor(),
          icon: const Icon(Icons.person_add_alt_outlined, size: 18),
          label: Text(l10n.usersAddButton),
        ),
      ],
      child: _loading
          ? const Center(child: CircularProgressIndicator())
          : _users.isEmpty
              ? EmptyState(
                  icon: Icons.people_outline,
                  title: l10n.usersEmptyTitle,
                  subtitle: l10n.usersEmptySubtitle,
                  actionLabel: l10n.usersEmptyAction,
                  onAction: () => _openEditor(),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
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
                        title: Text(isSelf ? l10n.usersDisplayNameSelf(u.displayName) : u.displayName),
                        subtitle: Text('${u.username} · ${roleLabel(context, u.role)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              tooltip: l10n.commonEdit,
                              icon: const Icon(Icons.edit_outlined, color: Color(0xFF2563EB)),
                              onPressed: () => _openEditor(existing: u),
                            ),
                            IconButton(
                              tooltip: l10n.commonDelete,
                              icon: const Icon(Icons.delete_outline, color: Color(0xFFDC2626)),
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
    final l10n = AppLocalizations.of(context);
    final username = _username.text.trim();
    final displayName = _displayName.text.trim();
    if (username.isEmpty || displayName.isEmpty) {
      setState(() => _error = l10n.commonRequiredFields);
      return;
    }
    if (_isNew && _password.text.isEmpty) {
      setState(() => _error = l10n.commonChoosePassword);
      return;
    }
    if (_password.text.isNotEmpty && _password.text != _passwordConfirm.text) {
      setState(() => _error = l10n.commonPasswordMismatch);
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
        _error = l10n.commonUsernameTaken;
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
      if (_isSelf) {
        if (_touchIdEnabled) {
          // Recrée aussi un jeton manquant (trousseau isolé par un
          // changement de bundle ID) même si touchIdEnabled était déjà true.
          final hasToken = await DevicePasskeyService.hasToken(u.id);
          if (!hasToken) {
            await DevicePasskeyService.createToken(u.id);
          }
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
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(_isNew ? l10n.usersNewTitle : l10n.usersEditTitle),
      content: SizedBox(
        width: 560,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DictationField(controller: _displayName, label: l10n.commonDisplayNameLabel, autofocus: true),
            const SizedBox(height: 12),
            TextField(
              controller: _username,
              decoration: InputDecoration(labelText: l10n.usersLoginIdLabel),
              autocorrect: false,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<UserRole>(
              initialValue: _role,
              decoration: InputDecoration(labelText: l10n.usersRoleLabel),
              items: [
                for (final r in UserRole.values) DropdownMenuItem(value: r, child: Text(roleLabel(context, r))),
              ],
              onChanged: (v) => setState(() => _role = v!),
            ),
            const SizedBox(height: 12),
            PasswordField(
              controller: _password,
              label: _isNew ? null : l10n.usersNewPasswordLabel,
            ),
            const SizedBox(height: 12),
            PasswordField(controller: _passwordConfirm, label: l10n.commonConfirmPasswordLabel),
            if (_isSelf && _touchIdSupported) ...[
              const SizedBox(height: 12),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.usersTouchIdTitle),
                subtitle: Text(l10n.usersTouchIdSubtitle),
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
        TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
        FilledButton(onPressed: _saving ? null : _save, child: Text(l10n.commonSave)),
      ],
    );
  }
}
