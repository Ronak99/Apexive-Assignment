import 'package:flutter/material.dart';

const List<Color> lightThemePrimaryGradient = [
  Color(0xff0C1D4D),
  Color(0xff214ECC)
];
const List<Color> darkThemePrimaryGradient = [
  Color(0xff000000),
  Color(0xff292929)
];

const TextTheme textTheme = TextTheme(
  headlineLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  ),
  headlineMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  ),
  headlineSmall: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  labelMedium: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  ),
  labelSmall: TextStyle(
    fontSize: 10,
  ),
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  displayLarge: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
  ),
  displayMedium: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
  displaySmall: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
);

const String defaultFontFamily = 'inter';

DividerThemeData dividerThemeData = const DividerThemeData(thickness: 1);
