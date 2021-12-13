import '../../presentation/home/home_screen.dart';
import '../../presentation/home/home_binding.dart';

import '../../presentation/auth/login_screen.dart';
import '../../presentation/auth/login_binding.dart';

import '../../presentation/auth/signup_screen.dart';
import '../../presentation/auth/signip_binding.dart';

import '../../presentation/profile/profile_screen.dart';

import '../../presentation/initial/initial_view.dart';
import '../../presentation/initial/initial_binding.dart';

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
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinging(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignUpScreen(),
      binding: SignUpBinging(),
    ),
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
