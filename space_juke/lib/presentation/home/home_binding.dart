import 'package:space_juke/domain/repository/auth_repository.dart';

import 'package:get/instance_manager.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print('HomeBinding');
    Get.lazyPut(() => HomeController(
        // localInterface: Get.put(LocalStorageImpl()),
        // user: Get.()));
        ));
    // Get.lazyPut(() => CartController());
  }
}
