// light theme
import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
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

ThemeData darkTheme = ThemeData(
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
