import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:physioapp/application/app_builder.dart';
import 'package:physioapp/navigation/app_navigator.dart';
import 'package:physioapp/routes/routes.dart';
import 'package:physioapp/routes/routes_generator.dart';
import 'package:physioapp/theme/theme.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  Locale _resolveLocale(
    Locale? previewLocale,
    Locale? deviceLocale,
    Iterable<Locale> supportedLocales,
  ) =>
      previewLocale ??
      (deviceLocale == null
          ? supportedLocales.first
          : supportedLocales.firstWhere(
              (locale) =>
                  locale.languageCode == deviceLocale.languageCode &&
                  (locale.countryCode == null || locale.countryCode == deviceLocale.countryCode),
              orElse: () => supportedLocales.first,
            ));

    Widget _builderApp(BuildContext context, Widget? child) => appBuilder()(
      context,
      DevicePreview.isEnabled(context) ? DevicePreview.appBuilder(context, child) : child,
    );

  @override
  Widget build(BuildContext context) {
    final bool devicePreviewActive = DevicePreview.isEnabled(context);

    return MaterialApp(
      title: 'PhysioApp',
      locale: devicePreviewActive ? DevicePreview.locale(context) : null,
      localeResolutionCallback: (deviceLocale, supportedLocales) => _resolveLocale(
        devicePreviewActive ? DevicePreview.locale(context) : null,
        deviceLocale,
        supportedLocales,
      ),
      builder: _builderApp,
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: RouteGenerator.generate,
      initialRoute: Routes.home,
      navigatorKey: AppNavigator.navigatorKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
