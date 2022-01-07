import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/services/notifications.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/screens/settings/widgets/notification_dialog.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/theme/dark_theme.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/values/utils/keys.dart';
import 'package:va_tf_todo/widgets/button.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsController extends GetxController {
  static SettingsController instance = Get.find();

  RxBool isDarkMode = false.obs;
  RxBool nofityOn = true.obs;
  RxBool isEverNotify = false.obs;

  RxString appLanguage = 'English'.obs;

  final _storage = GetStorage();
  final authCtrl = AuthController.instance;

  @override
  void onInit() async {
    super.onInit();
    isDarkMode.value = await _storage.read(themeKey) ?? false;
    isEverNotify.value = await _storage.read(notifyKey) ?? false;

    AwesomeNotifications().actionStream.listen((event) {
      if (event.channelKey == scheduledKey && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
              (value) => AwesomeNotifications().setGlobalBadgeCounter(0),
            );
      }
      if (event.buttonKeyPressed == 'COMPLETED') {
        print('Mission is Half Way there');
      }
      // Get.offNamed(AppRoutes.home);
    });
  }

  @override
  void onClose() {
    super.onClose();
    AwesomeNotifications().actionSink.close();
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

  void checkOnNotification() async {
    debugPrint('SettingsController - checkOnNotification is Called');
    if (!isEverNotify()) {
      AwesomeNotifications().isNotificationAllowed().then((value) {
        if (!value) {
          Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'allow'.tr + ' ' + 'notifications'.tr,
            content: const NotificationDialog(),
          );
        }
      });
    } else {
      nofityOn(false);
    }
  }

  void turnOffNotify() {
    debugPrint('HomeController - turnOffNotify is Called: ' + isEverNotify.value.toString());
    if (isEverNotify()) {
      _storage.write(notifyKey, isEverNotify());
      setNotification(false);
    }
    Get.back();
  }

  void setNotification(bool value) async {
    debugPrint('SettingsController - setThemeMode is Called');
    AwesomeNotifications().setGlobalBadgeCounter(0);
    nofityOn(value);
    if (value) {
      isEverNotify(false);
      _storage.write(notifyKey, false);
      checkOnNotification();
    }
    value ? await defaultNotificationMessage() : Get.snackbar('notifications'.tr, 'notifications'.tr + ' ' + 'off'.tr, snackPosition: SnackPosition.BOTTOM);
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
