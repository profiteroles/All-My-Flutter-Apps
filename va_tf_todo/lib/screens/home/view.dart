import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/add_cart.dart';
import 'package:va_tf_todo/screens/home/widgets/add_dialog.dart';
import 'package:va_tf_todo/screens/home/widgets/task_card.dart';
import '../../values/utils/extention.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: DragTarget<Task>(
        onAccept: (task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Task Removed');
        },
        builder: (_, __, ___) => Obx(
          () => FloatingActionButton(
              backgroundColor: controller.deleting.value ? Colors.red : Colors.blue,
              child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
              onPressed: () => controller.tasks.isNotEmpty ? Get.to(() => const AddDialog(), transition: Transition.downToUp) : EasyLoading.showInfo('First of all, Create a task')),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text('My List', style: TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold)),
            ),
            Obx(
              () => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks
                      .map(
                        (task) => LongPressDraggable(
                          child: TaskCard(task: task),
                          data: task,
                          onDragStarted: () => controller.changeDeleting(true),
                          onDraggableCanceled: (_, __) => controller.changeDeleting(false),
                          onDragEnd: (_) => controller.changeDeleting(false),
                          feedback: Opacity(
                            opacity: .8,
                            child: TaskCard(task: task),
                          ),
                        ),
                      )
                      .toList(),
                  const AddCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
