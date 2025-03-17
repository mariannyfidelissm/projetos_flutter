import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'search_movies.dart';
import '../components/botao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF000000),
          Color(0xFF1D0E44),
        ], begin: Alignment.topCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset("assets/images/cinetopia/logo.png"),
                ),
                Image.asset("assets/images/cinetopia/splash.png"),
                //Image.asset("assets/images/cinetopia/circular_image.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    "Um lugar ideal para buscar, salvar e organizar seus filmes favoritos !",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 70),
                PrimaryBottom(
                  text: "Quero começar ",
                  icon: Icons.arrow_forward,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      //return SearchMovies();
                      return Dashboard();
                    }));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
