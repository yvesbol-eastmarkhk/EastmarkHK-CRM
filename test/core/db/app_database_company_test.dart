// Couvre les points sensibles autour des sociétés : suppression en cascade
// et fusion des doublons (voir dedupeCompaniesByName) — cf. l'incident réel
// "3 fois le même client" retrouvé en base (2 doublons créés par 2 voies
// distinctes le même jour, jamais nettoyés automatiquement).
import 'dart:io';

import 'package:eastmarkhk_crm/core/db/app_database.dart';
import 'package:eastmarkhk_crm/core/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/fake_path_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppDatabase.debugSkipLegacyMigration = true;

  late Directory tempDir;

  setUp(() {
    tempDir = installFakeApplicationSupportDir('emhk_crm_test_');
  });

  tearDown(() async {
    await AppDatabase.instance.resetForTests();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  Company company(String id, String name, {String createdAt = '2026-01-01T00:00:00.000Z'}) =>
      Company(id: id, name: name, createdAt: createdAt, updatedAt: createdAt);

  test('softDeleteCompany tombstones the company and everything linked to it', () async {
    final db = AppDatabase.instance;
    await db.upsertCompany(company('c1', 'Acme'));
    final now = nowIso();
    await db.upsertTask(CrmTask(id: 't1', companyId: 'c1', title: 'Suivi', createdAt: now, updatedAt: now));
    await db.upsertOpportunity(Opportunity(id: 'o1', companyId: 'c1', title: 'Deal', createdAt: now, updatedAt: now));
    await db.upsertContact(Contact(id: 'ct1', companyId: 'c1', firstName: 'Jane', createdAt: now, updatedAt: now));

    await db.softDeleteCompany('c1', flushRemote: false);

    expect(await db.companies(), isEmpty);
    expect((await db.companyById('c1'))?.deletedAt, isNotNull);
    expect(await db.tasks(companyId: 'c1', onlyOpen: false), isEmpty);
    expect(await db.opportunities(companyId: 'c1'), isEmpty);
    expect(await db.contacts(companyId: 'c1'), isEmpty);
  });

  group('dedupeCompaniesByName', () {
    test('merges an exact-name duplicate, keeping the oldest and reattaching its data', () async {
      final db = AppDatabase.instance;
      // c1 est la fiche « originale » (plus ancienne, avec l'historique réel).
      await db.upsertCompany(company('c1', 'Coopama Cooperativa Agraria', createdAt: '2026-07-30T09:27:32.000Z'));
      final now = nowIso();
      await db.upsertTask(CrmTask(id: 't1', companyId: 'c1', title: 'Relance', createdAt: now, updatedAt: now));

      // c2 est un doublon créé plus tard (nom identique à la casse/espaces
      // près) — comme celui retrouvé en production.
      await db.upsertCompany(company('c2', '  coopama cooperativa agraria  ', createdAt: '2026-08-02T00:38:00.000Z'));
      await db.upsertOpportunity(Opportunity(id: 'o1', companyId: 'c2', title: 'Deal doublon', createdAt: now, updatedAt: now));

      final removed = await db.dedupeCompaniesByName();

      expect(removed, ['c2']);
      final active = await db.companies();
      expect(active.map((c) => c.id), ['c1']);
      expect((await db.companyById('c2'))?.deletedAt, isNotNull);

      // L'opportunité du doublon ne doit pas disparaître : elle est
      // réattribuée à la fiche gardée, pas perdue.
      expect(await db.opportunities(companyId: 'c2'), isEmpty);
      final reattached = await db.opportunities(companyId: 'c1');
      expect(reattached.map((o) => o.id), contains('o1'));
    });

    test('does nothing when no two active companies share a name', () async {
      final db = AppDatabase.instance;
      await db.upsertCompany(company('c1', 'Acme'));
      await db.upsertCompany(company('c2', 'Other Co'));

      final removed = await db.dedupeCompaniesByName();

      expect(removed, isEmpty);
      expect((await db.companies()).length, 2);
    });

    test('ignores a duplicate name that is already soft-deleted', () async {
      final db = AppDatabase.instance;
      await db.upsertCompany(company('c1', 'Acme'));
      await db.upsertCompany(company('c2', 'Acme'));
      await db.softDeleteCompany('c2', flushRemote: false);

      final removed = await db.dedupeCompaniesByName();

      expect(removed, isEmpty);
      expect((await db.companies()).map((c) => c.id), ['c1']);
    });
  });
}
