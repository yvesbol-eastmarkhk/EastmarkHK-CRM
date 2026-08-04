import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Chrome bureau — titres masqués (`TitleBarStyle.hidden`) : il faut
/// laisser la place aux ●●● macOS (et aux boutons caption Windows).
class DesktopChrome {
  DesktopChrome._();

  static bool get isMacDesktop => !kIsWeb && Platform.isMacOS;
  static bool get isWindowsDesktop => !kIsWeb && Platform.isWindows;

  /// Marge gauche sous les feux de circulation macOS (~78 px).
  static double get trafficLightsInset => isMacDesktop ? 78.0 : 0.0;

  /// Largeur du leading AppBar = inset + bouton retour standard (56).
  static double get appBarLeadingWidth => trafficLightsInset + 56.0;

  /// Leading AppBar qui ne chevauche pas les ●●●.
  static Widget? backLeading(BuildContext context) {
    if (!Navigator.of(context).canPop()) return null;
    final inset = trafficLightsInset;
    final button = IconButton(
      icon: const Icon(Icons.arrow_back),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () => Navigator.of(context).maybePop(),
    );
    if (inset <= 0) return button;
    return Padding(
      padding: EdgeInsets.only(left: inset),
      child: button,
    );
  }
}
