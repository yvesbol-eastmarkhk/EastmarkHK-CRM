import 'dart:io';

import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

/// `AppDatabase`/`CrmDb` appellent `getApplicationSupportDirectory()` (vrai
/// plugin natif, indisponible en `flutter test`). On substitue une
/// implémentation renvoyant un dossier temporaire propre à chaque test —
/// sans ça, `PlatformException(MissingPluginException)` dès le 1er accès DB.
class FakePathProviderPlatform extends PathProviderPlatform {
  FakePathProviderPlatform(this._dir);

  final Directory _dir;

  @override
  Future<String?> getApplicationSupportPath() async => _dir.path;

  @override
  Future<String?> getApplicationDocumentsPath() async => _dir.path;

  @override
  Future<String?> getTemporaryPath() async => _dir.path;
}

/// Installe un dossier temporaire comme "Application Support" pour la durée
/// du test et retourne son chemin (nettoyage à la charge de l'appelant via
/// `Directory.delete(recursive: true)` en `tearDown`).
Directory installFakeApplicationSupportDir(String prefix) {
  final dir = Directory.systemTemp.createTempSync(prefix);
  PathProviderPlatform.instance = FakePathProviderPlatform(dir);
  return dir;
}
