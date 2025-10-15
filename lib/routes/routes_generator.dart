import 'package:flutter/material.dart';
import 'package:physioapp/pages/pages.dart';
import 'package:physioapp/routes/routes.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return _materialRoute(const LoginPage());

      case Routes.home:
        return _materialRoute(const HomePage());

      default:
        return _materialRoute(const UnknownPage());
    }
  }

  static MaterialPageRoute<dynamic> _materialRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
