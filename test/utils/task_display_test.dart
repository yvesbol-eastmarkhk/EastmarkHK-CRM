import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:eastmarkhk_crm/core/models/models.dart';
import 'package:eastmarkhk_crm/core/utils/task_display.dart';

CrmTask _task({String title = 'Relancer', String? notes}) => CrmTask(
      id: 't1',
      title: title,
      notes: notes,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
    );

void main() {
  group('taskMessage', () {
    test('uses notes when present and non-empty', () {
      final t = _task(title: 'Relancer', notes: 'Rappeler pour le devis #123');
      expect(taskMessage(t), 'Rappeler pour le devis #123');
    });

    test('trims notes before checking emptiness', () {
      final t = _task(title: 'Relancer', notes: '   ');
      // Whitespace-only notes must fall back to the title, not show a blank
      // relance in the UI (this was the exact bug reported by the user: a
      // task appeared everywhere with no useful text).
      expect(taskMessage(t), 'Relancer');
    });

    test('falls back to title when notes is null', () {
      final t = _task(title: 'Relancer le 31 août', notes: null);
      expect(taskMessage(t), 'Relancer le 31 août');
    });

    test('falls back to title when notes is an empty string', () {
      final t = _task(title: 'Relancer', notes: '');
      expect(taskMessage(t), 'Relancer');
    });
  });

  group('truncateTaskMessage', () {
    test('returns the message unchanged when short enough', () {
      expect(truncateTaskMessage('Rappeler client', max: 72), 'Rappeler client');
    });

    test('truncates and appends an ellipsis when too long', () {
      final long = 'A' * 100;
      final result = truncateTaskMessage(long, max: 72);
      expect(result.length, 73); // 72 chars + the ellipsis character
      expect(result.endsWith('…'), isTrue);
    });

    test('trims surrounding whitespace before measuring length', () {
      expect(truncateTaskMessage('   short   ', max: 72), 'short');
    });
  });

  group('taskTitleFromMessage', () {
    test('keeps only the first line', () {
      expect(
        taskTitleFromMessage('Ligne 1\nLigne 2\nLigne 3'),
        'Ligne 1',
      );
    });

    test('handles CRLF line endings', () {
      expect(
        taskTitleFromMessage('Ligne 1\r\nLigne 2'),
        'Ligne 1',
      );
    });

    test('truncates a very long single line to 80 chars', () {
      final line = 'B' * 120;
      final result = taskTitleFromMessage(line);
      expect(result.length, 78); // 77 chars + ellipsis
      expect(result.endsWith('…'), isTrue);
    });
  });

  group('defaultDueTimeForDate', () {
    test('same day → now + 1 hour', () {
      final now = DateTime(2026, 8, 4, 10, 30);
      final result = defaultDueTimeForDate(DateTime(2026, 8, 4), referenceNow: now);
      expect(result, const TimeOfDay(hour: 11, minute: 30));
    });

    test('a different day → defaults to 09:00', () {
      final now = DateTime(2026, 8, 4, 10, 30);
      final result = defaultDueTimeForDate(DateTime(2026, 8, 5), referenceNow: now);
      expect(result, const TimeOfDay(hour: 9, minute: 0));
    });
  });

  group('combineDueDateTime', () {
    test('returns null when date is null', () {
      expect(combineDueDateTime(null, null), isNull);
    });

    test('uses the explicit time when provided', () {
      final result = combineDueDateTime(
        DateTime(2026, 8, 10),
        const TimeOfDay(hour: 14, minute: 15),
      );
      expect(result, DateTime(2026, 8, 10, 14, 15));
    });

    test('falls back to defaultDueTimeForDate when time is omitted', () {
      final now = DateTime(2026, 8, 4, 10, 0);
      final result = combineDueDateTime(
        DateTime(2026, 8, 5),
        null,
        referenceNow: now,
      );
      expect(result, DateTime(2026, 8, 5, 9, 0));
    });
  });
}
