import 'package:space_juke/presentation/favs/favs_screen.dart';
import 'package:space_juke/presentation/genre/genre_binding.dart';
import 'package:space_juke/presentation/genre/genre_screen.dart';
import 'package:space_juke/presentation/playlist/playlist_binding.dart';
import 'package:space_juke/presentation/playlist/playlist_screen.dart';
import 'package:space_juke/presentation/tracks/tracks_binding.dart';
import 'package:space_juke/presentation/tracks/tracks_screen.dart';

import '../../presentation/home/home_screen.dart';
import '../../presentation/home/home_binding.dart';

import '../../presentation/auth/login_screen.dart';
import '../../presentation/auth/login_binding.dart';

import '../../presentation/auth/signup_screen.dart';
import '../../presentation/auth/signip_binding.dart';

import '../../presentation/home/profile_screen.dart';

import '../../presentation/initial/initial_view.dart';
import '../../presentation/initial/initial_binding.dart';

import 'package:get/route_manager.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String tracks = '/tracks';
  static const String genres = '/genres';
  static const String playlist = '/playlist';
  static const String favorite = '/favorite';
  static const String account = '/account';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => InitialView(), binding: InitialBinding()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen(), binding: LoginBinging()),
    GetPage(name: AppRoutes.signup, page: () => SignUpScreen(), binding: SignUpBinging()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.tracks, page: () => TracksScreen()),
    GetPage(name: AppRoutes.genres, page: () => GenreScreen()), // Bindings are in the MainBindings
    GetPage(name: AppRoutes.playlist, page: () => PlaylistScreen()),
    GetPage(name: AppRoutes.favorite, page: () => FavouritesScreen()),
    GetPage(name: AppRoutes.account, page: () => ProfileScreen()),
  ];
}
