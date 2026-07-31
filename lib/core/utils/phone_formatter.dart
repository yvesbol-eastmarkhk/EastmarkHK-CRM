import 'package:dlibphonenumber/dlibphonenumber.dart';
import 'package:flutter/services.dart';

import '../data/countries.dart';

/// Alias ISO fréquents (picker / legacy → libphonenumber).
const _isoAliases = <String, String>{
  'UK': 'GB',
  'EL': 'GR',
  'AN': 'BQ',
};

final PhoneNumberUtil _phoneUtil = PhoneNumberUtil.instance;

String normalizeCountryIso(String? countryCode) {
  if (countryCode == null || countryCode.trim().isEmpty) return '';
  final upper = countryCode.trim().toUpperCase();
  return _isoAliases[upper] ?? upper;
}

/// Pays effectif pour formater le téléphone — [phoneCountryCode] vide
/// retombe sur le pays d'adresse. Si aucun des deux n'est encore choisi,
/// on reste vide plutôt que d'imposer un pays par défaut (ex. Belgique) :
/// le champ affiche alors une icône drapeau neutre jusqu'à sélection.
String effectivePhoneCountry(String? phoneCountryCode, String? addressCountryCode) {
  final phone = normalizeCountryIso(phoneCountryCode);
  if (phone.isNotEmpty) return phone;
  return normalizeCountryIso(addressCountryCode);
}

String? dialCodeForCountry(String? countryCode) {
  final code = normalizeCountryIso(countryCode);
  final fromPicker = CountryInfo.byCode(code)?.dialCode;
  if (fromPicker != null && fromPicker.isNotEmpty) return fromPicker;
  if (code.length != 2) return null;
  try {
    final cc = _phoneUtil.getCountryCodeForRegion(code);
    if (cc == 0) return null;
    return '+$cc';
  } catch (_) {
    return null;
  }
}

/// Préfixe international pour un champ vide (`+32 `).
String phoneDialPrefix(String? countryCode) {
  final dial = dialCodeForCountry(countryCode);
  if (dial == null || dial.isEmpty) return '';
  return dial.endsWith(' ') ? dial : '$dial ';
}

String? phoneExampleHint(String? countryCode) {
  final code = normalizeCountryIso(countryCode);
  if (code.length != 2) return null;
  try {
    final example = _phoneUtil.getExampleNumber(code);
    if (example == null) return null;
    return _phoneUtil.format(example, PhoneNumberFormat.international);
  } catch (_) {
    return null;
  }
}

String _nationalDigits(String input, String dialCode) {
  final trimmed = input.trim();
  if (trimmed.isEmpty) return '';

  final dialDigits = dialCode.replaceAll(RegExp(r'\D'), '');

  if (trimmed.startsWith('+')) {
    try {
      final parsed = _phoneUtil.parse(trimmed, null);
      return '${parsed.nationalNumber}';
    } catch (_) {
      final all = trimmed.replaceAll(RegExp(r'\D'), '');
      if (dialDigits.isNotEmpty && all.startsWith(dialDigits)) {
        return all.substring(dialDigits.length);
      }
      final m = RegExp(r'^\+(\d{1,3})').firstMatch(trimmed.replaceAll(' ', ''));
      if (m != null) {
        final cc = m.group(1)!;
        if (all.startsWith(cc) && all.length > cc.length) {
          return all.substring(cc.length);
        }
      }
      return all;
    }
  }

  var digits = trimmed.replaceAll(RegExp(r'\D'), '');
  if (dialDigits.isNotEmpty &&
      digits.startsWith(dialDigits) &&
      digits.length > dialDigits.length + 3) {
    digits = digits.substring(dialDigits.length);
  }
  return digits;
}

String _formatAsYouTypeInternational(String e164OrPartial, String region) {
  final formatter = _phoneUtil.getAsYouTypeFormatter(region);
  formatter.clear();
  var out = '';
  for (final rune in e164OrPartial.runes) {
    final ch = String.fromCharCode(rune);
    if (ch == '+' || RegExp(r'\d').hasMatch(ch)) {
      out = formatter.inputDigit(ch);
    }
  }
  return out;
}

/// Format international **selon le pays sélectionné** — champ vide → `+32 `,
/// as-you-type via libphonenumber, numéro complet → format international
/// canonique. Ex. Belgique : `+32 4 263 59 20`.
String formatPhoneInternational(String input, String? countryCode) {
  final code = normalizeCountryIso(countryCode);
  final dialCode = dialCodeForCountry(code) ?? '';
  final prefix = phoneDialPrefix(code);
  final trimmed = input.trim();

  if (trimmed.isEmpty) return prefix;

  final onlyDial = trimmed.replaceAll(RegExp(r'[\s-]'), '');
  final dialCompact = dialCode.replaceAll(RegExp(r'[\s-]'), '');
  if (dialCompact.isNotEmpty &&
      (onlyDial == dialCompact ||
          onlyDial == dialCompact.replaceFirst('+', '') ||
          onlyDial == '+${dialCompact.replaceFirst('+', '')}')) {
    return prefix.isNotEmpty ? prefix : trimmed;
  }

  final region = code.length == 2 ? code : 'ZZ';
  final national = _nationalDigits(trimmed, dialCode);

  String? e164Partial;
  if (dialCompact.isNotEmpty) {
    final n = national.startsWith('0') && national.length > 1
        ? national.substring(1)
        : national;
    e164Partial = n.isEmpty
        ? dialCode.replaceAll(' ', '')
        : '+${dialCompact.replaceFirst('+', '')}$n';
  } else if (trimmed.startsWith('+')) {
    e164Partial = trimmed.replaceAll(RegExp(r'[^\d+]'), '');
  }

  if (e164Partial != null && e164Partial.length > 3) {
    try {
      final parsed = _phoneUtil.parse(
        e164Partial,
        region == 'ZZ' ? null : region,
      );
      if (_phoneUtil.isValidNumber(parsed)) {
        return _phoneUtil.format(parsed, PhoneNumberFormat.international);
      }
    } catch (_) {}
  }

  if (e164Partial != null && e164Partial.isNotEmpty) {
    final typed = _formatAsYouTypeInternational(
      e164Partial,
      region == 'ZZ' ? 'US' : region,
    );
    if (typed.trim().isNotEmpty) return typed;
  }

  if (dialCode.isNotEmpty) {
    if (national.isEmpty) return prefix;
    return '$dialCode $national';
  }
  return trimmed;
}

/// Masque de saisie international (format as-you-type).
class PhoneInputFormatter extends TextInputFormatter {
  PhoneInputFormatter(this.countryCode);

  String? countryCode;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final formatted = formatPhoneInternational(newValue.text, countryCode);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
