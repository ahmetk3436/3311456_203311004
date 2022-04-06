import 'package:film_uygulamasi/main.dart';
import 'package:film_uygulamasi/mainScreen/editorChoices.dart';
import 'package:film_uygulamasi/mainScreen/favouriteMovies.dart';
import 'package:film_uygulamasi/mainScreen/whoWeAre.dart';
import 'package:flutter/material.dart';

import '../movieListScreens/movie_add.dart';
import '../movieListScreens/movie_details.dart';
import '../movieListScreens/movie_list.dart';

class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const MyApp());
      case '/movieDetails':
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MovieDetail(index: data));
      case '/movieAdd':
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MovieAdd(index: data));
      case '/movieList':
        return MaterialPageRoute(builder: (_) => const MovieList());
      case '/whoWeAre':
        return MaterialPageRoute(builder: (_) => const WhoWeAre());
      case '/editorChoices':
        return MaterialPageRoute(builder: (_) => const EditorChoices());
      case '/favouriteList':
        return MaterialPageRoute(builder: (_) => const FavouriteMovies());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
