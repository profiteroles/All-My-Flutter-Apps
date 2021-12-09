import 'package:get/instance_manager.dart';
import 'package:space_cube/screens/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    print('SplashBinding');
    Get.lazyPut(() => SplashController(
          localInterface: Get.find(),
          apiInterface: Get.find(),
        ));
  }
}
