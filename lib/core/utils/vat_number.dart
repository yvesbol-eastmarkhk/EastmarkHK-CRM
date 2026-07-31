import 'package:flutter/services.dart';

/// Normalisation / formatage local des n° de TVA UE (sans appel VIES).
/// Portage d'EastmarkHK e-Invoicing.
class VatNumber {
  VatNumber._();

  static final _re = RegExp(
    r'^((?:BE|FR|NL|DE|LU|IT|AT|ES|PT|IE|PL|SE|DK|FI|EL|CZ|HU|RO|SK|SI|HR|BG|EE|LV|LT|MT|CY|GB))\s*([A-Z0-9]+)$',
    caseSensitive: false,
  );

  static const _euVatPrefixes = {
    'BE', 'FR', 'NL', 'DE', 'LU', 'IT', 'AT', 'ES', 'PT', 'IE', 'PL', 'SE',
    'DK', 'FI', 'EL', 'CZ', 'HU', 'RO', 'SK', 'SI', 'HR', 'BG', 'EE', 'LV',
    'LT', 'MT', 'CY', 'GB',
  };

  /// Préfixe live pour un champ vide (`BE `).
  static String vatPrefix(String? countryCode) {
    final cc = (countryCode ?? '').trim().toUpperCase();
    if (cc == 'BR' || cc.length != 2) return '';
    if (!_euVatPrefixes.contains(cc) && cc != 'GR') return '';
    if (cc == 'GR') return 'EL ';
    return '$cc ';
  }

  /// Compact uppercase sans espaces : `BE0865944140`.
  static String normalize(String raw, {String? countryCode}) {
    var s = raw.replaceAll(RegExp(r'[\s.\-/]'), '').toUpperCase();
    if (s.isEmpty) return '';

    final cc = (countryCode ?? '').trim().toUpperCase();
    final prefixCc = cc == 'GR' ? 'EL' : cc;

    // Le champ garde parfois un préfixe d'un pays précédemment sélectionné
    // (ex. on bascule Belgique → Hong Kong : "BE0865944140" ne doit pas
    // rester préfixé BE puisque HK n'utilise pas ce format). On retire tout
    // préfixe UE existant qui ne correspond plus au pays actuel.
    final existingPrefix = RegExp(r'^([A-Z]{2})').firstMatch(s)?.group(1);
    if (existingPrefix != null && existingPrefix != prefixCc && _euVatPrefixes.contains(existingPrefix)) {
      s = s.substring(2);
    }

    // Seuls les pays UE (+ UK) utilisent ce préfixe à 2 lettres — pour les
    // autres (Hong Kong, Brésil…) on ne préfixe jamais, même si prefixCc
    // fait 2 caractères.
    final usesPrefix = _euVatPrefixes.contains(prefixCc);

    // Collage d'un numéro qui inclut déjà le préfixe pays (ex. le champ
    // affichait "BE " et l'utilisateur colle "BE0865944140") → on retire
    // la répétition plutôt que d'obtenir "BEBE0865944140".
    if (usesPrefix) {
      while (s.startsWith('$prefixCc$prefixCc')) {
        s = s.substring(prefixCc.length);
      }
    }

    if (usesPrefix && !RegExp(r'^[A-Z]{2}').hasMatch(s)) {
      s = '$prefixCc$s';
    }

    final m = _re.firstMatch(s);
    if (m != null) {
      return '${m.group(1)!.toUpperCase()}${m.group(2)!.toUpperCase()}';
    }

    if (usesPrefix && !RegExp(r'^[A-Z]{2}').hasMatch(s)) {
      return '$prefixCc$s';
    }
    return s;
  }

  /// Format live à la saisie : `BE 0865.944.140` (espace après le pays).
  static String formatLive(String raw, String? countryCode) {
    final prefix = vatPrefix(countryCode);
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return prefix;

    final n = normalize(raw, countryCode: countryCode);
    if (n.isEmpty) return prefix;

    if (n.length == 2 && RegExp(r'^[A-Z]{2}$').hasMatch(n)) {
      return '$n ';
    }

    return formatDisplay(n, countryCode: countryCode);
  }

  /// Affichage local (espaces / points) selon le pays.
  static String formatDisplay(String raw, {String? countryCode}) {
    final v = normalize(raw, countryCode: countryCode);
    if (v.isEmpty) {
      return raw.replaceAll(RegExp(r'[\s.\-/]'), '').toUpperCase();
    }
    if (v.length < 3) {
      if (v.length == 2) return '$v ';
      return v;
    }
    final cc = v.substring(0, 2);
    var body = v.substring(2);
    switch (cc) {
      case 'BE':
        if (body.length > 10) body = body.substring(0, 10);
        if (body.length <= 4) return 'BE $body';
        if (body.length <= 7) {
          return 'BE ${body.substring(0, 4)}.${body.substring(4)}';
        }
        return 'BE ${body.substring(0, 4)}.${body.substring(4, 7)}.${body.substring(7)}';
      case 'FR':
        if (body.length == 11) {
          return 'FR ${body.substring(0, 2)} ${body.substring(2, 5)} '
              '${body.substring(5, 8)} ${body.substring(8)}';
        }
        break;
      case 'NL':
        if (RegExp(r'^\d{9}B\d{2}$', caseSensitive: false).hasMatch(body)) {
          return 'NL ${body.substring(0, 4)}.${body.substring(4, 6)}.'
              '${body.substring(6, 9)}.${body.substring(9).toUpperCase()}';
        }
        break;
      case 'DE':
        if (body.length == 9) {
          return 'DE ${body.substring(0, 3)} ${body.substring(3, 6)} ${body.substring(6)}';
        }
        break;
      case 'LU':
        if (body.length == 8) {
          return 'LU ${body.substring(0, 3)} ${body.substring(3, 6)} ${body.substring(6)}';
        }
        break;
      case 'IT':
        if (body.length == 11) return 'IT $body';
        break;
    }
    return '$cc $body';
  }
}

/// Masque TVA : majuscules, espace après le pays (ex. `BE 0865.944.140`).
class VatInputFormatter extends TextInputFormatter {
  VatInputFormatter(this.countryCode);

  String? countryCode;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final formatted = VatNumber.formatLive(newValue.text, countryCode);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Masque de saisie du CNPJ brésilien : 00.000.000/0000-00.
class CnpjInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 14) return oldValue;

    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i == 2 || i == 5) buffer.write('.');
      if (i == 8) buffer.write('/');
      if (i == 12) buffer.write('-');
      buffer.write(digits[i]);
    }

    final text = buffer.toString();
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
