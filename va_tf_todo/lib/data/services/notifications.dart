import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:va_tf_todo/values/utils/notification_utilities.dart';

class NotificationServices {
  Future<void> defaultMessage() async {
    debugPrint('Notifications - defaultNotificationMessage is Called');
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqId(),
        channelKey: channelKey,
        title: 'notifications'.tr + ' ' + 'info'.tr,
        body: 'notification_default'.tr,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  Future<void> taskReminder(DateTime date, String title, {bool? repeat}) async {
    debugPrint('Notifications - defaultNotificationMessage is Called');

    await AwesomeNotifications().createNotification(
      actionButtons: [NotificationActionButton(key: 'COMPLETED', label: 'Completed')],
      content: NotificationContent(
        id: createUniqId(),
        channelKey: scheduledKey,
        title: 'notification_title'.tr,
        body: '$title ' + 'notification_body'.tr,
        notificationLayout: NotificationLayout.Default,
        autoDismissible: true,
      ),
      schedule: NotificationCalendar(
        repeats: repeat ?? false,
        year: date.year,
        month: date.month,
        day: date.day,
        hour: date.hour,
        minute: date.minute,
        second: 0,
        millisecond: 0,
      ),
    );
  }
}
