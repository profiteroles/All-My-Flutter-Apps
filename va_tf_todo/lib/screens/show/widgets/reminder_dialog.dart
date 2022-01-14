import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class ReminderDialog extends GetView<HomeController> {
  const ReminderDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 2.0.hp),
          child: Text('Set Reminder', style: Get.textTheme.headline5!.copyWith(color: Get.theme.colorScheme.onPrimary, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpandedCard(
                title: 'Tomorrow',
                onPressed: () {
                  final tomorrow = DateTime.now().add(const Duration(days: 1)).toString();
                  Get.back(result: tomorrow);
                  EasyLoading.showSuccess('Reminder is set for Tomorrow');
                }),
            ExpandedCard(
                title: 'Next Week',
                onPressed: () {
                  final nextWeek = DateTime.now().add(const Duration(days: 7)).toString();
                  Get.back(result: nextWeek);
                  EasyLoading.showSuccess('Reminder is set for Next Week Today');
                }),
          ],
        ),
        Row(
          children: [
            ExpandedCard(
              title: 'Pick a Date',
              onPressed: () async {
                String? result;
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                  builder: (context, child) => Theme(
                    child: child!,
                    data: Theme.of(context).copyWith(colorScheme: Get.theme.colorScheme.copyWith(primary: Get.theme.primaryColor)),
                  ),
                );

                if (date == null) {
                  EasyLoading.showError('Task has no reminder');
                } else {
                  try {
                    TimeOfDay time = await Navigator.of(context).push(showPicker(
                      context: context,
                      value: const TimeOfDay(hour: 12, minute: 30),
                      onChange: (val) {},
                      minuteInterval: MinuteInterval.FIVE,
                      is24HrFormat: true,
                    ));
                    result = DateTime(date.year, date.month, date.day, time.hour, time.minute).toString();
                  } catch (e) {
                    debugPrint('User Cancelled Operation on Time Picker');
                    EasyLoading.showError('Task has no reminder');
                  }
                }
                Get.back(result: result);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.all(5.0.wp),
        elevation: 5,
        child: TextButton(onPressed: onPressed, child: Text(title)),
      ),
    );
  }
}
