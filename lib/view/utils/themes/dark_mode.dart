import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade900,
    ),
    highlightColor: Colors.white,
    primaryColor: Colors.grey[900],
    secondaryHeaderColor: Colors.grey[750],
    colorScheme: ColorScheme.dark(
        background: Colors.black,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade700));
