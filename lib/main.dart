import 'package:flutter/material.dart';

import 'app.dart';
import 'core/db/app_database.dart';
import 'core/modules/module_registry.dart';
import 'core/services/app_locale_settings.dart';
import 'core/services/company_logo_service.dart';
import 'core/services/currency_settings.dart';
import 'core/services/current_session.dart';
import 'core/services/dictation_settings.dart';
import 'db/crm_db.dart';
import 'platform/crm_subscription_service.dart';
import 'platform/entitlement_service.dart';
import 'platform/license_manager.dart';
import 'platform/window_state_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowStateController.instance.init();

  // Auth / comptes (ancienne base) — conservé pour login / bootstrap / réglages.
  await AppDatabase.initPlatform();
  await CurrentSession.instance.ensureLoaded();
  await CompanyLogoSettings.instance.ensureLoaded();
  await DictationSettings.instance.ensureLoaded();
  await CurrencySettings.instance.ensureLoaded();
  await EntitlementService.instance.ensureLoaded();
  await LicenseManager.instance.init();
  await ModuleRegistry.instance.syncLicensesFromStorage();
  await ModuleRegistry.instance.ensureInitialized();
  try {
    await CrmSubscriptionService.instance.init();
  } catch (_) {}

  // Données métier du nouveau CRM.
  await CrmDb.initPlatform();
  await CrmDb.instance.database;

  await AppLocaleSettings.instance.ensureLoaded();
  runApp(const CrmApp());
}
