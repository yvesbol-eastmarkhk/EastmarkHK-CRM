import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'crm_tokens.dart';

/// Design system — Attio × Linear : neutre, typographie nette, chrome minimal.
/// Les écrans utilisent [CrmPage] et les tokens, pas de styles locaux ad hoc.
class AppTheme {
  static const seed = CrmTokens.accent;

  // Rétrocompatibilité — les écrans existants importent encore AppTheme.*
  static const avatarPalette = CrmTokens.avatarPalette;
  static Color avatarColor(String key) => CrmTokens.avatarColor(key);
  static const overdueColor = CrmTokens.overdue;
  static const dueSoonColor = CrmTokens.dueSoon;
  static const onTrackColor = CrmTokens.onTrack;
  static const stageColors = CrmTokens.stageColors;
  static Color dueDateColor(String? iso, {bool done = false, required Color neutral}) =>
      CrmTokens.dueDateColor(iso, done: done, neutral: neutral);

  static const taskTodoBg = CrmTokens.taskTodoBg;
  static const taskDoneBg = CrmTokens.taskDoneBg;
  static const eastmarkGreen = CrmTokens.eastmarkGreen;

  static ThemeData light() => _base(Brightness.light);
  static ThemeData dark() => _base(Brightness.dark);

  static ThemeData _base(Brightness b) {
    final isLight = b == Brightness.light;
    final scheme = ColorScheme(
      brightness: b,
      primary: CrmTokens.accent,
      onPrimary: Colors.white,
      primaryContainer: isLight ? CrmTokens.accentMuted : const Color(0xFF1E3A5F),
      onPrimaryContainer: isLight ? CrmTokens.accent : Colors.white,
      secondary: isLight ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
      onSecondary: Colors.white,
      error: CrmTokens.overdue,
      onError: Colors.white,
      surface: isLight ? CrmTokens.surfaceLight : CrmTokens.surfaceDark,
      onSurface: isLight ? CrmTokens.textPrimaryLight : CrmTokens.textPrimaryDark,
      onSurfaceVariant:
          isLight ? CrmTokens.textSecondaryLight : CrmTokens.textSecondaryDark,
      outline: isLight ? CrmTokens.borderLight : CrmTokens.borderDark,
      outlineVariant: isLight
          ? CrmTokens.borderLight.withValues(alpha: 0.7)
          : CrmTokens.borderDark.withValues(alpha: 0.7),
    );

    final baseText = GoogleFonts.interTextTheme(
      ThemeData(brightness: b).textTheme,
    );

    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      visualDensity: VisualDensity.compact,
      scaffoldBackgroundColor:
          isLight ? CrmTokens.surfaceMutedLight : CrmTokens.surfaceDark,
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: baseText.copyWith(
        displaySmall: baseText.displaySmall?.copyWith(
          fontSize: CrmTokens.displaySize,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.6,
          color: scheme.onSurface,
        ),
        titleMedium: baseText.titleMedium?.copyWith(
          fontSize: CrmTokens.titleSize,
          fontWeight: FontWeight.w500,
          color: scheme.onSurface,
        ),
        bodyMedium: baseText.bodyMedium?.copyWith(
          fontSize: CrmTokens.bodySize,
          color: scheme.onSurface,
        ),
        bodySmall: baseText.bodySmall?.copyWith(
          fontSize: CrmTokens.captionSize,
          color: scheme.onSurfaceVariant,
        ),
        labelSmall: baseText.labelSmall?.copyWith(
          fontSize: CrmTokens.captionSize,
          fontWeight: FontWeight.w600,
          letterSpacing: CrmTokens.labelTracking,
          color: scheme.onSurfaceVariant,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outline.withValues(alpha: 0.6),
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isLight ? CrmTokens.surfaceLight : CrmTokens.surfaceMutedDark,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        hintStyle: TextStyle(
          fontSize: CrmTokens.bodySize,
          color: isLight ? CrmTokens.textTertiaryLight : CrmTokens.textTertiaryDark,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
          borderSide: BorderSide(color: scheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
          borderSide: BorderSide(color: scheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surface,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CrmTokens.radiusLg),
          side: BorderSide(color: scheme.outline),
        ),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CrmTokens.radiusLg),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          textStyle: const TextStyle(fontSize: CrmTokens.bodySize, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CrmTokens.radiusMd),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          textStyle: const TextStyle(fontSize: CrmTokens.bodySize, fontWeight: FontWeight.w500),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          visualDensity: VisualDensity.compact,
          iconSize: 18,
        ),
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: TextStyle(fontSize: CrmTokens.captionSize, color: scheme.onInverseSurface),
        decoration: BoxDecoration(
          color: isLight ? const Color(0xFF18181B) : const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(CrmTokens.radiusSm),
        ),
      ),
    );
  }
}

/// Couleurs de surface pour le shell (sidebar, topbar).
extension CrmThemeExtension on ThemeData {
  Color get crmSidebar =>
      brightness == Brightness.light ? CrmTokens.surfaceLight : CrmTokens.surfaceMutedDark;
  Color get crmBorder =>
      brightness == Brightness.light ? CrmTokens.borderLight : CrmTokens.borderDark;
  Color get crmHover =>
      brightness == Brightness.light
          ? const Color(0xFFF3F4F6)
          : const Color(0xFF27272A);
}
