import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/add_dialog.dart';

class FabDragBtn extends GetView<HomeController> {
  const FabDragBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<TasksList>(
      onAccept: controller.deleteTask,
      builder: (_, __, ___) => Obx(
        () => AnimatedOpacity(
          opacity: controller.fabOpacity(),
          duration: const Duration(milliseconds: 800),
          curve: Curves.bounceOut,
          child: Visibility(
            visible: controller.pageIndex() == 1 ? true : false,
            child: FloatingActionButton(
              backgroundColor: controller.deleting.value ? Colors.red : Theme.of(context).floatingActionButtonTheme.backgroundColor,
              child: Icon(
                controller.deleting.value ? Icons.delete : Icons.add,
                color: Theme.of(context).canvasColor,
                size: 30,
              ),
              onPressed: () => controller.tasks.isNotEmpty
                  ? Get.to(() => const AddDialog(), transition: Transition.downToUp)
                  : EasyLoading.showInfo(
                      'First of all, Create a task',
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
