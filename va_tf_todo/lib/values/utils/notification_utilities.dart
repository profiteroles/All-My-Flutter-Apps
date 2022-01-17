// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:va_tf_todo/values/theme/colors.dart';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:va_tf_todo/values/theme/colors.dart';

const basicChannelKey = 'basic_channel';
const scheduledChannelKey = 'schedule_channel';

int createUniqId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(3);
}

final List<NotificationChannel> notificationChannels = [
  NotificationChannel(
    channelKey: basicChannelKey,
    channelName: 'Basic Notifications',
    channelDescription: 'Basic Notifications to Update User',
    defaultColor: purple,
    importance: NotificationImportance.High,
    channelShowBadge: true,
  ),
  NotificationChannel(
    channelKey: scheduledChannelKey,
    channelName: 'Scheduled Notifications',
    channelDescription: 'Notifications which has been set with Task List',
    defaultColor: purple,
    importance: NotificationImportance.High,
    channelShowBadge: true,
    locked: true,
  )
];
