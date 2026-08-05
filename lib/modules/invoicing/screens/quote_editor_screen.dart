import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/db/app_database.dart';
import '../../../core/models/models.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/rich_notes.dart';
import '../../../core/widgets/notes_editor.dart';
import '../../../db/crm_db.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../../platform/desktop_chrome.dart';
import '../../../theme/crm_tokens.dart';
import '../einvoice_connector.dart';
import '../invoicing_module.dart';
import '../widgets/ei_client_picker.dart';
import '../widgets/ei_customer_resolve_dialog.dart';
import '../widgets/ei_line_items_editor.dart';

/// Couleurs module facturation — alignées e-Invoicing.
abstract final class _DocColors {
  static const primary = Color(0xFF1E4D8C);
  static const teal = Color(0xFF2BA89A);
  static const fuchsia = Color(0xFFE6007E);
  static const paidSoft = Color(0xFFE6F5F2);
}

/// Éditeur de document — UX alignée sur e-Invoicing (catalogue + lignes
/// libres), données écrites directement dans e-Invoicing. Le client CRM est
/// prérempli ; le document apparaît ensuite aussi dans l'app standalone.
class EiDocumentEditorScreen extends StatefulWidget {
  const EiDocumentEditorScreen({
    super.key,
    this.companyId,
    this.opportunityId,
    this.asInvoice = false,
    this.initialLines = const [],
    this.existing,
  });

  final String? companyId;
  final String? opportunityId;

  /// false : devis, true : facture.
  final bool asInvoice;

  /// Lignes préremplies (ex. depuis une opportunité gagnée).
  final List<EiLine> initialLines;

  /// Document existant à modifier (null = création).
  final EiEditableDocument? existing;

  @override
  State<EiDocumentEditorScreen> createState() => _EiDocumentEditorScreenState();
}

class _EiDocumentEditorScreenState extends State<EiDocumentEditorScreen> {
  String? _companyId;
  late bool _asInvoice = widget.existing?.isInvoice ?? widget.asInvoice;
  final _notesKey = GlobalKey<NotesEditorState>();
  final _linesKey = GlobalKey<EiLineItemsEditorState>();
  final _vat = TextEditingController(text: '21');
  late DateTime _date = DateTime.now();
  late DateTime _dueOrValid = DateTime.now().add(const Duration(days: 30));
  String _status = 'draft';
  String _notesInitial = '';
  late final List<EiLine> _lines = [
    for (final l in widget.existing?.lines ?? widget.initialLines)
      EiLine(
        description: l.description,
        qty: l.qty,
        unitPrice: l.unitPrice,
        productId: l.productId,
        productUuid: l.productUuid,
        photoPath: l.photoPath,
      ),
  ];
  List<Company> _companies = [];
  bool _loading = true;
  bool _saving = false;
  bool get _isEditing => widget.existing != null;

  List<String> get _statusValues => _asInvoice
      ? const ['draft', 'sent', 'partial', 'paid', 'overdue', 'cancelled']
      : const ['draft', 'sent', 'accepted', 'rejected', 'invoiced'];

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

  double get _vatRate =>
      double.tryParse(_vat.text.replaceAll(',', '.')) ?? 21;

  double get _subtotal =>
      _lines.fold<double>(0, (sum, l) => sum + l.total);

  double get _vatAmount => _subtotal * (_vatRate / 100);

  double get _total => _subtotal + _vatAmount;

