import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/gen/app_localizations.dart';
import '../models/models.dart';

/// Une messagerie utilisable pour joindre un contact — la correspondance
/// réelle passe aujourd'hui par WhatsApp, WeChat, iMessage… bien plus que
/// par l'email. [id] est stocké tel quel dans `messaging_json` (stable même
/// si le libellé affiché change plus tard).
///
/// Logos SVG locaux (`assets/messaging/`, Simple Icons CC0) — repli Material.
class MessagingPlatformInfo {
  const MessagingPlatformInfo({
    required this.id,
    required this.label,
    required this.icon,
    required this.color,
    required this.hint,
    this.logoAsset,
    this.buildUrl,
    this.openNote,
  });

  final String id;
  final String label;
  final IconData icon;
  final Color color;

  /// Chemin asset SVG (ex. `assets/messaging/whatsapp.svg`) — null = icône.
  final String? logoAsset;

  /// Exemple de format attendu pour le champ identifiant (numéro, pseudo…).
  final String hint;

  /// Construit l'URL de lancement à partir de la valeur saisie — `null` si
  /// cette plateforme n'a pas de schéma de lien fiable (ex. WeChat).
  final String? Function(String value)? buildUrl;

  /// Limite honnête à afficher quand l'ouverture ne peut pas présélectionner
  /// le contact (certaines applis n'exposent pas ce lien publiquement).
  final String? openNote;
}

String _digitsAndPlus(String v) => v.replaceAll(RegExp(r'[^\d+]'), '');
String _digitsOnly(String v) => v.replaceAll(RegExp(r'\D'), '');

const messagingPlatforms = <MessagingPlatformInfo>[
  MessagingPlatformInfo(
    id: 'whatsapp',
    label: 'WhatsApp',
    icon: Icons.chat,
    color: Color(0xFF25D366),
    logoAsset: 'assets/messaging/whatsapp.svg',
    hint: '+852 1234 5678',
  ),
  MessagingPlatformInfo(
    id: 'imessage',
    label: 'iMessage / SMS',
    icon: Icons.sms,
    color: Color(0xFF34DA50),
    logoAsset: 'assets/messaging/imessage.svg',
    hint: '+852 1234 5678',
  ),
  MessagingPlatformInfo(
    id: 'wechat',
    label: 'WeChat (微信)',
    icon: Icons.chat_bubble,
    color: Color(0xFF07C160),
    logoAsset: 'assets/messaging/wechat.svg',
    hint: 'ID WeChat',
    openNote:
        "WeChat n'expose pas de lien public vers un contact précis — l'appli s'ouvre, la conversation reste à sélectionner à la main.",
  ),
  MessagingPlatformInfo(
    id: 'telegram',
    label: 'Telegram',
    icon: Icons.send,
    color: Color(0xFF26A5E4),
    logoAsset: 'assets/messaging/telegram.svg',
    hint: '@pseudo',
  ),
  MessagingPlatformInfo(
    id: 'signal',
    label: 'Signal',
    icon: Icons.shield,
    color: Color(0xFF3B45FD),
    logoAsset: 'assets/messaging/signal.svg',
    hint: '+852 1234 5678',
  ),
  MessagingPlatformInfo(
    id: 'messenger',
    label: 'Messenger',
    icon: Icons.forum,
    color: Color(0xFF0866FF),
    logoAsset: 'assets/messaging/messenger.svg',
    hint: 'pseudo.facebook',
  ),
  MessagingPlatformInfo(
    id: 'line',
    label: 'Line',
    icon: Icons.chat,
    color: Color(0xFF00C300),
    logoAsset: 'assets/messaging/line.svg',
    hint: 'ID Line',
  ),
  MessagingPlatformInfo(
    id: 'viber',
    label: 'Viber',
    icon: Icons.phone_in_talk,
    color: Color(0xFF7360F2),
    logoAsset: 'assets/messaging/viber.svg',
    hint: '+852 1234 5678',
  ),
  MessagingPlatformInfo(
    id: 'kakaotalk',
    label: 'KakaoTalk',
    icon: Icons.chat,
    color: Color(0xFFFFCD00),
    logoAsset: 'assets/messaging/kakaotalk.svg',
    hint: 'ID KakaoTalk',
    openNote:
        "KakaoTalk n'expose pas de lien public vers un contact précis — l'appli s'ouvre, la conversation reste à sélectionner à la main.",
  ),
  MessagingPlatformInfo(
    id: 'phone',
    label: 'Appel téléphonique',
    icon: Icons.call,
    color: Color(0xFF34A853),
    hint: '+852 1234 5678',
  ),
];

MessagingPlatformInfo platformById(String id) => messagingPlatforms.firstWhere(
      (p) => p.id == id,
      orElse: () => messagingPlatforms.first,
    );

