import 'package:flutter/material.dart';

import 'app.dart';
import 'core/db/app_database.dart';
import 'core/services/app_locale_settings.dart';
import 'core/services/company_logo_service.dart';
import 'core/services/currency_settings.dart';
import 'core/services/current_session.dart';
import 'core/services/dictation_settings.dart';
import 'core/services/pipeline_settings.dart';
import 'core/services/remote_crm_sync_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.initPlatform();
  await PipelineSettings.instance.ensureLoaded();
  await AppLocaleSettings.instance.ensureLoaded();
  await DictationSettings.instance.ensureLoaded();
  await CurrencySettings.instance.ensureLoaded();
  await CompanyLogoSettings.instance.ensureLoaded();
  await CurrentSession.instance.ensureLoaded();
  // Relit les réglages à chaque tick — pull 25 s en fond, push après écriture.
  RemoteCrmSyncService.instance.startAutoSync();
  runApp(const CrmApp());
}
