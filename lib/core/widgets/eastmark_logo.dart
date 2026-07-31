import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';
import '../services/company_logo_service.dart';

/// Logo EastmarkHK — wordmark de la plateforme elle-même (pas celui de la
/// société utilisatrice). Un seul asset source (assets/branding/) réutilisé
/// partout : jamais redessiné par écran, cohérent avec la règle « fondu,
/// pas juxtaposé ».
class EastmarkWordmark extends StatelessWidget {
  const EastmarkWordmark({super.key, this.height = 26});

  final double height;

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/branding/eastmarkhk_wordmark.png',
        height: height,
        fit: BoxFit.contain,
      );
}

/// Header standard de tous les écrans du cœur et des modules : le logo de
/// la société utilisatrice au centre (marque blanche — celui uploadé dans
/// Réglages), et à l'extrême droite l'icône Réglages puis le petit logo
/// EastmarkHK (la plateforme). Tant qu'aucun logo société n'est défini, le
/// wordmark EastmarkHK reste affiché au centre pour ne pas laisser un
/// header vide. `bottom` permet d'ajouter une barre secondaire (recherche,
/// sous-titre…) sous le header.
AppBar crmAppBar(BuildContext context, {PreferredSizeWidget? bottom, List<Widget>? extraActions}) {
  return AppBar(
    title: ListenableBuilder(
      listenable: CompanyLogoSettings.instance,
      builder: (context, _) {
        final logo = CompanyLogoSettings.instance.file;
        if (logo == null) return const EastmarkWordmark(height: 45);
        return Image.file(logo, height: 55, fit: BoxFit.contain);
      },
    ),
    centerTitle: true,
    actions: [
      if (extraActions != null) ...extraActions,
      IconButton(
        tooltip: 'Réglages',
        icon: const Icon(Icons.settings_outlined),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SettingsScreen()),
        ),
      ),
      ListenableBuilder(
        listenable: CompanyLogoSettings.instance,
        builder: (context, _) {
          // Le petit logo EastmarkHK n'apparaît ici que si la société a son
          // propre logo au centre — sinon il serait dupliqué avec le centre.
          if (CompanyLogoSettings.instance.file == null) return const SizedBox.shrink();
          return const Padding(
            padding: EdgeInsets.only(right: 12),
            child: EastmarkWordmark(height: 36),
          );
        },
      ),
      const SizedBox(width: 4),
    ],
    bottom: bottom,
  );
}
