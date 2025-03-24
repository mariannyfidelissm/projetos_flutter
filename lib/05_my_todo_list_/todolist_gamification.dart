import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/03_marybank/themes/my_theme.dart';
import 'data/task_inherited.dart';
import 'screens/initial_screen.dart';

class TodoListGamification extends StatelessWidget {
  const TodoListGamification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}






