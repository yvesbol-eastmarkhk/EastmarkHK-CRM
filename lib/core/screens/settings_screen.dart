import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/gen/app_localizations.dart';
import '../constants/sync_defaults.dart';
import '../db/app_database.dart';
import '../services/app_locale_settings.dart';
import '../services/company_logo_service.dart';
import '../services/current_session.dart';
import '../services/currency_settings.dart';
import '../services/dictation_settings.dart';
import '../services/remote_crm_sync_service.dart';
import '../utils/file_export.dart';
import '../widgets/app_language_picker.dart';
import '../widgets/country_flag_icon.dart';
import '../widgets/currency_picker.dart';
import '../widgets/dictation_field.dart';
import '../widgets/dictation_language_picker.dart';
import '../../ui/crm_overlay_page.dart';
import '../widgets/party_address_fields.dart';
import '../widgets/password_field.dart';
import '../widgets/pipeline_settings_dialog.dart';
import '../modules/module_registry.dart';
import '../widgets/crm_import_export_panel.dart';
import '../../platform/entitlement_service.dart';
import '../../platform/einvoice_display_prefs.dart';
import '../../theme/crm_tokens.dart';
import 'login_screen.dart';
import 'modules_screen.dart';
import 'users_screen.dart';

const _secureStorage = FlutterSecureStorage(
  mOptions: MacOsOptions(usesDataProtectionKeychain: false),
);
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
  final _syncServer = TextEditingController(text: SyncDefaults.serverUrl);
  final _syncAccount = TextEditingController(text: SyncDefaults.account);
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
  // Base partagée visible par défaut — l'utilisateur voit tout de suite
  // serveur / compte / mot de passe / test (sinon « rien » en mode local).
  _SyncMode _syncMode = _SyncMode.remote;
  bool _loading = true;
  bool _saving = false;
  bool _syncing = false;
  bool _testing = false;
  bool _syncStatusIsError = false;
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
    await EinvoiceDisplayPrefs.instance.ensureLoaded();
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
        var server = values['sync_server']!;
        // Migration crm.* → domaine unifié /crm.
        if (server.contains('crm.eastmarkhk.com')) {
          server = SyncDefaults.serverUrl;
          // Persister tout de suite — sinon sync reste sur DNS mort.
          // ignore: discarded_futures
          AppDatabase.instance.setSetting('sync_server', server);
        }
        _syncServer.text = server;
      }
      if (values['sync_account']?.isNotEmpty ?? false) {
        var account = values['sync_account']!;
        if (account == 'crm@eastmarkhk.com') {
          account = SyncDefaults.account;
          // ignore: discarded_futures
          AppDatabase.instance.setSetting('sync_account', account);
        }
        _syncAccount.text = account;
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
    // Champ vide : on ne touche pas au trousseau (évite d’effacer un MDP
    // déjà stocké si la lecture a échoué au chargement).
    var keychainError = false;
    final syncPassword = _syncPassword.text;
    if (syncPassword.isNotEmpty) {
      try {
        await _secureStorage.write(
          key: _syncPasswordKey,
          value: syncPassword,
        );
      } catch (e) {
        debugPrint('Settings: trousseau indisponible ($e)');
        keychainError = true;
      }
    }
    if (!mounted) return;
    setState(() => _saving = false);
    await RemoteCrmSyncService.instance.refreshRemoteModeFlag();
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      keychainError
          ? SnackBar(
              content: Text(l10n.settingsSaveKeychainError),
              duration: const Duration(seconds: 6),
            )
          : SnackBar(content: Text(l10n.settingsSaved)),
    );
    // Après réinstall / nouveau MDP : sync immédiate pour récupérer les autres appareils.
    if (!keychainError && _syncMode == _SyncMode.remote && syncPassword.isNotEmpty) {
      // ignore: discarded_futures
      _syncNow();
    }
  }

  Future<void> _exportBackup() async {
    final l10n = AppLocalizations.of(context);
    try {
      final file = await AppDatabase.instance.exportBackupCopy();
      final stamp =
          DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
      final path = await FileExport.saveFileCopy(
        source: file,
        suggestedName: 'emhk_crm_backup_$stamp.db',
        extensions: const ['db'],
        shareText: l10n.settingsBackupShareText,
      );
      // Copie temporaire locale — on peut la supprimer après export.
      try {
        if (await file.exists()) await file.delete();
      } catch (_) {}
      if (!mounted || path == null) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${l10n.settingsBackupShareText}\n$path')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.settingsExportError('$e'))),
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
      setState(() {
        _syncStatus = AppLocalizations.of(context).settingsSyncMissingFields;
        _syncStatusIsError = false;
      });
      return;
    }
    setState(() {
      _syncing = true;
      _syncStatus = null;
      _syncStatusIsError = false;
    });
    // Persiste d'abord le mot de passe pour que le poll auto fonctionne après.
    try {
      await _secureStorage.write(key: _syncPasswordKey, value: password);
    } catch (_) {}
    await AppDatabase.instance.setSetting('sync_mode', 'remote');
    await AppDatabase.instance.setSetting('sync_server', server);
    await AppDatabase.instance.setSetting('sync_account', account);
    await RemoteCrmSyncService.instance.refreshRemoteModeFlag();

    final outcome = await RemoteCrmSyncService.instance
        .syncNow(server: server, account: account, password: password);
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final detail = outcome.localizedMessage(l10n);
    setState(() {
      _syncing = false;
      _syncStatus = outcome.ok
          ? l10n.settingsSyncOk(detail)
          : l10n.settingsSyncError(detail);
      _syncStatusIsError = !outcome.ok;
      _syncMode = _SyncMode.remote;
    });
  }

  /// Test léger (pull vide) — vérifie serveur + identifiants sans sync complète.
  /// Persiste serveur / compte / MDP comme « Sync now », pour que le poll
  /// auto de l’app utilise exactement la même connexion.
  Future<void> _testConnection() async {
    final server = _syncServer.text.trim();
    final account = _syncAccount.text.trim();
    final password = _syncPassword.text;
    if (server.isEmpty || account.isEmpty || password.isEmpty) {
      setState(() {
        _syncStatus = AppLocalizations.of(context).settingsSyncMissingFields;
        _syncStatusIsError = false;
      });
      return;
    }
    setState(() {
      _testing = true;
      _syncStatus = null;
      _syncStatusIsError = false;
    });
    try {
      await _secureStorage.write(key: _syncPasswordKey, value: password);
    } catch (_) {}
    await AppDatabase.instance.setSetting('sync_mode', 'remote');
    await AppDatabase.instance.setSetting('sync_server', server);
    await AppDatabase.instance.setSetting('sync_account', account);
    await RemoteCrmSyncService.instance.refreshRemoteModeFlag();

    final outcome = await RemoteCrmSyncService.instance.testConnection(
      server: server,
      account: account,
      password: password,
    );
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final detail = outcome.localizedMessage(l10n);
    setState(() {
      _testing = false;
      _syncStatus = outcome.ok
          ? l10n.settingsSyncConnected(detail)
          : l10n.settingsSyncError(detail);
      _syncStatusIsError = !outcome.ok;
      if (outcome.ok) _syncMode = _SyncMode.remote;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CrmOverlayPage(
      title: l10n.settingsTitle,
      subtitle: l10n.settingsSubtitle,
      child: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
              children: [
                // ── Base partagée EN PREMIER — serveur / compte / MDP / test ──
                _SectionCard(
                  icon: Icons.cloud_outlined,
                  title: l10n.settingsSyncRemoteTitle,
                  subtitle: l10n.settingsSyncSubtitle,
                  children: [
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.settingsSyncRemoteTitle),
                      subtitle: Text(
                        _syncMode == _SyncMode.remote
                            ? l10n.settingsSyncRemoteSubtitle
                            : l10n.settingsSyncLocalSubtitle,
                      ),
                      value: _syncMode == _SyncMode.remote,
                      onChanged: (v) => setState(
                        () => _syncMode = v ? _SyncMode.remote : _SyncMode.local,
                      ),
                    ),
                    const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final remote = _syncMode == _SyncMode.remote;
                        final serverField = TextField(
                          controller: _syncServer,
                          decoration: InputDecoration(
                            labelText: l10n.settingsServerLabel,
                            border: const OutlineInputBorder(),
                            hintText: SyncDefaults.serverUrl,
                          ),
                          keyboardType: TextInputType.url,
                          enabled: remote,
                        );
                        final accountField = TextField(
                          controller: _syncAccount,
                          decoration: InputDecoration(
                            labelText: l10n.settingsAccountLabel,
                            border: const OutlineInputBorder(),
                            hintText: SyncDefaults.account,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          enabled: remote,
                        );
                        final passwordField = PasswordField(
                          controller: _syncPassword,
                          label: l10n.settingsFtpPassword,
                          enabled: remote,
                        );
                        // Une seule ligne dès qu'il y a la place.
                        if (constraints.maxWidth >= 720) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 5, child: serverField),
                              const SizedBox(width: 12),
                              Expanded(flex: 4, child: accountField),
                              const SizedBox(width: 12),
                              Expanded(flex: 4, child: passwordField),
                            ],
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            serverField,
                            const SizedBox(height: 12),
                            accountField,
                            const SizedBox(height: 12),
                            passwordField,
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        l10n.settingsSyncPasswordHint,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        FilledButton.tonalIcon(
                          onPressed: (_testing || _syncing || _syncMode != _SyncMode.remote)
                              ? null
                              : _testConnection,
                          icon: _testing
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Icon(Icons.wifi_tethering),
                          label: Text(l10n.settingsTestConnection),
                        ),
                        OutlinedButton.icon(
                          onPressed: (_syncing || _testing || _syncMode != _SyncMode.remote)
                              ? null
                              : _syncNow,
                          icon: _syncing
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Icon(Icons.sync),
                          label: Text(l10n.settingsSyncNowButton),
                        ),
                      ],
                    ),
                    if (_syncStatus != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        _syncStatus!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: _syncStatusIsError
                                  ? Theme.of(context).colorScheme.error
                                  : Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        l10n.settingsSyncPollHint,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.translate,
                  title: l10n.settingsLanguagesTitle,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final stacked = constraints.maxWidth < 720;
                        final appLang = ListenableBuilder(
                          listenable: AppLocaleSettings.instance,
                          builder: (context, _) => _SettingsRow(
                            label: l10n.settingsAppLanguageLabel,
                            value: AppLocaleSettings.instance.currentLabel(l10n.systemLanguage),
                            icon: Icons.translate,
                            onTap: () => showAppLanguagePicker(context),
                          ),
                        );
                        final dictation = ListenableBuilder(
                          listenable: DictationSettings.instance,
                          builder: (context, _) => _SettingsRow(
                            label: l10n.settingsDictationLanguageLabel,
                            value: DictationSettings.instance.currentLabel(l10n.systemLanguage),
                            icon: Icons.mic_none_outlined,
                            onTap: () => showDictationLanguagePicker(context),
                          ),
                        );
                        final currency = ListenableBuilder(
                          listenable: CurrencySettings.instance,
                          builder: (context, _) {
                            final c = CurrencySettings.instance.current;
                            return _SettingsRow(
                              label: l10n.settingsCurrencyLabel,
                              value: '${c.symbol} ${c.code}',
                              leading: CountryFlagIcon(
                                countryCode: c.flag,
                                width: 22,
                                height: 16,
                              ),
                              icon: Icons.payments_outlined,
                              onTap: () => showCurrencyPicker(context),
                            );
                          },
                        );
                        if (stacked) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              appLang,
                              const SizedBox(height: 12),
                              dictation,
                              const SizedBox(height: 12),
                              currency,
                            ],
                          );
                        }
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: appLang),
                            const SizedBox(width: 12),
                            Expanded(child: dictation),
                            const SizedBox(width: 12),
                            Expanded(child: currency),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        l10n.settingsFormatsHint,
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
                  title: l10n.settingsCompanyTitle,
                  subtitle: l10n.settingsCompanySubtitle,
                  children: [
                    _LogoPicker(file: _logoFile, onPick: _pickLogo, onRemove: _removeLogo),
                    const SizedBox(height: 16),
                    PartyAddressFields(
                      name: DictationField(controller: _companyName, label: l10n.commonCompanyNameLabel),
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
                  icon: Icons.extension_outlined,
                  title: l10n.settingsModulesTitle,
                  subtitle: l10n.settingsModulesSubtitle,
                  children: [
                    ListenableBuilder(
                      listenable: Listenable.merge([
                        ModuleRegistry.instance,
                        EntitlementService.instance,
                      ]),
                      builder: (context, _) {
                        final active = ModuleRegistry.instance.active;
                        if (active.isEmpty) {
                          return Text(
                            l10n.settingsNoModules,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          );
                        }
                        return Column(
                          children: [
                            for (final m in active)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        CrmTokens.accent.withValues(alpha: 0.12),
                                    child: Icon(m.icon, color: CrmTokens.accent),
                                  ),
                                  title: Text(
                                    m.title,
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    switch (
                                        EntitlementService.instance
                                            .trialDaysRemaining(m.id)) {
                                      final int days? =>
                                        l10n.settingsTrialRemaining(days),
                                      _ => l10n.settingsActiveInCrm,
                                    },
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                                  onTap: () => Navigator.pop(context, m.id),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final moduleId = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(builder: (_) => const ModulesScreen()),
                        );
                        if (moduleId != null && context.mounted) {
                          Navigator.pop(context, moduleId);
                        }
                      },
                      icon: const Icon(Icons.storefront_outlined),
                      label: Text(l10n.settingsBrowseModules),
                    ),
                  ],
                ),

                if (ModuleRegistry.instance.isUsedInCrm('invoicing')) ...[
                  const SizedBox(height: 20),
                  ListenableBuilder(
                    listenable: EinvoiceDisplayPrefs.instance,
                    builder: (context, _) {
                      final scope = EinvoiceDisplayPrefs.instance.scope;
                      return _SectionCard(
                        icon: Icons.receipt_long_outlined,
                        title: l10n.settingsEinvoiceDisplay,
                        subtitle: l10n.settingsEinvoiceDisplaySubtitle,
                        children: [
                          SegmentedButton<EinvoiceDocsScope>(
                            segments: [
                              ButtonSegment(
                                value: EinvoiceDocsScope.crmRelated,
                                label: Text(l10n.settingsLinkedToCrm),
                                icon: const Icon(Icons.link, size: 16),
                              ),
                              ButtonSegment(
                                value: EinvoiceDocsScope.all,
                                label: Text(l10n.settingsAllEinvoicing),
                                icon: const Icon(Icons.all_inbox_outlined, size: 16),
                              ),
                            ],
                            selected: {scope},
                            onSelectionChanged: (s) {
                              EinvoiceDisplayPrefs.instance.setScope(s.first);
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            scope == EinvoiceDocsScope.crmRelated
                                ? l10n.settingsCrmOnlyDesc
                                : l10n.settingsAllDocsDesc,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                ],

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.import_export_outlined,
                  title: l10n.settingsImportExportTitle,
                  subtitle: l10n.settingsImportExportSubtitle,
                  children: [
                    CrmImportExportPanel(onChanged: () {}),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.view_kanban_outlined,
                  title: l10n.settingsPipelineTitle,
                  subtitle: l10n.settingsPipelineSubtitle,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () => showPipelineSettingsDialog(context),
                      icon: const Icon(Icons.tune_outlined),
                      label: Text(l10n.settingsConfigureStages),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.backup_outlined,
                  title: l10n.settingsBackupTitle,
                  subtitle: l10n.settingsBackupSubtitle,
                  children: [
                    OutlinedButton.icon(
                      onPressed: _exportBackup,
                      icon: const Icon(Icons.file_download_outlined),
                      label: Text(l10n.settingsExportDbButton),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _SectionCard(
                  icon: Icons.people_outline,
                  title: l10n.settingsUsersTitle,
                  subtitle: CurrentSession.instance.isAdmin
                      ? l10n.settingsUsersSubtitleAdmin
                      : l10n.settingsUsersSubtitleLocked,
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
                        label: Text(l10n.settingsManageUsersButton),
                      )
                    else
                      Row(
                        children: [
                          Icon(Icons.lock_outline,
                              size: 18, color: Theme.of(context).colorScheme.onSurfaceVariant),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              l10n.settingsUsersLockedHint,
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
                  label: Text(l10n.commonSave),
                ),
                if (CurrentSession.instance.user != null) ...[
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final ok = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(l10n.settingsLogoutConfirmTitle),
                          content: Text(l10n.settingsLogoutConfirmDetail),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: Text(l10n.commonCancel)),
                            FilledButton.tonal(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: Text(l10n.settingsLogoutButton)),
                          ],
                        ),
                      );
                      if (ok != true || !context.mounted) return;
                      await CurrentSession.instance.logout();
                      if (!context.mounted) return;
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.logout),
                    label: Text(l10n.settingsLogoutButton),
                  ),
                ],

                const SizedBox(height: 20),
                const _AppVersionSection(),
                const SizedBox(height: 40),
              ],
            ),
    );
  }
}

/// Version marketing + numéro de build (Info.plist / pubspec).
class _AppVersionSection extends StatelessWidget {
  const _AppVersionSection();

  static final Future<PackageInfo> _info = PackageInfo.fromPlatform();
  static final Uri _privacyReportUri = Uri.parse(
    'https://eastmarkhk.com/privacy/EastmarkHK_CRM_Privacy_Report.pdf',
  );

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return _SectionCard(
      icon: Icons.info_outline,
      title: l10n.settingsAbout,
      children: [
        FutureBuilder<PackageInfo>(
          future: _info,
          builder: (context, snap) {
            final p = snap.data;
            if (p == null) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            }
            final build = p.buildNumber.isEmpty ? '—' : p.buildNumber;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _VersionInfoRow(label: l10n.settingsVersion, value: p.version),
                const SizedBox(height: 10),
                _VersionInfoRow(label: l10n.settingsBuild, value: build),
                const SizedBox(height: 8),
                Text(
                  p.appName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.privacy_tip_outlined, color: scheme.primary),
                  title: Text(l10n.settingsPrivacyReport),
                  subtitle: Text(l10n.settingsPrivacyReportSubtitle),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => launchUrl(
                    _privacyReportUri,
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _VersionInfoRow extends StatelessWidget {
  const _VersionInfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
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
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.settingsLogoTitle, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 4),
        Text(
          l10n.settingsLogoSubtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          // −50 % par rapport à l'ancien cadre (200 → 100).
          height: 100,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: scheme.outlineVariant),
          ),
          clipBehavior: Clip.antiAlias,
          child: file != null
              ? Image.file(file!, fit: BoxFit.contain)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 28, color: scheme.onSurfaceVariant),
                    const SizedBox(height: 6),
                    Text(
                      l10n.settingsLogoEmpty,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
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
              label: Text(file == null ? l10n.settingsLogoChoose : l10n.settingsLogoChange),
            ),
            if (file != null)
              TextButton(onPressed: onRemove, child: Text(l10n.commonDelete)),
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
  const _SettingsRow({
    required this.label,
    required this.value,
    required this.onTap,
    this.leading,
    this.icon,
  });

  final String label;
  final String value;
  final VoidCallback onTap;
  final Widget? leading;
  final IconData? icon;

  static const _teal = Color(0xFF2BA89A);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF3FBF9),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color.lerp(_teal, const Color(0xFF9AABBA), 0.45)!, width: 1.4),
          ),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: 10),
              ] else if (icon != null) ...[
                Icon(icon, size: 22, color: _teal),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: _teal,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: scheme.onSurface,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.expand_more, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
