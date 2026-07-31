import 'package:flutter/material.dart';

import '../core/db/app_database.dart';
import '../core/screens/tasks_screen.dart';
import '../core/services/company_logo_service.dart';
import '../core/services/current_session.dart';
import '../core/services/remote_crm_sync_service.dart';
import '../core/widgets/eastmark_logo.dart';
import '../theme/app_theme.dart';

/// Bannière workspace — + Tâche, logo, utilisateur, indicateur sync.
class CrmWorkspaceBanner extends StatefulWidget {
  const CrmWorkspaceBanner({
    super.key,
    this.leading,
    this.onAddTask,
    this.onTaskCreated,
  });

  final Widget? leading;
  final Future<void> Function()? onAddTask;
  final VoidCallback? onTaskCreated;

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
    return 'Utilisateur';
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

  Widget _syncIndicator(ColorScheme scheme) {
    if (!_sync.remoteModeEnabled) return const SizedBox.shrink();
    final tooltip = _sync.isSyncing
        ? 'Synchronisation en cours…'
        : _sync.lastError != null
            ? 'Erreur sync : ${_sync.lastError}'
            : _sync.lastSyncAt != null
                ? 'Dernière sync : ${_sync.lastSyncAt!.toLocal()}'
                : 'Mode base partagée actif';
    final icon = _sync.isSyncing
        ? SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: scheme.primary,
            ),
          )
        : Icon(
            _sync.lastError != null ? Icons.cloud_off_outlined : Icons.cloud_done_outlined,
            size: 18,
            color: _sync.lastError != null ? scheme.error : scheme.primary,
          );
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Tooltip(message: tooltip, child: icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    final scheme = Theme.of(context).colorScheme;
    return ListenableBuilder(
      listenable: Listenable.merge([
        CompanyLogoSettings.instance,
        CurrentSession.instance,
      ]),
      builder: (context, _) {
        final logo = CompanyLogoSettings.instance.file;
        final userLabel = _userLabel();

        return Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).crmSidebar,
            border: Border(bottom: BorderSide(color: border)),
          ),
          child: Row(
            children: [
              FilledButton.icon(
                onPressed: _addTask,
                icon: const Icon(Icons.add_task, size: 18),
                label: const Text('Tâche'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(0, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
              if (widget.leading != null) ...[
                const SizedBox(width: 4),
                widget.leading!,
              ],
              Expanded(
                child: Center(
                  child: logo != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.file(logo, height: 36, fit: BoxFit.contain),
                        )
                      : _companyName != null && _companyName!.isNotEmpty
                          ? Text(
                              _companyName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          : Text(
                              'Votre entreprise',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                ),
              ),
              _syncIndicator(scheme),
              Text(
                'Utilisateur : $userLabel',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 12),
              const EastmarkWordmark(height: 28),
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
