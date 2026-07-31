import 'dart:convert';

import 'package:http/http.dart' as http;

/// Résultat d'une recherche par code postal — ville, état/province, quartier
/// (bairro/colonia), pré-remplissage de la rue si disponible.
class PostalLookupResult {
  const PostalLookupResult({
    required this.city,
    this.state,
    this.stateCode,
    this.addressLine1,
    this.district,
  });

  final String city;
  final String? state;
  final String? stateCode;
  final String? addressLine1;
  final String? district;

  String labelForCountry(String countryCode) {
    final parts = [city, state, district]
        .whereType<String>()
        .where((s) => s.isNotEmpty);
    return parts.join(' · ');
  }
}

class PostalLookupException implements Exception {
  PostalLookupException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Recherche d'adresse à partir du code postal — ViaCEP pour le Brésil,
/// Zippopotam.us pour les autres pays. Portage d'EastmarkHK e-Invoicing.
class PostalLookupService {
  PostalLookupService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<PostalLookupResult>> lookupAll({
    required String countryCode,
    required String postalCode,
  }) async {
    final code = countryCode.toUpperCase();
    final zip = postalCode.trim();
    if (zip.isEmpty) {
      throw PostalLookupException('Saisissez d\'abord un code postal');
    }
    if (code == 'BR') {
      final single = await _lookupBrazil(zip);
      return [single];
    }
    return _lookupZippopotamAll(code, zip);
  }

  Future<PostalLookupResult> _lookupBrazil(String postalCode) async {
    final digits = postalCode.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 8) {
      throw PostalLookupException('Le CEP brésilien doit avoir 8 chiffres');
    }
    final response = await _client.get(
      Uri.parse('https://viacep.com.br/ws/$digits/json/'),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw PostalLookupException('Échec de la recherche CEP (${response.statusCode})');
    }
    final json = jsonDecode(response.body);
    if (json is! Map<String, dynamic>) {
      throw PostalLookupException('Réponse CEP invalide');
    }
    if (json['erro'] == true) {
      throw PostalLookupException('CEP introuvable');
    }
    return PostalLookupResult(
      city: json['localidade'] as String? ?? '',
      state: json['uf'] as String?,
      stateCode: json['uf'] as String?,
      addressLine1: json['logradouro'] as String?,
      district: json['bairro'] as String?,
    );
  }

  Future<List<PostalLookupResult>> _lookupZippopotamAll(
      String countryCode, String postalCode) async {
    final normalized = postalCode.replaceAll(' ', '-');
    final uri = Uri.parse('https://api.zippopotam.us/${countryCode.toLowerCase()}/$normalized');
    final response = await _client.get(uri, headers: {'Accept': 'application/json'});

    if (response.statusCode == 404) {
      throw PostalLookupException('Code postal introuvable pour $countryCode');
    }
    if (response.statusCode != 200) {
      throw PostalLookupException('Échec de la recherche (${response.statusCode})');
    }
    final json = jsonDecode(response.body);
    if (json is! Map<String, dynamic>) {
      throw PostalLookupException('Réponse invalide');
    }
    final places = json['places'];
    if (places is! List || places.isEmpty) {
      throw PostalLookupException('Aucune ville trouvée pour ce code postal');
    }
    return places.map((place) {
      final p = place as Map<String, dynamic>;
      return PostalLookupResult(
        city: p['place name'] as String? ?? '',
        state: p['state'] as String?,
        stateCode: p['state abbreviation'] as String?,
      );
    }).toList();
  }
}
