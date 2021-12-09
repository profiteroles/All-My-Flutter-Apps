import 'package:get/instance_manager.dart';
import 'package:space_cube/application/repositories/api_repo_impl.dart';
import 'package:space_cube/application/storage/local_storage_impl.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print('HomeBinding');
    Get.lazyPut(
      () => HomeController(
        localInterface: Get.put(LocalStorageImpl()),
        apiInterface: Get.put(APIRepositoryImpl()),
      ),
    );
  }
}
