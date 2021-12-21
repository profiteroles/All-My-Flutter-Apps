import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/show/widgets/doing_list.dart';
import 'package:va_tf_todo/screens/show/widgets/done_list.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class TaskDetailScreen extends GetView<HomeController> {
  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = controller.task.value!;
    var color = HexColor.fromHex(task.color);
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                children: [
                  IconButton(icon: const Icon(Icons.arrow_back), onPressed: controller.toHomeScreen),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
              child: Row(
                children: [
                  Icon(IconData(task.icon, fontFamily: 'MaterialIcons'), color: color),
                  SizedBox(width: 3.0.sp),
                  Text(
                    task.title,
                    style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Obx(
              () {
                var totalTodos = controller.doingTodos.length + controller.doneTodos.length;
                return Padding(
                  padding: EdgeInsets.only(top: 3.0.wp, right: 16.0.wp, left: 16.0.wp),
                  child: Row(
                    children: [
                      Text(
                        '$totalTodos Tasks',
                        style: TextStyle(fontSize: 12.0.sp, color: Colors.grey),
                      ),
                      SizedBox(width: 3.0.wp),
                      Expanded(
                        child: StepProgressIndicator(
                          totalSteps: totalTodos == 0 ? 1 : totalTodos,
                          currentStep: controller.doneTodos.length,
                          size: 5,
                          padding: 0,
                          selectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [color.withOpacity(.5), color],
                          ),
                          unselectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.grey[300]!, Colors.grey[300]!],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 5.0.wp),
              child: TextFormField(
                controller: controller.editCtrl,
                autofocus: true,
                validator: (value) => value!.trim().isEmpty ? 'Enter a task' : null,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!)),
                  prefixIcon: Icon(Icons.check_box_outline_blank, color: Colors.grey[400]),
                  suffixIcon: IconButton(icon: const Icon(Icons.done), onPressed: controller.addForTaskScren),
                ),
              ),
            ),
            const DoingList(),
            const DoneList(),
          ],
        ),
      ),
    );
  }
}
