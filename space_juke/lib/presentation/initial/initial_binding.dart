import 'package:get/instance_manager.dart';
// import 'package:space_juke/domain/provider/playlist_provider.dart';
// import 'package:space_juke/domain/repository/playlist_repository.dart';
// import 'package:space_juke/presentation/home/home_controller.dart';
import 'initial_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    print('InitialBinding - dependencies is Called');
    Get.lazyPut(() => InitialController());
    // Get.lazyPut(() => HomeController());

    // Get.lazyPut(() => PlaylistRepository());
    // Get.lazyPut(() => PlaylistAPIClient());
  }
}
