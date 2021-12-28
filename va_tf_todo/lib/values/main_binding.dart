import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/screens/home/binding.dart';
import 'package:va_tf_todo/screens/profile/binding.dart';
import 'package:va_tf_todo/screens/profile/controller.dart';
import 'package:va_tf_todo/screens/settings/bingding.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<InitialBinding>(() => InitialBinding());
    Get.put<HomeBinding>(HomeBinding(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put(SettingsController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
  }
}
