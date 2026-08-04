import '../../models/client.dart';
import '../../models/contact.dart';

/// Téléphone / e-mail utiles pour un suivi — contact prioritaire puis fiche client.
class ClientReachability {
  const ClientReachability({
    this.phone,
    this.email,
    this.sourceLabel,
  });

  final String? phone;
  final String? email;
  final String? sourceLabel;

  bool get hasPhone => phone != null && phone!.trim().isNotEmpty;
  bool get hasEmail => email != null && email!.trim().isNotEmpty;
}

ClientReachability resolveClientReachability(
  Client? client, {
  List<Contact> contacts = const [],
}) {
  if (client == null) return const ClientReachability();

  Contact? primary;
  for (final c in contacts) {
    if (c.isPrimary) {
      primary = c;
      break;
    }
  }
  final ordered = [
    ?primary,
    ...contacts.where((c) => c.id != primary?.id),
  ];

  String? phone;
  String? email;
  String? source;

  for (final c in ordered) {
    if (phone == null && (c.phone ?? '').trim().isNotEmpty) {
      phone = c.phone!.trim();
      source = c.displayName;
    }
    if (email == null && (c.email ?? '').trim().isNotEmpty) {
      email = c.email!.trim();
      source ??= c.displayName;
    }
    if (phone != null && email != null) break;
  }

  if (phone == null && (client.phone ?? '').trim().isNotEmpty) {
    phone = client.phone!.trim();
    source ??= client.name;
  }
  if (email == null && (client.email ?? '').trim().isNotEmpty) {
    email = client.email!.trim();
    source ??= client.name;
  }

  return ClientReachability(phone: phone, email: email, sourceLabel: source);
}

/// Mailto avec référence CRM dans l’objet (retrouver l’échange plus tard).
String buildCrmMailto({
  required String email,
  required String taskId,
  String? subjectHint,
  String? clientName,
}) {
  final short = taskId.length > 8 ? taskId.substring(0, 8) : taskId;
  final ref = 'EMHK-$short';
  final subject = '${subjectHint ?? 'Suivi CRM'} [$ref]';
  final body = StringBuffer()
    ..writeln()
    ..writeln()
    ..writeln('—')
    ..writeln('Réf. CRM : $ref');
  if (clientName != null && clientName.trim().isNotEmpty) {
    body.writeln('Client : ${clientName.trim()}');
  }
  body.writeln(
    'Conservez cette référence dans l’objet pour retrouver l’échange depuis le CRM.',
  );
  return Uri(
    scheme: 'mailto',
    path: email.trim(),
    queryParameters: {
      'subject': subject,
      'body': body.toString(),
    },
  ).toString();
}

String crmEmailRef(String taskId) {
  final short = taskId.length > 8 ? taskId.substring(0, 8) : taskId;
  return 'EMHK-$short';
}
