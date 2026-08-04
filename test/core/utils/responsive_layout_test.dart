// Verrouille les seuils responsive utilisés partout dans l'app (dashboard,
// pipeline, nav mobile, agenda...) pour éviter une régression silencieuse
// si quelqu'un touche aux breakpoints sans se rendre compte de l'impact
// sur les écrans téléphone. C'est la logique la plus simple à tester sans
// device réel — un filet de sécurité minimal pour le "mobile non testé en
// conditions réelles".
import 'package:eastmarkhk_crm/core/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _sizedApp(Size size, Widget Function(BuildContext) builder) {
  return MediaQuery(
    data: MediaQueryData(size: size),
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: Builder(builder: builder),
    ),
  );
}

void main() {
  group('CrmLayout.isPhone', () {
    testWidgets('iPhone-sized width is a phone', (tester) async {
      bool? isPhone;
      await tester.pumpWidget(_sizedApp(const Size(390, 844), (context) {
        isPhone = CrmLayout.isPhone(context);
        return const SizedBox();
      }));
      expect(isPhone, isTrue);
    });

    testWidgets('iPad-sized width is not a phone', (tester) async {
      bool? isPhone;
      await tester.pumpWidget(_sizedApp(const Size(834, 1194), (context) {
        isPhone = CrmLayout.isPhone(context);
        return const SizedBox();
      }));
      expect(isPhone, isFalse);
    });

    testWidgets('exactly at the threshold is not a phone (< not <=)', (tester) async {
      bool? isPhone;
      await tester.pumpWidget(
        _sizedApp(const Size(CrmLayout.phoneShortestSide, 1000), (context) {
          isPhone = CrmLayout.isPhone(context);
          return const SizedBox();
        }),
      );
      expect(isPhone, isFalse);
    });

    testWidgets('landscape phone: shortest side still decides, not width', (tester) async {
      bool? isPhone;
      // iPhone in landscape: width 844 > desktopMinWidth, but shortest side
      // (390) is still phone-sized — must not be misdetected as desktop.
      await tester.pumpWidget(_sizedApp(const Size(844, 390), (context) {
        isPhone = CrmLayout.isPhone(context);
        return const SizedBox();
      }));
      expect(isPhone, isTrue);
    });
  });

  group('CrmLayout.isDesktopSplit / isCompactTablet', () {
    testWidgets('narrow iPad portrait is compact tablet, not desktop split', (tester) async {
      bool? desktop, tablet;
      await tester.pumpWidget(_sizedApp(const Size(834, 1194), (context) {
        desktop = CrmLayout.isDesktopSplit(context);
        tablet = CrmLayout.isCompactTablet(context);
        return const SizedBox();
      }));
      expect(desktop, isFalse);
      expect(tablet, isTrue);
    });

    testWidgets('wide desktop window is desktop split, not compact tablet', (tester) async {
      bool? desktop, tablet;
      await tester.pumpWidget(_sizedApp(const Size(1440, 900), (context) {
        desktop = CrmLayout.isDesktopSplit(context);
        tablet = CrmLayout.isCompactTablet(context);
        return const SizedBox();
      }));
      expect(desktop, isTrue);
      expect(tablet, isFalse);
    });

    testWidgets('phone is neither desktop split nor compact tablet', (tester) async {
      bool? desktop, tablet;
      await tester.pumpWidget(_sizedApp(const Size(390, 844), (context) {
        desktop = CrmLayout.isDesktopSplit(context);
        tablet = CrmLayout.isCompactTablet(context);
        return const SizedBox();
      }));
      expect(desktop, isFalse);
      expect(tablet, isFalse);
    });
  });

  group('CrmLayout.stageTabColumns (pipeline mobile grid)', () {
    test('0 stages -> 0 columns', () {
      expect(CrmLayout.stageTabColumns(0), 0);
    });

    test('1 to 3 stages fit on a single row', () {
      expect(CrmLayout.stageTabColumns(1), 1);
      expect(CrmLayout.stageTabColumns(2), 2);
      expect(CrmLayout.stageTabColumns(3), 3);
    });

    test('4+ stages wrap onto exactly 2 rows', () {
      // columns * 2 rows must always be >= stageCount, and columns must be
      // the smallest value that achieves this (no wasted 3rd row).
      for (final count in [4, 5, 6, 7, 8, 9]) {
        final columns = CrmLayout.stageTabColumns(count);
        final rows = (count / columns).ceil();
        expect(rows, lessThanOrEqualTo(2), reason: 'stageCount=$count should fit in <=2 rows');
        expect(columns * 2, greaterThanOrEqualTo(count), reason: 'stageCount=$count');
      }
      // Concrete regression values matching the default pipeline stages.
      expect(CrmLayout.stageTabColumns(4), 2);
      expect(CrmLayout.stageTabColumns(6), 3);
      expect(CrmLayout.stageTabColumns(7), 4);
    });
  });
}
