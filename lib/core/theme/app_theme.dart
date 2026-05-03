import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  // ======================
  // LIGHT THEME
  // ======================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      primaryColor: AppColors.primary,
      cardColor: Colors.white,
      dividerTheme: const DividerThemeData(color: AppColors.customBorderColorGrey, thickness: 1),

      // Default color scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.scaffoldBackground,
        onSurface: AppColors.textPrimary, // Sets default text color on surfaces
        error: AppColors.redText,
      ),

      // Set the default text color without overriding font sizes or weights
      textTheme: GoogleFonts.googleSansFlexTextTheme(
        ThemeData.light().textTheme,
      ).apply(bodyColor: AppColors.textPrimary, displayColor: AppColors.textPrimary),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.primary),
    );
  }

  // ======================
  // DARK THEME
  // ======================
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
      primaryColor: AppColors.primary,
      cardColor: AppColors.darkSecondaryBackground,
      dividerTheme: const DividerThemeData(color: AppColors.darkBorderColor, thickness: 1),

      // Default dark color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.darkScaffoldBackground,
        onSurface: AppColors.darkTextPrimary,
        error: AppColors.redText, // Red works on dark too, or you can use a lighter red like #F28B82
      ),

      // Set the default dark text color
      textTheme: GoogleFonts.dmSansTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: AppColors.darkTextPrimary, displayColor: AppColors.darkTextPrimary),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.primary),
    );
  }
}
