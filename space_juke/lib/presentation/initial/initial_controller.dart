import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/values/themes/theme.dart';
import '../../values/constants.dart';
import '../../values/routes/routes.dart';

class InitialController extends GetxController {
  final storage = GetStorage(STORAGE_KEY);

  @override
  void onReady() async {
    print('InitialController - onReady is Called');
    super.onReady();
    validateTheme();
    Future.delayed(Duration(seconds: 1), () {
      checkSession();
    });
  }

  void checkSession() {
    print('InitialController - checkSession is Called');
    final authSession = storage.read(SESSION_KEY) ?? '';
    print('Session: $authSession');
    if (authSession.toString() == '') {
      Get.offNamed(AppRoutes.login);
    } else {
      Get.offNamed(AppRoutes.home);
    }
  }

  void validateTheme() {
    print('InitialController - validateTheme is Called');
    final isDark = storage.read(THEME_KEY);
    print('Theme Mode is: ${isDark ? 'DarkMode' : 'LightMode'}');
    if (isDark) {
      Get.changeTheme(isDark ? darkTheme : lightTheme);
    } else {
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }
  }
}
