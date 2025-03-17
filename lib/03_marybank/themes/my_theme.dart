import 'package:flutter/material.dart';

import 'theme_colors.dart';

ThemeData MyTheme = ThemeData(
    primarySwatch: ThemeColors.primaryColor,
    primaryColor: ThemeColors.primaryColor,
    brightness: Brightness.dark,
    fontFamily: 'Raleway',
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      bodyLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.normal,)
    ));
