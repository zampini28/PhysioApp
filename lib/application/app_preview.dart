import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool get isWebBrowser => kIsWeb;
bool get isDesktopPlatform =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux);

class AppPreview extends StatelessWidget {
  const AppPreview({super.key, required this.app});

  final Widget app;

  bool get _showDevicePreview => kDebugMode && (isWebBrowser || isDesktopPlatform);

  @override
  Widget build(BuildContext context) {
    return _showDevicePreview ? DevicePreview(enabled: true, builder: (_) => app) : app;
  }
}
