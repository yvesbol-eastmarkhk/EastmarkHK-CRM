/// Modèles du module Facturation — liés aux sociétés CRM par [companyId] (UUID).
library;

String invNowIso() => DateTime.now().toUtc().toIso8601String();

enum InvQuoteStatus { draft, sent, accepted, rejected, invoiced }

extension InvQuoteStatusX on InvQuoteStatus {
  String get labelFr => switch (this) {
        InvQuoteStatus.draft => 'Brouillon',
        InvQuoteStatus.sent => 'Envoyé',
        InvQuoteStatus.accepted => 'Accepté',
        InvQuoteStatus.rejected => 'Refusé',
        InvQuoteStatus.invoiced => 'Facturé',
      };

  static InvQuoteStatus parse(String? raw) =>
      InvQuoteStatus.values.firstWhere((s) => s.name == raw, orElse: () => InvQuoteStatus.draft);
}

enum InvInvoiceStatus { draft, sent, partial, paid, overdue, cancelled }

extension InvInvoiceStatusX on InvInvoiceStatus {
  String get labelFr => switch (this) {
        InvInvoiceStatus.draft => 'Brouillon',
        InvInvoiceStatus.sent => 'Envoyée',
        InvInvoiceStatus.partial => 'Part. payée',
        InvInvoiceStatus.paid => 'Payée',
        InvInvoiceStatus.overdue => 'En retard',
        InvInvoiceStatus.cancelled => 'Annulée',
      };

  static InvInvoiceStatus parse(String? raw) =>
      InvInvoiceStatus.values.firstWhere((s) => s.name == raw, orElse: () => InvInvoiceStatus.draft);
}

class InvLineItem {
  InvLineItem({
    required this.id,
    this.quoteId,
    this.invoiceId,
    required this.description,
    this.quantity = 1,
    this.unitPrice = 0,
    this.sortOrder = 0,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String? quoteId;
  String? invoiceId;
  String description;
  double quantity;
  double unitPrice;
  int sortOrder;
  String createdAt;
  String updatedAt;
  String? deletedAt;

  double get total => quantity * unitPrice;

  Map<String, Object?> toMap() => {
        'id': id,
        'quote_id': quoteId,
        'invoice_id': invoiceId,
        'description': description,
        'quantity': quantity,
        'unit_price': unitPrice,
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory InvLineItem.fromMap(Map<String, Object?> m) => InvLineItem(
        id: m['id'] as String,
        quoteId: m['quote_id'] as String?,
        invoiceId: m['invoice_id'] as String?,
        description: m['description'] as String? ?? '',
        quantity: (m['quantity'] as num?)?.toDouble() ?? 1,
        unitPrice: (m['unit_price'] as num?)?.toDouble() ?? 0,
        sortOrder: (m['sort_order'] as num?)?.toInt() ?? 0,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

class InvQuote {
  InvQuote({
    required this.id,
    required this.companyId,
    this.opportunityId,
    this.number,
    this.status = InvQuoteStatus.draft,
    required this.date,
    this.validUntil,
    this.vatRate = 21,
    this.notes,
    this.currency = 'EUR',
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.lines = const [],
  });

  final String id;
  final String companyId;
  String? opportunityId;
  String? number;
  InvQuoteStatus status;
  String date;
  String? validUntil;
  double vatRate;
  String? notes;
  String currency;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  List<InvLineItem> lines;

  double get subtotal => lines.fold(0.0, (s, l) => s + l.total);
  double get vatAmount => subtotal * vatRate / 100;
  double get total => subtotal + vatAmount;

  Map<String, Object?> toMap() => {
        'id': id,
        'company_id': companyId,
        'opportunity_id': opportunityId,
        'number': number,
        'status': status.name,
        'date': date,
        'valid_until': validUntil,
        'vat_rate': vatRate,
        'notes': notes,
        'currency': currency,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory InvQuote.fromMap(Map<String, Object?> m) => InvQuote(
        id: m['id'] as String,
        companyId: m['company_id'] as String,
        opportunityId: m['opportunity_id'] as String?,
        number: m['number'] as String?,
        status: InvQuoteStatusX.parse(m['status'] as String?),
        date: m['date'] as String,
        validUntil: m['valid_until'] as String?,
        vatRate: (m['vat_rate'] as num?)?.toDouble() ?? 21,
        notes: m['notes'] as String?,
        currency: m['currency'] as String? ?? 'EUR',
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

class InvInvoice {
  InvInvoice({
    required this.id,
    required this.companyId,
    this.quoteId,
    this.number,
    this.status = InvInvoiceStatus.draft,
    required this.date,
    this.dueDate,
    this.vatRate = 21,
    this.notes,
    this.currency = 'EUR',
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.lines = const [],
    this.paidAmount = 0,
  });

  final String id;
  final String companyId;
  String? quoteId;
  String? number;
  InvInvoiceStatus status;
  String date;
  String? dueDate;
  double vatRate;
  String? notes;
  String currency;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  List<InvLineItem> lines;
  double paidAmount;

  double get subtotal => lines.fold(0.0, (s, l) => s + l.total);
  double get vatAmount => subtotal * vatRate / 100;
  double get total => subtotal + vatAmount;
  double get balanceDue => total - paidAmount;

  Map<String, Object?> toMap() => {
        'id': id,
        'company_id': companyId,
        'quote_id': quoteId,
        'number': number,
        'status': status.name,
        'date': date,
        'due_date': dueDate,
        'vat_rate': vatRate,
        'notes': notes,
        'currency': currency,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory InvInvoice.fromMap(Map<String, Object?> m) => InvInvoice(
        id: m['id'] as String,
        companyId: m['company_id'] as String,
        quoteId: m['quote_id'] as String?,
        number: m['number'] as String?,
        status: InvInvoiceStatusX.parse(m['status'] as String?),
        date: m['date'] as String,
        dueDate: m['due_date'] as String?,
        vatRate: (m['vat_rate'] as num?)?.toDouble() ?? 21,
        notes: m['notes'] as String?,
        currency: m['currency'] as String? ?? 'EUR',
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

class InvPayment {
  InvPayment({
    required this.id,
    required this.invoiceId,
    required this.amount,
    required this.paidAt,
    this.method,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String invoiceId;
  double amount;
  String paidAt;
  String? method;
  String? notes;
  String createdAt;
  String updatedAt;
  String? deletedAt;

  Map<String, Object?> toMap() => {
        'id': id,
        'invoice_id': invoiceId,
        'amount': amount,
        'paid_at': paidAt,
        'method': method,
        'notes': notes,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory InvPayment.fromMap(Map<String, Object?> m) => InvPayment(
        id: m['id'] as String,
        invoiceId: m['invoice_id'] as String,
        amount: (m['amount'] as num?)?.toDouble() ?? 0,
        paidAt: m['paid_at'] as String,
        method: m['method'] as String?,
        notes: m['notes'] as String?,
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}
