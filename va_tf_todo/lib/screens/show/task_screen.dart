import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/choice_btn.dart';
import 'package:va_tf_todo/screens/home/widgets/task_input_field.dart';
import 'package:va_tf_todo/screens/show/widgets/activity_icon_dropbox.dart';
import 'package:va_tf_todo/screens/show/widgets/doing_list.dart';
import 'package:va_tf_todo/screens/show/widgets/done_list.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';
import 'package:va_tf_todo/widgets/icons.dart';
import 'widgets/task_processbar.dart';

class TaskDetailScreen extends GetView<HomeController> {
  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = controller.tasksList.value!;
    var color = HexColor.fromHex(task.color);
    controller.priorityIndex(getPriorities().indexOf(HexColor.fromHex(task.priority)));
    return WillPopScope(
      onWillPop: () async => false,
      child: Form(
        key: controller.formKey,
        child: CustomScrollView(
          slivers: [
            AppSliverAppBar(
              task.title,
              leading: true,
              onBack: controller.toHomePage,
              titleSpacing: 0,
              titleWidget: Row(
                children: [
                  const IconDropBox(false),
                  SizedBox(width: 2.0.wp),
                  Text(task.title, style: Theme.of(context).appBarTheme.titleTextStyle),
                  const Spacer(),
                  const IconDropBox(true),
                  SizedBox(width: 5.0.wp),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                TaskProgressBar(color),
                TaskInputField(
                  title: 'Task',
                  controller: controller.editCtrl,
                  prefixIcon: const Icon(Icons.checklist_rounded),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 2.0.wp),
                    child: ChoiceBtn(
                      backgroundColor: purple,
                      label: Icon(Icons.done, color: Theme.of(context).colorScheme.onPrimary),
                      elevation: 3,
                      onSelected: controller.addForTaskScren,
                    ),
                  ),
                ),
                const DoingList(),
                const DoneList(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
