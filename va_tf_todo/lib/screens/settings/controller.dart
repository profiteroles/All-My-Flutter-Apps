import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/values/theme/dark_theme.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';
import 'package:va_tf_todo/values/utils/keys.dart';

class SettingsController extends GetxController {
  static SettingsController instance = Get.find();

  RxBool isDarkMode = false.obs;
  RxBool nofityOn = true.obs;
  RxString appLanguage = 'English'.obs;

  final _storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    isDarkMode.value = await _storage.read(themeKey) ?? false;
    setThemeMode(isDarkMode());
  }

  final List locale = [
    {'name': 'English', 'locale': const Locale('en', 'AUS')},
    {'name': 'Deutsch', 'locale': const Locale('de', 'DEU')},
    {'name': 'Español', 'locale': const Locale('es', 'ESP')},
    {'name': 'Français', 'locale': const Locale('fr', 'FRA')},
    {'name': 'Pусский', 'locale': const Locale('ru', 'RUS')},
  ];

  void setThemeMode(bool value) {
    debugPrint('SettingsController - setThemeMode is Called');
    isDarkMode(value);
    Get.changeTheme(value ? darkTheme : lightTheme);
    _storage.write(themeKey, value);
  }

  void setNotification(bool value) {
    debugPrint('SettingsController - setThemeMode is Called');
    nofityOn(value);
  }

  void setLanguage(int index) {
    debugPrint('SettingsController - setLanguage is Called');
    Get.updateLocale(locale[index]['locale']);
    appLanguage(locale[index]['name']);
    Get.back();
  }
}
