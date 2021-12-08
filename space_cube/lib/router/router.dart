import 'package:flutter/material.dart';
import 'package:space_cube/presentation/Genres/genres_page.dart';
import 'package:space_cube/presentation/Home/home_page.dart';
import 'package:space_cube/presentation/Playlists/playlists_page.dart';
import 'package:space_cube/presentation/Tracks/tracks_page.dart';
import 'package:space_cube/presentation/Unfound/unfound.dart';
import 'package:space_cube/presentation/auth/account_page.dart';
import 'package:space_cube/presentation/auth/login_page.dart';
import 'package:space_cube/presentation/auth/signup_page.dart';
import 'package:space_cube/presentation/favorities/favorities_page.dart';
import 'package:space_cube/router/route_constants.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case signinRoute:
        return MaterialPageRoute(builder: (_) => const LogInPage());
      case accountRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case favoriteRoute:
        return MaterialPageRoute(builder: (_) => const FavoritiesPage());
      case tracksRoute:
        return MaterialPageRoute(builder: (_) => const TracksPage());
      case playlistsRoute:
        return MaterialPageRoute(builder: (_) => const PlaylistsPage());
      case genresRoute:
        return MaterialPageRoute(builder: (_) => const GenresPage());
      default:
        return MaterialPageRoute(builder: (_) => const UnfoundPage());
    }
  }
}
