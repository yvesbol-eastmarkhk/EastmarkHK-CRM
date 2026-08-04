import 'package:flutter_test/flutter_test.dart';

import 'package:eastmarkhk_crm/core/utils/vat_number.dart';

void main() {
  group('VatNumber.vatPrefix', () {
    test('returns "BE " for Belgium', () {
      expect(VatNumber.vatPrefix('BE'), 'BE ');
    });

    test('maps Greece (GR) to the EU prefix EL', () {
      expect(VatNumber.vatPrefix('GR'), 'EL ');
    });

    test('returns empty for a non-EU / non-GB country like Hong Kong', () {
      expect(VatNumber.vatPrefix('HK'), '');
    });

    test('returns empty for Brazil (has its own CNPJ format)', () {
      expect(VatNumber.vatPrefix('BR'), '');
    });

    test('returns empty when country code is null or blank', () {
      expect(VatNumber.vatPrefix(null), '');
      expect(VatNumber.vatPrefix('  '), '');
    });
  });

  group('VatNumber.normalize', () {
    test('strips spaces, dots and dashes and uppercases', () {
      expect(
        VatNumber.normalize('be 0865.944-140', countryCode: 'BE'),
        'BE0865944140',
      );
    });

    test('adds the country prefix when missing', () {
      expect(VatNumber.normalize('0865944140', countryCode: 'BE'), 'BE0865944140');
    });

    test('does not prefix numbers for non-EU countries', () {
      expect(VatNumber.normalize('12345678', countryCode: 'HK'), '12345678');
    });

    test('collapses a doubled prefix from pasted text (BEBE...)', () {
      expect(
        VatNumber.normalize('BEBE0865944140', countryCode: 'BE'),
        'BE0865944140',
      );
    });

    test('drops a stale prefix when switching country (BE -> FR)', () {
      // Regression guard: switching the address country from Belgium to
      // France must not leave "BE" glued in front of a French number.
      final result = VatNumber.normalize('BE0865944140', countryCode: 'FR');
      expect(result.startsWith('BE'), isFalse);
    });

    test('returns empty string for empty input', () {
      expect(VatNumber.normalize('', countryCode: 'BE'), '');
    });
  });

  group('VatNumber.formatDisplay', () {
    test('formats a Belgian VAT number with dot grouping', () {
      expect(
        VatNumber.formatDisplay('BE0865944140', countryCode: 'BE'),
        'BE 0865.944.140',
      );
    });

    test('formats a French VAT number (2 + 3 groups of digits)', () {
      expect(
        VatNumber.formatDisplay('FR12345678901', countryCode: 'FR'),
        'FR 12 345 678 901',
      );
    });

    test('formats a German VAT number in 3-3-3 groups', () {
      expect(
        VatNumber.formatDisplay('DE123456789', countryCode: 'DE'),
        'DE 123 456 789',
      );
    });

    test('formats a Luxembourg VAT number in 3-3-2 groups', () {
      expect(
        VatNumber.formatDisplay('LU12345678', countryCode: 'LU'),
        'LU 123 456 78',
      );
    });

    test('falls back to "CC body" for an unrecognised pattern', () {
      expect(
        VatNumber.formatDisplay('IT1234', countryCode: 'IT'),
        'IT 1234',
      );
    });
  });
}
