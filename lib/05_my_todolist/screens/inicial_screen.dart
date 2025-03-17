import '../components/tasks.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  bool opacidade = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas tarefas'),
        centerTitle: true,
        leading: Icon(Icons.add_task),
        actions: [
          IconButton(
            icon: opacidade ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                opacidade = !opacidade;
              });
            },
          )
        ],
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: Color.fromARGB(255, 208, 221, 237),
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Tasks('Estudar Flutter',
                    'assets/images/my_todolist/livro.jpg', 3),
              ),
              Tasks('Andar de Bike', 'assets/images/my_todolist/bike.webp', 2),
              Tasks('Ler 50 páginas', 'assets/images/my_todolist/livro.jpg', 1),
              Tasks('Meditar', 'assets/images/my_todolist/meditar.jpeg', 4),
              Tasks(
                'Jogar',
                'assets/images/my_todolist/jogar.jpg',
                0,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormScreen()));
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
