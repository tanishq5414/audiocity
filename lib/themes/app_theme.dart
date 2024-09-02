import 'package:flutter/material.dart';
import 'package:psventuresassignment/themes/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    // primaryColor: Pallete.blackColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Pallete.blackColor),
      displaySmall: TextStyle(color: Pallete.blackColor),
      displayMedium: TextStyle(color: Pallete.blackColor),
      headlineLarge: TextStyle(color: Pallete.blackColor),
      headlineMedium: TextStyle(color: Pallete.blackColor),
      headlineSmall: TextStyle(color: Pallete.blackColor),
      titleLarge: TextStyle(color: Pallete.blackColor),
      titleMedium: TextStyle(color: Pallete.blackColor),
      titleSmall: TextStyle(color: Pallete.blackColor),
      bodyLarge: TextStyle(color: Pallete.blackColor),
      bodyMedium: TextStyle(color: Pallete.blackColor),
      bodySmall: TextStyle(color: Pallete.blackColor),
      labelLarge: TextStyle(color: Pallete.blackColor),
      labelMedium: TextStyle(color: Pallete.blackColor),
      labelSmall: TextStyle(color: Pallete.blackColor),
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
          color: Pallete.whiteColor),
      titleTextStyle: TextStyle(
          color: Pallete.whiteColor, fontSize: 18, fontWeight: FontWeight.w700),
    ),
    primaryTextTheme: const TextTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.whiteColor,
    ),
    iconTheme: const IconThemeData(
      color: Pallete.whiteColor,
    ),
  );
}
