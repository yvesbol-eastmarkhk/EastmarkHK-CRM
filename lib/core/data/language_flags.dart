/// Drapeau représentatif pour une langue d'interface / de dictée.
///
/// On mappe le code langue (ou le suffixe pays d'un locale `fr_FR`) vers
/// un code ISO pays utilisé par [CountryFlagIcon].
String? flagCountryForLanguage(String languageOrLocale) {
  final raw = languageOrLocale.trim();
  if (raw.isEmpty) return null;

  // Locale complet : fr_FR, pt-BR, en_US…
  final parts = raw.replaceAll('-', '_').split('_');
  if (parts.length >= 2) {
    final region = parts.last.toUpperCase();
    if (region.length == 2) return region;
  }

  return switch (parts.first.toLowerCase()) {
    'fr' => 'FR',
    'en' => 'GB',
    'nl' => 'NL',
    'de' => 'DE',
    'es' => 'ES',
    'pt' => 'PT',
    'it' => 'IT',
    'zh' => 'CN',
    'ja' => 'JP',
    'ko' => 'KR',
    'th' => 'TH',
    'vi' => 'VN',
    'id' => 'ID',
    'ms' => 'MY',
    'ru' => 'RU',
    'uk' => 'UA',
    'pl' => 'PL',
    'tr' => 'TR',
    'ar' => 'SA',
    'he' => 'IL',
    'hi' => 'IN',
    'bn' => 'BD',
    'ta' => 'IN',
    'te' => 'IN',
    'mr' => 'IN',
    'gu' => 'IN',
    'kn' => 'IN',
    'ml' => 'IN',
    'pa' => 'IN',
    'ur' => 'PK',
    'el' => 'GR',
    'sv' => 'SE',
    'da' => 'DK',
    'no' => 'NO',
    'fi' => 'FI',
    'cs' => 'CZ',
    'ro' => 'RO',
    'hu' => 'HU',
    'sk' => 'SK',
    'bg' => 'BG',
    'hr' => 'HR',
    'sr' => 'RS',
    'sw' => 'KE',
    'fil' || 'tl' => 'PH',
    _ => null,
  };
}
