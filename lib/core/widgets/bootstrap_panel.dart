import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context);
    final username = _username.text.trim();
    final displayName = _displayName.text.trim();
    if (username.isEmpty || displayName.isEmpty) {
      setState(() => _error = l10n.commonRequiredFields);
      return;
    }
    if (_password.text.isEmpty) {
      setState(() => _error = l10n.commonChoosePassword);
      return;
    }
    if (_password.text != _passwordConfirm.text) {
      setState(() => _error = l10n.commonPasswordMismatch);
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
        _error = l10n.commonUsernameTaken;
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
    final l10n = AppLocalizations.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.bootstrapWelcome,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.bootstrapSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          DictationField(
            controller: _displayName,
            label: l10n.commonDisplayNameLabel,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _username,
            decoration: InputDecoration(labelText: l10n.commonUsernameLabel),
            autocorrect: false,
            enabled: !_saving,
          ),
          const SizedBox(height: 12),
          PasswordField(controller: _password),
          const SizedBox(height: 12),
          PasswordField(controller: _passwordConfirm, label: l10n.commonConfirmPasswordLabel),
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
                : Text(l10n.bootstrapSubmit),
          ),
        ],
      ),
    );
  }
}
