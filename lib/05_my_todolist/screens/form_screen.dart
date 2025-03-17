import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form_key,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inserir uma nova tarefa',
              style: TextStyle(color: Colors.white70)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2.2)),
              height: 650,
              width: MediaQuery.of(context).size.width * 0.9, // 375,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return '';
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: difficultController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.parse(value) < 1 ||
                            int.parse(value) > 5 ||
                            int.tryParse(value) == null) {
                          return 'Preencha com uma dificuldade entre 1 e 5';
                        }
                        return '';
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: imageController,
                      textAlign: TextAlign.center,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Sua imagem aqui',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    height: 240,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 2, color: Colors.transparent)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (context, object, stackError) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/images/my_todolist/nophoto.png'),
                              //Icon(Icons.error_outlined),
                              Text('Imagem não encontrada !')
                            ],
                          );
                        },
                        loadingBuilder: (context, object, event) {
                          if (event == null) {
                            return object;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (form_key.currentState!.validate()) {
                        String name = nameController.text;
                        int difficult = int.parse(difficultController.text);
                        String image = imageController.text;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tarefa foi salva com sucesso!'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue),
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
