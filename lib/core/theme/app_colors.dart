import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const Color scaffoldBackground = Colors.white;

  static const Color lightPrimaryColor = Color(0xFFDEEAFF);

  // Text
  static const Color textPrimary = Color(0xFF202124);
  static const Color textSecondary = Color(0xFF5F6368);
  static const Color infoBoxTitleColor = Color(0xFF4B4F54);

  // Main Colors
  static const Color primary = Color(0xFF1A73E8);

  /// Secondary background color.
  /// For example, if an icon on a button is [primary], its background should be this color.
  static const Color secondaryBackground = Color(0xFFF3F7FE);

  // Custom text/status colors
  static const Color greenText = Color(0xFF2C9C4A);
  static const Color redText = Color(0xFFD93025);

  //Border colors
  static const Color customBorderColorGrey = Color(0xFFE9EBF0);

  // Star/Rating color
  static const Color starColor = Color(0xFFFEB005);

  // Greys
  static const Color lightGrey = Color(0xFF989898);
  static const Color lighterGrey = Color(0xFF868A94);

  ////
  static const Color darkPink = Color(0xFF9C6DF2);

  ////Button Border
  static const Color buttonBorderColor = Color(0xFFDADCE0);

  // --- Dark Mode Colors ---
  static const Color darkScaffoldBackground = Color(0xFF121212); // Standard Material dark background
  static const Color darkTextPrimary = Color(0xFFE8EAED); // Off-white (better readability than pure white)
  static const Color darkTextSecondary = Color(0xFF9AA0A6); // Lighter grey for contrast on dark background
  static const Color darkPrimary = Color(0xFF8AB4F8); // A slightly brighter blue to pop against dark backgrounds
  static const Color darkSecondaryBackground = Color(0xFF1A263D); // Dark tinted blue for icon backgrounds
}
