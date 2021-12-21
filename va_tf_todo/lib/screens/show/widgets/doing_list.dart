import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0.sp),
                ),
              ],
            )
          : ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...controller.doingTodos
                    .map(
                      (task) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.0.wp, horizontal: 9.0.wp),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                fillColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                                value: false,
                                onChanged: (value) => controller.doneTodo(task['title']),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                              child: Text(task['title'], overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
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
