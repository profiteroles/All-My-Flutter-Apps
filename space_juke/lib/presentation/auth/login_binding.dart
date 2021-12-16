import 'package:get/instance_manager.dart';
import 'package:space_juke/domain/provider/auth_provider.dart';
import 'package:space_juke/domain/repository/auth_repository.dart';
import 'login_controller.dart';

class LoginBinging extends Bindings {
  @override
  void dependencies() {
    print('LoginBinding - dependencies is Called');
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthApiClient>(() => AuthApiClient());
  }
}
