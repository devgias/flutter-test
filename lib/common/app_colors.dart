import 'package:flutter/material.dart';

/// Soft UI (neumorphism) palette.
///
/// Every surface shares the same [background] colour; depth comes only from
/// the light and dark shadows defined in `AppShadow`.
class AppColors {
  const AppColors._();

  static const background = Color(0xFFE4EBF5);
  static const shadowLight = Color(0xFFFFFFFF);
  static const shadowDark = Color(0xFFA3B1C6);

  static const neutral400 = Color(0xFF8A94A6);
  static const neutral500 = Color(0xFF31456A);

  static const primary400 = Color(0xFF5B6CF9);
  static const primary200 = Color(0xFF8C98FF);

  static const success200 = Color(0xFF3B9C50);
  static const danger200 = Color(0xFFE63C3C);
}