  @override
  void initState() {
    super.initState();
    _companyId = widget.companyId ?? widget.existing?.crmCompanyId;
    final existing = widget.existing;
    if (existing != null) {
      _asInvoice = existing.isInvoice;
      _date = existing.date;
      _dueOrValid = existing.dueOrValid;
      _status = existing.status;
      _vat.text = existing.vatRate == existing.vatRate.roundToDouble()
          ? existing.vatRate.toStringAsFixed(0)
          : existing.vatRate.toString();
      _notesInitial = existing.notes;
    }
    _loadCompanies().then((_) {
      if (!mounted) return;
      if (!_isEditing &&
          widget.companyId == null &&
          _companyId == null &&
          _companies.isNotEmpty) {
        // Nouveau devis/facture hors fiche client → choix immédiat.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _pickClient();
        });
      }
    });
  }

  Future<void> _loadCompanies() async {
    final c = await AppDatabase.instance.companies();
    if (!mounted) return;
    setState(() {
      _companies = c;
      // Prérempli seulement si on vient d’une fiche client / devis existant.
      // Sinon l’utilisateur choisit via le modal (pas le 1er de la liste).
      _companyId ??= widget.companyId ?? widget.existing?.crmCompanyId;
      final existing = widget.existing;
      // Devis → facture : retrouver la fiche CRM via uuid e-Invoicing ou nom.
      if (_companyId == null && existing != null) {
        final u = existing.customerUuid.trim();
        if (u.isNotEmpty) {
          _companyId = c
              .where((x) => (x.einvoiceCustomerUuid ?? '').trim() == u)
              .map((x) => x.id)
              .firstOrNull;
        }
        if (_companyId == null) {
          final n = existing.customerName.trim().toLowerCase();
          if (n.isNotEmpty) {
            _companyId = c
                .where((x) => x.name.trim().toLowerCase() == n)
                .map((x) => x.id)
                .firstOrNull;
            _companyId ??= c
                .where((x) {
                  final cn = x.name.trim().toLowerCase();
                  return cn.contains(n) || n.contains(cn);
                })
                .map((x) => x.id)
                .firstOrNull;
            if (_companyId == null) {
              final token = n
                  .split(RegExp(r'[^a-z0-9]+'))
                  .where((t) => t.length >= 3)
                  .firstOrNull;
              if (token != null) {
                final hits = c
                    .where((x) => x.name.toLowerCase().contains(token))
                    .toList();
                if (hits.length == 1) _companyId = hits.first.id;
              }
            }
          }
        }
      }
      if (_companyId != null && !c.any((x) => x.id == _companyId)) {
        _companyId = null;
      }
      _loading = false;
    });
  }

  Future<void> _pickClient() async {
    final picked = await showEiClientPicker(
      context,
      companies: _companies,
      selectedId: _companyId,
    );
    if (picked == null || !mounted) return;
    setState(() => _companyId = picked.id);
  }

  @override
  void dispose() {
    _vat.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final companyId = _companyId;
    if (_saving) return;
    final existing = widget.existing;
    final hasEiCustomer = _isEditing &&
        ((existing?.customerUuid.trim().isNotEmpty ?? false) ||
            (existing?.customerName.trim().isNotEmpty ?? false));
    if (companyId == null && !hasEiCustomer) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).invClientRequired)),
      );
      await _pickClient();
      return;
    }
    await _linesKey.currentState?.commitEdits();
    final notesHtml = await _notesKey.currentState?.flushHtml() ??
        _notesKey.currentState?.getHtml();
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final validLines = _lines
        .where((l) => l.description.trim().isNotEmpty)
        .map((l) => EiLine(
              description: l.description.trim(),
              qty: l.qty <= 0 ? 1 : l.qty,
              unitPrice: l.unitPrice,
              productId: l.productId,
              productUuid: l.productUuid,
              photoPath: l.photoPath,
            ))
        .toList();
    if (validLines.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).invNeedLines),
      ));
      return;
    }
    Company? company = companyId == null
        ? null
        : _companies.where((c) => c.id == companyId).firstOrNull;
    if (companyId != null && company == null) return;

    final connector = EInvoiceConnector.instance;
    final sameLinkedCustomer = _isEditing &&
        company != null &&
        (existing?.crmCompanyId == null ||
            existing?.crmCompanyId == companyId);
    final keepExistingEiCustomer = _isEditing &&
        company == null &&
        (existing?.customerUuid.trim().isNotEmpty ?? false);

    late EiCustomerDecision decision;
    if (sameLinkedCustomer || keepExistingEiCustomer) {
      final ex = existing!;
      decision = EiCustomerDecision(
        kind: EiCustomerDecisionKind.useExisting,
        existing: EiCustomerHit(
          id: ex.customerId > 0 ? ex.customerId : null,
          uuid: ex.customerUuid.isNotEmpty ? ex.customerUuid : null,
          name: ex.customerName,
        ),
      );
    } else {
      if (company == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.invClientRequired)),
        );
        await _pickClient();
        return;
      }
      EiCustomerPreview preview;
      try {
        preview = await connector.previewCustomerLink(company);
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(AppLocalizations.of(context).eiCustomerCheckFailed('$e')),
          ),
        );
        return;
      }
      if (!mounted) return;
      decision = await showEiCustomerResolveDialog(
        context,
        preview: preview,
      );
      if (decision.kind == EiCustomerDecisionKind.cancel || !mounted) return;

      if (decision.updatedTaxId != null) {
        company.vatNumber = decision.updatedTaxId;
        await AppDatabase.instance.upsertCompany(company);
        if (!mounted) return;
        setState(() {
          final i = _companies.indexWhere((c) => c.id == company.id);
          if (i >= 0) _companies[i] = company;
        });
        try {
          final again = await connector.previewCustomerLink(company);
          if (again.byTaxId != null && !again.nameDiffersOnTaxMatch) {
            decision = EiCustomerDecision(
              kind: EiCustomerDecisionKind.useExisting,
              existing: again.byTaxId,
            );
          } else if (again.nameDiffersOnTaxMatch && mounted) {
            decision = await showEiCustomerResolveDialog(
              context,
              preview: again,
            );
            if (decision.kind == EiCustomerDecisionKind.cancel || !mounted) {
              return;
            }
          }
        } catch (_) {}
      }
    }

    setState(() => _saving = true);
    try {
      final notes = notesHtmlOrNull(notesHtml) ?? '';
      late final EiDocumentRef ref;
      if (existing != null) {
        ref = await connector
            .updateEditableDocument(
              existing: existing,
              lines: validLines,
              vatRate: _vatRate,
              notes: notes,
              date: _date,
              dueOrValid: _dueOrValid,
              status: _status,
              company: company,
              customerDecision: decision,
            )
            .timeout(const Duration(seconds: 90));
      } else {
        final c = company;
        final cid = companyId;
        if (c == null || cid == null) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.invClientRequired)),
          );
          await _pickClient();
          return;
        }
        ref = await (_asInvoice
                ? connector.createInvoice(
                    company: c,
                    lines: validLines,
                    vatRate: _vatRate,
                    notes: notes,
                    date: _date,
                    dueDate: _dueOrValid,
                    status: _status,
                    customerDecision: decision,
                  )
                : connector.createQuote(
                    company: c,
                    lines: validLines,
                    vatRate: _vatRate,
                    notes: notes,
                    date: _date,
                    validUntil: _dueOrValid,
                    status: _status,
                    customerDecision: decision,
                  ))
            .timeout(const Duration(seconds: 90));
        // Journal CRM — ne bloque pas la fermeture de l’éditeur.
        try {
          await InvoicingModule.logDocumentActivity(
            companyId: cid,
            opportunityId: widget.opportunityId,
            ref: ref,
          ).timeout(const Duration(seconds: 8));
        } catch (_) {}
        try {
          await CrmDb.instance
              .logDocumentOnClientTasks(
                clientId: cid,
                refType: ref.isInvoice ? 'invoice' : 'quote',
                refId: ref.uuid.isNotEmpty ? ref.uuid : '${ref.id}',
                title: ref.isInvoice
                    ? l10n.taskInvoiceTitle(ref.number)
                    : l10n.taskQuoteTitle(ref.number),
                detail: l10n.quoteCreatedFromEinvoice,
              )
              .timeout(const Duration(seconds: 8));
        } catch (_) {}
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          existing != null
              ? l10n.invDocumentSaved(ref.number)
              : l10n.quoteCreatedSnackbar(
                  ref.isInvoice ? l10n.oppInvoiceButton : l10n.oppQuoteButton,
                  ref.number,
                ),
        ),
      ));
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEditing
                ? AppLocalizations.of(context).invDocumentSaveFailed('$e')
                : AppLocalizations.of(context).quoteCreateFailed('$e'),
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _pickDate({required bool due}) async {
    final initial = due ? _dueOrValid : _date;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null || !mounted) return;
    setState(() {
      if (due) {
        _dueOrValid = picked;
      } else {
        _date = picked;
        if (_dueOrValid.isBefore(_date)) {
          _dueOrValid = _date.add(const Duration(days: 30));
        }
      }
    });
  }

  Widget _dateField({
    required String label,
    required DateTime value,
    required VoidCallback onTap,
  }) {
    final text = DateFormat('dd/MM/yyyy').format(value);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final statusValue =
        _statusValues.contains(_status) ? _status : 'draft';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: DesktopChrome.appBarLeadingWidth,
        leading: DesktopChrome.backLeading(context),
        title: Text(
          _isEditing
              ? (_asInvoice
                  ? l10n.invEditInvoice(widget.existing!.number)
                  : l10n.invEditQuote(widget.existing!.number))
              : (_asInvoice ? l10n.invNewInvoice : l10n.invNewQuote),
        ),
        actions: [
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: _DocColors.teal),
            onPressed: _saving ? null : _save,
            child: Text(
              _saving
                  ? (_isEditing ? l10n.invSaving : l10n.invCreating)
                  : (_isEditing ? l10n.invSave : l10n.invCreate),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _EiSectionCard(
                  title: _asInvoice ? l10n.invSectionInvoice : l10n.invSectionQuote,
                  accent: _DocColors.primary,
                  icon: _asInvoice
                      ? Icons.request_quote_outlined
                      : Icons.description_outlined,
                  children: [
                    if (!_isEditing) ...[
                      SegmentedButton<bool>(
                        segments: [
                          ButtonSegment(
                            value: false,
                            label: Text(l10n.invSectionQuote),
                            icon: const Icon(Icons.request_quote_outlined),
                          ),
                          ButtonSegment(
                            value: true,
                            label: Text(l10n.invSectionInvoice),
                            icon: const Icon(Icons.receipt_outlined),
                          ),
                        ],
                        selected: {_asInvoice},
                        onSelectionChanged: (s) => setState(() {
                          _asInvoice = s.first;
                          if (!_statusValues.contains(_status)) {
                            _status = 'draft';
                          }
                        }),
                      ),
                      const SizedBox(height: 12),
                    ],
                    Builder(builder: (context) {
                      final selected = _companies
                          .where((c) => c.id == _companyId)
                          .firstOrNull;
                      final fallbackName =
                          widget.existing?.customerName.trim() ?? '';
                      final label = selected?.name ??
                          (fallbackName.isNotEmpty
                              ? fallbackName
                              : l10n.invPickClientButton);
                      final hasClient =
                          selected != null || fallbackName.isNotEmpty;
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: l10n.invFieldClient,
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            tooltip: l10n.invPickClientButton,
                            onPressed: _pickClient,
                            icon: const Icon(Icons.search),
                          ),
                        ),
                        child: InkWell(
                          onTap: _pickClient,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              label,
                              style: TextStyle(
                                fontSize: 16,
                                color: hasClient
                                    ? scheme.onSurface
                                    : scheme.onSurfaceVariant,
                                fontWeight: hasClient
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    Text(
                      l10n.invClientLinkedHint,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 16),
                    LayoutBuilder(builder: (context, constraints) {
                      final narrow = constraints.maxWidth < 640;
                      final dateF = _dateField(
                        label: l10n.invFieldDate,
                        value: _date,
                        onTap: () => _pickDate(due: false),
                      );
                      final dueF = _dateField(
                        label: _asInvoice
                            ? l10n.invFieldDueDate
                            : l10n.invFieldValidUntil,
                        value: _dueOrValid,
                        onTap: () => _pickDate(due: true),
                      );
                      final statusF = DropdownButtonFormField<String>(
                        key: ValueKey('status-$_asInvoice-$statusValue'),
                        initialValue: statusValue,
                        decoration: InputDecoration(
                          labelText: l10n.invFieldStatus,
                          border: const OutlineInputBorder(),
                        ),
                        items: [
                          for (final s in _statusValues)
                            DropdownMenuItem(
                              value: s,
                              child: Text(_statusLabel(l10n, s)),
                            ),
                        ],
                        onChanged: (v) {
                          if (v != null) setState(() => _status = v);
                        },
                      );
                      final vatF = TextField(
                        controller: _vat,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: InputDecoration(
                          labelText: l10n.invFieldVatPercent,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (_) => setState(() {}),
                      );
                      if (narrow) {
                        return Column(
                          children: [
                            dateF,
                            const SizedBox(height: 12),
                            dueF,
                            const SizedBox(height: 12),
                            statusF,
                            const SizedBox(height: 12),
                            vatF,
                          ],
                        );
                      }
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: dateF),
                          const SizedBox(width: 12),
                          Expanded(child: dueF),
                          const SizedBox(width: 12),
                          Expanded(child: statusF),
                          const SizedBox(width: 12),
                          SizedBox(width: 110, child: vatF),
                        ],
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 12),
                _EiSectionCard(
                  title: l10n.invLinesTitle,
                  accent: _DocColors.teal,
                  icon: Icons.view_list_outlined,
                  platformViewSafe: true,
                  children: [
                    EiLineItemsEditor(
                      key: _linesKey,
                      lines: _lines,
                      vatRate: _vatRate,
                      onChanged: () => setState(() {}),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: _DocColors.paidSoft,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.lerp(
                                _DocColors.teal, Colors.white, 0.55)!,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _totalRow(
                                l10n.invSubtotalHt, formatAmount(_subtotal)),
                            _totalRow(l10n.invVat, formatAmount(_vatAmount)),
                            const Divider(height: 16),
                            _totalRow(
                              l10n.invTotalTtc,
                              formatAmount(_total),
                              bold: true,
                              highlight: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _EiSectionCard(
                  title: l10n.invNotesTitle,
                  accent: _DocColors.fuchsia,
                  icon: Icons.notes_outlined,
                  platformViewSafe: true,
                  children: [
                    SizedBox(
                      height: 220,
                      child: NotesEditor(
                        key: _notesKey,
                        initialHtml: _notesInitial,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.invFooterHint,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
    );
  }

  Widget _totalRow(String label, String value,
      {bool bold = false, bool highlight = false}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
      fontSize: bold ? 16 : 13,
      color: highlight ? _DocColors.fuchsia : null,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label, style: style)),
          Text(value, style: style),
        ],
      ),
    );
  }
}

class _EiSectionCard extends StatelessWidget {
  const _EiSectionCard({
    required this.title,
    required this.children,
    required this.accent,
    this.icon,
    this.platformViewSafe = false,
  });

  final String title;
  final List<Widget> children;
  final Color accent;
  final IconData? icon;
  final bool platformViewSafe;

  @override
  Widget build(BuildContext context) {
    final soft = Color.lerp(accent, Colors.white, 0.88)!;
    final border = Color.lerp(accent, CrmTokens.borderLight, 0.55)!;
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [soft, Colors.white],
            ),
            border: Border(
              bottom: BorderSide(
                color: Color.lerp(accent, Colors.white, 0.7)!,
              ),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 22,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 10),
              if (icon != null) ...[
                Icon(icon, size: 18, color: accent),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: accent,
                      ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ],
    );
    if (platformViewSafe) {
      return Container(
        padding: const EdgeInsets.all(1),
        color: border,
        child: ColoredBox(color: Colors.white, child: content),
      );
    }
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CrmTokens.radiusLg),
        side: BorderSide(color: border),
      ),
      child: content,
    );
  }
}
