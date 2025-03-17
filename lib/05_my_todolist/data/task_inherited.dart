import 'package:flutter/material.dart';

import '../components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List taskList = <Tasks>[
    Tasks('Estudar Flutter', 'assets/images/my_todolist/livro.jpg', 3),
    Tasks('Andar de Bike', 'assets/images/my_todolist/bike.webp', 2),
    Tasks('Ler 50 páginas', 'assets/images/my_todolist/livro.jpg', 1),
    Tasks('Meditar', 'assets/images/my_todolist/meditar.jpeg', 4),
    Tasks('Jogar', 'assets/images/my_todolist/jogar.jpg', 0)
  ];

  void newTask(String name, String photo, int difficult){
    taskList.add(Tasks(name, photo, difficult));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    //TODO: implement updateShouldNotify
    return false;
  }
}
