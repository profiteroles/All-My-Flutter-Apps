import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class AddDialog extends GetView<HomeController> {
  const AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(3.0.wp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: Get.back, icon: const Icon(Icons.close)),
                    TextButton(
                      onPressed: controller.addTaskFromDialog,
                      child: Text('done'.tr, style: TextStyle(fontSize: 14.0.sp)),
                      style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                child: Text('new_task'.tr, style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0.wp),
                child: TextFormField(
                  autofocus: true,
                  controller: controller.editCtrl,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) => value!.trim().isEmpty ? 'error_task_enter'.tr : null,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!)),
                      suffixIcon: controller.editCtrl.text.isNotEmpty
                          ? IconButton(
                              onPressed: controller.editCtrl.clear,
                              icon: const Icon(Icons.close),
                            )
                          : null),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.0.wp, right: 7.0.wp, top: 4.0.hp, bottom: .5.hp),
                child: Text('add_to'.tr, style: TextStyle(fontSize: 14.0.sp, color: Colors.grey)),
              ),
              ...controller.activities
                  .map((task) => Obx(
                        () => InkWell(
                          onTap: () => controller.changeActivity(task),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 1.0.wp),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 3.0.wp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(IconData(task.icon, fontFamily: 'MaterialIcons'), color: HexColor.fromHex(task.color)),
                                        SizedBox(width: 2.0.sp),
                                        Text(task.title, style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    if (controller.currentActivity.value == task) const Icon(Icons.check, color: Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
