import 'package:flutter/material.dart';
import 'constant.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: White.white_50,
    colorSchemeSeed: Primary.main,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Primary.main,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: White.white_50,
      surfaceTintColor: White.white_50,
    ),
  );
}
