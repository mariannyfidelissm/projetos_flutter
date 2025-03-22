import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/06_bytebank/screens/dashboard.dart';

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        hintColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
