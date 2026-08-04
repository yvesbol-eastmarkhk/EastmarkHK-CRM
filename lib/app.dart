import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/screens/splash_screen.dart';
import 'core/services/app_locale_settings.dart';
import 'core/services/task_alarm_service.dart';
import 'l10n/gen/app_localizations.dart';
import 'shell/crm_shell.dart';
import 'theme/app_theme.dart';

class CrmApp extends StatelessWidget {
  const CrmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocaleSettings.instance,
      builder: (context, _) => MaterialApp(
        // Clé stable : un changement de locale ne doit pas remonter SplashScreen.
        key: const ValueKey('eastmark_crm_app'),
        navigatorKey: TaskAlarmService.instance.navigatorKey,
        title: 'EastmarkHK CRM',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        debugShowCheckedModeBanner: false,
        // Pas de pied de page global ici : il apparaîtrait aussi sur le
        // splash/login. Le footer est intégré directement dans `CrmShell`,
        // uniquement une fois entré dans l'app.
        locale: AppLocaleSettings.instance.locale,
        localeResolutionCallback: (locale, supported) {
          if (locale == null) return supported.first;
          // Correspondance exacte (ex. pt_BR avant pt).
          for (final s in supported) {
            if (s.languageCode == locale.languageCode &&
                (s.countryCode ?? '') == (locale.countryCode ?? '')) {
              return s;
            }
          }
          for (final s in supported) {
            if (s.languageCode == locale.languageCode &&
                (s.countryCode == null || s.countryCode!.isEmpty)) {
              return s;
            }
          }
          for (final s in supported) {
            if (s.languageCode == locale.languageCode) return s;
          }
          return const Locale('en');
        },
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          for (final s in AppLocaleSettings.supported)
            AppLocaleSettings.parseLocale(s.$1),
        ],
        home: const SplashScreen(),
      ),
    );
  }
}

/// Shell principal — CRM cœur (clients, pipeline, tâches, Contacté…).
/// `AppShell` / `lib/screens/*` = expérimentation parallèle, non branchée.
typedef HomeShell = CrmShell;
