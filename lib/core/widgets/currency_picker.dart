import 'package:flutter/material.dart';

import '../services/currency_settings.dart';
import 'country_flag_icon.dart';

/// Sélecteur de devise — symbole + petit drapeau, recherche par nom/code.
Future<void> showCurrencyPicker(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => const _CurrencyPickerDialog(),
  );
}

class _CurrencyPickerDialog extends StatefulWidget {
  const _CurrencyPickerDialog();

  @override
  State<_CurrencyPickerDialog> createState() => _CurrencyPickerDialogState();
}

class _CurrencyPickerDialogState extends State<_CurrencyPickerDialog> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final current = CurrencySettings.instance.code;
    final filtered = _query.isEmpty
        ? CurrencySettings.supported
        : CurrencySettings.supported
            .where((c) =>
                c.$4.toLowerCase().contains(_query.toLowerCase()) ||
                c.$1.toLowerCase().contains(_query.toLowerCase()))
            .toList();

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 560),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Row(
                children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(width: 10),
                  Text('Devise', style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autofocus: true,
                onChanged: (v) => setState(() => _query = v),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Rechercher une devise…',
                ),
              ),
            ),
            const SizedBox(height: 4),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (final c in filtered)
                    ListTile(
                      leading: CountryFlagIcon(countryCode: c.$3),
                      title: Text(c.$4),
                      subtitle: Text('${c.$1} · ${c.$2}'),
                      trailing: current == c.$1 ? const Icon(Icons.check) : null,
                      onTap: () async {
                        await CurrencySettings.instance.setCode(c.$1);
                        if (context.mounted) Navigator.pop(context);
                      },
                    ),
                  if (filtered.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(24),
                      child: Text('Aucune devise trouvée'),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
