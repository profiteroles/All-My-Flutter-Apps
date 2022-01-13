import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class TaskBoxContainer extends GetView<HomeController> {
  const TaskBoxContainer(this.task, {this.isDone = false, Key? key}) : super(key: key);

  final Task task;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInQuad,
      height: 8.0.hp,
      padding: EdgeInsets.symmetric(vertical: 3.0.wp, horizontal: 9.0.wp),
      margin: EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 5.0.wp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Get.theme.cardColor,
        boxShadow: [
          BoxShadow(color: Theme.of(context).shadowColor.withOpacity(.3), blurRadius: 5, offset: const Offset(0, 5)),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: isDone
                ? Icon(Icons.done, color: Theme.of(context).colorScheme.primary)
                : Checkbox(
                    value: false,
                    onChanged: (value) => controller.doneTask(task),
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(3.0.wp),
            child: Text(
              task.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(isDone ? FontAwesomeIcons.solidCalendarCheck : FontAwesomeIcons.solidCalendarPlus),
            onPressed: isDone
                ? () {}
                : () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: TimeOfDay.fromDateTime(DateTime(2002, 3, 1, 5, 48)), //
                        onChange: controller.onTimeChanged,
                        minuteInterval: MinuteInterval.FIVE,
                        is24HrFormat: true,
                        onChangeDateTime: (date) {
                          print(date);
                        },
                      ),
                    );
                  },
            // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(DateTime.now().year + 1)).then(
            //   (value) => print(value),
            // );
          )
        ],
      ),
    );
  }
}
