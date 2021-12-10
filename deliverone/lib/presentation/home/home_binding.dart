import '../../domain/repository/api_repo_impl.dart';
import '../../domain/repository/local_storage_impl.dart';
import 'package:get/instance_manager.dart';

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
