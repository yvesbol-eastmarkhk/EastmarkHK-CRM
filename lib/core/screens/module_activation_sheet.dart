import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/gen/app_localizations.dart';
import '../../modules/invoicing/invoicing_module.dart';
import '../../platform/distribution_config.dart';
import '../../platform/license_manager.dart';
import '../../theme/crm_tokens.dart';
import '../modules/module_registry.dart';

/// Feuille d'activation webstore — code + Machine ID (sans lien d'achat sur App Store).
class ModuleActivationSheet extends StatefulWidget {
  const ModuleActivationSheet({super.key, required this.moduleId, required this.moduleTitle});

  final String moduleId;
  final String moduleTitle;

  static Future<void> show(BuildContext context,
      {required String moduleId, required String moduleTitle}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => ModuleActivationSheet(moduleId: moduleId, moduleTitle: moduleTitle),
    );
  }

  @override
  State<ModuleActivationSheet> createState() => _ModuleActivationSheetState();
}

class _ModuleActivationSheetState extends State<ModuleActivationSheet> {
  final _emailCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  bool _busy = false;

  LicenseManager get _license => LicenseManager.instance;

  @override
  void initState() {
    super.initState();
    _emailCtrl.text = _license.requestEmail ?? '';
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _codeCtrl.dispose();
    super.dispose();
  }

  Future<void> _activate() async {
    setState(() => _busy = true);
    try {
      final email = _emailCtrl.text.trim();
      if (email.isNotEmpty) await _license.setRequestEmail(email);
      await ModuleRegistry.instance.applyWebActivationCode(widget.moduleId, _codeCtrl.text);
      if (!mounted) return;
      Navigator.pop(context);
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.modulesActivatedViaWebsite(widget.moduleTitle))),
      );
    } on LicenseFlowException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _copyMachineId() async {
    await Clipboard.setData(ClipboardData(text: _license.hardwareUUIDFormatted));
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.modulesMachineIdCopied)),
    );
  }

  Future<void> _openPurchase() async {
    final url = _license.purchaseUrlForModule(widget.moduleId);
    if (url == null) return;
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Future<void> _requestByEmail() async {
    final email = _emailCtrl.text.trim();
    if (email.isEmpty) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.modulesEmailRequired)),
      );
      return;
    }
    await _license.setRequestEmail(email);
    final uri = _license.licenseRequestMailtoUri(
      email,
      productLabel: InvoicingModule.displayName,
    );
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(CrmTokens.pagePadding, 0, CrmTokens.pagePadding, bottom + 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emhkShowsWebStorePurchaseLinks
                  ? l10n.modulesWebSubscription
                  : l10n.modulesActivateWebCode,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              emhkUsesAppStoreIap
                  ? l10n.modulesActivationSubtitleAppStore
                  : l10n.modulesActivationSubtitleWeb,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.modulesMachineId),
              subtitle: Text(_license.hardwareUUIDFormatted,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
              trailing: IconButton(
                icon: const Icon(Icons.copy_outlined),
                onPressed: _copyMachineId,
                tooltip: l10n.modulesCopy,
              ),
            ),
            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(
                labelText: l10n.modulesSubscriptionEmailLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _codeCtrl,
              decoration: InputDecoration(
                labelText: l10n.modulesActivationCodeLabel,
                hintText: l10n.modulesActivationCodeHint,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
              autocorrect: false,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _busy ? null : _activate,
              child: _busy
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.modulesActivate),
            ),
            if (emhkShowsWebStorePurchaseLinks) ...[
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: _openPurchase,
                icon: const Icon(Icons.shopping_bag_outlined),
                label: Text(l10n.modulesBuyOnWebsite),
              ),
            ],
            if (emhkShowsWebStorePurchaseLinks) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: _requestByEmail,
                child: Text(l10n.modulesRequestCodeByEmail),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
