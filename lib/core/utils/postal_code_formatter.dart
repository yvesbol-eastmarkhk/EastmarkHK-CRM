/// Formate le code postal selon le modèle du pays sélectionné. Portage
/// d'EastmarkHK e-Invoicing.
String formatPostalCode(String input, String? countryCode) {
  final code = countryCode?.toUpperCase();
  if (code == null || code.isEmpty) return input.trim();

  switch (code) {
    case 'BR': // CEP : 37538-050
      var digits = input.replaceAll(RegExp(r'\D'), '');
      if (digits.length > 8) digits = digits.substring(0, 8);
      if (digits.length > 5) {
        return '${digits.substring(0, 5)}-${digits.substring(5)}';
      }
      return digits;

    case 'US': // 90210 ou 90210-1234
      var digits = input.replaceAll(RegExp(r'\D'), '');
      if (digits.length > 9) digits = digits.substring(0, 9);
      if (digits.length > 5) {
        return '${digits.substring(0, 5)}-${digits.substring(5)}';
      }
      return digits;

    case 'PL': // 00-001
      var digits = input.replaceAll(RegExp(r'\D'), '');
      if (digits.length > 5) digits = digits.substring(0, 5);
      if (digits.length > 2) {
        return '${digits.substring(0, 2)}-${digits.substring(2)}';
      }
      return digits;

    case 'PT': // 1000-001
      var digits = input.replaceAll(RegExp(r'\D'), '');
      if (digits.length > 7) digits = digits.substring(0, 7);
      if (digits.length > 4) {
        return '${digits.substring(0, 4)}-${digits.substring(4)}';
      }
      return digits;

    case 'JP': // 100-0001
      var digits = input.replaceAll(RegExp(r'\D'), '');
      if (digits.length > 7) digits = digits.substring(0, 7);
      if (digits.length > 3) {
        return '${digits.substring(0, 3)}-${digits.substring(3)}';
      }
      return digits;

    case 'NL': // 1011 AB
      final cleaned = input.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
      if (cleaned.length <= 4) return cleaned;
      final letters = cleaned.substring(4).replaceAll(RegExp(r'[^A-Z]'), '');
      return '${cleaned.substring(0, 4)} ${letters.substring(0, letters.length.clamp(0, 2))}'
          .trim();

    case 'CA': // K1A 1A1
      final cleaned = input.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
      if (cleaned.length <= 3) return cleaned;
      if (cleaned.length <= 6) {
        return '${cleaned.substring(0, 3)} ${cleaned.substring(3)}';
      }
      return '${cleaned.substring(0, 3)} ${cleaned.substring(3, 6)} ${cleaned.substring(6, 7)}';

    case 'SE': // 111 20
      var digits = input.replaceAll(RegExp(r'\D'), '');
      if (digits.length > 5) digits = digits.substring(0, 5);
      if (digits.length > 3) {
        return '${digits.substring(0, 3)} ${digits.substring(3)}';
      }
      return digits;

    case 'BE':
    case 'AT':
    case 'CH':
    case 'NO':
    case 'DK':
      var digits = input.replaceAll(RegExp(r'\D'), '');
      const max = 4;
      return digits.length > max ? digits.substring(0, max) : digits;

    case 'DE':
    case 'FR':
    case 'IT':
    case 'ES':
      var digits = input.replaceAll(RegExp(r'\D'), '');
      if (digits.length > 5) digits = digits.substring(0, 5);
      return digits;

    case 'GB':
      return input.toUpperCase().trim();

    default:
      return input.trim();
  }
}

/// Clé stable pour la recherche automatique (ignore les différences de format).
String postalLookupKey(String? countryCode, String postal) {
  final code = countryCode?.toUpperCase() ?? '';
  return '$code:${formatPostalCode(postal.trim(), countryCode)}';
}

int postalSignificantLength(String input, String? countryCode) {
  switch (countryCode?.toUpperCase()) {
    case 'NL':
    case 'CA':
    case 'GB':
      return input.replaceAll(RegExp(r'[^A-Z0-9]', caseSensitive: false), '').length;
    default:
      return input.replaceAll(RegExp(r'\D'), '').length;
  }
}

String? postalHintForCountry(String? countryCode) {
  switch (countryCode?.toUpperCase()) {
    case 'BR':
      return '37538-050';
    case 'US':
      return '90210';
    case 'BE':
      return '4432';
    case 'NL':
      return '1011 AB';
    case 'PL':
      return '00-001';
    case 'PT':
      return '1000-001';
    case 'JP':
      return '100-0001';
    case 'CA':
      return 'K1A 1A1';
    case 'SE':
      return '111 20';
    case 'DE':
      return '10115';
    case 'FR':
      return '75001';
    case 'GB':
      return 'SW1A 1AA';
    default:
      return null;
  }
}

int minPostalLengthForLookup(String? countryCode) {
  switch (countryCode?.toUpperCase()) {
    case 'US':
      return 5;
    case 'BE':
    case 'CH':
    case 'AT':
      return 4;
    case 'BR':
      return 8;
    case 'GB':
      return 5;
    default:
      return 3;
  }
}
