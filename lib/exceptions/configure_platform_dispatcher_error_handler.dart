import 'dart:developer' as developer;
import 'dart:ui';

import 'package:physioapp/exceptions/handler_uncaught_error.dart';

Future<void> configurePlatformDispatcherErrorHandler() async {
  PlatformDispatcher.instance.onError = (Object error, StackTrace stackTrace) {
    developer.log(
      'PlatformDisplatcher.onError',
      error: error,
      stackTrace: stackTrace,
      name: 'error_handler',
    );

    handlerUncaughtError(error, stackTrace);

    return true;
  };
}
