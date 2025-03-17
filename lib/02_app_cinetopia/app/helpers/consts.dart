import '../../api_key.dart';

const String populaMoviesUrl =
    "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'";

const request_headers = {
  'accept': 'application/json',
  'Authorization': 'Bearer $key'
};

const String prefix = "https://image.tmdb.org/t/p/w500";

const String moviePrefixUrl = "https://api.themoviedb.org/3/search/movie?query=";

const String movieFilterSulfix = "&include_adult=false&language=en-US&page=1;";