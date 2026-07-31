import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

/// Hachage de mot de passe local — PBKDF2 (HMAC-SHA256, 100 000 itérations)
/// avec sel aléatoire par utilisateur. Le mot de passe en clair ne quitte
/// jamais cette classe et n'est jamais stocké.
class AuthService {
  AuthService._();

  static const _iterations = 100000;
  static const _keyLength = 32;

  static String _randomSalt() {
    final rnd = Random.secure();
    final bytes = Uint8List.fromList(List.generate(16, (_) => rnd.nextInt(256)));
    return base64UrlEncode(bytes);
  }

  static Uint8List _pbkdf2(String password, String saltB64) {
    final salt = base64Url.decode(saltB64);
    final hmac = Hmac(sha256, utf8.encode(password));
    var u = hmac.convert(salt + [0, 0, 0, 1]).bytes;
    var result = Uint8List.fromList(u);
    for (var i = 1; i < _iterations; i++) {
      u = hmac.convert(u).bytes;
      for (var j = 0; j < result.length; j++) {
        result[j] ^= u[j];
      }
    }
    return result.sublist(0, _keyLength);
  }

  /// Retourne (hash, sel) — les deux à stocker en base.
  static (String hash, String salt) hashNewPassword(String password) {
    final salt = _randomSalt();
    final hash = base64UrlEncode(_pbkdf2(password, salt));
    return (hash, salt);
  }

  static bool verify(String password, String hash, String salt) {
    final computed = base64UrlEncode(_pbkdf2(password, salt));
    // Comparaison en temps constant.
    if (computed.length != hash.length) return false;
    var diff = 0;
    for (var i = 0; i < computed.length; i++) {
      diff |= computed.codeUnitAt(i) ^ hash.codeUnitAt(i);
    }
    return diff == 0;
  }
}
