import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/formatters.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../../platform/distribution_config.dart';
import '../../../platform/einvoice_display_prefs.dart';
import '../../../platform/license_manager.dart';
import '../../../ui/crm_page.dart';
import '../einvoice_connector.dart';
import '../widgets/ei_document_detail_dialog.dart';
import 'einvoice_remote_settings_dialog.dart';
import 'quote_editor_screen.dart';

/// Accueil Facturation — vue CRM sur les devis/factures de la base
/// e-Invoicing partagée. Reçues et relances vivent dans l'app standalone
/// (bouton « Ouvrir e-Invoicing »).
class InvoicingHomeScreen extends StatefulWidget {
  const InvoicingHomeScreen({super.key});

  @override
  State<InvoicingHomeScreen> createState() => _InvoicingHomeScreenState();
}

class _InvoicingHomeScreenState extends State<InvoicingHomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  List<EiDocument> _quotes = [];
  List<EiDocument> _invoices = [];
  bool _loading = true;
  bool _available = false;
  bool _appInstalled = false;
  bool _needsRemoteSetup = false;
  EiMode _mode = EiMode.unavailable;
  Timer? _refreshTimer;
  String _docsFingerprint = '';
  int _loadGen = 0;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    EinvoiceDisplayPrefs.instance.addListener(_onScopeChanged);
    _load();
    // Rafraîchit la liste tant qu’on reste sur cet écran — suppression /
    // création dans e-Invoicing apparaît sans quitter la page.
    _refreshTimer = Timer.periodic(const Duration(seconds: 12), (_) {
      if (mounted && !_loading) _load(silent: true);
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    EinvoiceDisplayPrefs.instance.removeListener(_onScopeChanged);
    _tabs.dispose();
    super.dispose();
  }

  void _onScopeChanged() => _load();

  /// Recharge après création/édition — bascule sur Factures si demandé.
  void _refreshAfterChange({bool showInvoices = false}) {
    if (showInvoices && _tabs.index != 1) {
      _tabs.animateTo(1);
    }
    _load();
  }

  Future<void> _load({bool silent = false}) async {
    final gen = ++_loadGen;
    if (!silent && mounted) {
      _docsFingerprint = '';
      EInvoiceConnector.invalidateDocumentsCache();
      setState(() => _loading = true);
    }
    await EinvoiceDisplayPrefs.instance.ensureLoaded();
    final connector = EInvoiceConnector.instance;
    final mode = await connector.resolveMode();
    final available = mode != EiMode.unavailable;
    final needsSetup = !available && await connector.needsRemoteSetup();
    final installed = available || needsSetup || await connector.isAppInstalled();
    var quotes = <EiDocument>[];
    var invoices = <EiDocument>[];
    if (available) {
      final docs = await connector.recentDocuments(
        limit: 200,
        crmRelatedOnly: EinvoiceDisplayPrefs.instance.crmRelatedOnly,
      );
      quotes = docs.where((d) => !d.isInvoice).toList();
      invoices = docs.where((d) => d.isInvoice).toList();
    }
    if (!mounted || gen != _loadGen) return;
    final fp = [
      for (final d in [...quotes, ...invoices])
        '${d.uuid}|${d.number}|${d.status}|${d.subtotal}',
    ].join(';');
    if (silent &&
        fp == _docsFingerprint &&
        mode == _mode &&
        available == _available) {
      return;
    }
    setState(() {
      _mode = mode;
      _available = available;
      _appInstalled = installed;
      _needsRemoteSetup = needsSetup;
      _quotes = quotes;
      _invoices = invoices;
      _docsFingerprint = fp;
      _loading = false;
    });
  }

  Future<void> _openRemoteSettings() async {
    final saved = await showEinvoiceRemoteSettingsDialog(context);
    if (saved) _load();
  }

  Future<void> _newDocument({required bool asInvoice}) async {
    final ok = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
          builder: (_) => EiDocumentEditorScreen(asInvoice: asInvoice)),
    );
    if (ok == true) _load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CrmPage(
      title: 'e-Invoicing',
      subtitle: l10n.invHomeSubtitle,
      actions: [
        if (_available) ...[
          FilledButton.tonalIcon(
            onPressed: () => _newDocument(asInvoice: false),
            icon: const Icon(Icons.add, size: 18),
            label: Text(l10n.invNewQuote),
          ),
          const SizedBox(width: 8),
          FilledButton.tonalIcon(
            onPressed: () => _newDocument(asInvoice: true),
            icon: const Icon(Icons.receipt_outlined, size: 18),
            label: Text(l10n.invNewInvoice),
          ),
          const SizedBox(width: 8),
        ],
        // Sur iOS l'app sœur ne s'ouvre pas comme sur macOS — cacher le bouton
        // pour libérer la place et éviter un CTA cassé.
        if (Theme.of(context).platform != TargetPlatform.iOS)
          OutlinedButton.icon(
            onPressed: () => EInvoiceConnector.instance.openStandaloneApp(
              kind: _tabs.index == 1 ? 'invoice' : 'quote',
            ),
            icon: const Icon(Icons.open_in_new, size: 18),
            label: Text(l10n.invOpenStandalone),
          ),
        if (_mode == EiMode.remote || _needsRemoteSetup)
          IconButton(
            tooltip: l10n.invRemoteConnectionTooltip,
            onPressed: _openRemoteSettings,
            icon: const Icon(Icons.settings_ethernet),
          ),
      ],
      child: _loading
          ? const Center(child: CircularProgressIndicator())
          : !_available
              ? _unavailable(context)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
                      child: ListenableBuilder(
                        listenable: EinvoiceDisplayPrefs.instance,
                        builder: (context, _) {
                          final scope = EinvoiceDisplayPrefs.instance.scope;
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: SegmentedButton<EinvoiceDocsScope>(
                              segments: [
                                ButtonSegment(
                                  value: EinvoiceDocsScope.all,
                                  label: Text(l10n.settingsAllEinvoicing),
                                  icon: const Icon(Icons.all_inbox_outlined, size: 16),
                                ),
                                ButtonSegment(
                                  value: EinvoiceDocsScope.crmRelated,
                                  label: Text(l10n.settingsLinkedToCrm),
                                  icon: const Icon(Icons.link, size: 16),
                                ),
                              ],
                              selected: {scope},
                              onSelectionChanged: (s) {
                                EinvoiceDisplayPrefs.instance.setScope(s.first);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    TabBar(
                      controller: _tabs,
                      tabs: [
                        Tab(text: l10n.invTabQuotes(_quotes.length)),
                        Tab(text: l10n.invTabInvoices(_invoices.length)),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabs,
                        children: [
                          _docList(empty: l10n.invEmptyQuotes, docs: _quotes),
                          _docList(empty: l10n.invEmptyInvoices, docs: _invoices),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }

  /// Canal d’obtention e-Invoicing : App Store / Microsoft Store (Windows) /
  /// eastmarkhk.com.
  Widget _unavailable(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final appStoreChannel = emhkUsesAppStoreIap;
    final msStoreChannel = emhkUsesMicrosoftStoreForEinvoicing;
    final hasStoreUrl = emhkHasEinvoicingAppStoreUrl;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long_outlined, size: 48, color: scheme.onSurfaceVariant),
            const SizedBox(height: 16),
            Text(
              _needsRemoteSetup
                  ? l10n.invRemoteSetupBody
                  : _appInstalled
                      ? l10n.invLaunchOnceBody
                      : msStoreChannel
                          ? l10n.invAcquireMicrosoftStoreBody
                          : appStoreChannel
                              ? (hasStoreUrl
                                  ? l10n.invAcquireAppStoreBody
                                  : l10n.invAppStoreUrlMissing)
                              : l10n.invAcquireWebBody,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (_needsRemoteSetup)
              FilledButton.icon(
                onPressed: _openRemoteSettings,
                icon: const Icon(Icons.settings_ethernet, size: 18),
                label: Text(l10n.invConfigureRemote),
              )
            else if (_appInstalled)
              FilledButton.icon(
                onPressed: () async {
                  await EInvoiceConnector.instance.openStandaloneApp();
                },
                icon: const Icon(Icons.open_in_new, size: 18),
                label: Text(l10n.invLaunchStandalone),
              )
            else if (msStoreChannel)
              FilledButton.icon(
                onPressed: () => _openAcquisitionLink(_AcquireChannel.microsoftStore),
                icon: const Icon(Icons.shop_outlined, size: 18),
                label: Text(l10n.invViewOnMicrosoftStore),
              )
            else if (appStoreChannel && hasStoreUrl)
              FilledButton.icon(
                onPressed: () => _openAcquisitionLink(_AcquireChannel.appStore),
                icon: const Icon(Icons.storefront_outlined, size: 18),
                label: Text(l10n.invViewOnAppStore),
              )
            else if (!appStoreChannel)
              FilledButton.icon(
                onPressed: () => _openAcquisitionLink(_AcquireChannel.website),
                icon: const Icon(Icons.language, size: 18),
                label: Text(l10n.invViewOnWebsite),
              ),
            const SizedBox(height: 8),
            TextButton(onPressed: _load, child: Text(l10n.invRetry)),
          ],
        ),
      ),
    );
  }

  Future<void> _openAcquisitionLink(_AcquireChannel channel) async {
    final url = switch (channel) {
      _AcquireChannel.microsoftStore => kEmhkEinvoicingMicrosoftStoreUrl.trim(),
      _AcquireChannel.appStore => kEmhkEinvoicingAppStoreUrl.trim(),
      _AcquireChannel.website =>
        LicenseManager.instance.purchaseUrlForModule('invoicing') ??
            'https://eastmarkhk.com',
    };
    if (url.isEmpty) return;
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Widget _docList({required String empty, required List<EiDocument> docs}) {
    if (docs.isEmpty) {
      return Center(child: Text(empty, textAlign: TextAlign.center));
    }
    final l10n = AppLocalizations.of(context);
    // Teal e-Invoicing (AppColors.brandAccent) — même lecture visuelle.
    const brandTeal = Color(0xFF2BA89A);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 4),
      itemCount: docs.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (_, i) {
        final d = docs[i];
        final status = _statusLabel(l10n, d.status);
        final title = d.number.trim().isEmpty
            ? d.customerName
            : '${d.number} — ${d.customerName}';
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: brandTeal.withValues(alpha: 0.12),
            child: Icon(
              d.isInvoice ? Icons.receipt_long : Icons.request_quote,
              color: brandTeal,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: brandTeal,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${formatDateFr(d.date)} · $status · ${formatAmount(d.total)}',
          ),
          trailing: IconButton(
            tooltip: l10n.invOpenInStandalone,
            icon: const Icon(Icons.open_in_new, size: 20),
            onPressed: () async {
              final opened = await EInvoiceConnector.instance
                  .openStandaloneApp(doc: d);
              if (!opened && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.invOpenStandaloneFailed)),
                );
              }
            },
          ),
          onTap: () => showEiDocumentDetail(
            context,
            d,
            onChanged: () => _refreshAfterChange(showInvoices: !d.isInvoice),
          ),
        );
      },
    );
  }

  String _statusLabel(AppLocalizations l10n, String code) => switch (code) {
        'draft' => l10n.invStatusDraft,
        'sent' => l10n.invStatusSent,
        'accepted' => l10n.invStatusAccepted,
        'rejected' => l10n.invStatusRejected,
        'invoiced' => l10n.invStatusInvoiced,
        'partial' => l10n.invStatusPartial,
        'paid' => l10n.invStatusPaid,
        'overdue' => l10n.invStatusOverdue,
        'cancelled' => l10n.invStatusCancelled,
        _ => code,
      };
}

enum _AcquireChannel { appStore, microsoftStore, website }
