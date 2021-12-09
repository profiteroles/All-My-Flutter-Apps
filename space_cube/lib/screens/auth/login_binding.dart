import 'package:get/instance_manager.dart';
import 'package:space_cube/screens/auth/login_controller.dart';

class LoginBinging extends Bindings {
  @override
  void dependencies() {
    print('LoginBinding');
    Get.lazyPut(() => LoginController(
          localInterface: Get.find(),
          apiInterface: Get.find(),
        ));
  }
}
