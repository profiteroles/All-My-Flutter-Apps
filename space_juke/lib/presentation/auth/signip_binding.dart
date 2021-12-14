import 'package:get/instance_manager.dart';
import 'signup_controller.dart';

class SignUpBinging extends Bindings {
  @override
  void dependencies() {
    print('LoginBinding - dependencies is Called');
    Get.lazyPut(() => SignUpController(
        // localInterface: Get.put(LocalStorageImpl()),
        // auth: Get.find<AuthRepository>(),
        ));
  }
}
