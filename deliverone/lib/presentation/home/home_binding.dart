import 'package:deliverone/presentation/cart/cart_controller.dart';

import '../../domain/repository/api_repo_impl.dart';
import '../../domain/repository/local_storage_impl.dart';
import 'package:get/instance_manager.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print('HomeBinding');
    Get.lazyPut(() => HomeController(Get.put(LocalStorageImpl()), Get.put(APIRepositoryImpl())));
    Get.lazyPut(() => CartController());
  }
}
