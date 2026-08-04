import 'dart:async';

import 'package:flutter/material.dart';

import '../core/db/app_database.dart';
import '../core/screens/tasks_screen.dart';
import '../core/services/company_logo_service.dart';
import '../core/services/current_session.dart';
import '../core/services/remote_crm_sync_service.dart';
import '../core/utils/responsive_layout.dart';
import '../core/widgets/eastmark_logo.dart';
import '../l10n/gen/app_localizations.dart';
import '../platform/desktop_chrome.dart';
import '../theme/app_theme.dart';

/// Bannière workspace — + Tâche | logo client centré | sync…user | EastmarkHK.
///
/// Ordre du bloc droit (de gauche à droite) :
/// sync → réglages → utilisateur → EastmarkHK (extrême droite).
///
/// Pas d'icône « Modules » ici — déjà accessible depuis Réglages (et le rail
/// desktop) ; la dupliquer dans l'en-tête n'apportait rien (retour utilisateur).
class CrmWorkspaceBanner extends StatefulWidget {
  const CrmWorkspaceBanner({
    super.key,
    this.leading,
    this.onAddTask,
    this.onTaskCreated,
    this.onSettings,
    this.compact = false,
  });

  final Widget? leading;
  final Future<void> Function()? onAddTask;
  final VoidCallback? onTaskCreated;
  final VoidCallback? onSettings;

  /// Téléphone : pas de nom / wordmark — sinon Réglages déborde hors écran.
  final bool compact;

  @override
  State<CrmWorkspaceBanner> createState() => _CrmWorkspaceBannerState();
}

class _CrmWorkspaceBannerState extends State<CrmWorkspaceBanner> {
  String? _companyName;
  final _sync = RemoteCrmSyncService.instance;

  @override
  void initState() {
    super.initState();
    CurrentSession.instance.ensureLoaded();
    _sync.addListener(_onSyncChanged);
    // ignore: unawaited_futures
    _sync.refreshRemoteModeFlag();
    _loadCompanyName();
  }

  @override
  void dispose() {
    _sync.removeListener(_onSyncChanged);
    super.dispose();
  }

  void _onSyncChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _loadCompanyName() async {
    final name = await AppDatabase.instance.getSetting('company_name');
    if (mounted) setState(() => _companyName = name?.trim());
  }

  String _userLabel() {
    final user = CurrentSession.instance.user;
    if (user != null) return user.displayName;
    return '';
  }

  Future<void> _addTask() async {
    if (widget.onAddTask != null) {
      await widget.onAddTask!();
      return;
    }
    if (!mounted) return;
    final created = await showAddTaskDialog(context, allowNoClient: true);
    if (created) widget.onTaskCreated?.call();
  }

  Future<void> _forceSync() async {
    final outcome = await _sync.syncFromSettings(mode: CrmSyncMode.full);
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    if (outcome == null) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.shellSyncNeedsPassword)),
      );
      return;
    }
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          outcome.ok
              ? l10n.settingsSyncOk(outcome.localizedMessage(l10n))
              : l10n.settingsSyncError(outcome.localizedMessage(l10n)),
        ),
      ),
    );
  }

  Widget _syncButton(ColorScheme scheme) {
    if (!_sync.remoteModeEnabled) {
      // Pas encore configurée (mot de passe sync jamais saisi) — plutôt que
      // masquer l'icône (aucun moyen de l'activer depuis l'en-tête), on la
      // garde visible en gris ; un tap ouvre Réglages pour l'activer.
      return IconButton(
        tooltip: 'Synchronisation non activée — cliquer pour l\u2019activer',
        visualDensity: VisualDensity.compact,
        onPressed: widget.onSettings,
        icon: Icon(Icons.cloud_outlined, size: 20, color: scheme.onSurfaceVariant),
      );
    }
    // Erreur « sticky » seulement si aucune sync réussie récente — un
    // timeout de fond ponctuel ne doit pas laisser le nuage rouge.
    final recentOk = _sync.lastSyncAt != null &&
        DateTime.now().difference(_sync.lastSyncAt!) < const Duration(minutes: 10);
    final showError = _sync.lastError != null && !recentOk;
    final tooltip = _sync.isSyncingVisible
        ? 'Synchronisation en cours…'
        : showError
            ? 'Erreur sync — cliquer pour réessayer'
            : _sync.lastSyncAt != null
                ? 'Dernière sync : ${_sync.lastSyncAt!.toLocal()}'
                : 'Synchroniser';
    final icon = _sync.isSyncingVisible
        ? SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: scheme.primary,
            ),
          )
        : Icon(
            showError ? Icons.cloud_off_outlined : Icons.cloud_done_outlined,
            size: 20,
            color: showError ? scheme.error : scheme.primary,
          );
    return IconButton(
      tooltip: tooltip,
      visualDensity: VisualDensity.compact,
      onPressed: _sync.isSyncingVisible ? null : _forceSync,
      icon: icon,
    );
  }

  Widget _clientLogo(ColorScheme scheme) {
    final logo = CompanyLogoSettings.instance.file;
    if (logo != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.file(logo, height: 36, fit: BoxFit.contain),
      );
    }
    if (_companyName != null && _companyName!.isNotEmpty) {
      return Text(
        _companyName!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      );
    }
    return Text(
      'Votre entreprise',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: scheme.onSurfaceVariant,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    final scheme = Theme.of(context).colorScheme;
    final compact = widget.compact || CrmLayout.isPhone(context);
    final leftInset = DesktopChrome.trafficLightsInset;
    final l10n = AppLocalizations.of(context);
    final userLabel = _userLabel();

    return ListenableBuilder(
      listenable: Listenable.merge([
        CompanyLogoSettings.instance,
        CurrentSession.instance,
      ]),
      builder: (context, _) {
        // Stack : logo client vraiment au centre de TOUTE la barre ;
        // EastmarkHK collé à l’extrême droite ; actions à sa gauche.
        return Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).crmSidebar,
            border: Border(bottom: BorderSide(color: border)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Centre absolu de la fenêtre.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 160),
                child: _clientLogo(scheme),
              ),
              // Couche interactive : gauche + droite.
              Padding(
                padding: EdgeInsets.only(left: 12 + leftInset, right: 8),
                child: Row(
                  children: [
                    FilledButton.icon(
                      onPressed: _addTask,
                      icon: const Icon(Icons.add_task, size: 18),
                      label: Text(l10n.bannerTaskLabel),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 36),
                        padding: EdgeInsets.symmetric(
                          horizontal: compact ? 10 : 12,
                        ),
                      ),
                    ),
                    if (widget.leading != null) ...[
                      const SizedBox(width: 4),
                      widget.leading!,
                    ],
                    const Spacer(),
                    // Ordre : sync → setting → user → EastmarkHK
                    _syncButton(scheme),
                    if (widget.onSettings != null)
                      IconButton(
                        tooltip: l10n.shellSettingsLabel,
                        onPressed: widget.onSettings,
                        icon: const Icon(Icons.settings_outlined),
                      ),
                    if (!compact && userLabel.isNotEmpty) ...[
                      const SizedBox(width: 6),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 120),
                        child: Text(
                          userLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    if (!compact) const EastmarkWordmark(height: 28),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Carte message relance — texte complet bien visible.
class TaskMessageCard extends StatelessWidget {
  const TaskMessageCard({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.taskTodoBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFD4C8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SelectableText(
        message,
        style: TextStyle(
          fontSize: 17,
          height: 1.55,
          fontWeight: FontWeight.w500,
          color: scheme.onSurface,
        ),
      ),
    );
  }
}
