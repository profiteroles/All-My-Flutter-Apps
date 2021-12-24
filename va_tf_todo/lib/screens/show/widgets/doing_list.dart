import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

import 'task_box_container.dart';

class DoingList extends GetView<HomeController> {
  const DoingList({Key? key}) : super(key: key);
  // final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.doingTodos.isEmpty && controller.doneTodos.isEmpty
          ? Column(
              children: [
                Image.asset('images/todo.png', fit: BoxFit.cover, width: 65.0.wp),
                Text(
                  'Add Task',
                  style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
              ],
            )
          : ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...controller.doingTodos.map((task) => TaskBoxContainer(task)).toList(),
                if (controller.doingTodos.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                    child: const Divider(thickness: 2),
                  ),
              ],
            ),
    );
  }
}
