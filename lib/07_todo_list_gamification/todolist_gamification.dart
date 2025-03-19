import 'package:flutter/material.dart';
import 'data/task_inherited.dart';
import 'package:primeiro_app_flutter/07_todo_list_gamification/screens/initial_screen.dart';

class TodoListGamification extends StatelessWidget {
  const TodoListGamification({Key? key}) : super(key: key);

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






