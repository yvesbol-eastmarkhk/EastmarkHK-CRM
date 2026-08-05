import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../db/app_database.dart';
import '../services/current_session.dart';
import '../services/device_passkey_service.dart';
import '../services/remote_crm_sync_service.dart';
import '../widgets/eastmark_logo.dart';
import '../widgets/password_field.dart';

/// Formulaire de connexion — le passkey / Touch ID est toujours proposé
/// au-dessus de la fenêtre (carte) dès que l'appareil et le compte le permettent.
class LoginPanel extends StatefulWidget {
  const LoginPanel({
    super.key,
    required this.onSuccess,
    this.showWordmark = true,
    /// Si `true`, le bouton passkey est rendu ici (dans le panneau).
    /// Si `false`, il est placé au-dessus de la carte login (splash).
    this.embedPasskey = true,
    this.onPasskeyAvailabilityChanged,
  });

  final VoidCallback onSuccess;
  final bool showWordmark;
  final bool embedPasskey;
  final ValueChanged<bool>? onPasskeyAvailabilityChanged;

  @override
  State<LoginPanel> createState() => LoginPanelState();
}

class LoginPanelState extends State<LoginPanel> {
  late final _username =
      TextEditingController(text: CurrentSession.instance.user?.username ?? '');
  final _password = TextEditingController();
  bool _saving = false;
  bool _biometricsAvailable = false;
  bool _switchAccount = CurrentSession.instance.user == null;
  bool _hasPasskeyToken = false;
  String? _error;

  bool get _rememberedUnlock =>
      !_switchAccount && CurrentSession.instance.user != null;

  /// Passkey seulement si un jeton existe déjà (créé après un login MDP réussi).
  bool get showPasskey =>
      _biometricsAvailable &&
      _hasPasskeyToken &&
      _rememberedUnlock &&
      CurrentSession.instance.user != null;

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

  void _notifyPasskeyAvailability() {
    widget.onPasskeyAvailabilityChanged?.call(showPasskey);
  }

  Future<void> _bootstrap() async {
    final user = CurrentSession.instance.user;
    final supported = await DevicePasskeyService.deviceSupportsBiometrics();
    var hasToken = false;
    if (user != null) {
      try {
        hasToken = await DevicePasskeyService.hasToken(user.id);
      } catch (_) {}
    }
    if (!mounted) return;
    setState(() {
      _biometricsAvailable = supported;
      _hasPasskeyToken = hasToken;
    });
    _notifyPasskeyAvailability();

    if (user == null || !supported || !hasToken) return;
    await tryPasskey();
  }

