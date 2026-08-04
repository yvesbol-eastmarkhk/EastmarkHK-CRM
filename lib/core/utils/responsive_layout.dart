import 'package:flutter/material.dart';

/// Breakpoints CRM — téléphone vs tablette/iPad vs desktop.
///
/// - **phone** : `shortestSide < 600` (iPhone, Android phone)
/// - **tablet** : `shortestSide >= 600` et largeur < 900 (iPad portrait)
/// - **desktop** : largeur ≥ 900 (iPad paysage / Mac / Windows)
abstract final class CrmLayout {
  static const phoneShortestSide = 600.0;
  static const desktopMinWidth = 900.0;

  static Size sizeOf(BuildContext context) => MediaQuery.sizeOf(context);

  static bool isPhone(BuildContext context) {
    final s = sizeOf(context);
    return s.shortestSide < phoneShortestSide;
  }

  static bool isDesktopSplit(BuildContext context) =>
      sizeOf(context).width >= desktopMinWidth;

  /// Tablette / iPad (ou desktop étroit) : pas téléphone, pas split desktop.
  static bool isCompactTablet(BuildContext context) =>
      !isPhone(context) && !isDesktopSplit(context);

  /// Nombre de colonnes pour une grille d'onglets d'étapes sur téléphone
  /// (ex. onglets du pipeline) : tient sur 1 ligne si peu d'étapes (≤3),
  /// sinon 2 lignes égales quel que soit le nombre d'étapes configurées.
  static int stageTabColumns(int stageCount) {
    if (stageCount <= 0) return 0;
    return stageCount <= 3 ? stageCount : (stageCount / 2).ceil();
  }
}
