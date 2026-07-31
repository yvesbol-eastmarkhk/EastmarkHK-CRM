import 'package:flutter/material.dart';

import '../services/pipeline_settings.dart';

/// Édition des étapes du pipeline — libellés et ordre, avec won/lost verrouillés.
Future<void> showPipelineSettingsDialog(BuildContext context) async {
  await PipelineSettings.instance.ensureLoaded();
  if (!context.mounted) return;

  await showDialog<void>(
    context: context,
    builder: (ctx) => const _PipelineSettingsDialog(),
  );
}

class _PipelineSettingsDialog extends StatefulWidget {
  const _PipelineSettingsDialog();

  @override
  State<_PipelineSettingsDialog> createState() => _PipelineSettingsDialogState();
}

class _PipelineSettingsDialogState extends State<_PipelineSettingsDialog> {
  late List<String> _stages;
  late Map<String, String> _labels;
  late Map<String, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _stages = List.from(PipelineSettings.instance.stages);
    _labels = Map.from(PipelineSettings.instance.labels);
    _controllers = {
      for (final s in _stages)
        s: TextEditingController(text: _labels[s] ?? PipelineSettings.instance.labelFor(s)),
    };
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  List<String> get _openStages => _stages.where((s) => s != 'won' && s != 'lost').toList();

  void _syncLabelsFromControllers() {
    for (final s in _openStages) {
      final v = _controllers[s]?.text.trim() ?? '';
      _labels[s] = v.isEmpty ? s : v;
    }
  }

  void _rebuildStages(List<String> open) {
    _stages = [...open, 'won', 'lost'];
    for (final s in open) {
      _controllers.putIfAbsent(
        s,
        () => TextEditingController(text: _labels[s] ?? s),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final openStages = _openStages;
    return AlertDialog(
      title: const Text('Étapes du pipeline'),
      content: SizedBox(
        width: 480,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Personnalisez les libellés et l\'ordre des étapes ouvertes. '
                'Gagné et Perdu restent en fin de pipeline.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              for (var i = 0; i < openStages.length; i++) ...[
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Monter',
                      onPressed: i > 0
                          ? () => setState(() {
                                final s = openStages.removeAt(i);
                                openStages.insert(i - 1, s);
                                _rebuildStages(openStages);
                              })
                          : null,
                      icon: const Icon(Icons.arrow_upward, size: 18),
                    ),
                    IconButton(
                      tooltip: 'Descendre',
                      onPressed: i < openStages.length - 1
                          ? () => setState(() {
                                final s = openStages.removeAt(i);
                                openStages.insert(i + 1, s);
                                _rebuildStages(openStages);
                              })
                          : null,
                      icon: const Icon(Icons.arrow_downward, size: 18),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controllers[openStages[i]],
                        decoration: InputDecoration(
                          labelText: 'Étape ${i + 1}',
                          border: const OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                    if (openStages.length > 1)
                      IconButton(
                        tooltip: 'Supprimer',
                        onPressed: () => setState(() {
                          final id = openStages.removeAt(i);
                          _controllers.remove(id)?.dispose();
                          _labels.remove(id);
                          _rebuildStages(openStages);
                        }),
                        icon: const Icon(Icons.delete_outline, size: 18),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
              OutlinedButton.icon(
                onPressed: () => setState(() {
                  final id = 'etape_${DateTime.now().millisecondsSinceEpoch}';
                  openStages.add(id);
                  _labels[id] = 'Nouvelle étape';
                  _controllers[id] = TextEditingController(text: 'Nouvelle étape');
                  _rebuildStages(openStages);
                }),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Ajouter une étape'),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Gagné',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                enabled: false,
                controller: TextEditingController(text: _labels['won'] ?? 'Gagné'),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Perdu',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                enabled: false,
                controller: TextEditingController(text: _labels['lost'] ?? 'Perdu'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await PipelineSettings.instance.resetToDefaults();
            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('Réinitialiser'),
        ),
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
        FilledButton(
          onPressed: () async {
            _syncLabelsFromControllers();
            await PipelineSettings.instance.setStages(_stages, _labels);
            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }
}
