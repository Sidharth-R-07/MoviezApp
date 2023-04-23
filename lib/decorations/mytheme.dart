import 'dart:math';

import 'package:flutter/material.dart';

class MyTheme {
  //i define two theme darkmode and lightmode.it's dppends on user system mode.!

  //syestem mode on light
  static ThemeData lightMode = ThemeData(
    fontFamily: 'Chinvo',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    textTheme: const TextTheme(
//for appbar title text
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontSize: 32,
          color: Colors.red),
      headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2),
      titleMedium: TextStyle(
          color: Colors.black87,
          letterSpacing: 1,
          fontSize: 22,
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2),
      labelSmall: TextStyle(
          color: Colors.black87,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2),
      labelMedium: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2),
      bodyMedium: TextStyle(
          color: Colors.black54,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 1),

//for slider text
      displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2),
      //for slider text
      displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 1),
      //for slider text
      headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2),
    ),
  );

  //syestem mode on Dark

  static ThemeData darkMode = ThemeData(
    fontFamily: 'Chinvo',
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    textTheme: const TextTheme(
//for appbar text
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontSize: 32,
          color: Colors.redAccent),

      //details screen movie title
      headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2),
      titleMedium: TextStyle(
          color: Colors.grey,
          letterSpacing: 1,
          fontSize: 22,
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2),
      labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2),
      labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2),
      bodyMedium: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 1),
      //for slider text
      displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2),
      //for slider text
      displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 1),
      //for slider text
      headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2),
    ),
  );
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
