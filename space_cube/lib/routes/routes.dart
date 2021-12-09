import 'package:get/route_manager.dart';
import 'package:space_cube/screens/auth/profile.dart';
import 'package:space_cube/screens/auth/login_binding.dart';
import 'package:space_cube/screens/auth/profile_binding.dart';
import 'package:space_cube/screens/favorities/favorities_page.dart';
import 'package:space_cube/screens/home/home_binding.dart';
import 'package:space_cube/screens/splash/splash_binding.dart';
import '/screens/Genres/genres_page.dart';
import '/screens/Playlists/playlists_page.dart';
import '/screens/Tracks/tracks_page.dart';
import '/screens/auth/login_page.dart';
import '/screens/auth/signup_page.dart';
import '/screens/home/home_page.dart';
import '/screens/splash/splash_screen.dart';

class JukeRoutes {
  static const String splash = '/splash';
  static const String tracks = '/tracks';
  static const String playlists = '/playlists';
  static const String genres = '/genres';
  static const String account = '/account';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String favorite = '/favorite';
}

class JukePages {
  static final pages = [
    GetPage(
      name: JukeRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: JukeRoutes.login,
      page: () => LogInPage(),
      binding: LoginBinging(),
    ),
    GetPage(
      name: JukeRoutes.signup,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: JukeRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: JukeRoutes.tracks,
      page: () => TracksPage(),
    ),
    GetPage(
      name: JukeRoutes.playlists,
      page: () => PlaylistsPage(),
    ),
    GetPage(
      name: JukeRoutes.genres,
      page: () => GenresPage(),
    ),
    GetPage(
      name: JukeRoutes.favorite,
      page: () => FavoritiesPage(),
    ),
    GetPage(
      name: JukeRoutes.account,
      page: () => ProfilePage(),
      // binding: ProfileBinding(),
    ),
  ];
}
