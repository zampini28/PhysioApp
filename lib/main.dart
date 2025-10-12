import 'dart:async' show runZonedGuarded;

import 'package:flutter/material.dart';
import 'package:physioapp/homepage.dart';
import 'package:physioapp/exceptions/exceptions.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // use FlutterNativeSplash.remove(); to remove the splash screen after initialization
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runZonedGuarded<Future<void>>(() async {
    await configureFlutterErrorHandler();
    await configurePlatformDispatcherErrorHandler();

    runApp(const MyApp());
  }, handlerUncaughtError);
}
