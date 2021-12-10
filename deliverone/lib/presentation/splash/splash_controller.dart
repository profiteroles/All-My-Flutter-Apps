import 'package:get/state_manager.dart';

import '../../domain/repository/api_repository.dart';
import '../../domain/repository/local_storage_repository.dart';
import '../../domain/routes/routes.dart';
import '../../themes/theme.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  SplashController({required this.localInterface, required this.apiInterface});
  final LocalStorageInterface localInterface;
  final APIRepositoryInterface apiInterface;

  @override
  void onInit() {
    super.onInit();
    validateTheme();
  }

  // RxString logoPath = 'assets/images.logo.png'.obs;

  @override
  void onReady() {
    super.onReady();
    validateSession();
  }

  Future<void> validateTheme() async {
    print('Splash Controller - validateTheme is Called');

    final isDark = await localInterface.isDarkMode();
    print('Theme Mode is $isDark');
    if (isDark) {
      Get.changeTheme(isDark ? darkTheme : lightTheme);
    } else {
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }
  }

  Future<void> validateSession() async {
    print('Splash Controller - validateSession is Called');
    final token = await localInterface.getToken();
    Future.delayed(Duration(seconds: 2));
    if (token.isNotEmpty) {
      final user = await apiInterface.getUserFromToken(token);
      await localInterface.saveUser(user);
      Get.offNamed(AppRoutes.home);
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }
}
