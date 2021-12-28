import 'package:get/instance_manager.dart';
import 'package:va_tf_todo/screens/profile/controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
