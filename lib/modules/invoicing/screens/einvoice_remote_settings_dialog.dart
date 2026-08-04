import 'package:flutter/material.dart';

import '../../../l10n/gen/app_localizations.dart';
import '../../../platform/einvoice_remote_config.dart';
import '../einvoice_remote_api.dart';

/// Dialogue de saisie des identifiants API distante d'e-Invoicing — mêmes
/// valeurs que Réglages → Stockage distant dans l'app e-Invoicing (URL de
/// base, login, mot de passe). Nécessaire une seule fois quand e-Invoicing
/// est configurée en mode distant (le Keychain n'est pas partagé entre les
/// deux apps).
Future<bool> showEinvoiceRemoteSettingsDialog(BuildContext context) async {
  final creds = await EinvoiceRemoteConfig.load();
  if (!context.mounted) return false;
  final l10n = AppLocalizations.of(context);
  // Première config remote : préremplir le domaine unifié.
  final initialUrl = creds.baseUrl.trim().isEmpty
      ? 'https://emhk.eastmarkhk.com/invoice/index.php'
      : EinvoiceRemoteConfig.normalizeBaseUrl(creds.baseUrl);
  final initialUser = creds.user.trim().isEmpty ||
          creds.user == 'inv@eastmarkhk.com' ||
          creds.user == 'emhk-e-inv@eastmarkhk.com'
      ? 'emhk@eastmarkhk.com'
      : creds.user;
  final urlCtrl = TextEditingController(text: initialUrl);
  final userCtrl = TextEditingController(text: initialUser);
  final passCtrl = TextEditingController(text: creds.password);
  var testing = false;
  String? testResult;
  var testOk = false;

  final saved = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        title: Text(l10n.eiRemoteTitle),
        content: SizedBox(
          width: 640,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.eiRemoteBody),
              const SizedBox(height: 16),
              TextField(
                controller: urlCtrl,
                decoration: InputDecoration(
                  labelText: l10n.settingsServerLabel,
                  hintText: 'https://emhk.eastmarkhk.com/invoice/index.php',
                  helperText: 'Même compte / mot de passe que e-Invoicing / CRM (HTTPS)',
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: userCtrl,
                decoration: InputDecoration(
                  labelText: l10n.settingsAccountLabel,
                  hintText: 'emhk@eastmarkhk.com',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passCtrl,
                decoration: InputDecoration(
                  labelText: l10n.commonPasswordLabel,
                  border: const OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 12),
              if (testResult != null)
                Text(
                  testResult!,
                  style: TextStyle(color: testOk ? Colors.green.shade700 : Colors.red.shade700),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: testing
                ? null
                : () async {
                    setState(() {
                      testing = true;
                      testResult = null;
                    });
                    urlCtrl.text = EinvoiceRemoteConfig.normalizeBaseUrl(urlCtrl.text);
                    await EinvoiceRemoteConfig.save(EinvoiceRemoteCredentials(
                      baseUrl: urlCtrl.text,
                      user: userCtrl.text,
                      password: passCtrl.text,
                    ));
                    try {
                      await EInvoiceRemoteApi.instance.testConnection();
                      setState(() {
                        testing = false;
                        testOk = true;
                        testResult = l10n.eiRemoteSuccess;
                      });
                    } catch (e) {
                      setState(() {
                        testing = false;
                        testOk = false;
                        testResult = l10n.eiRemoteFail('$e');
                      });
                    }
                  },
            child: Text(
                testing ? l10n.eiRemoteTesting : l10n.settingsTestConnection),
          ),
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.commonCancel)),
          FilledButton(
            onPressed: () async {
              final normalized = EinvoiceRemoteConfig.normalizeBaseUrl(urlCtrl.text);
              urlCtrl.text = normalized;
              await EinvoiceRemoteConfig.save(EinvoiceRemoteCredentials(
                baseUrl: normalized,
                user: userCtrl.text,
                password: passCtrl.text,
              ));
              if (ctx.mounted) Navigator.pop(ctx, true);
            },
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    ),
  );
  return saved == true;
}