/// Libellé affiché d'une plateforme — la plupart sont des noms de marque
/// (WhatsApp, Telegram…) qui ne se traduisent pas, seul "Appel téléphonique"
/// a besoin d'une vraie traduction. Les libellés bruts de
/// [MessagingPlatformInfo] restent `const` (pas de BuildContext
/// disponible à la définition de la liste) — ce helper fait la résolution
/// au moment de l'affichage.
String platformLabel(BuildContext context, String id) {
  if (id == 'phone') return AppLocalizations.of(context).messagingPhoneCallLabel;
  return platformById(id).label;
}

/// Note d'utilisation traduite (WeChat/KakaoTalk : pas de lien direct vers
/// un contact précis) — voir [platformLabel] pour le même principe.
String? platformOpenNote(BuildContext context, String id) {
  final l10n = AppLocalizations.of(context);
  return switch (id) {
    'wechat' => l10n.messagingWechatNote,
    'kakaotalk' => l10n.messagingKakaotalkNote,
    _ => null,
  };
}

/// URL de lancement pour un canal donné — construite ici plutôt que dans
/// [MessagingPlatformInfo.buildUrl] pour garder les schémas connus au même
/// endroit et les faire évoluer facilement (ex. si WeChat publie un jour un
/// lien officiel).
String? buildMessagingUrl(String platformId, String value) {
  final v = value.trim();
  if (v.isEmpty) return null;
  switch (platformId) {
    case 'whatsapp':
      final digits = _digitsOnly(v);
      return digits.isEmpty ? null : 'https://wa.me/$digits';
    case 'imessage':
      return 'sms:${_digitsAndPlus(v)}';
    case 'phone':
      return 'tel:${_digitsAndPlus(v)}';
    case 'telegram':
      final handle = v.startsWith('@') ? v.substring(1) : v;
      return 'https://t.me/$handle';
    case 'signal':
      final digits = _digitsAndPlus(v);
      return digits.isEmpty ? null : 'https://signal.me/#p/$digits';
    case 'messenger':
      final handle = v.startsWith('@') ? v.substring(1) : v;
      return 'https://m.me/$handle';
    case 'line':
      return 'line://ti/p/~$v';
    case 'viber':
      final digits = _digitsAndPlus(v);
      return digits.isEmpty ? null : 'viber://chat?number=$digits';
    case 'wechat':
    case 'kakaotalk':
    default:
      return null;
  }
}

/// Ouvre l'appli/le lien correspondant à un canal — logique partagée entre
/// l'éditeur de contact et la fiche client (liste des canaux), pour ne pas
/// dupliquer le comportement (et l'honnêteté sur ses limites : WeChat et
/// KakaoTalk n'ouvrent que l'appli, jamais le contact précis).
Future<void> openMessagingChannel(BuildContext context, MessagingChannel channel) async {
  final l10n = AppLocalizations.of(context);
  final label = platformLabel(context, channel.platformId);
  final openNote = platformOpenNote(context, channel.platformId);
  final url = buildMessagingUrl(channel.platformId, channel.value);
  final messenger = ScaffoldMessenger.of(context);
  if (url == null) {
    messenger.showSnackBar(
      SnackBar(content: Text(openNote ?? l10n.messagingIncompleteId(label))),
    );
    return;
  }
  final launched = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  if (!launched) {
    messenger.showSnackBar(
      SnackBar(content: Text(l10n.messagingCannotOpenApp(label))),
    );
  } else if (openNote != null) {
    messenger.showSnackBar(SnackBar(content: Text(openNote)));
  }
}

/// Ouverture générique d'une URL externe (mailto:, tel:…) avec le même
/// filet de sécurité que [openMessagingChannel] — utilisé par la
/// visionneuse de contact pour l'email et le téléphone.
Future<void> openExternalUrl(BuildContext context, String url, {String? label}) async {
  final messenger = ScaffoldMessenger.of(context);
  final launched = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  if (!launched) {
    messenger.showSnackBar(
      SnackBar(content: Text("Impossible d'ouvrir${label != null ? ' $label' : ''}.")),
    );
  }
}

List<MessagingChannel> decodeMessagingChannels(String? json) {
  if (json == null || json.trim().isEmpty) return [];
  try {
    final list = jsonDecode(json) as List;
    return list
        .map((e) => MessagingChannel.fromJson(Map<String, dynamic>.from(e as Map)))
        .where((c) => c.platformId.isNotEmpty)
        .toList();
  } catch (_) {
    return [];
  }
}

String? encodeMessagingChannels(List<MessagingChannel> channels) {
  final cleaned = channels.where((c) => c.value.trim().isNotEmpty).toList();
  if (cleaned.isEmpty) return null;
  return jsonEncode(cleaned.map((c) => c.toJson()).toList());
}
