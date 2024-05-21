import 'package:apexive_assignment/shared/constants/styles.dart';
import 'package:flutter/material.dart';

const Color primary80 = Colors.black;
const Color primary20 = Colors.black;
const Color primary30 = Colors.white;
const Color primary90 = Colors.black;

const Color secondary20 = Colors.white;
Color secondary30 = Colors.white.withOpacity(.16);
Color secondary80 = Colors.white.withOpacity(.16);
const Color secondary90 = Colors.white;

const Color tertiary20 = Colors.black;
Color tertiary30 = Colors.white.withOpacity(.32);
Color tertiary80 = Colors.white.withOpacity(.32);
const Color tertiary90 = Colors.black;

const Color error80 = Color(0xffCC3C21);
const Color error20 = Colors.white;
Color error30 = const Color(0xffCC3C21).withOpacity(.32);
const Color error90 = Color(0xffFF0000);

const Color neutral99 = Color(0xff0C1D4D);
const Color neutral10 = Colors.white;
Color neutralVariant30 = Colors.black.withOpacity(.01);
Color neutralVariant80 = Colors.white;
Color neutralVariant60 = Colors.white.withOpacity(.16);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: tertiary30,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: tertiary30,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  hintStyle: textTheme.bodyLarge,
);

class DarkTheme {
  static ThemeData get data => ThemeData(
        brightness: Brightness.dark,
        textTheme: textTheme,
        fontFamily: defaultFontFamily,
        inputDecorationTheme: inputDecorationTheme,
        dividerTheme: dividerThemeData,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: primary80,
          onPrimary: primary20,
          primaryContainer: primary30,
          onPrimaryContainer: primary90,
          secondary: secondary80,
          onSecondary: secondary20,
          secondaryContainer: secondary30,
          onSecondaryContainer: secondary90,
          tertiary: tertiary80,
          onTertiary: tertiary20,
          tertiaryContainer: tertiary30,
          onTertiaryContainer: tertiary90,
          error: error80,
          onError: error20,
          errorContainer: error30,
          onErrorContainer: error90,
          onBackground: neutral10,
          surface: neutral99,
          onSurface: neutral10,
          background: neutral99,
          surfaceVariant: neutralVariant30,
          onSurfaceVariant: neutralVariant80,
          outline: neutralVariant60,
          outlineVariant: neutralVariant30,
        ),
      );
}
