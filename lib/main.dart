import 'dart:async' show runZonedGuarded;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:physioapp/application/app_preview.dart';
import 'package:physioapp/application/app_root.dart';
import 'package:physioapp/application/dependecies.dart';
import 'package:physioapp/application/platform_services.dart';
import 'package:physioapp/exceptions/exceptions.dart';

Future<void> main() async {
  BindingBase.debugZoneErrorsAreFatal = kDebugMode;

  runZonedGuarded<Future<void>>(() async {
    final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // use FlutterNativeSplash.remove(); to remove the splash screen after initialization
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await initializePlatformServices();

    await setupDependencies(widgetsBinding);

    await configureFlutterErrorHandler();
    await configurePlatformDispatcherErrorHandler();

    FlutterNativeSplash.remove();

    runApp(const AppPreview(app: AppRoot()));
  }, handlerUncaughtError);
}
