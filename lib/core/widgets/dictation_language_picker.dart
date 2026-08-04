import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/language_flags.dart';
import '../../l10n/gen/app_localizations.dart';
import '../services/dictation_settings.dart';
import 'country_flag_icon.dart';
import 'safe_picker_dialog.dart';

/// Sélecteur de langue de dictée — liste curatée (pas d'appel speech_to_text
/// à l'ouverture : ça crash sur macOS desktop).
Future<void> showDictationLanguagePicker(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (_) => const _LanguagePickerDialog(),
  );
}

class _LanguagePickerDialog extends StatefulWidget {
  const _LanguagePickerDialog();

  @override
  State<_LanguagePickerDialog> createState() => _LanguagePickerDialogState();
}

class _LanguagePickerDialogState extends State<_LanguagePickerDialog> {
  String _query = '';

  Future<void> _pick(String? localeId) async {
    if (mounted) Navigator.pop(context);
    await DictationSettings.instance.setLocale(localeId);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final options = DictationSettings.curatedLocales;
    final filtered = _query.isEmpty
        ? options
        : options
            .where(
              (l) =>
                  l.label.toLowerCase().contains(_query.toLowerCase()) ||
                  l.id.toLowerCase().contains(_query.toLowerCase()),
            )
            .toList();
    final current = DictationSettings.instance.localeId;

    return SafePickerDialog(
      title: l10n.settingsDictationLanguageLabel,
      icon: Icons.mic_none_outlined,
      searchHint: l10n.dictationLanguageSearchHint,
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
          for (final l in filtered)
            ListTile(
              leading: _flag(l.id),
              title: Text(l.label),
              subtitle: Text(l.id),
              trailing: current == l.id ? const Icon(Icons.check) : null,
              onTap: () => _pick(l.id),
            ),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(l10n.noLanguage),
            ),
          if (!kIsWeb &&
              (defaultTargetPlatform == TargetPlatform.macOS ||
                  defaultTargetPlatform == TargetPlatform.windows ||
                  defaultTargetPlatform == TargetPlatform.linux))
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
              child: Text(
                l10n.dictationDesktopHint,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _flag(String localeId) {
    final cc = flagCountryForLanguage(localeId);
    if (cc == null) return const Icon(Icons.language, size: 22);
    return CountryFlagIcon(countryCode: cc, width: 22, height: 16);
  }
}
