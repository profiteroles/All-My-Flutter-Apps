import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/screens/home/binding.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';
import 'package:va_tf_todo/screens/singing/binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeBinding>(() => HomeBinding());
    Get.lazyPut<SigningBinding>(() => SigningBinding());
    Get.lazyPut<SettingsController>(() => SettingsController());
    // Get.lazyPut<ProfileBinding>(() => ProfileBinding());
  }
}
