import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../services/dictation_settings.dart';

/// Sélecteur de langue de dictée — liste toutes les langues installées
/// sur l'appareil (macOS/iOS/Android), recherche incluse. Choix global,
/// mémorisé, utilisé par tous les champs de dictée de l'app.
Future<void> showDictationLanguagePicker(BuildContext context) async {
  final settings = DictationSettings.instance;
  await showDialog(
    context: context,
    builder: (_) => const _LanguagePickerDialog(),
  );
  settings.notifyListeners();
}

class _LanguagePickerDialog extends StatefulWidget {
  const _LanguagePickerDialog();

  @override
  State<_LanguagePickerDialog> createState() => _LanguagePickerDialogState();
}

class _LanguagePickerDialogState extends State<_LanguagePickerDialog> {
  List<LocaleName> _locales = [];
  bool _loading = true;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final locales = await DictationSettings.instance.loadAvailableLocales();
    locales.sort((a, b) => a.name.compareTo(b.name));
    if (!mounted) return;
    setState(() {
      _locales = locales;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _query.isEmpty
        ? _locales
        : _locales
            .where((l) => l.name.toLowerCase().contains(_query.toLowerCase()))
            .toList();
    final current = DictationSettings.instance.localeId;

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440, maxHeight: 520),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Row(
                children: [
                  const Icon(Icons.language),
                  const SizedBox(width: 10),
                  Text('Langue de dictée',
                      style: Theme.of(context).textTheme.titleMedium),
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
            const SizedBox(height: 8),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.smartphone),
                          title: const Text('Langue du système'),
                          trailing: current == null
                              ? const Icon(Icons.check)
                              : null,
                          onTap: () async {
                            await DictationSettings.instance.setLocale(null);
                            if (context.mounted) Navigator.pop(context);
                          },
                        ),
                        const Divider(height: 1),
                        for (final l in filtered)
                          ListTile(
                            title: Text(l.name),
                            subtitle: Text(l.localeId),
                            trailing: current == l.localeId
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () async {
                              await DictationSettings.instance
                                  .setLocale(l.localeId);
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
