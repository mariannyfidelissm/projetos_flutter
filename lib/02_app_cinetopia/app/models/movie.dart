import '../helpers/consts.dart';

class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String releaseDate;
  final String overview;

  const Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.overview,
  });

  String get imageUrlWithPrefix => "$prefix$imageUrl";

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'imageUrl': this.imageUrl,
      'releaseDate': this.releaseDate,
      'overview': this.overview,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['poster_path'] as String,
      releaseDate: map['release_date'] as String,
      overview: map['overview'] as String,
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: int.parse(json["id"]),
      title: json["title"],
      imageUrl: json["poster_path"],
      releaseDate: json["release_date"],
      overview: json["overview"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "poster_path": this.imageUrl,
      "release_date": this.releaseDate,
      "overview": this.overview,
    };
  }
//
}
