import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';

// Default theme
ThemeData defaultTheme = ThemeData(
  textTheme: TextTheme(
    displayLarge: MyTextStyles.headings1,
    displayMedium: MyTextStyles.headings2,
    displaySmall: MyTextStyles.headings2,
    titleLarge: MyTextStyles.headings3,
    titleMedium: MyTextStyles.headings4,
    titleSmall: MyTextStyles.headings5,
    headlineLarge: MyTextStyles.subtitle1,
    headlineMedium: MyTextStyles.subtitle1,
    headlineSmall: MyTextStyles.subtitle2,
    bodyLarge: MyTextStyles.paragraph1,
    bodyMedium: MyTextStyles.paragraph2,
    bodySmall: MyTextStyles.quotes,
    labelLarge: MyTextStyles.button,
    labelMedium: MyTextStyles.label,
    labelSmall: MyTextStyles.caption,
  ),
);

// Light theme
ThemeData lightTheme = defaultTheme.copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: MyColors.backgroundLight,
  primaryColor: MyColors.primaryLight,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: MyColors.primaryLight,
    onPrimary: MyColors.backgroundLight,
    secondary: MyColors.secondaryLight,
    onSecondary: MyColors.neutralLight,
    error: MyColors.dangerLight,
    onError: MyColors.backgroundLight,
    background: MyColors.backgroundLight,
    onBackground: MyColors.neutralLight,
    surface: MyColors.backgroundLight,
    onSurface: MyColors.neutralLight,
  ),
);

// Dark theme
ThemeData darkTheme = defaultTheme.copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: MyColors.backgroundDark,
  primaryColor: MyColors.primaryDark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: MyColors.primaryDark,
    onPrimary: MyColors.backgroundDark,
    secondary: MyColors.secondaryDark,
    onSecondary: MyColors.neutralDark,
    error: MyColors.dangerDark,
    onError: MyColors.backgroundDark,
    background: MyColors.backgroundDark,
    onBackground: MyColors.neutralDark,
    surface: MyColors.backgroundDark,
    onSurface: MyColors.neutralDark,
  ),
);
