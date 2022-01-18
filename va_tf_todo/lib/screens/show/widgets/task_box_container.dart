import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
          BoxShadow(color: Get.theme.shadowColor.withOpacity(.3), blurRadius: 5, offset: const Offset(0, 5)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: isDone ? Icon(Icons.done, color: Get.theme.colorScheme.primary) : Checkbox(value: false, onChanged: (_) => controller.doneTask(task)),
          ),
          GestureDetector(
            onLongPress: () => showMenu(
                context: context,
                items: [PopupMenuItem(child: Text(task.title))],
                // TODO: make auto pop back
                position: RelativeRect.fromRect(Rect.largest, Rect.fromCenter(center: const Offset(4, 8), width: double.infinity, height: 100.0.hp))),
            child: Container(
              padding: EdgeInsets.only(left: 3.0.wp),
              width: Get.width / 1.9,
              child: Text(
                task.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(isDone ? FontAwesomeIcons.solidCalendarCheck : FontAwesomeIcons.solidCalendarPlus),
            onPressed: () => controller.setTaskReminder(task, isDone),
          ),
        ],
      ),
    );
  }
}
