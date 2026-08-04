// Régression pour le bug remonté par l'utilisateur : sur iPhone, entrer
// dans l'Agenda sautait directement dans le détail de la 1ère tâche, sans
// moyen d'en sortir ("aucun moyen d'en sortir, aussi il ne me laisse pas
// choisir quelle action choisir"). Le correctif rend l'auto-sélection de la
// 1ère tâche conditionnelle à `!CrmLayout.isPhone(context)` — ce test verrouille
// ce comportement pour les deux tailles d'écran.
import 'dart:io';

import 'package:eastmarkhk_crm/core/db/app_database.dart';
import 'package:eastmarkhk_crm/core/models/models.dart';
import 'package:eastmarkhk_crm/l10n/gen/app_localizations.dart';
import 'package:eastmarkhk_crm/state/crm_workspace_state.dart';
import 'package:eastmarkhk_crm/workspace/today_queue_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/fake_path_provider.dart';

/// [TodayQueuePanel] loads data via real sqflite I/O in `initState`.
/// `pumpAndSettle` can't wait for that inside the fake-async test zone, so we
/// repeatedly step out to the real event loop with [WidgetTester.runAsync]
/// until the loading spinner is gone (or give up after a short timeout).
Future<void> _pumpUntilLoaded(WidgetTester tester) async {
  for (var i = 0; i < 40; i++) {
    if (find.byType(CircularProgressIndicator).evaluate().isEmpty) return;
    await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 50)));
    await tester.pump();
  }
}

Widget _harness({required Size size, required ValueChanged<CrmTask> onSelectTask}) {
  return MediaQuery(
    data: MediaQueryData(size: size),
    child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fr')],
      home: Scaffold(
        body: TodayQueuePanel(
          workspace: CrmWorkspaceState(),
          selectedTaskId: null,
          onSelectTask: onSelectTask,
          onRefresh: () {},
        ),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppDatabase.debugSkipLegacyMigration = true;

  late Directory tempDir;

  setUp(() async {
    tempDir = installFakeApplicationSupportDir('emhk_crm_test_');
    final db = AppDatabase.instance;
    final now = nowIso();
    await db.upsertCompany(Company(id: 'c1', name: 'Acme', createdAt: now, updatedAt: now));
    await db.upsertTask(CrmTask(
      id: 't1',
      companyId: 'c1',
      title: 'Relancer Acme',
      dueDate: DateTime.now().toUtc().toIso8601String(),
      createdAt: now,
      updatedAt: now,
    ));
  });

  tearDown(() async {
    await AppDatabase.instance.resetForTests();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  testWidgets('on phone size, the first task is NOT auto-selected (list stays visible)', (tester) async {
    CrmTask? selected;
    await tester.pumpWidget(_harness(
      size: const Size(390, 844), // iPhone-sized: shortestSide < 600
      onSelectTask: (t) => selected = t,
    ));
    // TodayQueuePanel loads data via real sqflite I/O in initState; pumpAndSettle
    // can't wait for that inside the fake-async test zone, so we step out to the
    // real event loop with runAsync, then pump to rebuild with the loaded data.
    await _pumpUntilLoaded(tester);

    expect(selected, isNull, reason: 'auto-select must be disabled on phone layouts');
    // The task subtitle embeds the title ("Relancer Acme\n<due label>"), not an
    // exact-match Text widget, so we look for the substring instead.
    expect(find.textContaining('Relancer Acme'), findsOneWidget);
  });

  testWidgets('on tablet/desktop size, the first task IS auto-selected', (tester) async {
    CrmTask? selected;
    await tester.pumpWidget(_harness(
      size: const Size(1280, 800), // desktop-sized: shortestSide >= 600
      onSelectTask: (t) => selected = t,
    ));
    await _pumpUntilLoaded(tester);

    expect(selected?.id, 't1');
  });
}
