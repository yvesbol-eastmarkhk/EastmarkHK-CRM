import 'package:country_picker/country_picker.dart';

/// Informations pays (nom, code ISO, indicatif, format d'adresse) — couvre
/// tous les pays via `country_picker`, avec des règles d'affichage
/// d'adresse spécifiques par pays (état/province, district/quartier/bairro,
/// TVA/CNPJ…). Portage du même moteur qu'EastmarkHK e-Invoicing, réutilisé
/// ici pour la fiche société (Réglages) et, plus tard, la fiche client.
class CountryInfo {
  CountryInfo({
    required this.code,
    required this.name,
    required this.dialCode,
    this.postalExample,
    this.usesEori = false,
  });

  final String code; // ISO-2, ex: BE
  final String name;
  final String dialCode; // ex: +32
  final String? postalExample;
  final bool usesEori;

  @override
  String toString() => name;

  bool get isBrazil => code == 'BR';

  /// Quartier / bairro / colonia — fait partie de l'adresse standard dans ces pays.
  bool get usesDistrict => _districtCountryCodes.contains(code);

  /// Province / état affiché dans la ligne code postal + ville (US, CA, BR,
  /// AU…). La majorité de l'Europe (BE, FR, DE, NL…) n'affiche que code
  /// postal + ville.
  bool get usesStateInPostalLine => _stateInPostalLineCodes.contains(code);

  static const _stateInPostalLineCodes = {
    'US', 'CA', 'BR', 'AU', 'MX', 'IN', 'AR', 'CL', 'CO', 'PE', 'VE', 'EC', 'BO', 'PY', 'UY',
    'MY', 'ID', 'PH', 'NG', 'ZA', 'RU', 'UA', 'CN', 'KR', 'NZ', 'PK', 'BD', 'TH', 'VN',
  };

  String get districtLabel => switch (code) {
        'BR' => 'Bairro',
        'MX' => 'Colonia',
        'PT' => 'Bairro',
        'AR' || 'UY' || 'PY' => 'Barrio',
        _ => 'Quartier',
      };

  static const _districtCountryCodes = {
    'AR', 'BO', 'BR', 'CL', 'CO', 'CR', 'DO', 'EC', 'MX', 'PA', 'PE', 'PT', 'PY', 'UY', 'VE',
  };

  bool get isEuMember => euCountryCodes.contains(code);

  static const euCountryCodes = {
    'AT', 'BE', 'BG', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI', 'FR', 'DE', 'GR', 'HU',
    'IE', 'IT', 'LV', 'LT', 'LU', 'MT', 'NL', 'PL', 'PT', 'RO', 'SK', 'SI', 'ES', 'SE',
  };

  static const _postalExamples = {
    'BE': '4432',
    'US': '90210',
    'GB': 'SW1A 1AA',
    'FR': '75001',
    'DE': '10115',
    'NL': '1011 AB',
    'BR': '37538-050',
    'CA': 'K1A 0B1',
    'AU': '2000',
    'JP': '100-0001',
  };

  static List<CountryInfo>? _cache;

  static List<CountryInfo> get all {
    _cache ??= CountryService()
        .getAll()
        .map(CountryInfo.fromPicker)
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    return _cache!;
  }

  factory CountryInfo.fromPicker(Country country) {
    final code = country.countryCode;
    return CountryInfo(
      code: code,
      name: country.name,
      dialCode: '+${country.phoneCode}',
      postalExample: _postalExamples[code],
      usesEori: euCountryCodes.contains(code) || code == 'GB',
    );
  }

  static CountryInfo? byCode(String? code) {
    if (code == null || code.isEmpty) return null;
    final upper = code.toUpperCase();
    for (final c in all) {
      if (c.code == upper) return c;
    }
    return null;
  }
}

/// Libellé du numéro fiscal selon le pays (TVA, EIN, CNPJ…).
String taxIdLabelForCountry(String? countryCode) {
  switch (countryCode?.toUpperCase()) {
    case 'BR':
      return 'CNPJ';
    case 'US':
      return 'EIN / Tax ID';
    case 'GB':
      return 'N° TVA (VAT)';
    default:
      final country = CountryInfo.byCode(countryCode);
      if (country?.isEuMember == true) return 'N° TVA';
      return 'N° fiscal / TVA';
  }
}

