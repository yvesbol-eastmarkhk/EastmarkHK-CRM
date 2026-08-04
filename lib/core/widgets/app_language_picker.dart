import 'package:flutter/material.dart';

import '../data/language_flags.dart';
import '../../l10n/gen/app_localizations.dart';
import '../services/app_locale_settings.dart';
import 'country_flag_icon.dart';
import 'safe_picker_dialog.dart';

Future<void> showAppLanguagePicker(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => const _AppLanguagePickerDialog(),
  );
}

class _AppLanguagePickerDialog extends StatefulWidget {
  const _AppLanguagePickerDialog();

  @override
  State<_AppLanguagePickerDialog> createState() => _AppLanguagePickerDialogState();
}

class _AppLanguagePickerDialogState extends State<_AppLanguagePickerDialog> {
  String _query = '';

  Future<void> _pick(String? code) async {
    if (mounted) Navigator.pop(context);
    await AppLocaleSettings.instance.setLocale(code);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final current = AppLocaleSettings.instance.localeCode;
    final filtered = _query.isEmpty
        ? AppLocaleSettings.supported
        : AppLocaleSettings.supported
            .where((s) =>
                s.$2.toLowerCase().contains(_query.toLowerCase()) ||
                s.$1.toLowerCase().contains(_query.toLowerCase()))
            .toList();

    return SafePickerDialog(
      title: l10n.languagePickerTitle,
      icon: Icons.translate,
      searchHint: l10n.languageSearchHint,
      onQueryChanged: (v) => setState(() => _query = v),
      child: ListView(
        children: [
          if (_query.isEmpty)
            ListTile(
              leading: const Icon(Icons.smartphone),
              title: Text(l10n.systemLanguage),
              trailing: current == null ? const Icon(Icons.check) : null,
              onTap: () => _pick(null),
            ),
          if (_query.isEmpty) const Divider(height: 1),
          for (final s in filtered)
            ListTile(
              leading: _flag(s.$1),
              title: Text(s.$2),
              trailing: current == s.$1 ? const Icon(Icons.check) : null,
              onTap: () => _pick(s.$1),
            ),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(l10n.noLanguage),
            ),
        ],
      ),
    );
  }

  Widget _flag(String languageCode) {
    final cc = flagCountryForLanguage(languageCode);
    if (cc == null) return const Icon(Icons.language, size: 22);
    return CountryFlagIcon(countryCode: cc, width: 22, height: 16);
  }
}
