// Couvre le bug retrouvé en production : réimporter un CSV clients sans
// colonne d'identifiant créait un nouveau doublon à chaque passage (voir
// l'incident "3 fois le même client" — l'un des doublons venait très
// probablement d'un import CSV répété).
import 'dart:io';

import 'package:eastmarkhk_crm/core/db/app_database.dart';
import 'package:eastmarkhk_crm/core/services/crm_data_exchange.dart';
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

  const csvNoId = 'id,nom,pays,tva,site,peppol,tags,notes\n,Acme Corp,FR,,,,,';

  test('importing the same id-less CSV twice does not duplicate the client', () async {
    final first = await CrmDataExchange.importCompaniesCsv(csvNoId);
    expect(first.imported, 1);

    final second = await CrmDataExchange.importCompaniesCsv(csvNoId);
    expect(second.imported, 1);

    final companies = await AppDatabase.instance.companies();
    expect(companies.length, 1);
    expect(companies.single.name, 'Acme Corp');
  });

  test('re-import updates the matched client instead of blanking unspecified fields', () async {
    await CrmDataExchange.importCompaniesCsv(csvNoId);
    var acme = (await AppDatabase.instance.companies()).single;
    expect(acme.country, 'FR');

    // Deuxième import : même nom, colonne pays vide cette fois — ne doit pas
    // effacer la valeur déjà connue (FR).
    const csvBlankCountry = 'id,nom,pays,tva,site,peppol,tags,notes\n,Acme Corp,,,,,,';
    await CrmDataExchange.importCompaniesCsv(csvBlankCountry);

    final companies = await AppDatabase.instance.companies();
    expect(companies.length, 1);
    acme = companies.single;
    expect(acme.country, 'FR');
  });

  test('an explicit id column is still honored as-is', () async {
    const csvWithId = 'id,nom,pays,tva,site,peppol,tags,notes\nfixed-id,Acme Corp,FR,,,,,';
    await CrmDataExchange.importCompaniesCsv(csvWithId);
    await CrmDataExchange.importCompaniesCsv(csvWithId);

    final companies = await AppDatabase.instance.companies();
    expect(companies.length, 1);
    expect(companies.single.id, 'fixed-id');
  });
}
