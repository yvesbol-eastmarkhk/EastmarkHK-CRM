import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../services/currency_settings.dart';
import '../../l10n/gen/app_localizations.dart';

/// Formats imposés partout dans le CRM (indépendants de la langue de
/// l'interface) :
///  - Nombres : séparateur de milliers « , », décimale « . » → 1,234.56
///  - Dates   : format français jj/mm/aaaa
/// On s'appuie sur la locale en_US d'intl pour le groupement des nombres
/// car c'est exactement ce format (comma-thousands / dot-decimal), sans
/// dépendre de la langue choisie pour l'UI.
final _numberFormat = NumberFormat('#,##0.00', 'en_US');
final _numberFormatNoDecimals = NumberFormat('#,##0', 'en_US');
final _dateFormatFr = DateFormat('dd/MM/yyyy');
final _dateTimeFormatFr = DateFormat('dd/MM/yyyy HH:mm');

/// Formate un montant avec le symbole de la devise courante, ex. "€1,234.56".
String formatAmount(num? amount, {bool decimals = true}) {
  if (amount == null) return '';
  final n = decimals ? _numberFormat.format(amount) : _numberFormatNoDecimals.format(amount);
  final symbol = CurrencySettings.instance.current.symbol;
  return '$symbol$n';
}

/// Formate un nombre brut (sans devise) avec le séparateur imposé.
String formatNumber(num? value, {bool decimals = true}) {
  if (value == null) return '';
  return decimals ? _numberFormat.format(value) : _numberFormatNoDecimals.format(value);
}

/// Formate une date ISO-8601 (stockée en base) au format français jj/mm/aaaa.
String formatDateFr(String? iso) {
  if (iso == null || iso.isEmpty) return '';
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return _dateFormatFr.format(d.toLocal());
}

/// Libellé d'échéance lisible — textes via [l10n], jour de semaine selon [locale].
String formatDueLabel(
  String? iso,
  AppLocalizations l10n, {
  String locale = 'en',
}) {
  if (iso == null || iso.isEmpty) return l10n.tasksNoDue;
  final parsed = DateTime.tryParse(iso);
  if (parsed == null) return iso;
  final local = parsed.toLocal();
  final day = DateTime(local.year, local.month, local.day);
  final today = DateTime.now();
  final todayOnly = DateTime(today.year, today.month, today.day);
  final diff = day.difference(todayOnly).inDays;
  final dateStr = _dateFormatFr.format(local);
  final timeStr = local.hour != 0 || local.minute != 0
      ? ' · ${DateFormat('HH:mm').format(local)}'
      : '';
  final dateWithTime = '$dateStr$timeStr';
  if (diff < 0) {
    return l10n.dueLabelOverdue(-diff, dateWithTime);
  }
  if (diff == 0) return l10n.dueLabelToday(dateWithTime);
  if (diff == 1) return l10n.dueLabelTomorrow(dateWithTime);
  // Jour de semaine selon la langue UI — repli jj/mm/aaaa si locale intl absente.
  String weekdayDate;
  try {
    weekdayDate = DateFormat('EEE dd/MM/yyyy', locale).format(local);
  } catch (_) {
    weekdayDate = dateStr;
  }
  return l10n.dueLabelInDays(weekdayDate, diff);
}

/// En-tête de groupe pour la file « Aujourd'hui » — inclut la plage de dates.
String formatDueGroupLabel(
  String bucketKey,
  List<String> isoDates,
  AppLocalizations l10n,
) {
  if (isoDates.isEmpty) return bucketKey;
  final parsed = isoDates.map(DateTime.tryParse).whereType<DateTime>().toList();
  if (parsed.isEmpty) return bucketKey;
  parsed.sort((a, b) => a.compareTo(b));
  final first = _dateFormatFr.format(parsed.first.toLocal());
  final last = _dateFormatFr.format(parsed.last.toLocal());
  return switch (bucketKey) {
    'overdue' => l10n.queueGroupOverdue,
    'today' => l10n.dueGroupTodayWithDate(first),
    'tomorrow' => l10n.dueGroupTomorrowWithDate(first),
    'week' => first == last
        ? l10n.dueGroupWeekWithDate(first)
        : l10n.dueGroupWeekWithRange(first, last),
    _ => first == last
        ? l10n.dueGroupLaterWithDate(first)
        : l10n.dueGroupLaterWithRange(first, last),
  };
}

/// Idem avec l'heure — utilisé pour la timeline (notes, appels…).
String formatDateTimeFr(String? iso) {
  if (iso == null || iso.isEmpty) return '';
  final d = DateTime.tryParse(iso);
  if (d == null) return iso;
  return _dateTimeFormatFr.format(d.toLocal());
}

/// Reconvertit un texte affiché au format imposé (ex. "200,000.00") en
/// double — retire les séparateurs de milliers, garde le point décimal.
double? parseFormattedAmount(String text) {
  final cleaned = text.replaceAll(',', '').trim();
  return cleaned.isEmpty ? null : double.tryParse(cleaned);
}

/// Formate un montant "brut" pour pré-remplir un champ éditable (sans
/// symbole de devise, avec les séparateurs) — utilisé avec
/// [AmountInputFormatter] pour les champs de saisie de montant.
String formatAmountForEditing(num? amount) => amount == null ? '' : formatNumber(amount);

/// Ajoute en direct le séparateur de milliers pendant la saisie d'un
/// montant — sans ça, il est trop facile de se tromper d'un ou deux zéros
/// sur un gros montant. Le point reste la décimale (au plus 2 chiffres).
class AmountInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    // On ne garde qu'un seul point décimal (le premier rencontré).
    final firstDot = digitsOnly.indexOf('.');
    if (firstDot != -1) {
      digitsOnly = digitsOnly.substring(0, firstDot + 1) +
          digitsOnly.substring(firstDot + 1).replaceAll('.', '');
    }

    var integerPart = digitsOnly;
    var decimalPart = '';
    final dotIndex = digitsOnly.indexOf('.');
    if (dotIndex != -1) {
      integerPart = digitsOnly.substring(0, dotIndex);
      decimalPart = digitsOnly.substring(dotIndex + 1);
      if (decimalPart.length > 2) decimalPart = decimalPart.substring(0, 2);
    }

    integerPart = integerPart.replaceFirst(RegExp(r'^0+(?=\d)'), '');
    final grouped = integerPart.isEmpty
        ? ''
        : NumberFormat('#,###', 'en_US').format(int.parse(integerPart));

    final result = dotIndex != -1 ? '$grouped.$decimalPart' : grouped;

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}
