import 'package:deliverone/presentation/main/main_bindings.dart';

import '../../presentation/home/home_screen.dart';
import '../../presentation/home/home_binding.dart';

import '../../presentation/login/login_screen.dart';
import '../../presentation/login/login_binding.dart';

import '../../presentation/profile/profile_screen.dart';

import '../../presentation/splash/splash_screen.dart';
import '../../presentation/splash/splash_binding.dart';

import 'package:get/route_manager.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String account = '/account';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String favorite = '/favorite';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      // bindings: [MainBindings(), LoginBinging()],
      binding: LoginBinging(),
    ),
    // GetPage(
    //   name: JukeRoutes.signup,
    //   page: () => SignUpPage(),
    // ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: JukeRoutes.favorite,
    //   page: () => FavoritiesPage(),
    // ),
    GetPage(
      name: AppRoutes.account,
      page: () => ProfileScreen(),
      // binding: ProfileBinding(),
    ),
  ];
}
