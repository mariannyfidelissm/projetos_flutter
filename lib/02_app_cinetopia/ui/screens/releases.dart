import 'package:flutter/material.dart';

import '../../app/viewmodels/search_movies_viewmodel.dart';
import '../components/movie_card.dart';
import 'details_movie.dart';

class Releases extends StatefulWidget {
  const Releases({super.key});

  @override
  State<Releases> createState() => _ReleasesState();
}

class _ReleasesState extends State<Releases> {
  final SearchMoviesViewModel viewModel = SearchMoviesViewModel();

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: viewModel.getMovie(''),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/images/cinetopia/popular.png",
                  width: 80,
                  height: 80,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      "Filmes populares",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
                  )),

              SliverList.builder(
                  itemCount: viewModel.moviesList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsMovie(
                                      movie: viewModel.moviesList[index])),
                            )
                          },
                          child: MovieCard(movie: viewModel.moviesList[index])),
                    );
                  })
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
