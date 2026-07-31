import 'package:sqflite/sqflite.dart';

import '../../../core/db/app_database.dart';
import '../../../core/models/models.dart';
import 'models/invoicing_models.dart';

/// Migrations SQL du module Facturation.
const invoicingMigrations = [
  '''
  CREATE TABLE IF NOT EXISTS inv_quotes (
    id TEXT PRIMARY KEY,
    company_id TEXT NOT NULL,
    opportunity_id TEXT,
    number TEXT,
    status TEXT NOT NULL DEFAULT 'draft',
    date TEXT NOT NULL,
    valid_until TEXT,
    vat_rate REAL DEFAULT 21,
    notes TEXT,
    currency TEXT DEFAULT 'EUR',
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    deleted_at TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS inv_invoices (
    id TEXT PRIMARY KEY,
    company_id TEXT NOT NULL,
    quote_id TEXT,
    number TEXT,
    status TEXT NOT NULL DEFAULT 'draft',
    date TEXT NOT NULL,
    due_date TEXT,
    vat_rate REAL DEFAULT 21,
    notes TEXT,
    currency TEXT DEFAULT 'EUR',
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    deleted_at TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS inv_line_items (
    id TEXT PRIMARY KEY,
    quote_id TEXT,
    invoice_id TEXT,
    description TEXT NOT NULL,
    quantity REAL NOT NULL DEFAULT 1,
    unit_price REAL NOT NULL DEFAULT 0,
    sort_order INTEGER DEFAULT 0,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    deleted_at TEXT)''',
  '''
  CREATE TABLE IF NOT EXISTS inv_payments (
    id TEXT PRIMARY KEY,
    invoice_id TEXT NOT NULL,
    amount REAL NOT NULL,
    paid_at TEXT NOT NULL,
    method TEXT,
    notes TEXT,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    deleted_at TEXT)''',
  'CREATE INDEX IF NOT EXISTS idx_inv_quotes_company ON inv_quotes(company_id)',
  'CREATE INDEX IF NOT EXISTS idx_inv_invoices_company ON inv_invoices(company_id)',
  'CREATE INDEX IF NOT EXISTS idx_inv_payments_invoice ON inv_payments(invoice_id)',
];

/// Accès données Facturation — même base SQLite que le CRM.
class InvoicingRepository {
  InvoicingRepository._();
  static final InvoicingRepository instance = InvoicingRepository._();

  Future<void> ensureSchema() => AppDatabase.instance.runModuleMigrations(invoicingMigrations);

  Future<List<InvQuote>> quotes({String? companyId, String? search}) async {
    final db = await AppDatabase.instance.database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (companyId != null) {
      where.write(' AND company_id = ?');
      args.add(companyId);
    }
    if (search != null && search.trim().isNotEmpty) {
      where.write(' AND (number LIKE ? OR notes LIKE ?)');
      final q = '%${search.trim()}%';
      args.addAll([q, q]);
    }
    final rows = await db.query('inv_quotes',
        where: where.toString(), whereArgs: args, orderBy: 'date DESC');
    final out = <InvQuote>[];
    for (final r in rows) {
      final q = InvQuote.fromMap(r);
      q.lines = await _linesForQuote(q.id);
      out.add(q);
    }
    return out;
  }

  Future<List<InvInvoice>> invoices({String? companyId, String? search}) async {
    final db = await AppDatabase.instance.database;
    final where = StringBuffer('deleted_at IS NULL');
    final args = <Object?>[];
    if (companyId != null) {
      where.write(' AND company_id = ?');
      args.add(companyId);
    }
    if (search != null && search.trim().isNotEmpty) {
      where.write(' AND (number LIKE ? OR notes LIKE ?)');
      final q = '%${search.trim()}%';
      args.addAll([q, q]);
    }
    final rows = await db.query('inv_invoices',
        where: where.toString(), whereArgs: args, orderBy: 'date DESC');
    final out = <InvInvoice>[];
    for (final r in rows) {
      final inv = InvInvoice.fromMap(r);
      inv.lines = await _linesForInvoice(inv.id);
      inv.paidAmount = await _paidTotal(inv.id);
      out.add(inv);
    }
    return out;
  }

