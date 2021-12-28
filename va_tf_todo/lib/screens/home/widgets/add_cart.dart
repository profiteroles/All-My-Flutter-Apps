import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/icons.dart';
import '../../../widgets/button.dart';
import 'choice_btn.dart';
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
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'task_type'.tr,
            content: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TaskInputField(controller: controller.editCtrl),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                    child: Wrap(
                      spacing: 2.0.wp,
                      children: getIcons()
                          .map((e) => Obx(() => ChoiceBtn(
                                label: e,
                                elevation: controller.chipIndex.value == getIcons().indexOf(e) ? 3 : 0,
                                selected: controller.chipIndex.value == getIcons().indexOf(e),
                                onSelected: (selected) => controller.chipIndex.value = selected ? getIcons().indexOf(e) : 0,
                              )))
                          .toList(),
                    ),
                  ),
                  AppButton(onPressed: controller.addNewList),
                ],
              ),
            ),
          );
          controller.editCtrl.clear();
          controller.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          child: Center(
            child: Icon(Icons.add, size: 10.0.wp, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
