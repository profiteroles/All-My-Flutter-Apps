import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class AddDialog extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddDialog({Key? key}) : super(key: key);
  // final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: homeCtrl.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: homeCtrl.closeDialog, icon: const Icon(Icons.close)),
                  TextButton(
                    onPressed: () {
                      if (homeCtrl.formKey.currentState!.validate()) {
                        if (homeCtrl.task.value == null) {
                          EasyLoading.showError('Please Choose the list');
                        } else {
                          final bool success = homeCtrl.updateTask(
                            homeCtrl.task.value!,
                            homeCtrl.editCtrl.text,
                          );
                          if (success) {
                            EasyLoading.showSuccess('Task added to your ${homeCtrl.task.value!.title}');
                            homeCtrl.closeDialog();
                          } else {
                            EasyLoading.showError('Task is already in the list');
                          }
                          homeCtrl.editCtrl.clear();
                        }
                      }
                    },
                    child: Text('Done', style: TextStyle(fontSize: 14.0.sp)),
                    style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Text('New Task', style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: TextFormField(
                autofocus: true,
                controller: homeCtrl.editCtrl,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!)),
                ),
                validator: (value) => value!.trim().isEmpty ? 'Enter tasks for your list' : null,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.wp).copyWith(bottom: 2.0.wp),
              child: Text('Add to', style: TextStyle(fontSize: 14.0.sp, color: Colors.grey)),
            ),
            ...homeCtrl.tasks
                .map((task) => Obx(
                      () => InkWell(
                        onTap: () => homeCtrl.changeTask(task),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 3.0.wp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconData(task.icon, fontFamily: 'MaterialIcons'),
                                    color: HexColor.fromHex(task.color),
                                  ),
                                  SizedBox(width: 2.0.sp),
                                  Text(
                                    task.title,
                                    style: TextStyle(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              if (homeCtrl.task.value == task) const Icon(Icons.check, color: Colors.blue),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
