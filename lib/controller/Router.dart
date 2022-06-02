import 'package:film_uygulamasi/profile/profileUpdate.dart';
import 'package:film_uygulamasi/profile/resetPassword.dart';
import 'package:film_uygulamasi/profile/signIn.dart';
import 'package:film_uygulamasi/profile/signUp.dart';
import 'package:film_uygulamasi/profile/signup_signin.dart';
import 'package:flutter/material.dart';

import 'package:film_uygulamasi/main.dart';
import 'package:film_uygulamasi/mainScreen/editorChoices.dart';
import 'package:film_uygulamasi/mainScreen/favouriteMovies.dart';
import 'package:film_uygulamasi/mainScreen/whoWeAre.dart';

import '../movieListScreens/movie_add.dart';
import '../movieListScreens/movie_details.dart';
import '../movieListScreens/movie_list.dart';
import '../profile/profile.dart';

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
      case '/profilePage':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case '/resetPassword':
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => const SignIn());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => const SignUp());
      case '/registerAndLogin':
        return MaterialPageRoute(builder: (_) => const RegisterAndLogin());
      case '/profileUpdate':
        return MaterialPageRoute(builder: (_) => const ProfileUpdate());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
