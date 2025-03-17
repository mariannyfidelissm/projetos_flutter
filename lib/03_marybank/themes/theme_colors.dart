import 'package:flutter/material.dart';

class ThemeColors{

  static const MaterialColor primaryColor = Colors.purple;
  static const List<Color> headerGradient = [
    Color.fromRGBO(103, 99, 234, 1),
    Color.fromRGBO(155, 105, 254, 1),
    Color.fromRGBO(195, 107, 255, 1),
  ];

  static const recentActivity = {
    'spent': Color.fromRGBO(255, 175, 29, 1.0),  //spent - seria gastos em português
    'income': Color.fromRGBO(191, 69, 198, 1.0), //income - seria renda em português
  };
  
  static const division = Color.fromRGBO(166, 166, 166, 1.0);
}