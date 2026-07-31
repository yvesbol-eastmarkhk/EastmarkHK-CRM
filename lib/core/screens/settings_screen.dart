import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:share_plus/share_plus.dart';

import '../db/app_database.dart';
import '../services/app_locale_settings.dart';
import '../services/company_logo_service.dart';
import '../services/current_session.dart';
import '../services/currency_settings.dart';
import '../services/dictation_settings.dart';
import '../services/pipeline_settings.dart';
import '../services/remote_crm_sync_service.dart';
import '../utils/responsive_form.dart';
import '../widgets/app_language_picker.dart';
import '../widgets/country_flag_icon.dart';
import '../widgets/currency_picker.dart';
import '../widgets/dictation_field.dart';
import '../widgets/dictation_language_picker.dart';
import '../widgets/eastmark_logo.dart';
import '../widgets/party_address_fields.dart';
import '../widgets/password_field.dart';
import '../widgets/pipeline_settings_dialog.dart';
import '../widgets/crm_import_export_panel.dart';
import 'login_screen.dart';
import 'modules_screen.dart';
import 'users_screen.dart';

const _secureStorage = FlutterSecureStorage();
// Clé partagée avec RemoteCrmSyncService — un seul mot de passe de compte
// de sync, saisi ici, relu par le service pour les synchronisations
// automatiques en tâche de fond.
const _syncPasswordKey = RemoteCrmSyncService.passwordStorageKey;

/// Réglages — configuration ponctuelle (langues, profil société, sync),
/// par opposition à la colonne de gauche qui reste réservée aux actions
/// quotidiennes. Accessible via l'icône ⚙️ à l'extrême droite du header.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

enum _SyncMode { local, remote }

class _SettingsScreenState extends State<SettingsScreen> {
  final _companyName = TextEditingController();
  final _syncServer = TextEditingController(text: 'https://crm.eastmarkhk.com');
  final _syncAccount = TextEditingController(text: 'crm@eastmarkhk.com');
  final _syncPassword = TextEditingController();

  String _country = 'BE';
  String _taxId = '';
  String _address = '';
  String _district = '';
  String _zip = '';
  String _city = '';
  String _state = '';
  String _phone = '';
  String _phoneCountry = '';
  String _email = '';

  File? _logoFile;
  // Standalone par défaut — l'utilisateur active lui-même le mode remote
  // dans Réglages quand le serveur crm.eastmarkhk.com sera prêt.
  _SyncMode _syncMode = _SyncMode.local;
  bool _loading = true;
  bool _saving = false;
  bool _syncing = false;
  String? _syncStatus;

  static const _keys = [
    'company_name',
    'company_country',
    'company_tax_id',
    'company_address',
    'company_district',
    'company_zip',
    'company_city',
    'company_state',
    'company_phone',
    'company_phone_country',
    'company_email',
    'sync_mode',
    'sync_server',
    'sync_account',
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final values = await AppDatabase.instance.getSettings(_keys);
    final logo = await CompanyLogoService.currentFile();
    String? syncPassword;
    try {
      syncPassword = await _secureStorage.read(key: _syncPasswordKey);
    } catch (_) {
      // Trousseau indisponible (entitlement manquant) — le champ reste vide,
      // l'utilisateur pourra le re-saisir sans bloquer le reste des réglages.
    }
    await CurrentSession.instance.ensureLoaded();
    if (!mounted) return;
    setState(() {
      _companyName.text = values['company_name'] ?? '';
      _country = values['company_country']?.isNotEmpty == true ? values['company_country']! : 'BE';
      _taxId = values['company_tax_id'] ?? '';
      _address = values['company_address'] ?? '';
      _district = values['company_district'] ?? '';
      _zip = values['company_zip'] ?? '';
      _city = values['company_city'] ?? '';
      _state = values['company_state'] ?? '';
      _phone = values['company_phone'] ?? '';
      _phoneCountry = values['company_phone_country'] ?? '';
      _email = values['company_email'] ?? '';
      // Pas de réglage sauvegardé encore → on garde le défaut "remote" déjà
      // posé dans l'état initial plutôt que de forcer "local".
      if (values['sync_mode'] != null) {
        _syncMode = values['sync_mode'] == 'remote' ? _SyncMode.remote : _SyncMode.local;
      }
      if (values['sync_server']?.isNotEmpty ?? false) {
        _syncServer.text = values['sync_server']!;
      }
      if (values['sync_account']?.isNotEmpty ?? false) {
        _syncAccount.text = values['sync_account']!;
      }
      _syncPassword.text = syncPassword ?? '';
      _logoFile = logo;
      _loading = false;
    });
  }

