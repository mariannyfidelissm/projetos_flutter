import 'package:flutter/material.dart';

import 'login_page.dart';

class BancoDouroApp extends StatelessWidget {
  const BancoDouroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Douro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Banco Douro App'),
    );
  }
}