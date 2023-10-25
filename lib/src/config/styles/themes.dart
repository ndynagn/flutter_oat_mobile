import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_oat_mobile/src/config/styles/colors.dart';
import 'package:flutter_oat_mobile/src/config/styles/dimensions.dart';
import 'package:flutter_oat_mobile/src/config/styles/typography.dart';

abstract class AppThemes {
  const AppThemes._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      background: AppColors.cultured,
      onBackground: Colors.white,
      primary: Colors.black,
      onPrimary: AppColors.brandeisBlue,
      secondary: AppColors.cultured,
      error: AppColors.carminePink,
    ),
    textTheme: TextTheme(
      labelLarge: AppTypography.labelLarge.copyWith(
        color: Colors.black,
      ),
      labelMedium: AppTypography.labelMedium.copyWith(
        color: Colors.black,
      ),
      labelSmall: AppTypography.labelSmall.copyWith(
        color: Colors.black,
      ),
      bodyLarge: AppTypography.bodyLarge.copyWith(
        color: Colors.black,
      ),
      bodyMedium: AppTypography.bodyMedium.copyWith(
        color: Colors.black,
      ),
      bodySmall: AppTypography.bodySmall.copyWith(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size.fromHeight(0)),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        backgroundColor: const MaterialStatePropertyAll(AppColors.brandeisBlue),
        elevation: const MaterialStatePropertyAll(0),
        textStyle: const MaterialStatePropertyAll(AppTypography.bodyMedium),
        shape: MaterialStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: AppDimensions.small,
              cornerSmoothing: 1,
            ),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: const MaterialStatePropertyAll(AppTypography.bodyMedium),
        foregroundColor: MaterialStatePropertyAll(
          Colors.black.withOpacity(.4),
        ),
        elevation: const MaterialStatePropertyAll(0),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 14),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size.fromHeight(0),
        ),
        shape: MaterialStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: AppDimensions.small,
              cornerSmoothing: 1,
            ),
          ),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: AppDimensions.mediumLarge,
          cornerSmoothing: 1,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: AppDimensions.mediumLarge,
          cornerSmoothing: 1,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.cultured,
      elevation: 0,
      selectedLabelStyle: AppTypography.bodySmall,
      unselectedLabelStyle: AppTypography.bodySmall.copyWith(
        color: Colors.black.withOpacity(.4),
      ),
      type: BottomNavigationBarType.fixed,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.dark,
      background: AppColors.chineseBlack,
      onBackground: AppColors.raisinBlack,
      primary: Colors.white,
      onPrimary: AppColors.brandeisBlue,
      secondary: AppColors.darkCharcoal,
      error: AppColors.carminePink,
    ),
    textTheme: TextTheme(
      labelLarge: AppTypography.labelLarge.copyWith(
        color: Colors.white,
      ),
      labelMedium: AppTypography.labelMedium.copyWith(
        color: Colors.white,
      ),
      labelSmall: AppTypography.labelSmall.copyWith(
        color: Colors.white,
      ),
      bodyLarge: AppTypography.bodyLarge.copyWith(
        color: Colors.white,
      ),
      bodyMedium: AppTypography.bodyMedium.copyWith(
        color: Colors.white,
      ),
      bodySmall: AppTypography.bodySmall.copyWith(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size.fromHeight(0)),
        foregroundColor: const MaterialStatePropertyAll(Colors.black),
        backgroundColor: const MaterialStatePropertyAll(AppColors.cultured),
        elevation: const MaterialStatePropertyAll(0),
        textStyle: const MaterialStatePropertyAll(AppTypography.bodyMedium),
        shape: MaterialStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: AppDimensions.small,
              cornerSmoothing: 1,
            ),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: const MaterialStatePropertyAll(AppTypography.bodyMedium),
        foregroundColor: MaterialStatePropertyAll(
          Colors.white.withOpacity(.4),
        ),
        elevation: const MaterialStatePropertyAll(0),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 14),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size.fromHeight(0),
        ),
        shape: MaterialStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: AppDimensions.small,
              cornerSmoothing: 1,
            ),
          ),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.raisinBlack,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: AppDimensions.mediumLarge,
          cornerSmoothing: 1,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.raisinBlack,
      elevation: 0,
      scrolledUnderElevation: 0,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: AppDimensions.mediumLarge,
          cornerSmoothing: 1,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.raisinBlack,
      elevation: 0,
      selectedLabelStyle: AppTypography.bodySmall,
      unselectedLabelStyle: AppTypography.bodySmall.copyWith(
        color: Colors.white.withOpacity(.4),
      ),
      type: BottomNavigationBarType.fixed,
    ),
  );
}
