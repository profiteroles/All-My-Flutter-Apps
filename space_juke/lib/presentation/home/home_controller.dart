import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/domain/repository/local_storage_impl.dart';
import 'package:space_juke/values/constants.dart';
import 'package:space_juke/values/routes/routes.dart';
import 'package:space_juke/values/themes/theme.dart';

import '../../domain/models/user.dart';
import '../../domain/repository/local_storage_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  RxBool isDarkMode = false.obs;
  final storage = GetStorage(STORAGE_KEY);
  var token = ''.obs;
  // late Map<String, dynamic> userDetails = storage.read(USER_KEY);
  // late User user = User.fromJson(userDetails);
  // final Rx<User> user = localInterface.getUser();
  Rx<User> user = User.empty().obs;

  @override
  void onInit() async {
    super.onInit();
    print('HomeController - onInit is Called');
    print('HomeController - loadUser is Called');
  }

  bool updateTheme(bool isDark) {
    print('Home Controller - updateTheme is Called');
    storage.write(THEME_KEY, isDark);
    print('Theme Mode is $isDark');
    isDarkMode(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme);
    return isDark;
  }

  void logout() {
    debugPrint('ProfileController - logout is Called');
    storage.remove(SESSION_KEY);
    storage.remove(USER_KEY);
    Get.offNamed(AppRoutes.splash);
  }
}
