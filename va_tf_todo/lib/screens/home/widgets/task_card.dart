import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/show/task_screen.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class TaskCard extends GetView<HomeController> {
  const TaskCard({Key? key, required this.task}) : super(key: key);
  final TasksList task;

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    // final squareWidth = Get.width - 12.0.wp;
    return GestureDetector(
      onTap: () {
        controller.changeTask(task);
        controller.changeTasks(task.tasks ?? []);
        Get.to(() => const TaskDetailScreen());
      },
      child: Container(
        // width: squareWidth / 2,
        // height: squareWidth / 2,
        margin: EdgeInsets.all(3.0.wp),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepProgressIndicator(
              totalSteps: controller.isTaskEmpty(task) ? 1 : task.tasks!.length,
              currentStep: controller.isTaskEmpty(task) ? 0 : controller.getDoneTask(task),
              size: 5,
              padding: 0,
              unselectedGradientColor: appLinGradient(Theme.of(context).cardColor, Theme.of(context).cardColor),
              selectedGradientColor: appLinGradient(color.withOpacity(.4), color),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(IconData(task.icon, fontFamily: 'MaterialIcons'), color: color),
                  Icon(task.priority == lightGrey.toHex() ? Icons.outlined_flag : Icons.flag),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0.sp, overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: 2.0.wp),
                  Text(
                    "${task.tasks?.length ?? 0} Tasks",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
