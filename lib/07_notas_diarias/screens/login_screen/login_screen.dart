import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/screens/commom/confirmation_dialog.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/screens/commom/exception_dialog.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/service/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  Logger logger = Logger();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        decoration:
            BoxDecoration(border: Border.all(width: 8), color: Colors.white),
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.bookmark,
                    size: 64,
                    color: Colors.brown,
                  ),
                  const Text(
                    "Anotaí - Diário",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text("Relembre seus dias ..",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(thickness: 2),
                  ),
                  const Text("Entre ou Registre-se"),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(label: Text("Senha")),
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 16,
                    obscureText: true,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        login(context);
                      },
                      child: const Text("Continuar")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      //Navigator.pushNamed(context, "home");

      authService.login(email: email, password: password).then(
        (resultLogin) {
          if (resultLogin) {
            logger.i("Login realizado com sucesso !");
            logger.w("$email - $password");
            Navigator.pushReplacementNamed(context, "home");
          }
        },
      ).catchError(
        (error) {
          var innerException = error as HttpException;
          showExceptionDialog(context, content: innerException.message);
        },
        test: (error) => error is HttpException,
      ).catchError(
        (error) {
          logger.e("Usuário não encontrado");
          showConfirmationDialog(
            context,
            content: "Deseja criar um novo usuário usando o email $email ?",
            affirmativeOption: "CRIAR",
          ).then((value) {
            if (value != null && value == true) {
              authService
                  .register(email: email, password: password)
                  .then((resultRegister) {
                if (resultRegister) {
                  logger.i("Registro realizado com sucesso !");
                  logger.w("$email - $password");
                  Navigator.pushReplacementNamed(context, "home");
                }
              });
            }
          });
        },
        test: (error) => error is UserNotFindException,
      );
    }
  }
}
