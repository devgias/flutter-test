import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static final _fontFamily = GoogleFonts.sora().fontFamily;

  static final _light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: AppColors.primary400,
      primaryContainer: AppColors.primary200,
      secondary: AppColors.neutral500,
      secondaryContainer: AppColors.background,
      tertiary: AppColors.primary200,
      tertiaryContainer: AppColors.background,
      appBarColor: AppColors.background,
      error: AppColors.danger200,
    ),
    scaffoldBackground: AppColors.background,
    surface: AppColors.background,
    subThemesData: const FlexSubThemesData(
      inputDecoratorRadius: 16,
      inputDecoratorUnfocusedBorderIsColored: false,
      cardRadius: 20,
      dialogRadius: 20,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: _fontFamily,
  );

  static ThemeData get light => _light.modified;
}

extension _ThemeDataExt on ThemeData {
  ThemeData get modified => copyWith(
        appBarTheme: appBarTheme.copyWith(
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
          foregroundColor: AppColors.neutral500,
          titleTextStyle: AppTextStyle.s18w700
              .merge(appBarTheme.titleTextStyle)
              .copyWith(color: AppColors.neutral500),
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
          ),
        ),
        textTheme: textTheme.apply(
          bodyColor: AppColors.neutral500,
          displayColor: AppColors.neutral500,
        ),
      );
}
