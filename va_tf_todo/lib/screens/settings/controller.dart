import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/values/theme/dark_theme.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';
import 'package:va_tf_todo/values/utils/keys.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsController extends GetxController {
  static SettingsController instance = Get.find();

  RxBool isDarkMode = false.obs;
  RxBool nofityOn = true.obs;
  RxString appLanguage = 'English'.obs;

  final _storage = GetStorage();
  final authCtrl = AuthController.instance;

  @override
  void onInit() async {
    super.onInit();
    isDarkMode.value = await _storage.read(themeKey) ?? false;
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
    Get.snackbar('Notifications', value ? 'On' : 'Off', snackPosition: SnackPosition.BOTTOM);
  }

  void setLanguage(int index) {
    debugPrint('SettingsController - setLanguage is Called');
    Get.updateLocale(locale[index]['locale']);
    appLanguage(locale[index]['name']);
    Get.back();
  }

  void goToPrivacy() => Get.to(() {
        debugPrint('SettingsController - goToPrivacy is Called');
        return const Scaffold(
          appBar: FlatAppBar('Privacy Policy', leading: true),
          body: WebView(
            initialUrl: 'https://www.iubenda.com/privacy-policy/71269859',
          ),
        );
      });
}
