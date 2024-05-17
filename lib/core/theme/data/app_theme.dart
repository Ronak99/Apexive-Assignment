import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:flutter/material.dart';

const TextTheme _textTheme = TextTheme(
  headlineLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: white,
  ),
  labelLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: white,
  ),
  labelMedium: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: white,
  ),
  labelSmall: TextStyle(
    fontSize: 10,
    color: white,
  ),
  headlineMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: white,
  ),
  headlineSmall: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: white,
  ),
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: white,
  ),
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: white,
  ),
  titleSmall: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: white,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: white,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: white,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: white,
  ),
  displayLarge: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: white,
  ),
  displayMedium: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: white,
  ),
  displaySmall: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: white,
  ),
);

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: white.withOpacity(.3),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: white.withOpacity(.16),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  hintStyle: _textTheme.labelLarge,
);

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: lightThemePrimaryGradient.first,
        textTheme: _textTheme,
        highlightColor: lightThemePrimaryGradient.last,
        inputDecorationTheme: _inputDecorationTheme,
        dividerTheme: DividerThemeData(
          color: white.withOpacity(.16),
          thickness: 1,
        ),
      );
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: darkThemePrimaryGradient.first,
        textTheme: _textTheme,
        highlightColor: darkThemePrimaryGradient.last,
        inputDecorationTheme: _inputDecorationTheme,
      );
}
