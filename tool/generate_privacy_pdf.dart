// Generates the branded EastmarkHK CRM Privacy Report (App Store / website).
// Same layout as the EastmarkHK e-Invoicing / Trading privacy reports.
//
//   dart run tool/generate_privacy_pdf.dart
//
// Output: docs/EastmarkHK_CRM_Privacy_Report.pdf
import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

const _company = 'EastmarkHK';
const _legalName = 'Eastmark (Asia) Limited';
const _appName = 'EastmarkHK CRM';
const _website = 'eastmarkhk.com';
const _email = 'eastmarkhk@eastmarkhk.com';
const _address =
    'Flat D, 6/F, Brilliance Court, 3 Discovery Bay Road, Discovery Bay, Hong Kong';
const _lastUpdated = '2 August 2026';
const _headerLine = '$_company  |  $_website  |  $_email';
const _bundleId = 'com.eastmarkhk.eastmarkhkcrm';
const _outFileName = 'EastmarkHK_CRM_Privacy_Report.pdf';

// EastmarkHK brand palette (logo is teal-green ~#95D6C9) — identical to the
// other EastmarkHK apps, so the family of reports looks consistent.
const _primary = PdfColor.fromInt(0xFF12806A);
const _gold = PdfColor.fromInt(0xFF53BBA3);
const _muted = PdfColor.fromInt(0xFF5C6B6A);
const _body = PdfColor.fromInt(0xFF1A1A1A);
const _line = PdfColor.fromInt(0xFFC2D2CC);
const _zebra = PdfColor.fromInt(0xFFEDF7F3);
const _white = PdfColor.fromInt(0xFFFFFFFF);

late final pw.MemoryImage? _logo;

void main() async {
  final logoFile = File('assets/branding/app_icon_v3.png');
  _logo = logoFile.existsSync()
      ? pw.MemoryImage(logoFile.readAsBytesSync())
      : null;

  final doc =
      pw.Document(title: 'Privacy Report - $_appName', author: _company);

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(46, 40, 46, 44),
      header: _header,
      footer: _footer,
      build: (context) => _content(),
    ),
  );

  final outDir = Directory('docs');
  if (!outDir.existsSync()) outDir.createSync(recursive: true);
  final outFile = File('docs/$_outFileName');
  await outFile.writeAsBytes(await doc.save());
  stdout.writeln('Wrote ${outFile.path} (${outFile.lengthSync()} bytes)');

  // Mirror for website upload (when sibling eastmarkhk.com repo is present).
  final webDir = Directory('../eastmarkhk.com/privacy');
  if (webDir.existsSync()) {
    final webOut = File('${webDir.path}/$_outFileName');
    await webOut.writeAsBytes(await outFile.readAsBytes());
    stdout.writeln('Also copied to ${webOut.path}');
  }
}

pw.Widget _header(pw.Context context) {
  if (context.pageNumber == 1) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            if (_logo != null) ...[
              pw.SizedBox(
                  width: 52,
                  height: 52,
                  child: pw.Image(_logo!, fit: pw.BoxFit.contain)),
              pw.SizedBox(width: 14),
            ],
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(_appName,
                      style: pw.TextStyle(
                          fontSize: 19,
                          fontWeight: pw.FontWeight.bold,
                          color: _primary)),
                  pw.Text('Privacy Report',
                      style: const pw.TextStyle(fontSize: 13, color: _body)),
                  pw.Text('macOS  (iOS / iPadOS / Android planned)',
                      style: const pw.TextStyle(fontSize: 9, color: _muted)),
                ],
              ),
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(_website,
                    style: const pw.TextStyle(fontSize: 9, color: _muted)),
                pw.Text(_email,
                    style: const pw.TextStyle(fontSize: 9, color: _muted)),
                pw.Text('Updated $_lastUpdated',
                    style: const pw.TextStyle(fontSize: 8, color: _muted)),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Container(height: 2, color: _primary),
        pw.SizedBox(height: 12),
      ],
    );
  }
  return pw.Column(
    children: [
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('$_appName  -  Privacy Report',
              style: pw.TextStyle(
                  fontSize: 8.5,
                  color: _primary,
                  fontWeight: pw.FontWeight.bold)),
          pw.Text(_website,
              style: const pw.TextStyle(fontSize: 8, color: _muted)),
        ],
      ),
      pw.SizedBox(height: 4),
      pw.Container(height: 0.8, color: _line),
      pw.SizedBox(height: 10),
    ],
  );
}

pw.Widget _footer(pw.Context context) => pw.Column(
      children: [
        pw.Container(height: 0.8, color: _line),
        pw.SizedBox(height: 4),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(_headerLine,
                style: const pw.TextStyle(fontSize: 7, color: _muted)),
            pw.Text('Page ${context.pageNumber} / ${context.pagesCount}',
                style: const pw.TextStyle(fontSize: 7, color: _muted)),
          ],
        ),
      ],
    );

