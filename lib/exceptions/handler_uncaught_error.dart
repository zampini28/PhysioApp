import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

void handlerUncaughtError(Object error, StackTrace stackTrace) {
  developer.log(
    'Uncaught error',
    error: error,
    stackTrace: stackTrace,
    name: 'error_handler',
    level: 1000,
  );

  if (kDebugMode) {
    FlutterError.presentError(FlutterErrorDetails(exception: error, stack: stackTrace));
  }
}
