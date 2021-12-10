import 'package:get/instance_manager.dart';
import 'profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        localInterface: Get.find(),
        apiInterface: Get.find(),
      ),
    );
  }
}
