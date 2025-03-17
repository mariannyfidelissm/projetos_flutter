import 'package:flutter/material.dart';
import 'themes/my_theme.dart';
import 'screens/home.dart';

class MariBankApp extends StatelessWidget {
  const MariBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme,
      home: HomePage(),
      title: "MariBank",
    );
  }
}