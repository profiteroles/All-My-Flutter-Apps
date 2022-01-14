import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/choice_btn.dart';
import 'package:va_tf_todo/screens/home/widgets/task_input_field.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class TaskTitleUpdateBtn extends GetView<HomeController> {
  const TaskTitleUpdateBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Obx(() => Text(controller.activityTitle(), style: Get.theme.appBarTheme.titleTextStyle)),
      onPressed: () => Get.dialog(
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 2.0.hp),
            height: 10.0.hp,
            width: Get.width - 40,
            decoration: BoxDecoration(color: Get.theme.canvasColor, borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0.wp),
              child: TaskInputField(
                title: 'activity_title'.tr,
                controller: controller.taskTitleCtrl,
                prefixIcon: const Icon(Icons.title),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0.hp, horizontal: 1.0.wp),
                  child: ChoiceBtn(
                    backgroundColor: purple,
                    label: Icon(Icons.done, color: Get.theme.colorScheme.onPrimary),
                    elevation: 3,
                    onSelected: (_) {
                      controller.activityTitle(controller.taskTitleCtrl.text);
                      Get.back();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
