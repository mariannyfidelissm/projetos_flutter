import 'package:flutter/material.dart';
import 'data/task_inherited.dart';
import 'screens/initial_screen.dart';

class TodoListGamification extends StatelessWidget {
  const TodoListGamification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}






