import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Boutons `<` `>` pour agrandir / réduire une colonne du workspace.
class ColumnWidthControls extends StatelessWidget {
  const ColumnWidthControls({
    super.key,
    required this.onWider,
    required this.onNarrower,
    required this.canWider,
    required this.canNarrower,
    this.compact = false,
  });

  final VoidCallback? onWider;
  final VoidCallback? onNarrower;
  final bool canWider;
  final bool canNarrower;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).crmBorder;
    final disabled = Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.35);
    final iconSize = compact ? 18.0 : 20.0;
    final minSize = compact ? 26.0 : 32.0;
    final padding = compact ? 2.0 : 6.0;

    Widget button({
      required IconData icon,
      required bool enabled,
      required VoidCallback? onPressed,
      required String tooltip,
    }) {
      return IconButton(
        tooltip: tooltip,
        icon: Icon(icon, size: iconSize, color: enabled ? null : disabled),
        onPressed: enabled ? onPressed : null,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.all(padding),
        constraints: BoxConstraints(minWidth: minSize, minHeight: minSize),
      );
    }

    final widen = button(
      icon: Icons.chevron_left,
      enabled: canWider,
      onPressed: onWider,
      tooltip: 'Élargir',
    );
    final narrow = button(
      icon: Icons.chevron_right,
      enabled: canNarrower,
      onPressed: onNarrower,
      tooltip: 'Réduire',
    );

    return Tooltip(
      message: 'Largeur de cette colonne',
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(compact ? 6 : 8),
          color: Theme.of(context).crmSidebar,
        ),
        child: compact
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [widen, narrow],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widen,
                  Container(width: 1, height: 22, color: border),
                  narrow,
                ],
              ),
      ),
    );
  }
}
