import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context);
    final openStages = _openStages;
    return AlertDialog(
      title: Text(l10n.pipelineSettingsTitle),
      content: SizedBox(
        width: 620,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.pipelineSettingsHint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              for (var i = 0; i < openStages.length; i++) ...[
                Row(
                  children: [
                    IconButton(
                      tooltip: l10n.pipelineMoveUp,
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
                      tooltip: l10n.pipelineMoveDown,
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
                          labelText: l10n.pipelineStepLabel(i + 1),
                          border: const OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                    if (openStages.length > 1)
                      IconButton(
                        tooltip: l10n.commonDelete,
                        onPressed: () => setState(() {
                          final id = openStages.removeAt(i);
                          _controllers.remove(id)?.dispose();
                          _labels.remove(id);
                          _rebuildStages(openStages);
                        }),
                        icon: const Icon(Icons.delete_outline, size: 18, color: Color(0xFFDC2626)),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
              OutlinedButton.icon(
                onPressed: () => setState(() {
                  final id = 'etape_${DateTime.now().millisecondsSinceEpoch}';
                  openStages.add(id);
                  _labels[id] = l10n.pipelineNewStage;
                  _controllers[id] = TextEditingController(text: l10n.pipelineNewStage);
                  _rebuildStages(openStages);
                }),
                icon: const Icon(Icons.add, size: 18),
                label: Text(l10n.pipelineAddStage),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: l10n.pipelineWon,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                enabled: false,
                controller: TextEditingController(text: _labels['won'] ?? l10n.pipelineWon),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: l10n.pipelineLost,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                enabled: false,
                controller: TextEditingController(text: _labels['lost'] ?? l10n.pipelineLost),
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
          child: Text(l10n.pipelineReset),
        ),
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.commonCancel)),
        FilledButton(
          onPressed: () async {
            _syncLabelsFromControllers();
            await PipelineSettings.instance.setStages(_stages, _labels);
            if (context.mounted) Navigator.pop(context);
          },
          child: Text(l10n.commonSave),
        ),
      ],
    );
  }
}
