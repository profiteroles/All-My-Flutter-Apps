import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/icons.dart';

class AddCard extends GetView<HomeController> {
  const AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'Task Type',
            content: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      validator: (value) => value!.trim().isEmpty ? 'Task is required' : null,
                      controller: controller.editCtrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                    child: Wrap(
                      spacing: 2.0.wp,
                      children: icons
                          .map((e) => Obx(() {
                                final index = icons.indexOf(e);
                                return ChoiceChip(
                                  label: e,
                                  elevation: controller.chipIndex.value == index ? 3 : 0,
                                  selectedColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  selected: controller.chipIndex.value == index,
                                  onSelected: (selected) => controller.chipIndex.value = selected ? index : 0,
                                );
                              }))
                          .toList(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: controller.addNewList,
                    child: const Text('Confirm'),
                    style: ElevatedButton.styleFrom(
                      primary: blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      minimumSize: const Size(150, 40),
                    ),
                  ),
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
