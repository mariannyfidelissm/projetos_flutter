import 'package:flutter/material.dart';

import '../ui/screens/home_page.dart';

class CinetopiaApp extends StatelessWidget {
  const CinetopiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cinetopia",
      theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.deepPurple,
            onPrimary: Colors.deepPurple,
            secondary: Colors.deepPurple,
            onSecondary: Colors.deepPurple,
            error: Colors.redAccent,
            onError: Colors.redAccent,
            surface: Colors.white10,
            onSurface: Colors.white10,
          )),
      home: HomePage(),
    );
  }
}
