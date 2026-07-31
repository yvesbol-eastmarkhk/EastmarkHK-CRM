import 'package:flutter/widgets.dart';

/// Sous cette largeur, les formulaires empilent leurs champs en colonne
/// plutôt qu'en ligne — même seuil que la navigation (app.dart).
const kCompactFormBreakpoint = 720.0;

bool isCompactFormWidth(BuildContext context) =>
    MediaQuery.sizeOf(context).width < kCompactFormBreakpoint;

/// Sur mobile : empile [children] en colonne. Sinon : [Row] avec les mêmes
/// enfants (généralement déjà enveloppés via [formFlexChild]).
///
/// [compact] permet d'imposer la décision plutôt que de la déduire de la
/// largeur de l'écran (`MediaQuery`) — indispensable dans une boîte de
/// dialogue dont le contenu est bien plus étroit que l'écran : sans cela,
/// un dialogue de 680px sur un écran desktop de 1400px choisit quand même
/// la disposition en ligne et écrase les champs. Calculer [compact] via un
/// `LayoutBuilder` sur la largeur réellement disponible évite ce piège.
Widget formRowOrColumn({
  required BuildContext context,
  required List<Widget> children,
  double gap = 12,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  bool? compact,
}) {
  if (compact ?? isCompactFormWidth(context)) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) SizedBox(height: gap),
          children[i],
        ],
      ],
    );
  }
  return Row(
    crossAxisAlignment: crossAxisAlignment,
    children: [
      for (var i = 0; i < children.length; i++) ...[
        if (i > 0) SizedBox(width: gap),
        children[i],
      ],
    ],
  );
}

/// Enveloppe un enfant pour qu'il prenne toute la largeur en colonne, ou
/// le [flex] donné en ligne. Voir [formRowOrColumn] pour [compact].
Widget formFlexChild({
  required BuildContext context,
  required Widget child,
  int flex = 1,
  bool? compact,
}) {
  if (compact ?? isCompactFormWidth(context)) return child;
  return Expanded(flex: flex, child: child);
}
