import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:rxdart/rxdart.dart';
import 'package:va_tf_todo/values/utils/notification_utilities.dart';

class NotificationsService {
  static final _flnp = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static final _nDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      basicChannelKey,
      'Basic Channel',
      importance: Importance.high,
      priority: Priority.defaultPriority,
    ),
    iOS: IOSNotificationDetails(),
  );

  static Future showNotification(String? payload) async {
    _flnp.show(
      createUniqId(),
      'notifications'.tr + ' ' + 'info'.tr,
      'notification_default'.tr,
      await _nDetails,
      payload: payload ?? 'default',
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    await _flnp.initialize(settings, onSelectNotification: (payload) async => onNotifications.add(payload));
  }

  static void initiliase() {
    debugPrint('NotificationsService - initiliased');

    final initialSettings = InitializationSettings(android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    _flnp.initialize(initialSettings);
  }

  static void display(RemoteMessage message) async {
    debugPrint('NotificationsService - display is Called');

    try {
      await _flnp.show(createUniqId(), message.notification!.title, message.notification!.body, _nDetails);
    } on Exception catch (e) {
      debugPrint('NotificationsService - display Caught an Exception');
      print(e);
    }
  }
}

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:va_tf_todo/values/utils/notification_utilities.dart';

// class NotificationServices {
//   Future<void> defaultMessage() async {
//     debugPrint('Notifications - defaultNotificationMessage is Called');
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: createUniqId(),
//         channelKey: channelKey,
//         title: 'notifications'.tr + ' ' + 'info'.tr,
//         body: 'notification_default'.tr,
//         notificationLayout: NotificationLayout.Default,
//       ),
//     );
//   }

//   Future<void> taskReminder(DateTime date, String title, {bool? repeat}) async {
//     debugPrint('Notifications - defaultNotificationMessage is Called');

//     await AwesomeNotifications().createNotification(
//       actionButtons: [NotificationActionButton(key: 'COMPLETED', label: 'Completed')],
//       content: NotificationContent(
//         id: createUniqId(),
//         channelKey: scheduledKey,
//         title: 'notification_title'.tr,
//         body: '$title ' + 'notification_body'.tr,
//         notificationLayout: NotificationLayout.Default,
//         autoDismissible: true,
//       ),
//       schedule: NotificationCalendar(
//         repeats: repeat ?? false,
//         year: date.year,
//         month: date.month,
//         day: date.day,
//         hour: date.hour,
//         minute: date.minute,
//         second: 0,
//         millisecond: 0,
//       ),
//     );
//   }
// }
