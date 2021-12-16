import 'package:get/route_manager.dart';
import 'package:va_radio/screens/home/home_screen.dart';

class AppRoutes {
  static const String home = '/home';
}

class AppScreens {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  ];
}
