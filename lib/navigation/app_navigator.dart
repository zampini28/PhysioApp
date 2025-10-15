import 'dart:developer' as developer;

import 'package:flutter/material.dart';

abstract class AppNavigator {
  AppNavigator._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState? get _navigator => navigatorKey.currentState;

  static BuildContext? get context => _navigator?.context;

  static Future<T?> push<T extends Object?>(Route<T> route) {
    final nav = _navigator;
    if (nav == null) {
      developer.log('Attempted push but navigator is not avaliable', name: 'AppNavigator');
      return Future.value(null);
    }
    return nav.push(route);
  }

  static Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    final nav = _navigator;
    if (nav == null) {
      developer.log(
        'Attempted pushNamed($routeName) but navigator is not avaliable',
        name: 'AppNavigator',
      );
      return Future.value(null);
    }
    return nav.pushNamed<T>(routeName, arguments: arguments);
  }

  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) {
    final nav = _navigator;
    if (nav == null) {
      developer.log(
        'Attempted pushReplacement but navigator is not avaliable',
        name: 'AppNavigator',
      );
      return Future.value(null);
    }
    return nav.pushReplacement<T, TO>(newRoute, result: result);
  }

  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    final nav = _navigator;
    if (nav == null) {
      developer.log(
        'Attempted pushReplacementNamed($routeName) but navigator is not avaliable',
        name: 'AppNavigator',
      );
      return Future.value(null);
    }
    return nav.pushReplacementNamed<T, TO>(routeName, result: result, arguments: arguments);
  }

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    final nav = _navigator;
    if (nav == null) {
      developer.log(
        'Attempted pushNamedAndRemoveUntil($newRouteName) but navigator is not available',
        name: 'AppNavigator',
      );
      return Future.value(null);
    }
    return nav.pushNamedAndRemoveUntil<T>(newRouteName, predicate, arguments: arguments);
  }

  static Future<T?> pushAndRemoveAll<T extends Object?>(Route<T> newRoute) {
    final nav = _navigator;
    if (nav == null) {
      developer.log(
        'Attempted pushAndRemoveAll but navigator is not available',
        name: 'AppNavigator',
      );
      return Future.value(null);
    }
    return nav.pushAndRemoveUntil<T>(newRoute, (_) => false);
  }

  static void pop<T extends Object?>([T? result]) {
    final nav = _navigator;
    if (nav == null) {
      developer.log('Attempted pop but navigator is not available', name: 'AppNavigator');
      return;
    }
    if (nav.canPop()) {
      nav.pop<T>(result);
    } else {
      developer.log('Attempted pop but cannot pop any route', name: 'AppNavigator');
    }
  }

  static void popUntil(RoutePredicate predicate) {
    final nav = _navigator;
    if (nav == null) {
      developer.log('Attempted popUntil but navigator is not available', name: 'AppNavigator');
      return;
    }
    nav.popUntil(predicate);
  }

  static Future<bool> maybePop<T extends Object?>([T? result]) async {
    final nav = _navigator;
    if (nav == null) {
      developer.log('Attempted maybePop but navigator is not available', name: 'AppNavigator');
      return false;
    }
    return nav.maybePop(result);
  }

  static bool canPop() {
    final nav = _navigator;
    if (nav == null) return false;
    return nav.canPop();
  }
}
