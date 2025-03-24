import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,//Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          Image.asset("assets/images/bancodouro/banner.png"),
          Align(
            alignment: Alignment.bottomLeft,
              child: Image.asset("assets/images/bancodouro/stars.png")),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 68,),
                  Image.asset("assets/images/bancodouro/logo.png", width: 120,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 68,),
                      const Text(
                        'Sistema de gestão de compras',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        decoration: InputDecoration(label: Text('Email')),
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Senha'),
                        ),
                      ),
                      SizedBox(height: 32,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "home");
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.orange)//AppColors.orange,)
                        ),
                        child: Text("Entrar",style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "registration");
                        },
                        child: const Text("Sem conta? Registre-se agora!"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
