import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:va_tf_todo/data/models/activity.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/routes.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class TaskCard extends GetView<HomeController> {
  const TaskCard({Key? key, required this.task}) : super(key: key);
  final Activity task;

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    return GestureDetector(
      onTap: () {
        controller.changeActivity(task);
        controller.changeTasks(task.tasks ?? []);
        Get.toNamed(AppRoutes.task);
      },
      child: Container(
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Get.theme.cardColor,
          boxShadow: [
            BoxShadow(
              color: Get.theme.shadowColor.withOpacity(.3),
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
              unselectedGradientColor: appLinGradient(Get.theme.cardColor, Get.theme.cardColor),
              selectedGradientColor: appLinGradient(color.withOpacity(.4), color),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(IconData(task.icon, fontFamily: 'MaterialIcons'), color: color),
                  Icon(HexColor.fromHex(task.priority) == lightGrey ? Icons.outlined_flag : Icons.flag, color: HexColor.fromHex(task.priority)),
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
                    task.tasks!.length.toString(),
                    // "${task.tasks?.length ?? 0} Tasks",
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
