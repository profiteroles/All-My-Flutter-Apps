import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/domain/repository/auth_repository.dart';
import 'package:space_juke/domain/repository/playlist_repository.dart';
import 'package:space_juke/presentation/widgets/snackbar_error.dart';
import 'package:space_juke/values/constants.dart';
import 'package:space_juke/values/routes/routes.dart';
import 'package:space_juke/values/themes/theme.dart';

import '../../domain/models/user.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController with StateMixin {
  RxInt index = 0.obs;
  RxBool isDarkMode = false.obs;
  final storage = GetStorage(STORAGE_KEY);
  final User user = Get.arguments;
  final playlistRepo = Get.find<PlaylistRepository>();
  final authRepo = Get.put<AuthRepository>(AuthRepository());

  @override
  void onInit() async {
    super.onInit();
    print('HomeController - onInit is Called');
    print('Logged in User: -  ${Get.arguments.name}');
    loadPlaylist();
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
    authRepo.logout().then((value) {
      print(value);
      storage.remove(USER_KEY);
      storage.remove(SESSION_KEY);
      Get.offNamed(AppRoutes.splash);
      snackbarError(value['message'], isInfo: true);
    });
  }

  void loadPlaylist() async {
    print('HomeController - loadPlaylist is Called');
    await playlistRepo.getAll().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print('HomeController - loadPlaylist - catchError');
      print(err);
      change(null, status: RxStatus.error('Error has occoured'));
    });
  }
}
