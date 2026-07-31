import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../db/app_database.dart';

/// Cache réactif du logo société — permet au header (`crmAppBar`) de
/// l'afficher au centre sans re-lire le disque à chaque frame, et de se
/// mettre à jour immédiatement quand l'utilisateur le change dans Réglages.
class CompanyLogoSettings extends ChangeNotifier {
  CompanyLogoSettings._();
  static final CompanyLogoSettings instance = CompanyLogoSettings._();

  File? _file;
  File? get file => _file;

  bool _loaded = false;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    _file = await CompanyLogoService.currentFile();
    _loaded = true;
    notifyListeners();
  }

  /// À appeler après avoir choisi/supprimé le logo dans Réglages.
  Future<void> refresh() async {
    _file = await CompanyLogoService.currentFile();
    notifyListeners();
  }
}

/// Logo de la société utilisatrice — stocké comme fichier local (pas en
/// base64 en base) et référencé par son chemin dans `settings` (clé
/// `company_logo_path`). Réutilisable plus tard dans le header (mode
/// marque blanche) et dans l'en-tête des PDF générés (module Facturation).
class CompanyLogoService {
  CompanyLogoService._();

  static Future<String?> currentPath() =>
      AppDatabase.instance.getSetting('company_logo_path');

  static Future<File?> currentFile() async {
    final path = await currentPath();
    if (path == null) return null;
    final file = File(path);
    return file.existsSync() ? file : null;
  }

  /// Ouvre le sélecteur de fichier, copie l'image choisie dans le
  /// répertoire de l'app et enregistre le chemin. Retourne le fichier
  /// copié, ou `null` si l'utilisateur a annulé.
  static Future<File?> pickAndSave() async {
    final file = await openFile(acceptedTypeGroups: [
      const XTypeGroup(label: 'images', extensions: ['png', 'jpg', 'jpeg', 'webp']),
    ]);
    if (file == null) return null;

    final dir = await getApplicationSupportDirectory();
    final brandingDir = Directory(p.join(dir.path, 'branding'));
    await brandingDir.create(recursive: true);
    final ext = p.extension(file.path).isEmpty ? '.png' : p.extension(file.path);
    final destPath = p.join(brandingDir.path, 'company_logo$ext');

    final bytes = await file.readAsBytes();
    final dest = File(destPath);
    await dest.writeAsBytes(bytes, flush: true);

    await AppDatabase.instance.setSetting('company_logo_path', destPath);
    return dest;
  }

  static Future<void> remove() async {
    final path = await currentPath();
    if (path != null) {
      final file = File(path);
      if (file.existsSync()) await file.delete();
    }
    await AppDatabase.instance.setSetting('company_logo_path', null);
  }
}
