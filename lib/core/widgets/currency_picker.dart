import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../services/currency_settings.dart';
import 'country_flag_icon.dart';
import 'safe_picker_dialog.dart';

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

  Future<void> _pick(String code) async {
    if (mounted) Navigator.pop(context);
    await CurrencySettings.instance.setCode(code);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final current = CurrencySettings.instance.code;
    final filtered = _query.isEmpty
        ? CurrencySettings.supported
        : CurrencySettings.supported
            .where((c) =>
                c.$4.toLowerCase().contains(_query.toLowerCase()) ||
                c.$1.toLowerCase().contains(_query.toLowerCase()))
            .toList();

    return SafePickerDialog(
      title: l10n.currencyPickerTitle,
      icon: Icons.attach_money,
      searchHint: l10n.currencySearchHint,
      onQueryChanged: (v) => setState(() => _query = v),
      child: ListView(
        children: [
          for (final c in filtered)
            ListTile(
              leading: CountryFlagIcon(countryCode: c.$3),
              title: Text('${c.$1} · ${c.$2}'),
              subtitle: Text(c.$4),
              trailing: current == c.$1 ? const Icon(Icons.check) : null,
              onTap: () => _pick(c.$1),
            ),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(l10n.currencyNone),
            ),
        ],
      ),
    );
  }
}
