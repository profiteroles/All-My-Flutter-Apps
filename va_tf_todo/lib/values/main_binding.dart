import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/data/providers/task_provider.dart';
import 'package:va_tf_todo/data/services/task_repository.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/screens/home/binding.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/profile/controller.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(SettingsController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<HomeController>(HomeController(taskRepository: TaskRepository(taskProvider: TaskProvider())), permanent: true);
    Get.put(ProfileController(), permanent: true);
  }
}
