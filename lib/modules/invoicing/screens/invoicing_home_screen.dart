import 'package:flutter/material.dart';

import '../../../core/utils/formatters.dart';
import '../../../theme/crm_tokens.dart';
import '../../../ui/crm_page.dart';
import '../invoicing_repository.dart';
import '../models/invoicing_models.dart';
import 'quote_editor_screen.dart';

/// Accueil Facturation — devis et factures (module e-Invoice).
class InvoicingHomeScreen extends StatefulWidget {
  const InvoicingHomeScreen({super.key});

  @override
  State<InvoicingHomeScreen> createState() => _InvoicingHomeScreenState();
}

class _InvoicingHomeScreenState extends State<InvoicingHomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  List<InvQuote> _quotes = [];
  List<InvInvoice> _invoices = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final repo = InvoicingRepository.instance;
    final quotes = await repo.quotes();
    final invoices = await repo.invoices();
    if (!mounted) return;
    setState(() {
      _quotes = quotes;
      _invoices = invoices;
      _loading = false;
    });
  }

  Future<void> _newQuote() async {
    final ok = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const QuoteEditorScreen()),
    );
    if (ok == true) _load();
  }

  @override
  Widget build(BuildContext context) {
    return CrmPage(
      title: 'Facturation',
      subtitle: 'Devis, factures et paiements — module e-Invoice',
      actions: [
        FilledButton.tonalIcon(
          onPressed: _newQuote,
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouveau devis'),
        ),
      ],
      child: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabBar(
                  controller: _tabs,
                  tabs: [
                    Tab(text: 'Devis (${_quotes.length})'),
                    Tab(text: 'Factures (${_invoices.length})'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabs,
                    children: [
                      _docList(
                        empty: 'Aucun devis — créez-en un depuis une opportunité gagnée ou le bouton ci-dessus.',
                        items: _quotes
                            .map((q) => (
                                  q.number ?? q.id.substring(0, 8),
                                  q.status.labelFr,
                                  formatAmount(q.total),
                                  () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => QuoteEditorScreen(existing: q)),
                                    );
                                    _load();
                                  },
                                ))
                            .toList(),
                      ),
                      _docList(
                        empty: 'Aucune facture.',
                        items: _invoices
                            .map((inv) => (
                                  inv.number ?? inv.id.substring(0, 8),
                                  inv.status.labelFr,
                                  formatAmount(inv.total),
                                  () {},
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _docList({
    required String empty,
    required List<(String title, String subtitle, String amount, VoidCallback onTap)> items,
  }) {
    if (items.isEmpty) {
      return Center(child: Text(empty, textAlign: TextAlign.center));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(CrmTokens.pagePadding),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final item = items[i];
        return Material(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            title: Text(item.$1),
            subtitle: Text(item.$2),
            trailing: Text(item.$3, style: const TextStyle(fontWeight: FontWeight.w600)),
            onTap: item.$4,
          ),
        );
      },
    );
  }
}
