import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/icons.dart';
import '../../../widgets/button.dart';
import 'task_input_field.dart';

class AddCard extends GetView<HomeController> {
  const AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'activity_type'.tr,
            content: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TaskInputField(controller: controller.editCtrl),
                  Text('category'.tr),
                  Wrap(spacing: 2.0.wp, children: taskIcons(controller, hasBackFunction: false)),
                  Text('priority'.tr),
                  Wrap(spacing: 2.0.wp, children: priorityIcons(controller, hasBackFunction: false)),
                  Padding(padding: EdgeInsets.only(top: 2.0.hp), child: AppButton(onPressed: controller.addActivity)),
                ],
              ),
            ),
          );
          controller.editCtrl.clear();
          controller.iconIndex(0);
          controller.priorityIndex(0);
        },
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              border: Border.all(
                color: Get.theme.primaryColor,
                width: controller.isEmptyError() ? 0 : 6,
                style: controller.isEmptyError() ? BorderStyle.solid : BorderStyle.none,
              ),
            ),
            child: DottedBorder(
              color: Theme.of(context).toggleableActiveColor,
              radius: const Radius.circular(5),
              borderType: BorderType.RRect,
              child: Center(child: Icon(Icons.add, size: 10.0.wp)),
            ),
          ),
        ),
      ),
    );
  }
}
