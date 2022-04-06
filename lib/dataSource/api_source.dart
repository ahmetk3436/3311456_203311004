// To parse this JSON data, do
//
//     final movies = moviesFromMap(jsonString);

import 'dart:convert';

Movies moviesFromMap(String str) => Movies.fromMap(json.decode(str));

String moviesToMap(Movies data) => json.encode(data.toMap());

class Movies {
  Movies({
    required this.movies,
  });

  final List<Movie> movies;

  factory Movies.fromMap(Map<String, dynamic> json) => Movies(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toMap())),
      };
}

class Movie {
  Movie({
    required this.movieName,
    required this.movieExplanation,
    required this.imdbPoint,
    required this.imgUrl,
  });

  final String movieName;
  final String movieExplanation;
  final double imdbPoint;
  final String imgUrl;

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        movieName: json["movieName"],
        movieExplanation: json["movieExplanation"],
        imdbPoint: json["imdbPoint"].toDouble(),
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toMap() => {
        "movieName": movieName,
        "movieExplanation": movieExplanation,
        "imdbPoint": imdbPoint,
        "imgUrl": imgUrl,
      };
}
