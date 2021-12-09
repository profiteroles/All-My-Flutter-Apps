import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:space_cube/application/repositories/api_repo_impl.dart';
import 'package:space_cube/application/repositories/api_repository.dart';
import 'package:space_cube/application/storage/local_storage.dart';
import 'package:space_cube/application/storage/local_storage_impl.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorageInterface>(() => LocalStorageImpl());
    Get.lazyPut<APIRepositoryInterface>(() => APIRepositoryImpl());
  }
}
