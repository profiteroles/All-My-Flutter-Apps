import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:space_cube/application/repositories/api_repository.dart';
import 'package:space_cube/application/storage/local_storage.dart';
import 'package:space_cube/routes/routes.dart';

class SplashController extends GetxController {
  SplashController({required this.localInterface, required this.apiInterface});
  final LocalStorageInterface localInterface;
  final APIRepositoryInterface apiInterface;

  @override
  void onInit() {
    super.onInit();
    // validateTheme();
  }

  @override
  void onReady() {
    super.onReady();
    validateSession();
  }

//TODO: Switch dark mode to splash
  // void validateTheme() async {
  //   final isDark = await localInterface.isDarkMode();
  //   if (isDark != 'null') {
  //     Get.changeTheme(isDark ? darkTheme : lightTheme);
  //   }else{
  //     Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
  //   }
  // }

  void validateSession() async {
    final token = await localInterface.getToken();
    if (token.isNotEmpty) {
      final user = await apiInterface.getUserFromToken(token);
      await localInterface.saveUser(user);
      Get.offNamed(JukeRoutes.home);
    } else {
      Get.offNamed(JukeRoutes.login);
    }
  }
}
