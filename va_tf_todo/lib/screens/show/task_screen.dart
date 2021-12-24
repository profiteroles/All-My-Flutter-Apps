import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/choice_btn.dart';
import 'package:va_tf_todo/screens/home/widgets/task_input_field.dart';
import 'package:va_tf_todo/screens/show/widgets/doing_list.dart';
import 'package:va_tf_todo/screens/show/widgets/done_list.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
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
                  Text(task.title, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold)),
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
                      Text('$totalTodos Tasks', style: Theme.of(context).textTheme.subtitle2),
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
            TaskInputField(
              title: 'Task',
              controller: controller.editCtrl,
              prefixIcon: const Icon(Icons.checklist_rounded),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 2.0.wp),
                child: ChoiceBtn(label: const Icon(Icons.done, color: green), elevation: 3, onSelected: controller.addForTaskScren),
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
