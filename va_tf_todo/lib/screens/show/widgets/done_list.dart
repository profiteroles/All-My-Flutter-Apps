import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/show/widgets/task_box_container.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class DoneList extends GetView<HomeController> {
  const DoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.doneTodos.isNotEmpty
          ? ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0.wp, horizontal: 6.0.wp),
                  child: Text(
                    'Complited(${controller.doneTodos.length})',
                    style: TextStyle(fontSize: 14.0.sp, color: Colors.grey),
                  ),
                ),
                ...controller.doneTodos
                    .map((task) => Dismissible(
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => controller.deleteIsDoneTask(task),
                          background: Container(
                            color: Theme.of(context).colorScheme.error,
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.0.wp),
                              child: const Icon(Icons.delete, color: Colors.white),
                            ),
                          ),
                          key: ObjectKey(task),
                          child: TaskBoxContainer(task, isDone: true),
                        ))
                    .toList()
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
