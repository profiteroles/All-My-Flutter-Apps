import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class DoneList extends GetView<HomeController> {
  const DoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.doneTodos.isNotEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.wp, horizontal: 6.0.wp),
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Text(
                    'Complited(${controller.doneTodos.length})',
                    style: TextStyle(fontSize: 14.0.sp, color: Colors.grey),
                  ),
                  ...controller.doneTodos
                      .map((task) => Dismissible(
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) => controller.deleteDoneTodo(task),
                            background: Container(
                              color: Colors.red.withOpacity(.8),
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 5.0.wp),
                                child: const Icon(Icons.delete, color: Colors.white),
                              ),
                            ),
                            key: ObjectKey(task),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 2.0.wp),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Icon(Icons.done, color: blue),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                                    child: Text(
                                      task['title'],
                                      style: const TextStyle(decoration: TextDecoration.lineThrough),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                      .toList()
                ],
              ),
            )
          : Container(),
    );
  }
}
