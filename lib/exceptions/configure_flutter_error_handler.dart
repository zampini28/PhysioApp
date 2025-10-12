import 'dart:async' show Zone;

import 'package:flutter/foundation.dart';

Future<void> configureFlutterErrorHandler() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    }
    Zone.current.handleUncaughtError(
      details.exception,
      details.stack ?? StackTrace.empty,
    );
  };
}
