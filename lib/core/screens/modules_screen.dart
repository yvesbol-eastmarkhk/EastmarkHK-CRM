import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../modules/invoicing/invoicing_module.dart';
import '../../platform/crm_subscription_service.dart';
import '../../platform/distribution_config.dart';
import '../../platform/entitlement_service.dart';
import '../../platform/license_manager.dart';
import '../../platform/module_crm_prefs.dart';
import '../../theme/app_theme.dart';
import '../../theme/crm_tokens.dart';
import '../../ui/crm_overlay_page.dart';
import '../modules/crm_module.dart';
import '../modules/module_registry.dart';
import 'module_activation_sheet.dart';

/// Boutique modules — App Store IAP + webstore eastmarkhk.com (code d'activation).
class ModulesScreen extends StatefulWidget {
  const ModulesScreen({super.key});

  @override
  State<ModulesScreen> createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  bool _syncing = false;

  @override
  void initState() {
    super.initState();
    EntitlementService.instance.addListener(_refresh);
    ModuleRegistry.instance.addListener(_refresh);
    ModuleCrmPrefs.instance.addListener(_refresh);
    CrmSubscriptionService.instance.isStoreAvailable.addListener(_refresh);
    _syncPurchases();
  }

  /// Vérifie App Store + licence eastmarkhk.com / app e-Invoicing installée.
  Future<void> _syncPurchases() async {
    setState(() => _syncing = true);
    try {
      await ModuleCrmPrefs.instance.ensureLoaded();
      await CrmSubscriptionService.instance.syncAppStoreEntitlements();
      await ModuleRegistry.instance.syncLicensesFromStorage();
      if (!EntitlementService.instance.isActive('invoicing')) {
        try {
          await ModuleRegistry.instance.importFromInstalledEinvoicing();
        } on LicenseFlowException catch (e) {
          debugPrint('ModulesScreen: import e-Invoicing refusé — ${e.message}');
        } catch (e, st) {
          debugPrint('ModulesScreen: import e-Invoicing — $e\n$st');
        }
      }
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
  }

  @override
  void dispose() {
    EntitlementService.instance.removeListener(_refresh);
    ModuleRegistry.instance.removeListener(_refresh);
    ModuleCrmPrefs.instance.removeListener(_refresh);
    CrmSubscriptionService.instance.isStoreAvailable.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  String _subtitle(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // iOS / macOS App Store : pas de mention d’abonnement web (Guideline 3.1.1).
    if (emhkUsesAppStoreIap) {
      return l10n.modulesRenewalNote;
    }
    if (emhkShowsAppStorePurchaseButton) {
      return l10n.modulesSubtitleAppStore;
    }
    return l10n.modulesSubtitleWebStore;
  }

  @override
  Widget build(BuildContext context) {
    final modules = ModuleRegistry.instance.all;
    final l10n = AppLocalizations.of(context);
    return CrmOverlayPage(
      title: l10n.settingsModulesTitle,
      subtitle: _subtitle(context),
      child: Column(
        children: [
          if (_syncing)
            Material(
              color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        emhkUsesAppStoreIap
                            ? l10n.modulesCheckingAppStore
                            : l10n.modulesCheckingPurchases,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(CrmTokens.pagePadding),
              itemCount: modules.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (_, i) => _ModuleCard(module: modules[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModuleCard extends StatefulWidget {
  const _ModuleCard({required this.module});

  final CrmModule module;

  @override
  State<_ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<_ModuleCard> {
  bool _busy = false;

  CrmModule get module => widget.module;

  Future<void> _subscribe() async {
    setState(() => _busy = true);
    try {
      final store = CrmSubscriptionService.instance;
      if (!store.isStoreAvailable.value) {
        await store.syncAppStoreEntitlements();
      }
      if (!store.isStoreAvailable.value) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).modulesStoreUnavailable)),
        );
        return;
      }
      final ok = await store.buyModule(module.id);
      if (!mounted) return;
      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).modulesBuyFailed)),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restore() async {
    setState(() => _busy = true);
    try {
      await CrmSubscriptionService.instance.syncAppStoreEntitlements();
      await ModuleRegistry.instance.syncLicensesFromStorage();
      if (!EntitlementService.instance.isActive(module.id) && module.id == 'invoicing') {
        try {
          await ModuleRegistry.instance.importFromInstalledEinvoicing();
        } on LicenseFlowException catch (_) {}
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).modulesRestoreDone)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _importFromEinvoicing() async {
    setState(() => _busy = true);
    try {
      final ok = await ModuleRegistry.instance.importFromInstalledEinvoicing();
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      if (ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.modulesImportedFromEinvoicing(InvoicingModule.displayName)),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.modulesLicenseNotFound),
            duration: const Duration(seconds: 6),
          ),
        );
      }
    } on LicenseFlowException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _openWebActivation() {
    ModuleActivationSheet.show(
      context,
      moduleId: module.id,
      moduleTitle: module.title,
    );
  }

  Future<void> _openMicrosoftStore() async {
    final url = kEmhkEinvoicingMicrosoftStoreUrl.trim();
    if (url.isEmpty) return;
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Future<void> _useInCrm() async {
    await ModuleRegistry.instance.setUsedInCrm(module.id, true);
    if (!mounted) return;
    Navigator.pop(context, module.id);
  }

  Future<void> _dontUseInCrm() async {
    await ModuleRegistry.instance.setUsedInCrm(module.id, false);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final active = EntitlementService.instance.isActive(module.id);
    final usedInCrm = ModuleCrmPrefs.instance.isEnabledInCrm(module.id);
    final trialLeft = EntitlementService.instance.trialDaysRemaining(module.id);
    final rec = EntitlementService.instance.recordFor(module.id);
    final iapPrice = CrmSubscriptionService.instance.localizedPriceForModule(module.id);
    final priceLabel = iapPrice ?? module.priceLabel;
    final showAppleBuy = emhkShowsAppStorePurchaseButton && !active;

    String status;
    if (active && rec?.source == EntitlementSource.iap) {
      status = l10n.modulesStatusActiveAppStore;
    } else if (active && rec?.source == EntitlementSource.license) {
      // Sur App Store iOS : ne pas afficher « Active — eastmarkhk.com ».
      status = emhkUsesAppStoreIap
          ? l10n.modulesStatusActive
          : l10n.modulesStatusActiveWeb;
    } else if (active && rec?.source == EntitlementSource.trial) {
      status = l10n.modulesStatusTrial(trialLeft ?? 0);
    } else if (active) {
      status = l10n.modulesStatusActive;
    } else {
      status = l10n.modulesStatusAvailable;
    }

    final bool isTrial = active && rec?.source == EntitlementSource.trial;
    final Color badgeColor = active
        ? (isTrial ? const Color(0xFFB45309) : const Color(0xFF059669))
        : scheme.surfaceContainerHighest;
    final Color badgeFg = active ? Colors.white : scheme.onSurfaceVariant;
    final IconData badgeIcon =
        active ? (isTrial ? Icons.timer_outlined : Icons.check_circle) : Icons.lock_outline;

    final Widget badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(999),
        boxShadow: active
            ? [
                BoxShadow(
                  color: badgeColor.withValues(alpha: 0.35),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(badgeIcon, size: 16, color: badgeFg),
          const SizedBox(width: 6),
          Text(
            status,
            style: TextStyle(
              color: badgeFg,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
        border: Border.all(
          color: active ? scheme.primary.withValues(alpha: 0.4) : Theme.of(context).crmBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(module.icon, color: scheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(module.title, style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      showAppleBuy || emhkUsesAppStoreIap
                          ? '$priceLabel ${l10n.modulesPerMonth}'
                          : priceLabel,
                      style: TextStyle(color: scheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              badge,
            ],
          ),
          const SizedBox(height: 8),
          Text(module.description, style: Theme.of(context).textTheme.bodyMedium),
          if ((showAppleBuy || emhkUsesAppStoreIap) && !active) ...[
            const SizedBox(height: 8),
            Text(
              l10n.modulesRenewalNote,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
            ),
          ],
          if (emhkShowsWebStorePurchaseLinks && !active) ...[
            const SizedBox(height: 8),
            Text(
              emhkUsesMicrosoftStoreForEinvoicing && module.id == 'invoicing'
                  ? l10n.modulesMicrosoftStoreNote
                  : l10n.modulesWebStoreNote,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
            ),
          ],
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (!active &&
                  emhkUsesMicrosoftStoreForEinvoicing &&
                  module.id == 'invoicing')
                FilledButton.icon(
                  onPressed: _busy ? null : _openMicrosoftStore,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF0078D4),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.shop_outlined, size: 20),
                  label: Text(l10n.modulesBuyOnMicrosoftStore),
                ),
              if (!active && emhkShowsWebStorePurchaseLinks && module.id == 'invoicing')
                FilledButton.icon(
                  onPressed: _busy ? null : _importFromEinvoicing,
                  icon: const Icon(Icons.link_outlined, size: 18),
                  label: Text(l10n.modulesHaveEinvoicing),
                ),
              if (!active && !emhkUsesAppStoreIap)
                FilledButton(
                  onPressed: _busy ? null : () => ModuleRegistry.instance.startTrial(module.id),
                  child: Text(l10n.modulesTry7Days),
                ),
              if (showAppleBuy)
                FilledButton.icon(
                  onPressed: _busy ? null : _subscribe,
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  icon: _busy
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.apple, size: 20),
                  label: Text(
                    '${l10n.modulesBuyOnAppStore}${iapPrice != null ? ' — $iapPrice' : ''}',
                  ),
                ),
              if (!active && emhkShowsAppStorePurchaseButton)
                OutlinedButton(
                  onPressed: _busy ? null : _restore,
                  child: Text(l10n.modulesRestore),
                ),
              if (!active && emhkAllowsWebLicenseActivation)
                OutlinedButton(
                  onPressed: _busy ? null : _openWebActivation,
                  child: Text(
                    emhkShowsAppStorePurchaseButton || emhkUsesAppStoreIap
                        ? l10n.modulesWebSubscription
                        : l10n.modulesActivateWebCode,
                  ),
                ),
              if (active) ...[
                FilledButton.icon(
                  onPressed: usedInCrm
                      ? () => Navigator.pop(context, module.id)
                      : (_busy ? null : _useInCrm),
                  icon: Icon(usedInCrm ? Icons.arrow_forward : Icons.check_circle_outline, size: 18),
                  label: Text(l10n.modulesUseInCrm),
                ),
                usedInCrm
                    ? OutlinedButton.icon(
                        onPressed: _busy ? null : _dontUseInCrm,
                        icon: const Icon(Icons.hide_source_outlined, size: 18),
                        label: Text(l10n.modulesDontUseInCrm),
                      )
                    : FilledButton.tonalIcon(
                        onPressed: null,
                        icon: const Icon(Icons.hide_source_outlined, size: 18),
                        label: Text(l10n.modulesDontUseInCrm),
                      ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
