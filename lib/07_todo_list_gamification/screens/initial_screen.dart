import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/07_todo_list_gamification/data/task_dao.dart';
import '../components/task.dart';
import '../data/task_inherited.dart';
import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(), title: const Text('Tarefas')),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items![index];
                            return tarefa;
                          });
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.error_outline, size: 128),
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0),
                            child: Text(
                              'Não há nenhuma tarefa cadastrada',textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 28),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return Text('Erro ao carregar tarefas ');
                  break;
              }return Text('Erro desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