  Future<void> upsertQuote(InvQuote q, {List<InvLineItem>? lines}) async {
    final db = await AppDatabase.instance.database;
    if (q.number == null || q.number!.isEmpty) {
      q.number = await _nextNumber('DEV');
    }
    q.updatedAt = invNowIso();
    await db.insert('inv_quotes', q.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    if (lines != null) {
      await db.update('inv_line_items', {'deleted_at': q.updatedAt},
          where: 'quote_id = ? AND deleted_at IS NULL', whereArgs: [q.id]);
      for (final l in lines) {
        l.quoteId = q.id;
        l.updatedAt = q.updatedAt;
        await db.insert('inv_line_items', l.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    await _logActivity(q.companyId, 'Devis', q.number ?? q.id, 'inv_quotes', q.id);
  }

  Future<void> upsertInvoice(InvInvoice inv, {List<InvLineItem>? lines}) async {
    final db = await AppDatabase.instance.database;
    inv.updatedAt = invNowIso();
    await db.insert('inv_invoices', inv.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    if (lines != null) {
      await db.update('inv_line_items', {'deleted_at': inv.updatedAt},
          where: 'invoice_id = ? AND deleted_at IS NULL', whereArgs: [inv.id]);
      for (final l in lines) {
        l.invoiceId = inv.id;
        l.updatedAt = inv.updatedAt;
        await db.insert('inv_line_items', l.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    await _logActivity(inv.companyId, 'Facture', inv.number ?? inv.id, 'inv_invoices', inv.id);
  }

  Future<void> addPayment(InvPayment p) async {
    final db = await AppDatabase.instance.database;
    p.updatedAt = invNowIso();
    await db.insert('inv_payments', p.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    final invRows = await db.query('inv_invoices', where: 'id = ?', whereArgs: [p.invoiceId]);
    if (invRows.isEmpty) return;
    final companyId = invRows.first['company_id'] as String;
    await _logActivity(companyId, 'Paiement', '${p.amount}', 'inv_payments', p.id);
  }

  /// Crée un devis pré-rempli depuis une opportunité gagnée.
  Future<InvQuote> createQuoteFromOpportunity(Opportunity opp) async {
    if (opp.companyId == null) throw ArgumentError('Opportunité sans client');
    final now = invNowIso();
    final id = AppDatabase.newId();
    final number = await _nextNumber('DEV');
    final line = InvLineItem(
      id: AppDatabase.newId(),
      quoteId: id,
      description: opp.title,
      quantity: 1,
      unitPrice: opp.amount ?? 0,
      createdAt: now,
      updatedAt: now,
    );
    final q = InvQuote(
      id: id,
      companyId: opp.companyId!,
      opportunityId: opp.id,
      number: number,
      date: now,
      validUntil: DateTime.now().add(const Duration(days: 30)).toUtc().toIso8601String(),
      notes: opp.notes,
      currency: opp.currency ?? 'EUR',
      createdAt: now,
      updatedAt: now,
    );
    await upsertQuote(q, lines: [line]);
    return q;
  }

  Future<InvInvoice> createInvoiceFromQuote(InvQuote q) async {
    final now = invNowIso();
    final id = AppDatabase.newId();
    final number = await _nextNumber('FAC');
    final inv = InvInvoice(
      id: id,
      companyId: q.companyId,
      quoteId: q.id,
      number: number,
      date: now,
      dueDate: DateTime.now().add(const Duration(days: 30)).toUtc().toIso8601String(),
      vatRate: q.vatRate,
      notes: q.notes,
      currency: q.currency,
      createdAt: now,
      updatedAt: now,
    );
    final lines = q.lines
        .map((l) => InvLineItem(
              id: AppDatabase.newId(),
              invoiceId: id,
              description: l.description,
              quantity: l.quantity,
              unitPrice: l.unitPrice,
              sortOrder: l.sortOrder,
              createdAt: now,
              updatedAt: now,
            ))
        .toList();
    q.status = InvQuoteStatus.invoiced;
    await upsertQuote(q);
    await upsertInvoice(inv, lines: lines);
    return inv;
  }

  Future<String> _nextNumber(String prefix) async {
    final db = await AppDatabase.instance.database;
    final year = DateTime.now().year;
    final key = 'inv_seq_${prefix}_$year';
    final cur = int.tryParse(await AppDatabase.instance.getSetting(key) ?? '0') ?? 0;
    final next = cur + 1;
    await AppDatabase.instance.setSetting(key, '$next');
    return '$prefix-$year-${next.toString().padLeft(4, '0')}';
  }

  Future<List<InvLineItem>> _linesForQuote(String quoteId) async {
    final db = await AppDatabase.instance.database;
    final rows = await db.query('inv_line_items',
        where: 'quote_id = ? AND deleted_at IS NULL', whereArgs: [quoteId], orderBy: 'sort_order');
    return rows.map(InvLineItem.fromMap).toList();
  }

  Future<List<InvLineItem>> _linesForInvoice(String invoiceId) async {
    final db = await AppDatabase.instance.database;
    final rows = await db.query('inv_line_items',
        where: 'invoice_id = ? AND deleted_at IS NULL', whereArgs: [invoiceId], orderBy: 'sort_order');
    return rows.map(InvLineItem.fromMap).toList();
  }

  Future<double> _paidTotal(String invoiceId) async {
    final db = await AppDatabase.instance.database;
    final rows = await db.rawQuery(
      'SELECT COALESCE(SUM(amount), 0) AS t FROM inv_payments WHERE invoice_id = ? AND deleted_at IS NULL',
      [invoiceId],
    );
    return (rows.first['t'] as num?)?.toDouble() ?? 0;
  }

  Future<void> _logActivity(String companyId, String title, String body, String refTable, String refId) async {
    final now = nowIso();
    await AppDatabase.instance.upsertActivity(Activity(
      id: AppDatabase.newId(),
      companyId: companyId,
      type: ActivityType.moduleEvent,
      moduleId: 'invoicing',
      refTable: refTable,
      refId: refId,
      title: title,
      body: body,
      happenedAt: now,
      createdAt: now,
      updatedAt: now,
    ));
  }
}