import 'dart:async';

import 'package:flutter/material.dart';

import '../db/app_database.dart';
import '../services/current_session.dart';
import '../services/device_passkey_service.dart';
import '../services/remote_crm_sync_service.dart';
import '../widgets/eastmark_logo.dart';
import '../widgets/password_field.dart';

/// Formulaire de connexion réutilisable (splash ou écran dédié après déconnexion).
/// Comme e-Invoicing : lance le passkey automatiquement s'il est activé.
class LoginPanel extends StatefulWidget {
  const LoginPanel({
    super.key,
    required this.onSuccess,
    this.showWordmark = true,
  });

  final VoidCallback onSuccess;
  final bool showWordmark;

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  late final _username =
      TextEditingController(text: CurrentSession.instance.user?.username ?? '');
  final _password = TextEditingController();
  bool _saving = false;
  bool _passkeyEnabled = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    final user = CurrentSession.instance.user;
    if (user == null) return;
    final supported = await DevicePasskeyService.deviceSupportsBiometrics();
    final hasToken = supported ? await DevicePasskeyService.hasToken(user.id) : false;
    final enabled = user.touchIdEnabled && hasToken;
    if (!mounted) return;
    setState(() => _passkeyEnabled = enabled);
    if (enabled) {
      await _tryPasskey();
    }
  }

  Future<void> _tryPasskey() async {
    final user = CurrentSession.instance.user;
    if (user == null) return;
    setState(() {
      _saving = true;
      _error = null;
    });
    final ok = await DevicePasskeyService.unlock(user.id);
    if (!mounted) return;
    setState(() => _saving = false);
    if (!ok) return;
    CurrentSession.instance.markUnlockedByBiometrics();
    _enterApp();
  }

  Future<void> _login() async {
    final username = _username.text.trim();
    if (username.isEmpty || _password.text.isEmpty) {
      setState(() => _error = 'Identifiant et mot de passe requis');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    final ok = await CurrentSession.instance.login(username, _password.text);
    if (!mounted) return;
    if (!ok) {
      setState(() {
        _saving = false;
        _error = 'Identifiant ou mot de passe incorrect';
      });
      return;
    }
    await _enablePasskeyByDefault();
    if (!mounted) return;
    _enterApp();
  }

  /// Active Touch ID par défaut après la première connexion par mot de passe,
  /// comme le passkey auto sur e-Invoicing — pas de dialogue « Plus tard ».
  Future<void> _enablePasskeyByDefault() async {
    final user = CurrentSession.instance.user;
    if (user == null || user.touchIdEnabled) return;
    final supported = await DevicePasskeyService.deviceSupportsBiometrics();
    if (!supported) return;
    await DevicePasskeyService.createToken(user.id);
    user.touchIdEnabled = true;
    await AppDatabase.instance.upsertUser(user);
  }

  void _enterApp() {
    unawaited(RemoteCrmSyncService.instance.syncFromSettings());
    widget.onSuccess();
  }

  @override
  Widget build(BuildContext context) {
    final user = CurrentSession.instance.user;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showWordmark) ...[
            const EastmarkWordmark(height: 40),
            const SizedBox(height: 32),
          ],
          Text(
            user != null ? 'Bon retour, ${user.displayName}' : 'Connexion',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          if (_passkeyEnabled) ...[
            FilledButton.icon(
              onPressed: _saving ? null : _tryPasskey,
              icon: _saving
                  ? const SizedBox(
                      width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.fingerprint),
              label: Text(_saving ? 'Vérification…' : 'Déverrouiller avec Touch ID'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('ou',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant)),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
          ],
          TextField(
            controller: _username,
            decoration: const InputDecoration(labelText: 'Identifiant'),
            autocorrect: false,
            enabled: !_saving,
            autofocus: !_passkeyEnabled,
            onSubmitted: (_) => _login(),
          ),
          const SizedBox(height: 12),
          PasswordField(controller: _password, label: 'Mot de passe'),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _saving ? null : _login,
              child: _saving && !_passkeyEnabled
                  ? const SizedBox(
                      width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Se connecter'),
            ),
          ),
        ],
      ),
    );
  }
}
