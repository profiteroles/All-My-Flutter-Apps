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

  Future<void> taskReminder(DateTime time, {bool? repeat}) async {
    debugPrint('Notifications - defaultNotificationMessage is Called');
    print(time.weekday);
    print(time.hour);
    print(time.minute);
    print('_______END OF TIME______');

    await AwesomeNotifications().createNotification(
      actionButtons: [NotificationActionButton(key: 'COMPLETED', label: 'Completed')],
      content: NotificationContent(
        id: createUniqId(),
        channelKey: scheduledKey,
        title: 'notification_schedule'.tr,
        body: 'notification_schedule_text'.tr,
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationCalendar(
        repeats: repeat ?? false,
        weekday: time.weekday,
        hour: time.hour,
        minute: time.minute,
        second: 0,
        millisecond: 0,
      ),
    );
  }
}
