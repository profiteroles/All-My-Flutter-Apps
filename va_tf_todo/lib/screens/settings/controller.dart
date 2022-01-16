import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/services/notifications.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/screens/settings/widgets/notification_dialog.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/dark_theme.dart';
import 'package:va_tf_todo/values/theme/light_theme.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/values/utils/keys.dart';
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
  final nService = NotificationsService();

  @override
  void onInit() async {
    super.onInit();
    isDarkMode.value = await _storage.read(themeKey) ?? false;
    isEverNotify.value = await _storage.read(notifyKey) ?? false;

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      try {
        print(message!.notification!.title);
        print(message.notification!.body);
        print('____________END______getInitialMessage_________');
      } catch (e) {
        debugPrint(e.toString());
      }
    });

//foreground listener
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print(message.data.keys);
        print('____________END_____onMessage____________');
      }

      NotificationsService.display(message);
    });
    //
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // print(message.data);
      print(message.data['route']);
      print(message.from);
      // print(message.category);
      print('____________END_____ onMessageOpenedApp ____________');

      Get.offNamed(AppRoutes.home);
    });

    // AwesomeNotifications().actionStream.listen((event) {
    //   if (event.channelKey == scheduledKey && Platform.isIOS) {
    //     AwesomeNotifications().getGlobalBadgeCounter().then(
    //           (value) => AwesomeNotifications().setGlobalBadgeCounter(0),
    //         );
    //   }
    //   if (event.buttonKeyPressed == 'COMPLETED') {
    //     print('Mission is Half Way there');
    //   }
    //   // Get.offNamed(AppRoutes.home);
    // });
  }

  @override
  void onClose() {
    super.onClose();
    // AwesomeNotifications().actionSink.close();
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
    // if (!isEverNotify()) {
    //   AwesomeNotifications().isNotificationAllowed().then((value) {
    //     if (!value) {
    //       Get.defaultDialog(
    //         titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
    //         radius: 5,
    //         title: 'allow'.tr + ' ' + 'notifications'.tr,
    //         content: const NotificationDialog(),
    //       );
    //     }
    //   });
    // } else {
    //   nofityOn(false);
    // }
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
    // AwesomeNotifications().setGlobalBadgeCounter(0);

    nofityOn(value);
    if (value) {
      isEverNotify(false);
      _storage.write(notifyKey, false);
      checkOnNotification();
    }
    value
        ? NotificationsService.showNotification('') // await nService.defaultMessage()
        : Get.snackbar(
            'notifications'.tr,
            'notifications'.tr + ' ' + 'off'.tr,
            snackPosition: SnackPosition.BOTTOM,
          );
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

  Future<dynamic> languageDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        title: Text('language'.tr, style: Theme.of(context).textTheme.headline6),
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
          ),
        ),
      ),
    );
  }
}
