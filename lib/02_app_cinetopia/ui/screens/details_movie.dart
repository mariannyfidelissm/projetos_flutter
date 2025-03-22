import 'package:flutter/material.dart';
import '../../app/models/movie.dart';

class DetailsMovie extends StatelessWidget {
  final Movie movie;

  const DetailsMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF000000),
        Color(0xFF1D0E44),
      ], begin: Alignment.topCenter)),
      child: Padding(
          padding: const EdgeInsets.only(top: 58.0, bottom: 64, left: 20, right: 16),
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                movie.title,
                style: TextStyle(fontSize: 24, color: Colors.white70),
              ),
              SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.width*1,
                decoration: BoxDecoration(
                  color: Color(0xFF000000),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(movie.imageUrlWithPrefix),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: const EdgeInsets.only(right: 16),
              ),
              SizedBox(height: 30,),
              Text(movie.overview,style: TextStyle(fontSize: 14, color: Colors.white70)),
              SizedBox(height: 30,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F3888FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text("Voltar", style: TextStyle(color: Colors.white70),),
                onPressed: () => Navigator.pop(context),
              )
            ]),
          )),
    ));
  }
}
