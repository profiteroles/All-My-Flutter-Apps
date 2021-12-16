import 'package:get/instance_manager.dart';
import 'package:space_juke/domain/repository/playlist_repository.dart';
import 'signup_controller.dart';

class SignUpBinging extends Bindings {
  @override
  void dependencies() {
    print('LoginBinding - dependencies is Called');
    Get.lazyPut(() => SignUpController());
    Get.lazyPut<PlaylistRepository>(() => PlaylistRepository());
  }
}
