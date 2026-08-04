import 'package:flutter/material.dart';

import '../platform/desktop_chrome.dart';

/// Page secondaire (Réglages, Modules…) — AppBar simple + contenu scrollable.
class CrmOverlayPage extends StatelessWidget {
  const CrmOverlayPage({
    super.key,
    required this.title,
    this.subtitle,
    this.actions = const [],
    this.toolbar,
    required this.child,
  });

  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final Widget? toolbar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final subtitleText = subtitle?.trim();
    final hasSubtitle =
        subtitleText != null && subtitleText.isNotEmpty;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: DesktopChrome.appBarLeadingWidth,
        leading: DesktopChrome.backLeading(context),
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              if (hasSubtitle) ...[
                TextSpan(
                  text: '  ·  ',
                  style: TextStyle(color: scheme.onSurfaceVariant),
                ),
                TextSpan(
                  text: subtitleText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
              ],
            ],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        actions: actions,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ?toolbar,
          Expanded(child: child),
        ],
      ),
    );
  }
}
