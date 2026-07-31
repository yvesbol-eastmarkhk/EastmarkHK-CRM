import 'package:flutter/material.dart';

import '../../../core/db/app_database.dart';
import '../../../core/models/models.dart';
import '../../../core/services/currency_settings.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/dictation_field.dart';
import '../invoicing_repository.dart';
import '../models/invoicing_models.dart';

/// Éditeur de devis — version CRM (logique e-Invoice, UI unifiée).
class QuoteEditorScreen extends StatefulWidget {
  const QuoteEditorScreen({super.key, this.existing, this.companyId, this.opportunityId});

  final InvQuote? existing;
  final String? companyId;
  final String? opportunityId;

  @override
  State<QuoteEditorScreen> createState() => _QuoteEditorScreenState();
}

class _QuoteEditorScreenState extends State<QuoteEditorScreen> {
  String? _companyId;
  final _desc = TextEditingController();
  final _amount = TextEditingController();
  final _notes = TextEditingController();
  List<Company> _companies = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _companyId = widget.existing?.companyId ?? widget.companyId;
    if (widget.existing != null) {
      final lines = widget.existing!.lines;
      if (lines.isNotEmpty) {
        _desc.text = lines.first.description;
        _amount.text = formatAmountForEditing(lines.first.unitPrice);
      }
      _notes.text = widget.existing!.notes ?? '';
    }
    _loadCompanies();
  }

  Future<void> _loadCompanies() async {
    final c = await AppDatabase.instance.companies();
    if (!mounted) return;
    setState(() {
      _companies = c;
      _companyId ??= c.isNotEmpty ? c.first.id : null;
      _loading = false;
    });
  }

  @override
  void dispose() {
    _desc.dispose();
    _amount.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_companyId == null || _desc.text.trim().isEmpty) return;
    final now = invNowIso();
    final id = widget.existing?.id ?? AppDatabase.newId();
    final line = InvLineItem(
      id: widget.existing?.lines.firstOrNull?.id ?? AppDatabase.newId(),
      quoteId: id,
      description: _desc.text.trim(),
      quantity: 1,
      unitPrice: parseFormattedAmount(_amount.text) ?? 0,
      createdAt: widget.existing?.createdAt ?? now,
      updatedAt: now,
    );
    final q = InvQuote(
      id: id,
      companyId: _companyId!,
      opportunityId: widget.existing?.opportunityId ?? widget.opportunityId,
      number: widget.existing?.number,
      status: widget.existing?.status ?? InvQuoteStatus.draft,
      date: widget.existing?.date ?? now,
      validUntil: widget.existing?.validUntil,
      notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
      currency: CurrencySettings.instance.code,
      createdAt: widget.existing?.createdAt ?? now,
      updatedAt: now,
    );
    if (q.number == null || q.number!.isEmpty) {
      // numéro assigné par le repo si nouveau
    }
    await InvoicingRepository.instance.upsertQuote(q, lines: [line]);
    if (!mounted) return;
    Navigator.pop(context, true);
  }

  Future<void> _toInvoice() async {
    if (widget.existing == null) {
      await _save();
      return;
    }
    await InvoicingRepository.instance.createInvoiceFromQuote(widget.existing!);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Facture créée à partir du devis')),
    );
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existing == null ? 'Nouveau devis' : 'Devis ${widget.existing!.number ?? ''}'),
        actions: [
          if (widget.existing != null)
            TextButton(onPressed: _toInvoice, child: const Text('→ Facture')),
          FilledButton(onPressed: _save, child: const Text('Enregistrer')),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    initialValue: _companyId,
                    decoration: const InputDecoration(labelText: 'Client', border: OutlineInputBorder()),
                    items: [
                      for (final c in _companies)
                        DropdownMenuItem(value: c.id, child: Text(c.name)),
                    ],
                    onChanged: (v) => setState(() => _companyId = v),
                  ),
                  const SizedBox(height: 12),
                  DictationField(controller: _desc, label: 'Description / produit'),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _amount,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [AmountInputFormatter()],
                    decoration: InputDecoration(
                      labelText: 'Montant HT',
                      prefixText: '${CurrencySettings.instance.current.symbol} ',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DictationField(controller: _notes, label: 'Notes', maxLines: 3),
                ],
              ),
            ),
    );
  }
}
