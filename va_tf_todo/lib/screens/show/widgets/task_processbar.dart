import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class TaskProgressBar extends GetView<HomeController> {
  const TaskProgressBar(
    this.color, {
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var totalTodos = controller.doingTasks.length + controller.doneTasks.length;
        return Padding(
          padding: EdgeInsets.only(top: 3.0.wp, right: 16.0.wp, left: 16.0.wp),
          child: Row(
            children: [
              Text('$totalTodos Tasks', style: Theme.of(context).textTheme.subtitle2),
              SizedBox(width: 3.0.wp),
              Expanded(
                child: StepProgressIndicator(
                  totalSteps: totalTodos == 0 ? 1 : totalTodos,
                  currentStep: controller.doneTasks.length,
                  size: 5,
                  padding: 0,
                  selectedGradientColor: appLinGradient(color.withOpacity(.5), color),
                  unselectedGradientColor: appLinGradient(grey.withOpacity(0.1), grey.withOpacity(0.2)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
