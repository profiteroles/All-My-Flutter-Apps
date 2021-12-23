import 'package:get/route_manager.dart';
import 'package:va_tf_todo/screens/home/binding.dart';
import 'package:va_tf_todo/screens/home/view.dart';
import 'package:va_tf_todo/screens/show/task_screen.dart';
import 'package:va_tf_todo/screens/singing/binding.dart';
import 'package:va_tf_todo/screens/singing/view.dart';

class AppRoutes {
  static const String initial = '/initial';
  static const String signing = '/signing';
  static const String home = '/home';
  static const String task = '/task';
  static const String account = '/account';
}

class AppPages {
  static final pages = [
    // GetPage(name: AppRoutes.splash, page: () => InitialView(), binding: InitialBinding()),
    GetPage(name: AppRoutes.signing, page: () => const SigningScreen(), binding: SigningBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(name: AppRoutes.task, page: () => const TaskDetailScreen()),
  ];
}
