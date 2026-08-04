// Verrouille deux comportements liés au mobile / lisibilité demandés par
// l'utilisateur : (1) le titre reste toujours sur une seule ligne (le bug
// initial était le libellé de nav qui passait sur 2 lignes sur iPhone —
// SelectableListTile est utilisé partout dans les mêmes listes), et (2) le
// nom de client s'affiche en fuchsia quand titleColor est fourni (demande
// "dans dashboard, agenda, clients aussi en fuchsia").
import 'package:eastmarkhk_crm/theme/crm_tokens.dart';
import 'package:eastmarkhk_crm/workspace/list_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child, {double width = 200}) {
  return MaterialApp(
    home: Scaffold(
      body: SizedBox(width: width, child: child),
    ),
  );
}

void main() {
  testWidgets('title never wraps onto a second line, even when very long', (tester) async {
    await tester.pumpWidget(_wrap(
      SelectableListTile(
        selected: false,
        title: 'A very long company name that would otherwise wrap across multiple lines',
        onTap: () {},
      ),
    ));

    final text = tester.widget<Text>(find.text(
      'A very long company name that would otherwise wrap across multiple lines',
    ));
    expect(text.maxLines, 1);
    expect(text.overflow, TextOverflow.ellipsis);
  });

  testWidgets('titleColor paints the client name in fuchsia when provided', (tester) async {
    await tester.pumpWidget(_wrap(
      SelectableListTile(
        selected: false,
        title: 'Coopama Cooperativa Agraria',
        titleColor: CrmTokens.fuchsia,
        onTap: () {},
      ),
    ));

    final text = tester.widget<Text>(find.text('Coopama Cooperativa Agraria'));
    expect(text.style?.color, CrmTokens.fuchsia);
  });

  testWidgets('falls back to default color when there is no linked client', (tester) async {
    await tester.pumpWidget(_wrap(
      SelectableListTile(
        selected: false,
        title: 'Sans client',
        onTap: () {},
      ),
    ));

    final text = tester.widget<Text>(find.text('Sans client'));
    expect(text.style?.color, isNot(CrmTokens.fuchsia));
  });

  testWidgets('done items keep the strikethrough regardless of titleColor', (tester) async {
    await tester.pumpWidget(_wrap(
      SelectableListTile(
        selected: false,
        title: 'Client fait',
        titleColor: CrmTokens.fuchsia,
        isDone: true,
        onTap: () {},
      ),
    ));

    final text = tester.widget<Text>(find.text('Client fait'));
    expect(text.style?.decoration, TextDecoration.lineThrough);
  });

  testWidgets('tapping the tile triggers onTap', (tester) async {
    var tapped = false;
    await tester.pumpWidget(_wrap(
      SelectableListTile(
        selected: false,
        title: 'Client',
        onTap: () => tapped = true,
      ),
    ));

    await tester.tap(find.text('Client'));
    expect(tapped, isTrue);
  });
}