/// Pays où un n° fiscal est attendu sur les documents (facturation
/// électronique / TVA). Hong Kong, Macao, etc. n'en ont pas — le CRM
/// rattache alors le client e-Invoicing par lien mémorisé, email, téléphone
/// ou nom, jamais en exigeant un CNPJ/TVA.
bool countryExpectsTaxId(String? countryCode) {
  final cc = countryCode?.toUpperCase();
  if (cc == null || cc.isEmpty) return false;
  if (cc == 'HK' || cc == 'MO') return false;
  if (cc == 'BR' || cc == 'US' || cc == 'GB') return true;
  if (cc == 'CH' || cc == 'NO' || cc == 'IS' || cc == 'LI') return true;
  return CountryInfo.byCode(cc)?.isEuMember == true;
}

bool showCnpjField(String? countryCode) => countryCode?.toUpperCase() == 'BR';

bool showVatField(String? countryCode) {
  if (countryCode == null) return false;
  if (countryCode.toUpperCase() == 'BR') return false;
  return countryExpectsTaxId(countryCode);
}

/// Affiche le champ fiscal (TVA ou CNPJ) seulement si le pays en attend un.
bool showTaxIdField(String? countryCode) =>
    showCnpjField(countryCode) || showVatField(countryCode);

/// Peppol / e-facture UE — uniquement pays membres UE (+ GB souvent Peppol).
bool countryUsesPeppol(String? countryCode) {
  final cc = countryCode?.toUpperCase();
  if (cc == null || cc.isEmpty) return false;
  if (cc == 'GB') return true;
  return CountryInfo.byCode(cc)?.isEuMember == true;
}

/// Facture électronique brésilienne (NF-e) — pas Peppol.
bool countryUsesBrazilEInvoice(String? countryCode) =>
    countryCode?.toUpperCase() == 'BR';

/// Flex relatif du champ fiscal selon le format (CNPJ plus large que TVA).
int taxIdFlexForCountry(String? countryCode) {
  switch (countryCode?.toUpperCase()) {
    case 'BR':
      return 3; // 00.000.000/0000-00
    case 'US':
      return 2;
    case 'GB':
      return 2;
    default:
      return 2; // N° TVA UE
  }
}

/// Flex du sélecteur pays — assez large pour le plus long nom de pays.
int countryPickerFlex({required bool withTaxId}) => withTaxId ? 3 : 3;

bool showDistrictField(String? countryCode) =>
    CountryInfo.byCode(countryCode)?.usesDistrict ?? false;

bool showStateField(String? countryCode) =>
    CountryInfo.byCode(countryCode)?.usesStateInPostalLine ?? false;

/// Pays sans système de code postal — Hong Kong et Macau notamment.
/// L'adresse s'y adapte : pas de champ CP du tout, plutôt que vide.
const _noPostalCodeCountries = {'HK', 'MO'};

bool showPostalCodeField(String? countryCode) =>
    !_noPostalCodeCountries.contains(countryCode?.toUpperCase());

/// Libellé court du taux de vente selon le pays du fournisseur (vendeur).
String salesTaxLabelForCountry(
  String? countryCode, {
  String localizedVat = 'TVA',
  String localizedSalesTax = 'Sales tax',
  String localizedGst = 'GST',
}) {
  switch (countryCode?.toUpperCase()) {
    case 'BR':
      return 'ICMS';
    case 'SG':
    case 'AU':
    case 'NZ':
    case 'IN':
      return localizedGst;
    case 'CA':
      return 'GST/HST';
    case 'US':
      return localizedSalesTax;
    case 'MY':
      return 'SST';
    case 'ID':
      return 'PPN';
    case 'GB':
    case 'JE':
    case 'GG':
    case 'IM':
      return 'VAT';
    default:
      return localizedVat;
  }
}

/// Code douanier : NCM seulement au Brésil, sinon HS.
String hsCodeLabelForCountry(
  String? countryCode, {
  String hsCode = 'Code HS',
  String ncm = 'NCM',
}) {
  if (countryCode?.toUpperCase() == 'BR') return ncm;
  return hsCode;
}
