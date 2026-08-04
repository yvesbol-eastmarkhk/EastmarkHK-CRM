import '../db/app_database.dart';
import '../models/models.dart';
import 'pipeline_settings.dart';

/// Résultat d'un import CSV ou vCard.
class ImportResult {
  const ImportResult({required this.imported, required this.skipped, this.errors = const []});
  final int imported;
  final int skipped;
  final List<String> errors;
}

/// Import / export CSV et vCard pour clients, contacts et opportunités.
class CrmDataExchange {
  CrmDataExchange._();

  static String _escape(String? v) {
    final s = v ?? '';
    if (s.contains(',') || s.contains('"') || s.contains('\n')) {
      return '"${s.replaceAll('"', '""')}"';
    }
    return s;
  }

  static List<String> _parseCsvLine(String line) {
    final out = <String>[];
    var cur = StringBuffer();
    var inQuotes = false;
    for (var i = 0; i < line.length; i++) {
      final c = line[i];
      if (inQuotes) {
        if (c == '"') {
          if (i + 1 < line.length && line[i + 1] == '"') {
            cur.write('"');
            i++;
          } else {
            inQuotes = false;
          }
        } else {
          cur.write(c);
        }
      } else if (c == '"') {
        inQuotes = true;
      } else if (c == ',') {
        out.add(cur.toString());
        cur = StringBuffer();
      } else {
        cur.write(c);
      }
    }
    out.add(cur.toString());
    return out;
  }

  static Future<String> exportCompaniesCsv() async {
    final companies = await AppDatabase.instance.companies();
    final buf = StringBuffer(
      'id,nom,pays,tva,website,peppol,tags,notes\n',
    );
    for (final c in companies) {
      buf.writeln([
        _escape(c.id),
        _escape(c.name),
        _escape(c.country),
        _escape(c.vatNumber),
        _escape(c.website),
        _escape(c.peppolId),
        _escape(c.tags.join(',')),
        _escape(c.notes),
      ].join(','));
    }
    return buf.toString();
  }

  static Future<String> exportContactsCsv() async {
    final contacts = await AppDatabase.instance.contacts();
    final companies = {for (final c in await AppDatabase.instance.companies()) c.id: c.name};
    final buf = StringBuffer('id,societe_id,societe,nom,prenom,email,telephone,fonction,notes\n');
    for (final c in contacts) {
      buf.writeln([
        _escape(c.id),
        _escape(c.companyId),
        _escape(companies[c.companyId]),
        _escape(c.lastName),
        _escape(c.firstName),
        _escape(c.email),
        _escape(c.phone),
        _escape(c.role),
        _escape(c.notes),
      ].join(','));
    }
    return buf.toString();
  }

  static Future<String> exportOpportunitiesCsv() async {
    await PipelineSettings.instance.ensureLoaded();
    final opps = await AppDatabase.instance.opportunities();
    final companies = {for (final c in await AppDatabase.instance.companies()) c.id: c.name};
    final buf = StringBuffer(
      'id,societe_id,societe,titre,montant,devise,etape,probabilite,cloture_prevue,gagne_perdu,notes\n',
    );
    for (final o in opps) {
      buf.writeln([
        _escape(o.id),
        _escape(o.companyId),
        _escape(companies[o.companyId]),
        _escape(o.title),
        _escape(o.amount?.toString()),
        _escape(o.currency),
        _escape(PipelineSettings.instance.labelFor(o.stage)),
        _escape(o.probability?.toString()),
        _escape(o.expectedClose),
        _escape(o.wonLost),
        _escape(o.notes),
      ].join(','));
    }
    return buf.toString();
  }

