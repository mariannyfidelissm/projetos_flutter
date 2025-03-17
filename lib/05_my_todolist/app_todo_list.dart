import 'package:primeiro_app_flutter/05_my_todolist/screens/form_screen.dart';

import './screens/inicial_screen.dart';
import 'package:flutter/material.dart';

class AppTodoList extends StatefulWidget {
  const AppTodoList({Key? key}) : super(key: key);

  @override
  State<AppTodoList> createState() => _AppTodoListState();
}

class _AppTodoListState extends State<AppTodoList> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialScreen(),
    );
  }
}
