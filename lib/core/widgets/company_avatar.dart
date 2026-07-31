import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Avatar coloré stable : la couleur dépend du nom (hash), donc identique
/// à chaque lancement — repère visuel fort dans les listes.
class CompanyAvatar extends StatelessWidget {
  const CompanyAvatar({super.key, required this.name, this.radius = 20});

  final String name;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.avatarColor(name);
    final initials = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .take(2)
        .map((w) => w[0].toUpperCase())
        .join();
    return CircleAvatar(
      radius: radius,
      backgroundColor: color.withValues(alpha: 0.18),
      child: Text(
        initials.isEmpty ? '?' : initials,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: radius * 0.72,
        ),
      ),
    );
  }
}
