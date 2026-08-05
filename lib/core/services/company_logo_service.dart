import 'dart:convert';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
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

/// Logo de la société utilisatrice — fichier local + chemin dans `settings`.
/// Bytes synchronisés via `company_profile.logo_base64` (remote CRM sync).
class CompanyLogoService {
  CompanyLogoService._();

  static const int _syncMaxSide = 1200;
  static const int _syncJpegQuality = 85;

  static Future<String?> currentPath() =>
      AppDatabase.instance.getSetting('company_logo_path');

  static Future<File?> currentFile() async {
    final path = await currentPath();
    if (path == null) return null;
    final file = File(path);
    return file.existsSync() ? file : null;
  }

  static Future<Directory> _brandingDir() async {
    final dir = await getApplicationSupportDirectory();
    final brandingDir = Directory(p.join(dir.path, 'branding'));
    await brandingDir.create(recursive: true);
    return brandingDir;
  }

  /// Ouvre le sélecteur de fichier / photothèque, copie l'image choisie dans le
  /// répertoire de l'app et enregistre le chemin. Retourne le fichier
  /// copié, ou `null` si l'utilisateur a annulé.
  static Future<File?> pickAndSave() async {
    Uint8List bytes;
    var ext = '.jpg';

    final mobile = !kIsWeb && (Platform.isIOS || Platform.isAndroid);
    if (mobile) {
      final x = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 92,
        maxWidth: 2000,
      );
      if (x == null) return null;
      bytes = await x.readAsBytes();
      final nameExt = p.extension(x.name).toLowerCase();
      if (nameExt.isNotEmpty) ext = nameExt;
    } else {
      final file = await openFile(acceptedTypeGroups: [
        const XTypeGroup(
            label: 'images', extensions: ['png', 'jpg', 'jpeg', 'webp']),
      ]);
      if (file == null) return null;
      bytes = await file.readAsBytes();
      ext = p.extension(file.path).isEmpty ? '.png' : p.extension(file.path);
    }
    final dest = await saveBytes(bytes, ext);
    await AppDatabase.instance.touchCompanyProfileForSync();
    return dest;
  }

  /// Écrit le logo local (sync pull ou import) et met à jour `company_logo_path`.
  static Future<File> saveBytes(Uint8List bytes, String extension) async {
    final brandingDir = await _brandingDir();
    var ext = extension.trim().toLowerCase();
    if (ext.isEmpty) ext = '.png';
    if (!ext.startsWith('.')) ext = '.$ext';
    // Un seul fichier actif — évite d'accumuler d'anciens formats.
    for (final old in brandingDir.listSync().whereType<File>()) {
      if (p.basename(old.path).startsWith('company_logo')) {
        try {
          await old.delete();
        } catch (_) {}
      }
    }
    final destPath = p.join(brandingDir.path, 'company_logo$ext');
    final dest = File(destPath);
    await dest.writeAsBytes(bytes, flush: true);
    await AppDatabase.instance.setSetting('company_logo_path', destPath);
    await AppDatabase.instance.setSetting('company_logo_cleared', null);
    return dest;
  }

  static Future<void> remove() async {
    final path = await currentPath();
    if (path != null) {
      final file = File(path);
      if (file.existsSync()) await file.delete();
    }
    await AppDatabase.instance.setSetting('company_logo_path', null);
    // Marque une suppression volontaire pour le push sync.
    await AppDatabase.instance.setSetting('company_logo_cleared', '1');
    await AppDatabase.instance.touchCompanyProfileForSync();
  }

  /// Payload logo pour le sync remote (JPEG compressé si possible).
  /// [cleared] : suppression volontaire — le serveur efface le logo distant.
  static Future<({String base64, String ext, bool cleared})> logoForSync() async {
    final cleared = await AppDatabase.instance.getSetting('company_logo_cleared');
    if (cleared == '1') {
      return (base64: '', ext: '.cleared', cleared: true);
    }
    final path = await currentPath();
    if (path == null || path.isEmpty) {
      // Pas de fichier local → ne pas écraser le logo distant.
      return (base64: '', ext: '', cleared: false);
    }
    final file = File(path);
    if (!await file.exists()) {
      return (base64: '', ext: '', cleared: false);
    }
    final raw = await file.readAsBytes();
    final compressed = _compressForSync(Uint8List.fromList(raw));
    return (
      base64: base64Encode(compressed.bytes),
      ext: compressed.ext,
      cleared: false,
    );
  }

  static ({Uint8List bytes, String ext}) _compressForSync(Uint8List bytes) {
    try {
      final decoded = img.decodeImage(bytes);
      if (decoded == null) {
        return (bytes: bytes, ext: '.bin');
      }
      var image = decoded;
      if (image.width > _syncMaxSide || image.height > _syncMaxSide) {
        image = image.width >= image.height
            ? img.copyResize(image,
                width: _syncMaxSide, interpolation: img.Interpolation.average)
            : img.copyResize(image,
                height: _syncMaxSide, interpolation: img.Interpolation.average);
      }
      final jpeg =
          Uint8List.fromList(img.encodeJpg(image, quality: _syncJpegQuality));
      return (bytes: jpeg, ext: '.jpg');
    } catch (_) {
      return (bytes: bytes, ext: '.bin');
    }
  }
}
