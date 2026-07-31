import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/crm_constants.dart';
import '../db/app_database.dart';
import '../models/models.dart' show kDefaultStages;

/// Étapes du pipeline — chargées depuis la table `pipelines`, avec repli
/// sur [kDefaultStages] / [kStageLabels] si rien n'est configuré.
class PipelineSettings extends ChangeNotifier {
  PipelineSettings._();
  static final PipelineSettings instance = PipelineSettings._();

  static const defaultPipelineId = 'default';

  List<String> _stages = List<String>.from(kDefaultStages);
  Map<String, String> _labels = Map<String, String>.from(kStageLabels);
  bool _loaded = false;

  List<String> get stages => List.unmodifiable(_stages);
  Map<String, String> get labels => Map.unmodifiable(_labels);

  String labelFor(String stage) => _labels[stage] ?? stage;

  List<String> get openStages => _stages.where((s) => s != 'won' && s != 'lost').toList();

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final db = await AppDatabase.instance.database;
    final rows = await db.query('pipelines', where: 'id = ?', whereArgs: [defaultPipelineId]);
    if (rows.isEmpty) {
      await _persist(db);
    } else {
      _applyJson(rows.first['stages_json'] as String?);
    }
    _loaded = true;
  }

  Future<void> setStages(List<String> stages, Map<String, String> labels) async {
    if (stages.length < 2) return;
    _stages = List.from(stages);
    _labels = Map.from(labels);
    final db = await AppDatabase.instance.database;
    await _persist(db);
    notifyListeners();
  }

  Future<void> resetToDefaults() async {
    _stages = List.from(kDefaultStages);
    _labels = Map.from(kStageLabels);
    final db = await AppDatabase.instance.database;
    await _persist(db);
    notifyListeners();
  }

  void _applyJson(String? raw) {
    if (raw == null || raw.isEmpty) return;
    try {
      final m = jsonDecode(raw) as Map<String, dynamic>;
      final s = (m['stages'] as List?)?.map((e) => e.toString()).toList();
      if (s != null && s.isNotEmpty) _stages = s;
      final l = m['labels'] as Map?;
      if (l != null) {
        _labels = l.map((k, v) => MapEntry(k.toString(), v.toString()));
      }
    } catch (_) {}
  }

  Future<void> _persist(Database db) async {
    final json = jsonEncode({'stages': _stages, 'labels': _labels});
    await db.insert(
      'pipelines',
      {'id': defaultPipelineId, 'name': 'Pipeline principal', 'stages_json': json},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
