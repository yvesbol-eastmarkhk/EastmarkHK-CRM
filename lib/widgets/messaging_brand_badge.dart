import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/data/messaging_platforms.dart';

/// Badge messagerie — logo SVG local (Simple Icons) avec repli icône.
class MessagingBrandBadge extends StatelessWidget {
  const MessagingBrandBadge({
    super.key,
    required this.platform,
    this.size = 32,
  });

  final MessagingPlatformInfo platform;
  final double size;

  @override
  Widget build(BuildContext context) {
    final asset = platform.logoAsset;
    final iconSize = size * 0.58;

    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: asset == null
              ? platform.color
              : Colors.white,
          shape: BoxShape.circle,
          border: asset == null
              ? null
              : Border.all(
                  color: platform.color.withValues(alpha: 0.35),
                ),
          boxShadow: asset == null
              ? null
              : [
                  BoxShadow(
                    color: platform.color.withValues(alpha: 0.18),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
        ),
        child: Center(
          child: asset == null
              ? Icon(platform.icon, size: size * 0.55, color: Colors.white)
              : SvgPicture.asset(
                  asset,
                  width: iconSize,
                  height: iconSize,
                  fit: BoxFit.contain,
                  placeholderBuilder: (_) => Icon(
                    platform.icon,
                    size: size * 0.45,
                    color: platform.color.withValues(alpha: 0.5),
                  ),
                ),
        ),
      ),
    );
  }
}
