import 'package:get/route_manager.dart';
import 'package:va_tf_todo/screens/auth/binding.dart';
import 'package:va_tf_todo/screens/auth/view.dart';
import 'package:va_tf_todo/screens/home/binding.dart';
import 'package:va_tf_todo/screens/home/view.dart';
import 'package:va_tf_todo/screens/settings/widgets/about.dart';
import 'package:va_tf_todo/screens/initial/initial.dart';
import 'package:va_tf_todo/screens/profile/binding.dart';
import 'package:va_tf_todo/screens/profile/view.dart';
import 'package:va_tf_todo/screens/show/task_screen.dart';

class AppRoutes {
  static const String initial = '/initial';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String task = '/tasks';
  static const String profile = '/profile';
  static const String about = '/about';
  static const String privacyURL = 'https://www.iubenda.com/privacy-policy/71269859';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.initial, page: () => const InitialScreen(), binding: AuthBinding()),
    GetPage(name: AppRoutes.auth, page: () => const SigningScreen(), binding: AuthBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen(), binding: ProfileBinding()),
    GetPage(name: AppRoutes.task, page: () => const TaskDetailScreen()),
    GetPage(name: AppRoutes.about, page: () => const AboutScreen()),
  ];
}
