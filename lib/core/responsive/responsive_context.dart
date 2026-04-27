import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

/// Extension to easier access ScreenType from Context
extension ResponsiveContext on BuildContext {
  ScreenType get screenType {
    final width = MediaQuery.of(this).size.width;
    if (width >= 1040) return ScreenType.desktop;
    if (width >= 600) return ScreenType.tablet;
    return ScreenType.mobile;
  }

  bool get isMobile => screenType == ScreenType.mobile;

  bool get isTablet => screenType == ScreenType.tablet;

  bool get isDesktop => screenType == ScreenType.desktop;
}
