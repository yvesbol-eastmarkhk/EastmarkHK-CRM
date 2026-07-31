import 'package:flutter/material.dart';

import '../db/app_database.dart';
import '../models/models.dart' show nowIso;
import '../models/user_account.dart';
import '../services/auth_service.dart';
import '../services/current_session.dart';
import '../widgets/dictation_field.dart';
import '../widgets/password_field.dart';

/// Création du tout premier compte administrateur — obligatoire avant d'entrer
/// dans le CRM (plus de mode bootstrap ouvert sans authentification).
class BootstrapPanel extends StatefulWidget {
  const BootstrapPanel({super.key, required this.onSuccess});

  final VoidCallback onSuccess;

  @override
  State<BootstrapPanel> createState() => _BootstrapPanelState();
}

class _BootstrapPanelState extends State<BootstrapPanel> {
  final _username = TextEditingController();
  final _displayName = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _username.dispose();
    _displayName.dispose();
    _password.dispose();
    _passwordConfirm.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    final username = _username.text.trim();
    final displayName = _displayName.text.trim();
    if (username.isEmpty || displayName.isEmpty) {
      setState(() => _error = 'Nom et identifiant sont obligatoires');
      return;
    }
    if (_password.text.isEmpty) {
      setState(() => _error = 'Choisissez un mot de passe');
      return;
    }
    if (_password.text != _passwordConfirm.text) {
      setState(() => _error = 'Les mots de passe ne correspondent pas');
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });

    final db = AppDatabase.instance;
    final other = await db.userByUsername(username);
    if (other != null) {
      setState(() {
        _saving = false;
        _error = 'Cet identifiant est déjà utilisé';
      });
      return;
    }

    final (hash, salt) = AuthService.hashNewPassword(_password.text);
    final now = nowIso();
    final account = UserAccount(
      id: AppDatabase.newId(),
      username: username,
      displayName: displayName,
      passwordHash: hash,
      passwordSalt: salt,
      role: UserRole.administrator,
      createdAt: now,
      updatedAt: now,
    );
    await db.upsertUser(account);
    await CurrentSession.instance.adoptAfterBootstrap(account);
    if (!mounted) return;
    widget.onSuccess();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Bienvenue',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Créez le compte administrateur pour sécuriser votre CRM.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          DictationField(
            controller: _displayName,
            label: 'Nom affiché',
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _username,
            decoration: const InputDecoration(labelText: 'Identifiant'),
            autocorrect: false,
            enabled: !_saving,
          ),
          const SizedBox(height: 12),
          PasswordField(controller: _password, label: 'Mot de passe'),
          const SizedBox(height: 12),
          PasswordField(controller: _passwordConfirm, label: 'Confirmer le mot de passe'),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _saving ? null : _create,
            child: _saving
                ? const SizedBox(
                    width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                : const Text('Créer le compte administrateur'),
          ),
        ],
      ),
    );
  }
}
