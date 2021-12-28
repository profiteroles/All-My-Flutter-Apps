import 'package:get/route_manager.dart';
import 'package:va_tf_todo/screens/auth/binding.dart';
import 'package:va_tf_todo/screens/auth/view.dart';
import 'package:va_tf_todo/screens/home/binding.dart';
import 'package:va_tf_todo/screens/home/view.dart';
import 'package:va_tf_todo/screens/profile/binding.dart';
import 'package:va_tf_todo/screens/profile/view.dart';
import 'package:va_tf_todo/screens/show/task_screen.dart';

class AppRoutes {
  static const String initial = '/initial';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String task = '/tasks';
  static const String profile = '/profile';
}

class AppPages {
  static final pages = [
    // GetPage(name: AppRoutes.initial, page: () => InitialView(), binding: InitialBinding()),
    GetPage(name: AppRoutes.auth, page: () => const SigningScreen(), binding: SigningBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(name: AppRoutes.task, page: () => const TaskDetailScreen()),
    GetPage(name: AppRoutes.profile, page: () => ProfileScreen(), binding: ProfileBinding()),
  ];
}
