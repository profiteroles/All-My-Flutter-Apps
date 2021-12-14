import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/domain/models/user.dart';
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

  void checkSession() async {
    print('InitialController - checkSession is Called');
    final authSession = await storage.read(SESSION_KEY) ?? '';

    print('Session: $authSession');
    if (authSession.toString() == '') {
      Get.offNamed(AppRoutes.login);
    } else {
      final user = User.fromJson(authSession['user']);
      Get.offNamed(AppRoutes.home, arguments: user);
    }
  }

  void validateTheme() {
    print('InitialController - validateTheme is Called');
    final isDark = storage.read(THEME_KEY) ?? false;
    print('Theme Mode is: ${isDark ? 'DarkMode' : 'LightMode'}');
    if (isDark) {
      Get.changeTheme(isDark ? darkTheme : lightTheme);
    } else {
      storage.writeIfNull(THEME_KEY, false);
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }
  }
}