  Future<void> _pickLogo() async {
    final file = await CompanyLogoService.pickAndSave();
    if (file != null && mounted) setState(() => _logoFile = file);
    await CompanyLogoSettings.instance.refresh();
  }

  Future<void> _removeLogo() async {
    await CompanyLogoService.remove();
    if (mounted) setState(() => _logoFile = null);
    await CompanyLogoSettings.instance.refresh();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final db = AppDatabase.instance;
    await db.setSetting('company_name', _companyName.text.trim());
    await db.setSetting('company_country', _country);
    await db.setSetting('company_tax_id', _taxId);
    await db.setSetting('company_address', _address);
    await db.setSetting('company_district', _district);
    await db.setSetting('company_zip', _zip);
    await db.setSetting('company_city', _city);
    await db.setSetting('company_state', _state);
    await db.setSetting('company_phone', _phone);
    await db.setSetting('company_phone_country', _phoneCountry);
    await db.setSetting('company_email', _email);
    await db.setSetting('sync_mode', _syncMode == _SyncMode.remote ? 'remote' : 'local');
    await db.setSetting('sync_server', _syncServer.text.trim());
    await db.setSetting('sync_account', _syncAccount.text.trim());
    // Le mot de passe de sync vit dans le trousseau sécurisé, jamais dans
    // la table settings (qui elle sera synchronisée en clair plus tard).
    var keychainError = false;
    try {
      if (_syncPassword.text.isEmpty) {
        await _secureStorage.delete(key: _syncPasswordKey);
      } else {
        await _secureStorage.write(key: _syncPasswordKey, value: _syncPassword.text);
      }
    } catch (_) {
      keychainError = true;
    }
    if (!mounted) return;
    setState(() => _saving = false);
    await RemoteCrmSyncService.instance.refreshRemoteModeFlag();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      keychainError
          ? const SnackBar(
              content: Text(
                  'Réglages enregistrés, mais le trousseau sécurisé est indisponible — le mot de passe de sync n\'a pas pu être stocké (relancez l\'app après une reconstruction complète).'),
              duration: Duration(seconds: 6),
            )
          : const SnackBar(content: Text('Réglages enregistrés')),
    );
  }

  Future<void> _exportBackup() async {
    try {
      final file = await AppDatabase.instance.exportBackupCopy();
      await Share.shareXFiles([XFile(file.path)], text: 'Sauvegarde EastmarkHK CRM');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Export impossible : $e')),
      );
    }
  }

  /// Lance une synchronisation immédiate avec les valeurs actuellement
  /// saisies à l'écran — sans attendre que l'utilisateur clique
  /// "Enregistrer" d'abord, pour pouvoir tester la connexion tout de suite.
  Future<void> _syncNow() async {
    final server = _syncServer.text.trim();
    final account = _syncAccount.text.trim();
    final password = _syncPassword.text;
    if (server.isEmpty || account.isEmpty || password.isEmpty) {
      setState(() => _syncStatus = 'Serveur, compte et mot de passe requis');
      return;
    }
    setState(() {
      _syncing = true;
      _syncStatus = null;
    });
    final outcome = await RemoteCrmSyncService.instance
        .syncNow(server: server, account: account, password: password);
    if (!mounted) return;
    setState(() {
      _syncing = false;
      _syncStatus = outcome.message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const EastmarkWordmark(height: 24), centerTitle: true),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text('Réglages', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 4),
                Text(
                  'Configuration ponctuelle de l\'application.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 28),

                _SectionCard(
                  icon: Icons.translate,
                  title: 'Langues & devise',
                  children: [
                    formRowOrColumn(
                      context: context,
                      children: [
                        formFlexChild(
                          context: context,
                          child: ListenableBuilder(
                            listenable: AppLocaleSettings.instance,
                            builder: (context, _) => _SettingsRow(
                              label: 'Langue de l\'application',
                              value: AppLocaleSettings.instance.currentLabel(),
                              onTap: () => showAppLanguagePicker(context),
                            ),
                          ),
                        ),
                        formFlexChild(
                          context: context,
                          child: ListenableBuilder(
                            listenable: DictationSettings.instance,
                            builder: (context, _) => _SettingsRow(
                              label: 'Langue de dictée',
                              value: DictationSettings.instance.currentLabel(),
                              onTap: () => showDictationLanguagePicker(context),
                            ),
                          ),
                        ),
                        formFlexChild(
                          context: context,
                          child: ListenableBuilder(
                            listenable: CurrencySettings.instance,
                            builder: (context, _) {
                              final c = CurrencySettings.instance.current;
                              return _SettingsRow(
                                label: 'Devise',
                                value: '${c.symbol} ${c.code}',
                                leading: CountryFlagIcon(countryCode: c.flag, width: 22, height: 16),
                                onTap: () => showCurrencyPicker(context),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Montants affichés au format 1,234.56 (virgule = milliers, point = décimales) '
                        'et dates au format jj/mm/aaaa, quelle que soit la langue de l\'interface.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.apartment_outlined,
                  title: 'Société',
                  subtitle: 'Identité de la société qui utilise ce CRM — réutilisée plus tard '
                      'dans le header (marque blanche) et l\'en-tête des documents PDF.',
                  children: [
                    _LogoPicker(file: _logoFile, onPick: _pickLogo, onRemove: _removeLogo),
                    const SizedBox(height: 16),
                    PartyAddressFields(
                      name: DictationField(controller: _companyName, label: 'Nom de la société'),
                      countryCode: _country,
                      taxId: _taxId,
                      address: _address,
                      district: _district,
                      zip: _zip,
                      city: _city,
                      state: _state,
                      phone: _phone,
                      phoneCountryCode: _phoneCountry,
                      email: _email,
                      onCountryChanged: (v) => setState(() => _country = v),
                      onTaxIdChanged: (v) => _taxId = v,
                      onAddressChanged: (v) => _address = v,
                      onDistrictChanged: (v) => _district = v,
                      onZipChanged: (v) => _zip = v,
                      onCityChanged: (v) => _city = v,
                      onStateChanged: (v) => _state = v,
                      onPhoneChanged: (v) => _phone = v,
                      onPhoneCountryChanged: (v) => setState(() => _phoneCountry = v),
                      onEmailChanged: (v) => _email = v,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.sync_outlined,
                  title: 'Synchronisation',
                  subtitle:
                      'Par défaut, toutes les données restent en local (SQLite) sur cet appareil.',
                  children: [
                    RadioListTile<_SyncMode>(
                      contentPadding: EdgeInsets.zero,
                      value: _SyncMode.local,
                      groupValue: _syncMode,
                      title: const Text('Standalone (local uniquement)'),
                      subtitle: const Text('Aucune donnée envoyée en dehors de cet appareil'),
                      onChanged: (v) => setState(() => _syncMode = v!),
                    ),
                    RadioListTile<_SyncMode>(
                      contentPadding: EdgeInsets.zero,
                      value: _SyncMode.remote,
                      groupValue: _syncMode,
                      title: const Text('Base partagée (remote)'),
                      subtitle: const Text('Synchronise avec un serveur PHP + SQLite (voir server/crm-sync/)'),
                      onChanged: (v) => setState(() => _syncMode = v!),
                    ),
                    if (_syncMode == _SyncMode.remote) ...[
                      const SizedBox(height: 8),
                      TextField(
                        controller: _syncServer,
                        decoration: const InputDecoration(labelText: 'Serveur', border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _syncAccount,
                        decoration: const InputDecoration(labelText: 'Compte', border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 12),
                      PasswordField(controller: _syncPassword, label: 'Mot de passe'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Stocké dans le trousseau sécurisé de l\'appareil — jamais dans la base de données.',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          OutlinedButton.icon(
                            onPressed: _syncing ? null : _syncNow,
                            icon: _syncing
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2))
                                : const Icon(Icons.sync),
                            label: const Text('Synchroniser maintenant'),
                          ),
                          if (_syncStatus != null) ...[
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                _syncStatus!,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant),
                              ),
                            ),
                          ],
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Pull automatique toutes les 25 s en tâche de fond ; push immédiat après chaque modification (mode remote actif). Pas de pull pendant une saisie en cours.',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.extension_outlined,
                  title: 'Modules',
                  subtitle: 'Facturation (e-Invoice), Scanner, Sync… — essai 7 jours ou activation licence.',
                  children: [
                    OutlinedButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ModulesScreen()),
                      ),
                      icon: const Icon(Icons.storefront_outlined),
                      label: const Text('Parcourir les modules'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.import_export_outlined,
                  title: 'Import / export',
                  subtitle: 'Clients, contacts et opportunités en CSV ; contacts depuis vCard.',
                  children: [
                    CrmImportExportPanel(onChanged: () {}),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.view_kanban_outlined,
                  title: 'Pipeline',
                  subtitle: 'Personnalisez les étapes et leurs libellés.',
                  children: [
                    OutlinedButton.icon(
                      onPressed: () => showPipelineSettingsDialog(context),
                      icon: const Icon(Icons.tune_outlined),
                      label: const Text('Configurer les étapes'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.backup_outlined,
                  title: 'Sauvegarde locale',
                  subtitle: 'Exporte une copie de votre base SQLite — utile avant une mise à jour ou pour archiver.',
                  children: [
                    OutlinedButton.icon(
                      onPressed: _exportBackup,
                      icon: const Icon(Icons.file_download_outlined),
                      label: const Text('Exporter la base (.db)'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.people_outline,
                  title: 'Utilisateurs',
                  subtitle: CurrentSession.instance.isAdmin
                      ? 'Comptes, rôles et mots de passe — administrateur et utilisateur.'
                      : 'Réservé aux administrateurs.',
                  children: [
                    if (CurrentSession.instance.isAdmin)
                      OutlinedButton.icon(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const UsersScreen()),
                          );
                          if (mounted) setState(() {});
                        },
                        icon: const Icon(Icons.manage_accounts_outlined),
                        label: const Text('Gérer les utilisateurs'),
                      )
                    else
                      Row(
                        children: [
                          Icon(Icons.lock_outline,
                              size: 18, color: Theme.of(context).colorScheme.onSurfaceVariant),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Connectez-vous avec un compte administrateur pour voir ou modifier les utilisateurs et leurs mots de passe.',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),

                const SizedBox(height: 28),
                FilledButton.icon(
                  onPressed: _saving ? null : _save,
                  icon: _saving
                      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.check),
                  label: const Text('Enregistrer'),
                ),
                if (CurrentSession.instance.user != null) ...[
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final ok = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Se déconnecter ?'),
                          content: const Text(
                              'Vous devrez saisir votre mot de passe (ou Touch ID) pour revenir.'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('Annuler')),
                            FilledButton.tonal(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text('Se déconnecter')),
                          ],
                        ),
                      );
                      if (ok != true || !mounted) return;
                      await CurrentSession.instance.logout();
                      if (!mounted) return;
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Se déconnecter'),
                  ),
                ],
                const SizedBox(height: 40),
              ],
            ),
    );
  }
}

class _LogoPicker extends StatelessWidget {
  const _LogoPicker({required this.file, required this.onPick, required this.onRemove});

  final File? file;
  final VoidCallback onPick;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Logo de la société', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 4),
        Text(
          'Affiché en haut de l\'application et dans la bannière.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: scheme.outlineVariant),
          ),
          clipBehavior: Clip.antiAlias,
          child: file != null
              ? Image.file(file!, fit: BoxFit.contain)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 48, color: scheme.onSurfaceVariant),
                    const SizedBox(height: 12),
                    Text(
                      'Aucun logo — ajoutez celui de votre entreprise',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: scheme.onSurfaceVariant),
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OutlinedButton.icon(
              onPressed: onPick,
              icon: const Icon(Icons.upload_outlined, size: 18),
              label: Text(file == null ? 'Choisir une image' : 'Changer le logo'),
            ),
            if (file != null)
              TextButton(onPressed: onRemove, child: const Text('Supprimer')),
          ],
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.children,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: scheme.primary, size: 20),
                const SizedBox(width: 10),
                Text(title, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 6),
              Text(subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
            ],
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.label, required this.value, required this.onTap, this.leading});

  final String label;
  final String value;
  final VoidCallback onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 8)],
            Expanded(child: Text(label)),
            Text(value, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
            const SizedBox(width: 6),
            const Icon(Icons.chevron_right, size: 18),
          ],
        ),
      ),
    );
  }
}
