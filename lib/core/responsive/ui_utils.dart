import 'package:flutter/material.dart';
import 'responsive_context.dart';

/// UIUtils = Design Tokens + UI Rules
/// This file should be the SINGLE SOURCE OF TRUTH for UI sizing.
class UIUtils {
  // -------------------------------
  // FONT SIZES
  // -------------------------------

  static double appTitle(ScreenType t) => t == ScreenType.desktop ? 28 : (t == ScreenType.tablet ? 24 : 18);
  static double pageTitle(ScreenType t) => t == ScreenType.desktop ? 26 : (t == ScreenType.tablet ? 22 : 16);
  static double sectionTitle(ScreenType t) => t == ScreenType.desktop ? 24 : (t == ScreenType.tablet ? 20 : 16);
  static double sectionSubtitle(ScreenType t) => t == ScreenType.desktop ? 18 : (t == ScreenType.tablet ? 16 : 14);

  static double tileTitle(ScreenType t) => t == ScreenType.desktop ? 20 : (t == ScreenType.tablet ? 18 : 16);
  static double tileSubtitle(ScreenType t) => t == ScreenType.desktop ? 16 : (t == ScreenType.tablet ? 15 : 13);

  static double body(ScreenType t) => t == ScreenType.desktop ? 18 : (t == ScreenType.tablet ? 16 : 14);
  static double caption(ScreenType t) => t == ScreenType.desktop ? 14 : (t == ScreenType.tablet ? 13 : 11);

  static double bottomNavFontSize(ScreenType t) =>
      t == ScreenType.desktop ? 16 : (t == ScreenType.tablet ? 15 : 13);

  // -------------------------------
  // FONT WEIGHTS
  // -------------------------------

  static FontWeight bold = FontWeight.w600;
  static FontWeight semiBold = FontWeight.w500;
  static FontWeight regular = FontWeight.w400;

  // -------------------------------
  // ICON SIZES
  // -------------------------------

  static double appBarIcon(ScreenType t) => t == ScreenType.desktop ? 32 : (t == ScreenType.tablet ? 28 : 22);
  static double sectionIcon(ScreenType t) => t == ScreenType.desktop ? 28 : (t == ScreenType.tablet ? 24 : 18);
  static double tileIcon(ScreenType t) => t == ScreenType.desktop ? 26 : (t == ScreenType.tablet ? 22 : 18);
  static double smallIcon(ScreenType t) => t == ScreenType.desktop ? 20 : (t == ScreenType.tablet ? 18 : 14);

  static double chevronIcon(ScreenType t) => t == ScreenType.desktop ? 28 : (t == ScreenType.tablet ? 24 : 20);

  // Bottom Navigation Icon Sizes
  static double bottomNavIconActive(ScreenType t) =>
      t == ScreenType.desktop ? 30 : (t == ScreenType.tablet ? 26 : 22);
  static double bottomNavIconInactive(ScreenType t) =>
      t == ScreenType.desktop ? 28 : (t == ScreenType.tablet ? 24 : 20);

  // -------------------------------
  // SPACING / GAPS
  // -------------------------------

  static double gapXS(ScreenType t) => t == ScreenType.desktop ? 8 : (t == ScreenType.tablet ? 6 : 4);
  static double gapSM(ScreenType t) => t == ScreenType.desktop ? 12 : (t == ScreenType.tablet ? 10 : 6);
  static double gapMD(ScreenType t) => t == ScreenType.desktop ? 20 : (t == ScreenType.tablet ? 16 : 12);
  static double gapLG(ScreenType t) => t == ScreenType.desktop ? 32 : (t == ScreenType.tablet ? 24 : 16);
  static double gapXL(ScreenType t) => t == ScreenType.desktop ? 48 : (t == ScreenType.tablet ? 32 : 20);

  // -------------------------------
  // PADDING
  // -------------------------------

  static EdgeInsets pagePadding(ScreenType t) =>
      EdgeInsets.all(t == ScreenType.desktop ? 32 : (t == ScreenType.tablet ? 24 : 16));

  static EdgeInsets cardPadding(ScreenType t) =>
      EdgeInsets.all(t == ScreenType.desktop ? 24 : (t == ScreenType.tablet ? 20 : 12));

