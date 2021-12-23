import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
