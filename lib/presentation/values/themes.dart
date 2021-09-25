import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  Themes._();

  static const colorScheme = const ColorScheme(
    primary: const Color(0xFFfe832a),
    primaryVariant: const Color(0xFFfe832a),
    secondary: const Color(0xFFFDB434),
    secondaryVariant: const Color(0xFFFDB434),
    surface: Colors.white,
    background: Colors.white,
    error: const Color(0xffe44034),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: colorScheme.primary,
    colorScheme: colorScheme,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFFF3F3F3),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: colorScheme.primary,
      selectedLabelStyle: TextStyle(
        color: colorScheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: const Color(0xFFA4A4A4),
      unselectedLabelStyle: TextStyle(
        color: const Color(0xFFA4A4A4),
        fontSize: 14,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    splashColor: colorScheme.primary.withOpacity(0.26),
    disabledColor: const Color(0xFFA4A4A4),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}
