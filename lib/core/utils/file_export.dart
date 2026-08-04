import 'dart:convert';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Export utilisateur : sur desktop, dialogue « Enregistrer sous »
/// (choix du dossier + nom). Pas de fichier temporaire imposé + Share.
///
/// Sur mobile → Share en secours.
class FileExport {
  FileExport._();

  static bool get _isDesktop =>
      !kIsWeb &&
      (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

  /// Écrit [contents] (UTF-8) à l'emplacement choisi. `null` si annulé.
  static Future<String?> saveText({
    required String suggestedName,
    required String contents,
    List<String> extensions = const ['csv', 'txt'],
    String? shareText,
  }) {
    return saveBytes(
      suggestedName: suggestedName,
      bytes: Uint8List.fromList(utf8.encode(contents)),
      extensions: extensions,
      shareText: shareText,
    );
  }

  /// Écrit des octets à l'emplacement choisi par l'utilisateur.
  static Future<String?> saveBytes({
    required String suggestedName,
    required Uint8List bytes,
    List<String> extensions = const [],
    String? shareText,
  }) async {
    if (_isDesktop) {
      final location = await getSaveLocation(
        suggestedName: suggestedName,
        acceptedTypeGroups: [
          if (extensions.isNotEmpty)
            XTypeGroup(
              label: extensions.join(', ').toUpperCase(),
              extensions: extensions,
            ),
        ],
      );
      if (location == null) return null;
      final file = File(location.path);
      await file.writeAsBytes(bytes, flush: true);
      return file.path;
    }

    final dir = await getTemporaryDirectory();
    final file = File(p.join(dir.path, suggestedName));
    await file.writeAsBytes(bytes, flush: true);
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: shareText ?? suggestedName,
      ),
    );
    return file.path;
  }

  /// Copie un fichier existant vers l'emplacement choisi.
  static Future<String?> saveFileCopy({
    required File source,
    required String suggestedName,
    List<String> extensions = const [],
    String? shareText,
  }) async {
    final bytes = await source.readAsBytes();
    return saveBytes(
      suggestedName: suggestedName,
      bytes: Uint8List.fromList(bytes),
      extensions: extensions,
      shareText: shareText,
    );
  }
}