  static EdgeInsets tilePadding(ScreenType t) => EdgeInsets.symmetric(
    horizontal: t == ScreenType.desktop ? 24 : (t == ScreenType.tablet ? 20 : 16),
    vertical: t == ScreenType.desktop ? 20 : (t == ScreenType.tablet ? 16 : 12),
  );

  static EdgeInsets sectionPadding(ScreenType t) => EdgeInsets.symmetric(
    horizontal: t == ScreenType.desktop ? 32 : (t == ScreenType.tablet ? 24 : 14), 
    vertical: t == ScreenType.desktop ? 24 : (t == ScreenType.tablet ? 20 : 16),
  );

  static EdgeInsets bottomNavPadding(ScreenType t) =>
      EdgeInsets.only(bottom: t == ScreenType.desktop ? 12 : (t == ScreenType.tablet ? 10 : 6));

  // -------------------------------
  // HEIGHTS
  // -------------------------------

  static double buttonHeight(ScreenType t) => t == ScreenType.desktop ? 60 : (t == ScreenType.tablet ? 56 : 44);
  static double inputHeight(ScreenType t) => t == ScreenType.desktop ? 60 : (t == ScreenType.tablet ? 54 : 42);
  static double appBarHeight(ScreenType t) => t == ScreenType.desktop ? 80 : (t == ScreenType.tablet ? 72 : 56);
  static double listTileHeight(ScreenType t) =>
      t == ScreenType.desktop ? 80 : (t == ScreenType.tablet ? 72 : 56);

  // -------------------------------
  // WIDTHS
  // -------------------------------

  static double maxContentWidth(ScreenType t) =>
      t == ScreenType.desktop ? 1200 : (t == ScreenType.tablet ? 720 : double.infinity);

  static double sidePanelWidth(ScreenType t) =>
      t == ScreenType.desktop ? 320 : (t == ScreenType.tablet ? 280 : 0);

  // -------------------------------
  // BORDER RADIUS
  // -------------------------------

  static double radiusXS(ScreenType t) => t == ScreenType.desktop ? 8 : (t == ScreenType.tablet ? 6 : 4);
  static double radiusSM(ScreenType t) => t == ScreenType.desktop ? 12 : (t == ScreenType.tablet ? 8 : 6);
  static double radiusMD(ScreenType t) => t == ScreenType.desktop ? 16 : (t == ScreenType.tablet ? 12 : 8);
  static double radiusLG(ScreenType t) => t == ScreenType.desktop ? 24 : (t == ScreenType.tablet ? 16 : 12);
  static double radiusXL(ScreenType t) => t == ScreenType.desktop ? 32 : (t == ScreenType.tablet ? 24 : 20);

  // -------------------------------
  // ELEVATION
  // -------------------------------

  static double cardElevation(ScreenType t) => t == ScreenType.desktop ? 4 : (t == ScreenType.tablet ? 3 : 1);
  static double appBarElevation(ScreenType t) => t == ScreenType.desktop ? 3 : (t == ScreenType.tablet ? 2 : 0);

  // -------------------------------
  // AVATAR / IMAGE SIZES
  // -------------------------------

  static double avatarSM(ScreenType t) => t == ScreenType.desktop ? 40 : (t == ScreenType.tablet ? 36 : 28);
  static double avatarMD(ScreenType t) => t == ScreenType.desktop ? 56 : (t == ScreenType.tablet ? 48 : 36);
  static double avatarLG(ScreenType t) => t == ScreenType.desktop ? 80 : (t == ScreenType.tablet ? 64 : 48);
  static double avatarXL(ScreenType t) => t == ScreenType.desktop ? 120 : (t == ScreenType.tablet ? 105 : 75);

  // -------------------------------
  // ANIMATION DURATIONS
  // -------------------------------

  static Duration fastAnim = const Duration(milliseconds: 150);
  static Duration normalAnim = const Duration(milliseconds: 250);
  static Duration slowAnim = const Duration(milliseconds: 400);
}

/// UI Dialogs
class UIUtilsDialogs {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const PopScope(
        canPop: false,
        child: _LoadingDialog(),
      ),
    );
  }
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