  Future<void> tryPasskey() async {
    final user = CurrentSession.instance.user;
    if (user == null || !_biometricsAvailable) return;
    final l10n = AppLocalizations.of(context);
    // Ne jamais créer un jeton ici : sans MDP validé une fois, ce serait
    // un déverrouillage biométrique d’un compte sync « fantôme ».
    if (!await DevicePasskeyService.hasToken(user.id)) {
      if (mounted) {
        setState(() {
          _hasPasskeyToken = false;
          _error = l10n.loginPasskeyNotConfigured;
        });
        _notifyPasskeyAvailability();
      }
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    final ok = await DevicePasskeyService.unlock(user.id);
    if (!mounted) return;
    setState(() => _saving = false);
    if (!ok) {
      setState(() {
        _error = l10n.loginPasskeyRefused;
      });
      return;
    }
    CurrentSession.instance.markUnlockedByBiometrics();
    _enterApp();
  }

  Future<void> _login() async {
    final l10n = AppLocalizations.of(context);
    final remembered = CurrentSession.instance.user;
    final username = _rememberedUnlock
        ? remembered!.username
        : _username.text.trim();
    if (username.isEmpty || _password.text.isEmpty) {
      setState(() => _error = l10n.loginRequiredFields);
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
        _error = l10n.loginInvalidCredentials;
      });
      return;
    }
    await _enablePasskeyByDefault();
    if (!mounted) return;
    _enterApp();
  }

  Future<void> _enablePasskeyByDefault() async {
    final user = CurrentSession.instance.user;
    if (user == null) return;
    final supported = await DevicePasskeyService.deviceSupportsBiometrics();
    if (!supported) return;
    try {
      await DevicePasskeyService.createToken(user.id);
      user.touchIdEnabled = true;
      await AppDatabase.instance.upsertUser(user);
      if (mounted) setState(() => _hasPasskeyToken = true);
    } catch (e, st) {
      debugPrint('LoginPanel._enablePasskeyByDefault failed: $e\n$st');
    }
  }

  void _enterApp() {
    unawaited(RemoteCrmSyncService.instance.syncFromSettings());
    widget.onSuccess();
  }

  Future<void> _showResetPassword() async {
    final users = await AppDatabase.instance.users();
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    if (users.isEmpty) {
      setState(() => _error = l10n.loginNoAccount);
      return;
    }

    final usernameCtrl = TextEditingController(
      text: _rememberedUnlock
          ? (CurrentSession.instance.user?.username ?? '')
          : _username.text.trim(),
    );
    if (usernameCtrl.text.isEmpty && users.length == 1) {
      usernameCtrl.text = users.first.username;
    }
    final passCtrl = TextEditingController();
    final confirmCtrl = TextEditingController();
    String? dialogError;

    final saved = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return AlertDialog(
              title: Text(l10n.loginResetPasswordTitle),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: 360,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.loginResetHint,
                        style: Theme.of(ctx).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        initialValue: users.any((u) => u.username == usernameCtrl.text)
                            ? usernameCtrl.text
                            : users.first.username,
                        decoration: InputDecoration(
                          labelText: l10n.loginAccountLabel,
                          border: const OutlineInputBorder(),
                        ),
                        items: [
                          for (final u in users)
                            DropdownMenuItem(
                              value: u.username,
                              child: Text('${u.displayName} (${u.username})'),
                            ),
                        ],
                        onChanged: (v) {
                          if (v == null) return;
                          usernameCtrl.text = v;
                        },
                      ),
                      const SizedBox(height: 12),
                      PasswordField(
                        controller: passCtrl,
                        label: l10n.loginNewPasswordLabel,
                      ),
                      const SizedBox(height: 12),
                      PasswordField(
                        controller: confirmCtrl,
                        label: l10n.loginConfirmLabel,
                      ),
                      if (dialogError != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          dialogError!,
                          style: TextStyle(
                            color: Theme.of(ctx).colorScheme.error,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text(l10n.commonCancel),
                ),
                FilledButton(
                  onPressed: () {
                    final p = passCtrl.text;
                    final c = confirmCtrl.text;
                    if (p.length < 4) {
                      setDialogState(() {
                        dialogError = l10n.loginTooShort;
                      });
                      return;
                    }
                    if (p != c) {
                      setDialogState(() {
                        dialogError = l10n.loginMismatch;
                      });
                      return;
                    }
                    Navigator.pop(ctx, true);
                  },
                  child: Text(l10n.loginResetButton),
                ),
              ],
            );
          },
        );
      },
    );

    final username = usernameCtrl.text.trim();
    final newPassword = passCtrl.text;
    usernameCtrl.dispose();
    passCtrl.dispose();
    confirmCtrl.dispose();

    if (saved != true || !mounted) return;

    final account = await AppDatabase.instance.resetLocalPassword(
      username: username,
      newPassword: newPassword,
    );
    if (!mounted) return;
    if (account == null) {
      setState(() => _error = l10n.loginAccountNotFound);
      return;
    }
    try {
      await DevicePasskeyService.removeToken(account.id);
    } catch (_) {}

    final ok = await CurrentSession.instance.login(username, newPassword);
    if (!mounted) return;
    if (!ok) {
      setState(() {
        _error = l10n.loginResetDone;
        _username.text = username;
        _switchAccount = true;
        _hasPasskeyToken = false;
      });
      _notifyPasskeyAvailability();
      return;
    }
    await _enablePasskeyByDefault();
    if (!mounted) return;
    _enterApp();
  }

  /// Bouton passkey — à placer au-dessus de la carte login.
  Widget buildPasskeyButton(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (!showPasskey) return const SizedBox.shrink();
    return SizedBox(
      width: 380,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onPressed: _saving ? null : tryPasskey,
        icon: _saving
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
              )
            : const Icon(Icons.fingerprint, size: 28),
        label: Text(
          _saving ? l10n.loginVerifying : l10n.loginUnlockTouchId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final user = CurrentSession.instance.user;
    final scheme = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.embedPasskey && showPasskey) ...[
            buildPasskeyButton(context),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    l10n.loginOr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),
          ],
          if (widget.showWordmark) ...[
            const EastmarkWordmark(height: 40),
            const SizedBox(height: 24),
          ],
          Text(
            _rememberedUnlock
                ? l10n.loginWelcomeBack(user!.displayName)
                : l10n.loginTitle,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          if (!_rememberedUnlock) ...[
            TextField(
              controller: _username,
              decoration: InputDecoration(labelText: l10n.commonUsernameLabel),
              autocorrect: false,
              enabled: !_saving,
              autofocus: !showPasskey,
              onSubmitted: (_) => _login(),
            ),
            const SizedBox(height: 12),
          ],
          PasswordField(
            controller: _password,
            autofocus: _rememberedUnlock && !showPasskey,
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!, style: TextStyle(color: scheme.error)),
          ],
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _saving ? null : _login,
              child: _saving && !showPasskey
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.loginSubmit),
            ),
          ),
          TextButton(
            onPressed: _saving ? null : _showResetPassword,
            child: Text(
              l10n.loginForgotPassword,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.primary,
                  ),
            ),
          ),
          if (_rememberedUnlock) ...[
            TextButton(
              onPressed: _saving
                  ? null
                  : () {
                      setState(() {
                        _switchAccount = true;
                        _username.clear();
                        _error = null;
                      });
                      _notifyPasskeyAvailability();
                    },
              child: Text(
                l10n.loginOtherAccount,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ] else if (user != null) ...[
            TextButton(
              onPressed: _saving
                  ? null
                  : () async {
                      final hasToken =
                          await DevicePasskeyService.hasToken(user.id);
                      if (!mounted) return;
                      setState(() {
                        _switchAccount = false;
                        _username.text = user.username;
                        _error = null;
                        _hasPasskeyToken = hasToken;
                      });
                      _notifyPasskeyAvailability();
                    },
              child: Text(
                l10n.loginUseSavedAccount,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
