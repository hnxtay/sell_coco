import 'package:flutter/material.dart';

import '../common/assets/app_colors.dart';
import '../common/assets/app_fonts.dart';
import 'color_schemes.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: AppFonts.inter,
          color: AppColors.maybeBlack,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFonts.inter,
          color: AppColors.maybeBlack,
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: AppFonts.inter,
          color: AppColors.maybeBlack,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFonts.inter,
          color: AppColors.maybeBlack,
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
      ),
    );
  }
}
