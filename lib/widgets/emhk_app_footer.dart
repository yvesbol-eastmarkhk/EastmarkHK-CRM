import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/crm_tokens.dart';

/// Pied de page discret — Copyright + lien EastmarkHK (toutes les pages).
class EmhkAppFooter extends StatelessWidget {
  const EmhkAppFooter({super.key});

  static const _site = 'https://eastmarkhk.com';

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final bg = dark ? const Color(0xFF1A1A1C) : const Color(0xFFE4E7EC);
    final muted = dark ? CrmTokens.textTertiaryDark : const Color(0xFF8B93A1);

    return Material(
      color: bg,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: bg,
          border: Border(
            top: BorderSide(
              color: muted.withValues(alpha: 0.4),
              width: 0.5,
            ),
          ),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 11,
            color: muted,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('© 2026 '),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => launchUrl(
                    Uri.parse(_site),
                    mode: LaunchMode.externalApplication,
                  ),
                  child: Text(
                    'EastmarkHK',
                    style: TextStyle(
                      color: CrmTokens.eastmarkGreen.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          CrmTokens.eastmarkGreen.withValues(alpha: 0.4),
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
