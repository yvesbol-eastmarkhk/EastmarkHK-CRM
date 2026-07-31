import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/screens/splash_screen.dart';
import 'core/services/app_locale_settings.dart';
import 'core/services/task_alarm_service.dart';
import 'shell/crm_shell.dart';
import 'theme/app_theme.dart';

class CrmApp extends StatelessWidget {
  const CrmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocaleSettings.instance,
      builder: (context, _) => MaterialApp(
        navigatorKey: TaskAlarmService.instance.navigatorKey,
        title: 'EastmarkHK CRM',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        debugShowCheckedModeBanner: false,
        locale: AppLocaleSettings.instance.locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          for (final s in AppLocaleSettings.supported) Locale(s.$1),
        ],
        home: const SplashScreen(),
      ),
    );
  }
}

/// Alias conservé pour les imports existants (splash, tests…).
typedef HomeShell = CrmShell;
