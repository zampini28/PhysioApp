import 'package:flutter/material.dart';
import 'package:physioapp/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // use FlutterNativeSplash.remove(); to remove the splash screen after initialization
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}
