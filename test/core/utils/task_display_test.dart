// Verrouille le sous-titre liste des tâches : même avec une échéance longue
// (« En retard · N j · date · heure »), la date/heure de création 24h reste
// visible sur sa propre ligne — bug remonté : trop long = ellipsis qui
// mangeait la création.
import 'package:eastmarkhk_crm/core/utils/task_display.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('taskListSubtitle', () {
    test('puts due and createdAt on separate lines so creation is never clipped by due', () {
      const created = '05/08/2026 14:30';
      final due = 'En retard · 12 j · 24/07/2026 · 09:15';
      final subtitle = taskListSubtitle(
        message: 'Relancer le client pour le devis',
        dueLabel: due,
        createdLabel: created,
      );

      final lines = subtitle.split('\n');
      expect(lines.length, 3);
      expect(lines[0], contains('Relancer'));
      expect(lines[1], due);
      expect(lines[2], created);
      // Creation must not share the due line (that was truncating it).
      expect(lines[1].contains(created), isFalse);
    });

    test('works without due date (no-due label alone on meta line)', () {
      final subtitle = taskListSubtitle(
        message: 'Note perso',
        dueLabel: 'Pas d’échéance',
        createdLabel: '05/08/2026 08:00',
      );
      expect(subtitle.split('\n'), [
        'Note perso',
        'Pas d’échéance',
        '05/08/2026 08:00',
      ]);
    });
  });
}