  static Future<ImportResult> importCompaniesCsv(String content) async {
    final lines = content.split('\n').where((l) => l.trim().isNotEmpty).toList();
    if (lines.isEmpty) return const ImportResult(imported: 0, skipped: 0);
    var start = 0;
    if (lines.first.toLowerCase().contains('nom')) start = 1;
    var imported = 0;
    var skipped = 0;
    final errors = <String>[];
    // Retrouve un client déjà existant par nom quand la ligne CSV n'a pas
    // d'identifiant — sinon réimporter le même fichier (par erreur, ou depuis
    // un autre appareil) crée un doublon à chaque passage au lieu de mettre
    // à jour la fiche existante (cf. « 3 fois le même client » remonté).
    final existingByName = <String, String>{
      for (final c in await AppDatabase.instance.companies()) c.name.trim().toLowerCase(): c.id,
    };
    for (var i = start; i < lines.length; i++) {
      final cols = _parseCsvLine(lines[i]);
      if (cols.isEmpty) continue;
      final name = cols.length > 1 ? cols[1].trim() : cols[0].trim();
      if (name.isEmpty) {
        skipped++;
        continue;
      }
      try {
        final now = nowIso();
        final explicitId = cols[0].trim();
        final nameKey = name.toLowerCase();
        final id = explicitId.isNotEmpty ? explicitId : (existingByName[nameKey] ?? AppDatabase.newId());
        final existing = await AppDatabase.instance.companyById(id);
        await AppDatabase.instance.upsertCompany(Company(
          id: id,
          name: name,
          country: cols.length > 2 && cols[2].trim().isNotEmpty ? cols[2].trim() : existing?.country,
          vatNumber: cols.length > 3 && cols[3].trim().isNotEmpty ? cols[3].trim() : existing?.vatNumber,
          website: cols.length > 4 && cols[4].trim().isNotEmpty ? cols[4].trim() : existing?.website,
          peppolId: cols.length > 5 && cols[5].trim().isNotEmpty ? cols[5].trim() : existing?.peppolId,
          tags: cols.length > 6 && cols[6].trim().isNotEmpty
              ? cols[6].trim().split(',').map((t) => t.trim()).where((t) => t.isNotEmpty).toList()
              : (existing?.tags ?? const []),
          notes: cols.length > 7 && cols[7].trim().isNotEmpty ? cols[7].trim() : existing?.notes,
          createdAt: existing?.createdAt ?? now,
          updatedAt: now,
        ));
        existingByName[nameKey] = id;
        imported++;
      } catch (e) {
        errors.add('Ligne ${i + 1}: $e');
        skipped++;
      }
    }
    return ImportResult(imported: imported, skipped: skipped, errors: errors);
  }

  static Future<ImportResult> importContactsCsv(String content) async {
    final lines = content.split('\n').where((l) => l.trim().isNotEmpty).toList();
    if (lines.isEmpty) return const ImportResult(imported: 0, skipped: 0);
    var start = 0;
    if (lines.first.toLowerCase().contains('email')) start = 1;
    var imported = 0;
    var skipped = 0;
    final errors = <String>[];
    for (var i = start; i < lines.length; i++) {
      final cols = _parseCsvLine(lines[i]);
      if (cols.length < 4) {
        skipped++;
        continue;
      }
      final companyId = cols.length > 1 ? cols[1].trim() : '';
      if (companyId.isEmpty) {
        skipped++;
        continue;
      }
      try {
        final now = nowIso();
        await AppDatabase.instance.upsertContact(Contact(
          id: cols[0].trim().isNotEmpty ? cols[0].trim() : AppDatabase.newId(),
          companyId: companyId,
          lastName: cols.length > 3 ? cols[3].trim() : '',
          firstName: cols.length > 4 && cols[4].trim().isNotEmpty ? cols[4].trim() : null,
          email: cols.length > 5 && cols[5].trim().isNotEmpty ? cols[5].trim() : null,
          phone: cols.length > 6 && cols[6].trim().isNotEmpty ? cols[6].trim() : null,
          role: cols.length > 7 && cols[7].trim().isNotEmpty ? cols[7].trim() : null,
          notes: cols.length > 8 && cols[8].trim().isNotEmpty ? cols[8].trim() : null,
          createdAt: now,
          updatedAt: now,
        ));
        imported++;
      } catch (e) {
        errors.add('Ligne ${i + 1}: $e');
        skipped++;
      }
    }
    return ImportResult(imported: imported, skipped: skipped, errors: errors);
  }

