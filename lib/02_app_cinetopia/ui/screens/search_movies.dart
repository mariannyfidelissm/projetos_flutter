import 'details_movie.dart';
import 'package:flutter/material.dart';
import '../components/movie_card.dart';
import '../../app/viewmodels/search_movies_viewmodel.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewModel viewModel = SearchMoviesViewModel();

  TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.getMovie(queryController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/images/cinetopia/movie.png",
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white70),
                    controller: queryController,
                    onEditingComplete: () {
                      //viewModel.getMovie(queryController.text);
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: "Filme",
                        hintText: "Pesquisar",
                        prefixIcon: Icon(Icons.movie),
                        prefixIconColor: Colors.white70,
                        labelStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
              ),
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