pw.Widget _section(String title) => pw.Container(
      margin: const pw.EdgeInsets.only(top: 10, bottom: 5),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(title,
              style: pw.TextStyle(
                  fontSize: 12, fontWeight: pw.FontWeight.bold, color: _primary)),
          pw.SizedBox(height: 2),
          pw.Container(height: 1.4, width: 42, color: _gold),
        ],
      ),
    );

pw.Widget _para(String text) => pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Text(text,
          textAlign: pw.TextAlign.justify,
          style: const pw.TextStyle(
              fontSize: 9.5, color: _body, lineSpacing: 1.9)),
    );

pw.Widget _table(List<String> headers, List<List<String>> rows,
    Map<int, pw.TableColumnWidth> widths) {
  return pw.TableHelper.fromTextArray(
    headers: headers,
    data: rows,
    border: pw.TableBorder.all(color: _line, width: 0.5),
    headerStyle: pw.TextStyle(
        fontSize: 8.5, fontWeight: pw.FontWeight.bold, color: _white),
    headerDecoration: const pw.BoxDecoration(color: _primary),
    headerHeight: 18,
    cellStyle: const pw.TextStyle(fontSize: 8.5, color: _body),
    oddRowDecoration: const pw.BoxDecoration(color: _zebra),
    cellPadding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 3),
    cellAlignment: pw.Alignment.centerLeft,
    columnWidths: widths,
    headerAlignment: pw.Alignment.centerLeft,
  );
}

