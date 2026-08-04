import 'package:flutter/material.dart';

import '../models/models.dart';

/// Texte complet de la tâche — notes si présentes, sinon titre.
String taskMessage(CrmTask task) {
  final notes = task.notes?.trim();
  if (notes != null && notes.isNotEmpty) return notes;
  return task.title;
}

/// Version tronquée pour la colonne liste.
String truncateTaskMessage(String message, {int max = 72}) {
  final trimmed = message.trim();
  if (trimmed.length <= max) return trimmed;
  return '${trimmed.substring(0, max).trim()}…';
}

/// Sous-titre liste des tâches — 3 lignes séparées pour que la date de
/// création (24h) ne soit jamais mangée par l’ellipsis de l’échéance.
///
/// 1. message tronqué
/// 2. échéance (ou « Pas d’échéance »)
/// 3. date/heure de création
String taskListSubtitle({
  required String message,
  required String dueLabel,
  required String createdLabel,
}) {
  return '${truncateTaskMessage(message)}\n$dueLabel\n$createdLabel';
}

/// Heure par défaut si l'utilisateur ne choisit pas d'heure :
/// - même jour → +1 h après [referenceNow]
/// - autre jour → 09:00
TimeOfDay defaultDueTimeForDate(DateTime date, {DateTime? referenceNow}) {
  final now = referenceNow ?? DateTime.now();
  final todayOnly = DateTime(now.year, now.month, now.day);
  final dayOnly = DateTime(date.year, date.month, date.day);
  if (dayOnly == todayOnly) {
    final later = now.add(const Duration(hours: 1));
    return TimeOfDay(hour: later.hour, minute: later.minute);
  }
  return const TimeOfDay(hour: 9, minute: 0);
}

DateTime? combineDueDateTime(DateTime? date, TimeOfDay? explicitTime, {DateTime? referenceNow}) {
  if (date == null) return null;
  final t = explicitTime ?? defaultDueTimeForDate(date, referenceNow: referenceNow);
  return DateTime(date.year, date.month, date.day, t.hour, t.minute);
}

/// Titre court en base — première ligne, max 80 caractères.
String taskTitleFromMessage(String message) {
  final firstLine = message.split(RegExp(r'\r?\n')).first.trim();
  if (firstLine.length <= 80) return firstLine;
  return '${firstLine.substring(0, 77)}…';
}
