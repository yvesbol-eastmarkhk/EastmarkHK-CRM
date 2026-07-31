import 'package:flutter/material.dart';

import '../services/app_locale_settings.dart';

/// Sélecteur de langue de l'interface — distinct du sélecteur de langue
/// de dictée (dictation_language_picker.dart). Liste complète (toutes les
/// langues, comme la dictée) avec recherche.
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

  @override
  Widget build(BuildContext context) {
    final current = AppLocaleSettings.instance.locale?.languageCode;
    final filtered = _query.isEmpty
        ? AppLocaleSettings.supported
        : AppLocaleSettings.supported
            .where((s) => s.$2.toLowerCase().contains(_query.toLowerCase()))
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
                  const Icon(Icons.translate),
                  const SizedBox(width: 10),
                  Text('Langue de l\'application', style: Theme.of(context).textTheme.titleMedium),
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
                  hintText: 'Rechercher une langue…',
                ),
              ),
            ),
            const SizedBox(height: 4),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  if (_query.isEmpty)
                    ListTile(
                      leading: const Icon(Icons.smartphone),
                      title: const Text('Langue du système'),
                      trailing: current == null ? const Icon(Icons.check) : null,
                      onTap: () async {
                        await AppLocaleSettings.instance.setLocale(null);
                        if (context.mounted) Navigator.pop(context);
                      },
                    ),
                  if (_query.isEmpty) const Divider(height: 1),
                  for (final s in filtered)
                    ListTile(
                      title: Text(s.$2),
                      trailing: current == s.$1 ? const Icon(Icons.check) : null,
                      onTap: () async {
                        await AppLocaleSettings.instance.setLocale(s.$1);
                        if (context.mounted) Navigator.pop(context);
                      },
                    ),
                  if (filtered.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(24),
                      child: Text('Aucune langue trouvée'),
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
