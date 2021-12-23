import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/theme/dark_theme.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';

class SettingsController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxBool nofityOn = true.obs;

  void setThemeMode(bool value) {
    debugPrint('SettingsController - setThemeMode is Called');
    isDarkMode(value);
    Get.changeTheme(value ? darkTheme : lightTheme);
  }

  void setNotification(bool value) {
    debugPrint('SettingsController - setThemeMode is Called');
    nofityOn(value);
  }
}
