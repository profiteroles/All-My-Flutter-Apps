import 'package:get/instance_manager.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    print('SplashBinding - dependencies');
    Get.lazyPut(() => SplashController(
          localInterface: Get.find(),
          apiInterface: Get.find(),
        ));
  }
}