List<pw.Widget> _content() => [
      _section('1. Introduction'),
      _para(
          'This Privacy Policy applies to $_appName (bundle ID $_bundleId) for '
          'macOS (iOS, iPadOS and Android planned). $_appName is a professional CRM '
          'for managing business clients, contacts, sales opportunities (pipeline), '
          'tasks / follow-ups and a shared activity timeline, with an optional '
          'invoicing module that creates quotes and invoices in the companion app '
          'EastmarkHK e-Invoicing.'),
      _para(
          'This document describes the data stored, the purposes for which it is used, '
          'the network connections made and the system permissions required, as expected '
          'by Apple for App Store and Mac App Store submission (Privacy Nutrition Labels '
          'and PrivacyInfo.xcprivacy).'),
      _para(
          'By default, $_appName stores all user-entered business data on the device in a '
          'local SQLite database. $_company does not operate a mandatory cloud account for '
          'this app. Optional features (team sync on a server you host, the e-Invoicing '
          'module, the on-device AI assistant) are user-configured and only contact '
          'services the user chooses.'),

      _section('2. Data Stored by EastmarkHK CRM'),
      _table(
        ['Data Type', 'Storage', 'Shared With', 'Purpose'],
        [
          [
            'Clients (name, VAT / Peppol ID, address, tags, notes)',
            'SQLite (on-device)',
            'Nobody by default',
            'Business client register'
          ],
          [
            'Contacts (name, email, phone, role, messaging channels)',
            'SQLite (on-device)',
            'Nobody by default',
            'People at each client'
          ],
          [
            'Opportunities (pipeline stage, amount, probability, notes)',
            'SQLite (on-device)',
            'Nobody by default',
            'Sales pipeline tracking'
          ],
          [
            'Activity timeline (notes, calls, e-mails, meetings, linked '
                'quotes / invoices)',
            'SQLite (on-device)',
            'Nobody by default',
            'Full history per client and per deal'
          ],
          [
            'Tasks and follow-up reminders',
            'SQLite (on-device)',
            'Team members, only if you enable sync',
            'Reminders and relances'
          ],
          [
            'Local team accounts (username, display name, role)',
            'SQLite (on-device)',
            'Team members, only if you enable sync',
            'Assign tasks and attribute activity by rep'
          ],
          [
            'App lock password / biometrics flag',
            'Secure storage (Keychain)',
            'Nobody',
            'Optional device unlock (Face ID / Touch ID)'
          ],
          [
            'Team sync credentials (your own server)',
            'Secure storage (on-device)',
            'Only the host you configure',
            'Multi-device / multi-rep synchronisation'
          ],
          [
            'e-Invoicing connection credentials (optional module)',
            'Secure storage (on-device)',
            'Only the e-Invoicing host you configure',
            'Create quotes / invoices from the CRM'
          ],
          [
            'Product photos (optional invoicing module)',
            'Local files / shared container',
            'Nobody by default',
            'Catalogue used on quotes and invoices'
          ],
        ],
        {
          0: const pw.FlexColumnWidth(2.6),
          1: const pw.FlexColumnWidth(1.8),
          2: const pw.FlexColumnWidth(2.0),
          3: const pw.FlexColumnWidth(2.8)
        },
      ),
      pw.SizedBox(height: 6),
      _para(
          '$_company does not automatically receive your CRM database. Team sync, when '
          'enabled, uses credentials you enter and exchanges data only with a server you '
          'control (your own hosting, running the EastmarkHK CRM sync endpoint).'),

      _section('3. Network Connections'),
      _table(
        ['Endpoint', 'Purpose', 'Triggered By', 'Data Sent'],
        [
          [
            'Your own CRM sync server (optional)',
            'Keep clients / contacts / opportunities / activities / tasks in sync '
                'across devices or reps',
            'You enable Team Sync in Settings; automatic pull, debounced push '
                'after local changes',
            'The CRM records above, to the host you configure'
          ],
          [
            'EastmarkHK e-Invoicing (optional module)',
            'Create / read quotes and invoices for a client',
            'You create a quote / invoice, or open a client\'s invoicing section',
            'Local: shared on-device database only. Remote mode: client + document '
                'data to the e-Invoicing host you configured in that app'
          ],
          [
            'Apple Foundation Models (on-device, Apple Silicon, macOS 26+)',
            'AI-assisted opportunity draft (title / notes from your text)',
            'You use the AI assistant when creating an opportunity',
            'Processed entirely on-device; nothing is sent to $_company or Apple'
          ],
          [
            'Apple App Store (StoreKit)',
            'Optional subscription purchase (invoicing module)',
            'You purchase / restore a module subscription',
            'Handled entirely by Apple; $_company never sees payment details'
          ],
        ],
        {
          0: const pw.FlexColumnWidth(2.4),
          1: const pw.FlexColumnWidth(2.4),
          2: const pw.FlexColumnWidth(2.6),
          3: const pw.FlexColumnWidth(3.0)
        },
      ),
      pw.SizedBox(height: 6),
      _para(
          'Client and pipeline management work fully offline. Network use is limited to '
          'features the user enables or explicitly triggers — there is no background '
          'telemetry.'),

      _section('4. System Permissions Required'),
      _table(
        ['Permission', 'macOS', 'Reason'],
        [
          [
            'Microphone + Speech Recognition',
            'Optional (dictation)',
            'Voice-to-text for notes, opportunities and tasks — transcription happens '
                'on-device'
          ],
          [
            'File picker (Photos / Documents)',
            'User-selected files only',
            'Import product photos and CSV backups; export data the user requests'
          ],
          [
            'Face ID / Touch ID (local authentication)',
            'Optional app lock',
            'Unlock the app when app lock is enabled'
          ],
          [
            'Network client',
            'When optional features used',
            'Team sync, e-Invoicing module, App Store purchase validation'
          ],
          [
            'Local database & secure storage',
            'Automatic',
            'App data and credentials on device'
          ],
          [
            'Camera',
            'Not used',
            'Not requested — photos are chosen via the file picker, not captured'
          ],
          [
            'Location (GPS)',
            'Not used',
            'Not requested'
          ],
          [
            'Contacts book (system)',
            'Not used',
            'Not requested — clients and contacts are entered in-app'
          ],
        ],
        {
          0: const pw.FlexColumnWidth(2.4),
          1: const pw.FlexColumnWidth(2.0),
          2: const pw.FlexColumnWidth(4.0)
        },
      ),

      _section('5. PrivacyInfo.xcprivacy - Required Reason APIs'),
      _table(
        ['API Category', 'Reason Code', 'Usage'],
        [
          [
            'NSPrivacyAccessedAPICategoryUserDefaults',
            'CA92.1',
            'Read / write locale and on-device preferences via SharedPreferences'
          ],
          [
            'NSPrivacyAccessedAPICategoryFileTimestamp',
            'C617.1',
            'Read file modification dates when managing local app files'
          ],
        ],
        {
          0: const pw.FlexColumnWidth(3.4),
          1: const pw.FlexColumnWidth(1.4),
          2: const pw.FlexColumnWidth(4.0)
        },
      ),
      pw.SizedBox(height: 6),
      _para(
          'NSPrivacyTracking is set to false. No advertising identifier APIs are used.'),

      _section('6. App Store Privacy Nutrition Labels'),
      _table(
        ['Category', 'Collected?', 'Linked to Identity?', 'Used for Tracking?'],
        [
          ['Contact Info', 'Yes (clients / contacts you enter)', 'No', 'No'],
          ['Financial Info', 'Yes (deal amounts, linked invoice totals)', 'No', 'No'],
          ['Photos or Videos', 'Yes (product photos, optional)', 'No', 'No'],
          ['Other User Content', 'Yes (notes, timeline entries)', 'No', 'No'],
          ['Identifiers', 'No (no advertising ID)', '-', '-'],
          ['Location', 'No', '-', '-'],
          ['Browsing History', 'No', '-', '-'],
          ['Usage Data', 'No', '-', '-'],
          ['Diagnostics', 'No', '-', '-'],
        ],
        {
          0: const pw.FlexColumnWidth(2.2),
          1: const pw.FlexColumnWidth(3.0),
          2: const pw.FlexColumnWidth(1.8),
          3: const pw.FlexColumnWidth(1.8)
        },
      ),
      pw.SizedBox(height: 6),
      _para(
          'Data marked "Collected" is entered by the user for business use and stored on '
          'the device (and, if Team Sync is enabled, on the server the user hosts). It is '
          'not linked to the user\'s Apple ID or a $_company cloud account.'),

      _section('7. Data Retention and Deletion'),
      _table(
        ['Data', 'Retention', 'How to Delete'],
        [
          [
            'CRM database (clients, opportunities, activities, tasks)',
            'Until deleted in app or app removed',
            'Delete records in app, or uninstall'
          ],
          [
            'Product photos',
            'Until deleted or app removed',
            'Remove in app, or uninstall'
          ],
          [
            'Sync / e-Invoicing credentials',
            'Until cleared in Settings or app removed',
            'Clear fields in Settings, or uninstall'
          ],
          [
            'Team sync server copy (optional)',
            'Controlled by the user\'s hosting',
            'Delete records on the user\'s sync server'
          ],
        ],
        {
          0: const pw.FlexColumnWidth(2.6),
          1: const pw.FlexColumnWidth(2.6),
          2: const pw.FlexColumnWidth(3.2)
        },
      ),
      pw.SizedBox(height: 6),
      _para(
          'Uninstalling the app permanently deletes the on-device SQLite database. Copies '
          'already synced to a server you configured remain until you delete them there.'),

      _section('8. Third-Party Services'),
      _table(
        ['Service', 'Provider', 'Purpose', 'Data Sent', 'Privacy Policy'],
        [
          [
            'CRM sync server',
            'User\'s own host',
            'Optional multi-device / team sync',
            'CRM records (user-enabled)',
            'User\'s host policy'
          ],
          [
            'EastmarkHK e-Invoicing',
            '$_company (sibling app)',
            'Optional invoicing module (quotes / invoices)',
            'Client + document data (module purchased and used)',
            'EastmarkHK e-Invoicing Privacy Report'
          ],
          [
            'Apple StoreKit',
            'Apple',
            'Subscription purchase for the invoicing module',
            'Handled by Apple; no data shared with $_company',
            'apple.com/privacy'
          ],
          [
            'Apple Foundation Models',
            'Apple (on-device)',
            'AI-assisted opportunity drafting',
            'On-device only',
            'apple.com/privacy'
          ],
        ],
        {
          0: const pw.FlexColumnWidth(1.8),
          1: const pw.FlexColumnWidth(1.8),
          2: const pw.FlexColumnWidth(2.4),
          3: const pw.FlexColumnWidth(2.6),
          4: const pw.FlexColumnWidth(2.0)
        },
      ),
      pw.SizedBox(height: 6),
      _para(
          'No analytics SDKs, advertising networks or third-party tracking libraries are '
          'included in $_appName.'),

      _section("9. Children's Privacy"),
      _para(
          '$_appName is a professional B2B CRM tool. It is not directed at children under 13 '
          '(or under 16 in the European Union). We do not knowingly collect any data from children.'),

      _section('10. No Mandatory Cloud Login'),
      _para(
          '$_appName does not require an $_company cloud account. Optional app lock uses a '
          'password or biometrics stored on the device. Optional Team Sync uses the server '
          'credentials you provide for your own host.'),

      _section('11. Contact'),
      _para(
          'For any privacy-related question or request regarding $_appName, please contact:'),
      _contactBlock(),
    ];

pw.Widget _contactBlock() => pw.Container(
      decoration: pw.BoxDecoration(
        color: _zebra,
        border: pw.Border.all(color: _line, width: 0.5),
      ),
      child: pw.Column(
        children: [
          _contactRow('Company', '$_company — $_legalName', top: false),
          _contactRow('Website', 'https://$_website'),
          _contactRow('Email', _email),
          _contactRow('Address', _address),
        ],
      ),
    );

pw.Widget _contactRow(String label, String value, {bool top = true}) =>
    pw.Container(
      decoration: top
          ? const pw.BoxDecoration(
              border: pw.Border(top: pw.BorderSide(color: _line, width: 0.5)))
          : null,
      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            width: 70,
            child: pw.Text(label,
                style: pw.TextStyle(
                    fontSize: 9,
                    fontWeight: pw.FontWeight.bold,
                    color: _primary)),
          ),
          pw.Expanded(
              child: pw.Text(value,
                  style: const pw.TextStyle(fontSize: 9, color: _body))),
        ],
      ),
    );
