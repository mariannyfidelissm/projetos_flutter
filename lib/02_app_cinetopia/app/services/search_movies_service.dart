import 'dart:convert';
import 'dart:developer';
import '../models/movie.dart';
import 'package:http/http.dart' as http;
import '../helpers/consts.dart';

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

class SearchPopularMoviesService implements SearchMoviesService {
  List<Movie> movies = <Movie>[];

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response =
          await http.get(Uri.parse(populaMoviesUrl), headers: request_headers);
      if (response.statusCode == 200) {
        //print(response.body);
        for (dynamic movie in json.decode(response.body)['results']) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (e) {
      log(e.toString());
      return movies;
    }
  }
}

class SearchForMovie implements SearchMoviesService {

  List<Movie> movies = <Movie>[];
  final String query;

  SearchForMovie({required this.query});

  @override
  Future<List<Movie>> getMovies() async {
    try {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(moviePrefixUrl + query + movieFilterSulfix);
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      final response = await http.get(
          Uri.parse(moviePrefixUrl + query + movieFilterSulfix),
          headers: request_headers);
      if (response.statusCode == 200) {

        for (dynamic movie in json.decode(response.body)['results']) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (e) {
      log(e.toString());
      return movies;
    }
  }
}
