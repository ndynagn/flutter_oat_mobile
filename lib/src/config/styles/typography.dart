import 'package:flutter/material.dart';

abstract class AppTypography {
  const AppTypography._();

  static const helveticaNeue = 'Helvetica Neue';
  static const vkSansDisplay = 'VK Sans Display';

  static const labelLarge = TextStyle(
    fontFamily: helveticaNeue,
    fontWeight: FontWeight.w500,
    fontSize: 31,
    letterSpacing: -0.33,
  );

  static const labelMedium = TextStyle(
    fontFamily: helveticaNeue,
    fontWeight: FontWeight.w400,
    fontSize: 28,
    letterSpacing: -0.33,
  );

  static const labelSmall = TextStyle(
    fontFamily: helveticaNeue,
    fontWeight: FontWeight.w400,
    fontSize: 24,
    letterSpacing: -0.33,
  );

  static const bodyLarge = TextStyle(
    fontFamily: helveticaNeue,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    letterSpacing: -0.33,
  );

  static const bodyMedium = TextStyle(
    fontFamily: helveticaNeue,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.33,
  );

  static const bodySmall = TextStyle(
    fontFamily: helveticaNeue,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.33,
  );
}
