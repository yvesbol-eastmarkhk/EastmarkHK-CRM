import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Devise utilisée pour l'affichage des montants (opportunités, futures
/// factures…) — indépendante de la langue de l'app et de la dictée.
/// Format des nombres imposé partout dans le CRM : séparateur de milliers
/// « , » et décimale « . » (ex. 1,234.56), quel que soit la devise ou la
/// langue de l'interface — voir core/utils/formatters.dart.
class CurrencySettings extends ChangeNotifier {
  CurrencySettings._();
  static final CurrencySettings instance = CurrencySettings._();

  static const _prefKey = 'currency_code';

  /// (code ISO 4217, symbole, drapeau représentatif, libellé)
  static const supported = <(String code, String symbol, String flag, String label)>[
    ('EUR', '€', 'BE', 'Euro'),
    ('USD', '\$', 'US', 'Dollar américain'),
    ('HKD', 'HK\$', 'HK', 'Dollar de Hong Kong'),
    ('GBP', '£', 'GB', 'Livre sterling'),
    ('CNY', '¥', 'CN', 'Yuan chinois'),
    ('BRL', 'R\$', 'BR', 'Réal brésilien'),
    ('JPY', '¥', 'JP', 'Yen japonais'),
    ('CHF', 'CHF', 'CH', 'Franc suisse'),
    ('SGD', 'S\$', 'SG', 'Dollar de Singapour'),
    ('AUD', 'A\$', 'AU', 'Dollar australien'),
    ('CAD', 'C\$', 'CA', 'Dollar canadien'),
    ('INR', '₹', 'IN', 'Roupie indienne'),
    ('AED', 'د.إ', 'AE', 'Dirham (EAU)'),
    ('ZAR', 'R', 'ZA', 'Rand sud-africain'),
    ('MXN', '\$', 'MX', 'Peso mexicain'),
    ('THB', '฿', 'TH', 'Baht thaïlandais'),
    ('VND', '₫', 'VN', 'Dong vietnamien'),
    ('IDR', 'Rp', 'ID', 'Roupie indonésienne'),
    ('MYR', 'RM', 'MY', 'Ringgit malaisien'),
    ('KRW', '₩', 'KR', 'Won sud-coréen'),
  ];

  String _code = 'EUR';
  String get code => _code;

  bool _loaded = false;

  ({String code, String symbol, String flag, String label}) get current {
    final m = supported.firstWhere((c) => c.$1 == _code, orElse: () => supported.first);
    return (code: m.$1, symbol: m.$2, flag: m.$3, label: m.$4);
  }

  /// Devise par défaut à la première install : dérivée de la région système.
  static String defaultFromSystemLocale() {
    final cc = PlatformDispatcher.instance.locale.countryCode?.toUpperCase();
    return switch (cc) {
      'US' => 'USD',
      'HK' => 'HKD',
      'GB' => 'GBP',
      'CN' || 'TW' => 'CNY',
      'JP' => 'JPY',
      'CH' => 'CHF',
      'SG' => 'SGD',
      'AU' => 'AUD',
      'CA' => 'CAD',
      'IN' => 'INR',
      'AE' => 'AED',
      'ZA' => 'ZAR',
      'MX' => 'MXN',
      'TH' => 'THB',
      'VN' => 'VND',
      'ID' => 'IDR',
      'MY' => 'MYR',
      'KR' => 'KRW',
      'BR' => 'BRL',
      'BE' || 'DE' || 'FR' || 'IT' || 'ES' || 'NL' || 'AT' || 'PT' ||
      'IE' || 'FI' || 'LU' =>
        'EUR',
      _ => 'EUR',
    };
  }

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _code = prefs.getString(_prefKey) ?? defaultFromSystemLocale();
    _loaded = true;
  }

  Future<void> setCode(String code) async {
    _code = code;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, code);
  }
}
