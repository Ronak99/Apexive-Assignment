import 'package:apexive_assignment/shared/constants/styles.dart';
import 'package:flutter/material.dart';

const Color primary10 = Colors.black;
const Color primary40 = Colors.white;
const Color primary90 = Colors.white;
const Color primary100 = Colors.black;

const Color secondary10 = Colors.white;
Color secondary40 = Colors.white.withOpacity(.16);
Color secondary90 = Colors.white.withOpacity(.16);
const Color secondary100 = Colors.white;

const Color tertiary10 = Colors.black;
Color tertiary40 = Colors.white.withOpacity(.32);
Color tertiary90 = Colors.white.withOpacity(.32);
const Color tertiary100 = Colors.black;

const Color error10 = Color(0xffCC3C21);
const Color error40 = Color(0xffCC3C21);
Color error90 = const Color(0xffCC3C21).withOpacity(.32);
const Color error100 = Color(0xffFF0000);

const Color neutral99 = Color(0xff0C1D4D);
const Color neutral50 = Color(0xff214ECC);
const Color neutral10 = Colors.white;
const Color neutralVariant30 = Colors.white;
Color neutralVariant50 = Colors.white.withOpacity(.16);
Color neutralVariant80 = Colors.white.withOpacity(.48);
Color neutralVariant90 = Colors.white.withOpacity(.01);

const Color indicatorColor = Color(0xffFFC629);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: tertiary40,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: tertiary40,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  hintStyle: textTheme.bodyLarge,
);

class LightTheme {
  static ThemeData get data => ThemeData(
        brightness: Brightness.dark,
        textTheme: textTheme,
        fontFamily: defaultFontFamily,
        inputDecorationTheme: inputDecorationTheme,
        dividerTheme: dividerThemeData,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: primary40,
          onPrimary: primary100,
          primaryContainer: primary90,
          onPrimaryContainer: primary10,
          secondary: secondary40,
          onSecondary: secondary100,
          secondaryContainer: secondary90,
          onSecondaryContainer: secondary10,
          tertiary: tertiary40,
          onTertiary: tertiary100,
          tertiaryContainer: tertiary90,
          onTertiaryContainer: tertiary10,
          error: error40,
          onError: error100,
          errorContainer: error90,
          onErrorContainer: error10,
          onBackground: neutral10,
          surface: neutral99,
          background: neutral99,
          onSurface: neutral10,
          surfaceVariant: neutralVariant90,
          onSurfaceVariant: neutralVariant30,
          outline: neutralVariant50,
          outlineVariant: neutralVariant80,
          surfaceTint: neutral50,
        ),
      );
}