  static Future<ImportResult> importOpportunitiesCsv(String content) async {
    await PipelineSettings.instance.ensureLoaded();
    final stageByLabel = {
      for (final s in PipelineSettings.instance.stages)
        PipelineSettings.instance.labelFor(s).toLowerCase(): s,
      ...{for (final s in PipelineSettings.instance.stages) s.toLowerCase(): s},
    };
    final lines = content.split('\n').where((l) => l.trim().isNotEmpty).toList();
    if (lines.isEmpty) return const ImportResult(imported: 0, skipped: 0);
    var start = 0;
    if (lines.first.toLowerCase().contains('titre')) start = 1;
    var imported = 0;
    var skipped = 0;
    final errors = <String>[];
    for (var i = start; i < lines.length; i++) {
      final cols = _parseCsvLine(lines[i]);
      if (cols.length < 4) {
        skipped++;
        continue;
      }
      final companyId = cols.length > 1 ? cols[1].trim() : '';
      final title = cols.length > 3 ? cols[3].trim() : '';
      if (companyId.isEmpty || title.isEmpty) {
        skipped++;
        continue;
      }
      try {
        final stageRaw = cols.length > 6 ? cols[6].trim().toLowerCase() : 'lead';
        final stage = stageByLabel[stageRaw] ?? 'lead';
        final now = nowIso();
        await AppDatabase.instance.upsertOpportunity(Opportunity(
          id: cols[0].trim().isNotEmpty ? cols[0].trim() : AppDatabase.newId(),
          companyId: companyId,
          title: title,
          amount: cols.length > 4 && cols[4].trim().isNotEmpty ? double.tryParse(cols[4].trim()) : null,
          currency: cols.length > 5 && cols[5].trim().isNotEmpty ? cols[5].trim() : 'EUR',
          stage: stage,
          probability: cols.length > 7 && cols[7].trim().isNotEmpty ? int.tryParse(cols[7].trim()) : null,
          expectedClose: cols.length > 8 && cols[8].trim().isNotEmpty ? cols[8].trim() : null,
          wonLost: cols.length > 9 && cols[9].trim().isNotEmpty ? cols[9].trim() : null,
          notes: cols.length > 10 && cols[10].trim().isNotEmpty ? cols[10].trim() : null,
          createdAt: now,
          updatedAt: now,
        ));
        imported++;
      } catch (e) {
        errors.add('Ligne ${i + 1}: $e');
        skipped++;
      }
    }
    return ImportResult(imported: imported, skipped: skipped, errors: errors);
  }

  /// Parse un fichier vCard (.vcf) — un ou plusieurs contacts.
  static Future<ImportResult> importVCard(String content, {required String companyId}) async {
    final cards = content.split(RegExp(r'BEGIN:VCARD', caseSensitive: false));
    var imported = 0;
    var skipped = 0;
    final errors = <String>[];
    for (final block in cards) {
      if (!block.contains('END:VCARD')) continue;
      String? fn;
      String? email;
      String? tel;
      String? title;
      for (final line in block.split('\n')) {
        final l = line.trim();
        if (l.startsWith('FN:')) fn = l.substring(3).trim();
        if (l.startsWith('EMAIL')) email = l.split(':').last.trim();
        if (l.startsWith('TEL')) tel = l.split(':').last.trim();
        if (l.startsWith('TITLE:')) title = l.substring(6).trim();
      }
      if (fn == null || fn.isEmpty) {
        skipped++;
        continue;
      }
      final parts = fn.split(' ');
      try {
        final now = nowIso();
        await AppDatabase.instance.upsertContact(Contact(
          id: AppDatabase.newId(),
          companyId: companyId,
          lastName: parts.length > 1 ? parts.sublist(1).join(' ') : fn,
          firstName: parts.length > 1 ? parts.first : null,
          email: email,
          phone: tel,
          role: title,
          createdAt: now,
          updatedAt: now,
        ));
        imported++;
      } catch (e) {
        errors.add('$fn: $e');
        skipped++;
      }
    }
    return ImportResult(imported: imported, skipped: skipped, errors: errors);
  }
}
