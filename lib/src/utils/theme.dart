import 'package:flutter/material.dart';

enum AppThemes {
  dark,
  light,
}

final Map<AppThemes, ThemeData> appThemeData = <AppThemes, ThemeData>{
  AppThemes.dark: darkTheme,
  AppThemes.light: lightTheme,
};

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.dark,
  primarySwatch:
      MaterialColor(const Color(0xff709CFD).value, const <int, Color>{
    0: Color(0xff2F3245),
    100: Color(0xff212435),
    200: Color(0xff272a3b),
    300: Color(0xff4F536C),
    400: Color(0xff709CFD),
    500: Color(0xff5C49E1),
    600: Color(0xff7C9BEB),
    700: Color(0xff58CBC9),
  }),
  primaryColor: const Color(0xff76ACFF),
  accentColorBrightness: Brightness.light,
  accentColor: const Color(0xff59CBCB),
  scaffoldBackgroundColor: const Color(0xff222430),
  cardColor: const Color(0xff272A3B),
  dividerColor: const Color(0xFF8D9496),
  canvasColor: const Color(0xff434656),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff709CFD),
    primaryVariant: Color(0xff5C49E1),
    secondary: Color(0xff272A3B),
    secondaryVariant: Color(0xff4F536C),
    surface: Color(0xff4F536C),
    background: Color(0xff2F3245),
    error: Color(0xff4D516A),
    onPrimary: Color(0xffffffff),
    onSecondary: Color(0xffffffff),
    onSurface: Color(0xffffffff),
    onBackground: Color(0xffffffff),
    onError: Color(0xffFF6D83),
  ),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.dark,
  primaryColor: const Color(0xff0099FF),
  accentColorBrightness: Brightness.dark,
  accentColor: const Color(0xff0099FF),
  scaffoldBackgroundColor: const Color(0xffDDE0E1),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0xFF8D9496),
  canvasColor: const Color(0xffffffff),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff0099FF),
    primaryVariant: Color(0xff5C49E1),
    secondary: Color(0xffF1F4FD),
    secondaryVariant: Color(0xffF6F7F9),
    surface: Color(0xffffffff),
    background: Color(0xffF1F4FD),
    error: Color(0xffF1F4FD),
    onPrimary: Color(0xffffffff),
    onSecondary: Color(0xff111111),
    onSurface: Color(0xff111111),
    onBackground: Color(0xff111111),
    onError: Color(0xff983594),
  ),
);
