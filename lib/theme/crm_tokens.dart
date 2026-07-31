import 'package:flutter/material.dart';

/// Tokens de design — direction Attio × Linear : neutre, dense, une accent.
/// « Le CRM qui vous fait gagner du temps dès le premier jour. »
abstract final class CrmTokens {
  // ── Couleurs ──────────────────────────────────────────────────────────
  static const accent = Color(0xFF2563EB);
  static const accentMuted = Color(0xFFEFF4FF);

  static const surfaceLight = Color(0xFFFFFFFF);
  static const surfaceMutedLight = Color(0xFFF9FAFB);
  static const borderLight = Color(0xFFE5E7EB);
  static const textPrimaryLight = Color(0xFF111827);
  static const textSecondaryLight = Color(0xFF6B7280);
  static const textTertiaryLight = Color(0xFF9CA3AF);

  static const surfaceDark = Color(0xFF0C0C0D);
  static const surfaceMutedDark = Color(0xFF161618);
  static const borderDark = Color(0xFF27272A);
  static const textPrimaryDark = Color(0xFFFAFAFA);
  static const textSecondaryDark = Color(0xFFA1A1AA);
  static const textTertiaryDark = Color(0xFF71717A);

  // Sémantique (échéances, pipeline) — discret, pas criard
  static const overdue = Color(0xFFDC2626);
  static const dueSoon = Color(0xFFD97706);
  static const onTrack = Color(0xFF059669);

  /// Tâches — fonds doux (liste « Aujourd'hui » / Tâches).
  static const eastmarkGreen = Color(0xFF059669);
  static const taskTodoBg = Color(0xFFFFF0EB);
  static const taskTodoBgHover = Color(0xFFFFE4DC);
  static const taskDoneBg = Color(0xFFE8F8F0);
  static const taskDoneBgHover = Color(0xFFD4F0E3);
  static const taskSelectedBg = Color(0xFFEFF4FF);

  static const stageColors = {
    'lead': Color(0xFF3B82F6),
    'contacted': Color(0xFF06B6D4),
    'quoted': Color(0xFFF59E0B),
    'negotiation': Color(0xFF8B5CF6),
    'won': Color(0xFF10B981),
    'lost': Color(0xFFEF4444),
  };

  static const avatarPalette = [
    Color(0xFF6366F1),
    Color(0xFF14B8A6),
    Color(0xFFF97316),
    Color(0xFFEC4899),
    Color(0xFF3B82F6),
    Color(0xFF84CC16),
    Color(0xFFEF4444),
    Color(0xFF06B6D4),
  ];

  static Color avatarColor(String key) =>
      avatarPalette[key.codeUnits.fold<int>(0, (a, b) => a + b) % avatarPalette.length];

  static Color dueDateColor(String? iso, {bool done = false, required Color neutral}) {
    if (done || iso == null) return neutral;
    final d = DateTime.tryParse(iso);
    if (d == null) return neutral;
    final today = DateTime.now();
    final dayOnly = DateTime(d.year, d.month, d.day);
    final todayOnly = DateTime(today.year, today.month, today.day);
    final diff = dayOnly.difference(todayOnly).inDays;
    if (diff < 0) return overdue;
    if (diff <= 1) return dueSoon;
    return onTrack;
  }

  // ── Espacement ──────────────────────────────────────────────────────────
  static const sidebarWidth = 220.0;
  static const sidebarCompactWidth = 56.0;
  static const pagePadding = 24.0;
  static const rowHeight = 40.0;
  static const radiusSm = 6.0;
  static const radiusMd = 8.0;
  static const radiusLg = 12.0;

  // ── Typographie (échelle Linear) ────────────────────────────────────────
  static const displaySize = 28.0;
  static const titleSize = 15.0;
  static const bodySize = 13.0;
  static const captionSize = 11.0;
  static const labelTracking = 0.5;
}
