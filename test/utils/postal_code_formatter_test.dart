import 'package:flutter_test/flutter_test.dart';

import 'package:eastmarkhk_crm/core/utils/postal_code_formatter.dart';

void main() {
  group('formatPostalCode', () {
    test('Brazil CEP: 37538050 -> 37538-050', () {
      expect(formatPostalCode('37538050', 'BR'), '37538-050');
    });

    test('Brazil CEP truncates beyond 8 digits', () {
      expect(formatPostalCode('375380501234', 'BR'), '37538-050');
    });

    test('US ZIP+4: 902101234 -> 90210-1234', () {
      expect(formatPostalCode('902101234', 'US'), '90210-1234');
    });

    test('US ZIP without extension stays plain', () {
      expect(formatPostalCode('90210', 'US'), '90210');
    });

    test('Poland: 00001 -> 00-001', () {
      expect(formatPostalCode('00001', 'PL'), '00-001');
    });

    test('Portugal: 1000001 -> 1000-001', () {
      expect(formatPostalCode('1000001', 'PT'), '1000-001');
    });

    test('Japan: 1000001 -> 100-0001', () {
      expect(formatPostalCode('1000001', 'JP'), '100-0001');
    });

    test('Netherlands: 1011ab -> 1011 AB', () {
      expect(formatPostalCode('1011ab', 'NL'), '1011 AB');
    });

    test('Canada: k1a1a1 -> K1A 1A1', () {
      expect(formatPostalCode('k1a1a1', 'CA'), 'K1A 1A1');
    });

    test('Sweden: 11120 -> 111 20', () {
      expect(formatPostalCode('11120', 'SE'), '111 20');
    });

    test('Belgium caps at 4 digits, no separator', () {
      expect(formatPostalCode('44320', 'BE'), '4432');
    });

    test('Germany caps at 5 digits', () {
      expect(formatPostalCode('101150', 'DE'), '10115');
    });

    test('United Kingdom uppercases and trims', () {
      expect(formatPostalCode(' sw1a 1aa ', 'GB'), 'SW1A 1AA');
    });

    test('unknown country just trims the input', () {
      expect(formatPostalCode('  1234  ', 'ZZ'), '1234');
    });

    test('null/empty country code returns trimmed input unchanged', () {
      expect(formatPostalCode('  1234  ', null), '1234');
    });
  });

  group('postalSignificantLength', () {
    test('counts alphanumeric characters for NL/CA/GB', () {
      expect(postalSignificantLength('1011 AB', 'NL'), 6);
      expect(postalSignificantLength('K1A 1A1', 'CA'), 6);
    });

    test('counts digits only for other countries', () {
      expect(postalSignificantLength('4432', 'BE'), 4);
      expect(postalSignificantLength('37538-050', 'BR'), 8);
    });
  });

  group('minPostalLengthForLookup', () {
    test('returns the expected minimum per country', () {
      expect(minPostalLengthForLookup('US'), 5);
      expect(minPostalLengthForLookup('BE'), 4);
      expect(minPostalLengthForLookup('BR'), 8);
      expect(minPostalLengthForLookup('GB'), 5);
    });

    test('defaults to 3 for an unlisted country', () {
      expect(minPostalLengthForLookup('ZZ'), 3);
    });
  });

  group('postalLookupKey', () {
    test('combines the uppercased country with the formatted postal code', () {
      expect(postalLookupKey('be', '4432'), 'BE:4432');
    });
  });
}
