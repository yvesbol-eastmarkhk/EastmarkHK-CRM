import 'package:flutter/material.dart';

import '../../../core/widgets/eastmark_logo.dart';
import '../../../platform/desktop_chrome.dart';

/// En-tête style EastmarkHK e-Invoicing : titre à gauche + wordmark à droite.
class EiEastmarkAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EiEastmarkAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    final compact = MediaQuery.sizeOf(context).width < 700;
    final hasActions = actions?.isNotEmpty ?? false;
    final trafficPad = DesktopChrome.trafficLightsInset;
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8 + trafficPad),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (canPop)
                    Padding(
                      padding: const EdgeInsets.only(right: 4, bottom: 4),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: compact ? 18 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 4,
              right: compact ? (hasActions ? 12 : 4) : 0,
            ),
            child: IgnorePointer(
              child: EastmarkWordmark(height: compact ? 28 : 36),
            ),
          ),
          if (!compact)
            const Expanded(child: IgnorePointer(child: SizedBox.shrink())),
        ],
      ),
      actions: actions,
    );
  }
}
