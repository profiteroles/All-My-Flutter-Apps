import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/theme/colors.dart';

import 'keys.dart';

int createUniqId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(3);
}

class NotificationWeekAndTime {
  NotificationWeekAndTime({required this.weekDay, required this.day});

  final int weekDay;
  final TimeOfDay day;
}

Future<NotificationWeekAndTime?> pickSchedule(BuildContext context) async {
  List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();
  int? selectedDay;

  await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Remind me: '),
            content: Wrap(alignment: WrapAlignment.center, spacing: 3, children: [
              for (var i = 0; i < weekdays.length; i++)
                ElevatedButton(
                    child: Text(weekdays[i]),
                    onPressed: () {
                      selectedDay = i + 1;
                      Get.back();
                    }),
            ]),
          ));
  return NotificationWeekAndTime(weekDay: selectedDay!, day: timeOfDay!);
}

final List<NotificationChannel> notificationChannels = [
  NotificationChannel(
    channelKey: channelKey,
    channelName: 'Basic Notifications',
    channelDescription: 'Basic Notifications to Update User',
    defaultColor: purple,
    importance: NotificationImportance.High,
    channelShowBadge: true,
  ),
  NotificationChannel(
    channelKey: scheduledKey,
    channelName: 'Scheduled Notifications',
    channelDescription: 'Notifications which has been set with Task List',
    defaultColor: purple,
    importance: NotificationImportance.High,
    channelShowBadge: true,
    locked: true,
  )
];
