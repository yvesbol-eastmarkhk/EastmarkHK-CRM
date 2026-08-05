import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

/// Compression photos produit — redimensionnement + WebP (ou JPEG si plus petit).
///
/// Flutter décode nativement le WebP (vignettes + zoom InteractiveViewer).
/// L’encodeur Dart (`package:image`) produit du WebP **lossless** ; après
/// redimensionnement on compare à un JPEG lossy et on garde le plus léger.
class EiProductPhotoCompress {
  EiProductPhotoCompress._();

  /// Côté long max — assez net pour le zoom plein écran, sans fichiers multi‑Mo.
  static const int maxSide = 1920;

  static const int jpegQuality = 82;

  /// Compresse en isolate (évite de bloquer l’UI).
  static Future<({Uint8List bytes, String extension})> compress(
    Uint8List bytes,
  ) async {
    if (bytes.isEmpty) {
      return (bytes: bytes, extension: '.jpg');
    }
    try {
      return await compute(_compressIsolate, bytes);
    } catch (e) {
      debugPrint('EiProductPhotoCompress.compress: $e');
      return (bytes: bytes, extension: _guessExt(bytes));
    }
  }

  static ({Uint8List bytes, String extension}) _compressIsolate(
    Uint8List bytes,
  ) {
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      return (bytes: bytes, extension: _guessExt(bytes));
    }

    var image = decoded;
    if (image.width > maxSide || image.height > maxSide) {
      image = image.width >= image.height
          ? img.copyResize(
              image,
              width: maxSide,
              interpolation: img.Interpolation.average,
            )
          : img.copyResize(
              image,
              height: maxSide,
              interpolation: img.Interpolation.average,
            );
    }

    final webp = Uint8List.fromList(img.encodeWebP(image));
    final jpeg = Uint8List.fromList(
      img.encodeJpg(image, quality: jpegQuality),
    );

    // WebP privilégié s’il est au moins aussi compact (sinon JPEG lossy).
    if (webp.isNotEmpty && webp.lengthInBytes <= jpeg.lengthInBytes) {
      return (bytes: webp, extension: '.webp');
    }
    return (bytes: jpeg, extension: '.jpg');
  }

  static String _guessExt(Uint8List bytes) {
    if (bytes.length >= 12 &&
        bytes[0] == 0x52 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x46 &&
        bytes[8] == 0x57 &&
        bytes[9] == 0x45 &&
        bytes[10] == 0x42 &&
        bytes[11] == 0x50) {
      return '.webp';
    }
    if (bytes.length >= 3 &&
        bytes[0] == 0xFF &&
        bytes[1] == 0xD8 &&
        bytes[2] == 0xFF) {
      return '.jpg';
    }
    if (bytes.length >= 8 &&
        bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47) {
      return '.png';
    }
    return '.jpg';
  }
}
