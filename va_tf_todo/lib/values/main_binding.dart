import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/screens/auth/binding.dart';
import 'package:va_tf_todo/screens/home/binding.dart';
import 'package:va_tf_todo/screens/initial/binding.dart';
import 'package:va_tf_todo/screens/profile/controller.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialBinding>(() => InitialBinding());
    Get.lazyPut<HomeBinding>(() => HomeBinding());
    Get.lazyPut<SigningBinding>(() => SigningBinding());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
