import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/services/notifications.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/dark_theme.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/values/utils/keys.dart';
import 'package:va_tf_todo/values/utils/notification_utilities.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'widgets/notification_dialog.dart';

class SettingsController extends GetxController {
  static SettingsController instance = Get.find();

  RxBool isDarkMode = false.obs;
  RxBool nofityOn = true.obs;
  RxBool isEverNotify = false.obs;

  RxString appLanguage = 'English'.obs;

  final _storage = GetStorage();
  final authCtrl = AuthController.instance;
  final nService = NotificationServices();

  @override
  void onInit() async {
    super.onInit();
    isDarkMode.value = await _storage.read(themeKey) ?? false;
    isEverNotify.value = await _storage.read(notifyKey) ?? false;
    nofityOn.value = await AwesomeNotifications().isNotificationAllowed().asStream().first;

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      try {
        print(message!.notification!.title);
        print(message.notification!.body);
        Get.toNamed(AppRoutes.home);
        print('Went home');
      } catch (e) {
        debugPrint(e.toString());
      }
    });

// //foreground listener
    // FirebaseMessaging.onMessage.listen((message) {
    //   if (message.notification != null) {
    //     print(message.notification!.title);
    //     print(message.notification!.body);
    //     print(message.data.keys);
    //     print('____________END_____onMessage____________');
    //   }

    //   //   NotificationsService.display(message);
    // });
    // // //
    // FirebaseMessaging.onMessageOpenedApp.listen((message) {
    //   // print(message.data);
    //   print(message.data['route']);
    //   print(message.from);
    //   // print(message.category);
    //   print('____________END_____ onMessageOpenedApp ____________');

    //   Get.offNamed(AppRoutes.home);
    // });

    AwesomeNotifications().actionStream.listen((event) {
      if (event.channelKey == scheduledChannelKey && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
              (value) => AwesomeNotifications().setGlobalBadgeCounter(0),
            );
      }
      if (event.buttonKeyPressed == 'COMPLETED') {
        print('Mission is Half Way there');
      }
      Get.offNamed(AppRoutes.home);
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

  Future<bool> checkOnNotification() async {
    debugPrint('SettingsController - checkOnNotification is Called');
    final systemCheck = await AwesomeNotifications().isNotificationAllowed().then((systemNotification) {
      if (!systemNotification) {
        Get.defaultDialog(
          titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
          radius: 5,
          title: 'allow'.tr + ' ' + 'notifications'.tr,
          content: const NotificationDialog(),
        ).then((value) {
          print('SettingsController -checkOnNotification : $value __END');
          nofityOn(value);
          _storage.write(notifyKey, false);
          return value;
        });
      } else {
        return true;
      }
    });

    return systemCheck ?? false;
  }

  void notificationOff() {
    debugPrint('HomeController - turnOffNotify is Called: ' + isEverNotify.value.toString());
    //When Don't bother check box is checked saves in the storage

    isEverNotify() ? _storage.write(notifyKey, true) : null;

    Get.back();
    setNotification(false);
  }

  void setNotification(bool value) async {
    debugPrint('SettingsController - setNotification is Called: $value');
    NotificationServices().setBadge(0);
    nofityOn(value);
    if (value) {
      await checkOnNotification();
      nofityOn(value);
      NotificationServices().defaultMessage();
    } else {
      Get.snackbar('notifications'.tr, 'notifications'.tr + ' ' + 'off'.tr, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void setLanguage(int index) {
    debugPrint('SettingsController - setLanguage is Called');
    Get.updateLocale(locale[index]['locale']);
    appLanguage(locale[index]['name']);
    Get.back();
  }

  void goToPrivacy() => Get.to(() => const Scaffold(
        appBar: FlatAppBar('privacy_policy', leading: true),
        body: WebView(initialUrl: AppRoutes.privacyURL),
      ));

  Future<dynamic> languageDialog() {
    debugPrint('SettingsController - languageDialog is Opened');
    return Get.dialog(AlertDialog(
        title: Text('language'.tr, style: Get.textTheme.headline6),
        content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: () => setLanguage(i), child: Text(locale[i]['name'])),
              ),
              separatorBuilder: (context, i) => const Divider(),
              itemCount: locale.length,
            ))));
  }
}
