/// Client / prospect — toute affaire commence ici.
/// Le pays pilote le format des champs (adresse, téléphone, n° fiscal…).
class Client {
  Client({
    required this.id,
    required this.name,
    this.contactName,
    this.country,
    this.taxId,
    this.peppolId,
    this.website,
    this.email,
    this.phone,
    this.phoneCountry,
    this.address,
    this.district,
    this.zip,
    this.city,
    this.state,
    this.tags = const [],
    this.notes,
    this.useEInvoicing = false,
    this.status = ClientStatus.prospect,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  String name;
  /// Personne de contact (comme e-Invoicing) — distincte des contacts détaillés.
  String? contactName;
  String? country;
  String? taxId;
  String? peppolId;
  String? website;
  String? email;
  String? phone;
  String? phoneCountry;
  String? address;
  String? district;
  String? zip;
  String? city;
  String? state;
  List<String> tags;
  String? notes;
  bool useEInvoicing;
  ClientStatus status;
  final String createdAt;
  String updatedAt;
  String? deletedAt;

  String get locationLabel {
    final parts = <String>[
      if (city != null && city!.trim().isNotEmpty) city!.trim(),
      if (country != null && country!.trim().isNotEmpty) country!.trim(),
    ];
    return parts.join(', ');
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'name': name,
        'contact_name': contactName,
        'country': country,
        'tax_id': taxId,
        'peppol_id': peppolId,
        'website': website,
        'email': email,
        'phone': phone,
        'phone_country': phoneCountry,
        'address': address,
        'district': district,
        'zip': zip,
        'city': city,
        'state': state,
        'tags': tags.join(','),
        'notes': notes,
        'use_einvoicing': useEInvoicing ? 1 : 0,
        'status': status.name,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  factory Client.fromMap(Map<String, Object?> m) => Client(
        id: m['id'] as String,
        name: m['name'] as String,
        contactName: m['contact_name'] as String?,
        country: m['country'] as String?,
        taxId: m['tax_id'] as String?,
        peppolId: m['peppol_id'] as String?,
        website: m['website'] as String?,
        email: m['email'] as String?,
        phone: m['phone'] as String?,
        phoneCountry: m['phone_country'] as String?,
        address: m['address'] as String?,
        district: m['district'] as String?,
        zip: m['zip'] as String?,
        city: m['city'] as String?,
        state: m['state'] as String?,
        tags: ((m['tags'] as String?) ?? '')
            .split(',')
            .map((t) => t.trim())
            .where((t) => t.isNotEmpty)
            .toList(),
        notes: m['notes'] as String?,
        useEInvoicing: (m['use_einvoicing'] as int?) == 1,
        status: ClientStatus.fromName(m['status'] as String?),
        createdAt: m['created_at'] as String,
        updatedAt: m['updated_at'] as String,
        deletedAt: m['deleted_at'] as String?,
      );
}

enum ClientStatus {
  prospect,
  active,
  inactive;

  static ClientStatus fromName(String? name) {
    for (final v in values) {
      if (v.name == name) return v;
    }
    return ClientStatus.prospect;
  }

  String get label => switch (this) {
        ClientStatus.prospect => 'Prospect',
        ClientStatus.active => 'Client',
        ClientStatus.inactive => 'Inactif',
      };
}
