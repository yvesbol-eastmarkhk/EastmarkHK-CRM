// Due labels must follow UI language — « dans 7 j » is French-only.
import 'package:eastmarkhk_crm/core/utils/formatters.dart';
import 'package:eastmarkhk_crm/l10n/gen/app_localizations_en.dart';
import 'package:eastmarkhk_crm/l10n/gen/app_localizations_fr.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('fr');
    await initializeDateFormatting('en');
  });

  group('formatDueLabel', () {
    test('French uses « dans N j »', () {
      final due = DateTime.now().add(const Duration(days: 7));
      final iso = DateTime(due.year, due.month, due.day).toIso8601String();
      final label = formatDueLabel(iso, AppLocalizationsFr(), locale: 'fr');
      expect(label, contains('dans 7 j'));
      expect(label, isNot(contains('in 7 d')));
    });

    test('English uses « in N d », not French « dans »', () {
      final due = DateTime.now().add(const Duration(days: 7));
      final iso = DateTime(due.year, due.month, due.day).toIso8601String();
      final label = formatDueLabel(iso, AppLocalizationsEn(), locale: 'en');
      expect(label, contains('in 7 d'));
      expect(label, isNot(contains('dans')));
    });

    test('today / tomorrow / overdue follow locale', () {
      final today = DateTime.now();
      final todayIso =
          DateTime(today.year, today.month, today.day).toIso8601String();
      final tomorrowIso = DateTime(today.year, today.month, today.day)
          .add(const Duration(days: 1))
          .toIso8601String();
      final overdueIso = DateTime(today.year, today.month, today.day)
          .subtract(const Duration(days: 3))
          .toIso8601String();

      expect(
        formatDueLabel(todayIso, AppLocalizationsEn(), locale: 'en'),
        startsWith('Today'),
      );
      expect(
        formatDueLabel(tomorrowIso, AppLocalizationsEn(), locale: 'en'),
        startsWith('Tomorrow'),
      );
      expect(
        formatDueLabel(overdueIso, AppLocalizationsEn(), locale: 'en'),
        contains('Overdue'),
      );

      expect(
        formatDueLabel(todayIso, AppLocalizationsFr(), locale: 'fr'),
        startsWith('Aujourd'),
      );
      expect(
        formatDueLabel(tomorrowIso, AppLocalizationsFr(), locale: 'fr'),
        startsWith('Demain'),
      );
      expect(
        formatDueLabel(overdueIso, AppLocalizationsFr(), locale: 'fr'),
        contains('En retard'),
      );
    });
  });
}
