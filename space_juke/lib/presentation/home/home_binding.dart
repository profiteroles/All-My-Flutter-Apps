import 'package:space_juke/domain/repository/playlist_repository.dart';

import 'home_controller.dart';
import 'package:get/instance_manager.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/provider/playlist_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print('HomeBinding');
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<PlaylistRepository>(() => PlaylistRepository());
    Get.lazyPut<PlaylistAPIClient>(() => PlaylistAPIClient());
  }
}
