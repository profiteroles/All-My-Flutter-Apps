import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class TaskBoxContainer extends GetView<HomeController> {
  const TaskBoxContainer(this.task, {this.isDone = false, Key? key}) : super(key: key);

  final Map<String, dynamic> task;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInQuad,
      height: controller.taskBoxHeight(),
      padding: EdgeInsets.symmetric(vertical: 3.0.wp, horizontal: 9.0.wp),
      margin: EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 5.0.wp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(.3),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
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
                    // fillColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                    value: false,
                    onChanged: (value) => controller.doneTask(task['title']),
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
            child: Text(
              task['title'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
            ),
          ),
        ],
      ),
    );
  }
}
