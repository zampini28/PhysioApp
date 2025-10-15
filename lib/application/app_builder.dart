import 'package:flutter/material.dart';

Widget Function(BuildContext, Widget?) appBuilder({
  double minTextScale = 1.0,
  double maxTextScale = 1.4,
  bool enableSafeArea = true,
  bool dismissKeyboardOnTap = true,
  Duration keyboardInsetAnimationDuration = const Duration(milliseconds: 200),
}) {
  assert(minTextScale > 0 && maxTextScale >= minTextScale);

  return (BuildContext context, Widget? child) {
    final mediaQuery = MediaQuery.of(context);
    final textScale = mediaQuery.textScaler.scale(1).clamp(minTextScale, maxTextScale);

    Widget current = child ?? const SizedBox.shrink();

    current = AnimatedPadding(
      padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
      duration: keyboardInsetAnimationDuration,
      curve: Curves.easeOut,
      child: current,
    );

    final hasDevicePadding = mediaQuery.viewPadding.top > 0 || mediaQuery.viewPadding.bottom > 0;

    if (enableSafeArea && !hasDevicePadding) {
      current = SafeArea(child: current);
    }

    current = ScrollConfiguration(behavior: _NoGlowScrollBehavior(), child: current);

    current = MediaQuery(
      data: mediaQuery.copyWith(textScaler: TextScaler.linear(textScale)),
      child: current,
    );

    if (dismissKeyboardOnTap) {
      current = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          final scope = FocusManager.instance.primaryFocus;
          if (scope != null && scope.hasFocus) scope.unfocus();
        },
        child: current,
      );
    }

    return ScaffoldMessenger(child: current);
  };
}

class _NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}
