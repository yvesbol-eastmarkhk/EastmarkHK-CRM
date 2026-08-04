import 'package:flutter/material.dart';

/// Carte section — bandeau supérieur coloré bien marqué + titre.
class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.children,
    this.accent = const Color(0xFF2BA89A),
    this.icon,
    this.trailing,
    this.margin = const EdgeInsets.only(bottom: 16),
    this.platformViewSafe = false,
  });

  final String title;
  final List<Widget> children;
  final Color accent;
  final IconData? icon;
  final Widget? trailing;
  final EdgeInsetsGeometry margin;

  /// À activer quand la carte contient une platform view (WebView Jodit).
  /// Sur macOS, le contour d'un `Card` outlined est peint **au-dessus** de
  /// l'enfant, ce qui rend la platform view inerte (clics et scroll perdus,
  /// flutter/flutter#181257). Cette variante ne peint que des fonds.
  final bool platformViewSafe;

  @override
  Widget build(BuildContext context) {
    final soft = Color.lerp(accent, Colors.white, 0.82)!;
    final border = Color.lerp(accent, const Color(0xFF9AABBA), 0.45)!;
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _bandAndBody(context, soft, accent),
    );
    if (platformViewSafe) {
      return Container(
        margin: margin,
        padding: const EdgeInsets.all(1.25),
        color: border,
        child: ColoredBox(color: Colors.white, child: content),
      );
    }
    return Card(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: border, width: 1.25),
      ),
      child: content,
    );
  }

  List<Widget> _bandAndBody(BuildContext context, Color soft, Color accent) {
    return [
          // Bandeau supérieur plein — plus large et plus saturé.
          Container(height: 6, color: accent),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [soft, Colors.white],
              ),
              border: Border(
                bottom: BorderSide(
                  color: accent.withValues(alpha: 0.28),
                  width: 1.5,
                ),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: 24,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 10),
                if (icon != null) ...[
                  Icon(icon, size: 20, color: accent),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: accent,
                        ),
                  ),
                ),
                ?trailing,
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
    ];
  }
}
