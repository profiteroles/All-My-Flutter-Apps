import '../../domain/repository/local_storage_impl.dart';
import '../../domain/repository/local_storage_repository.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LocalStorageInterface>(() => LocalStorageImpl());
    // Get.lazyPut<APIRepositoryInterface>(() => APIRepositoryImpl());
  }
}
