import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/asset_path.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/app_divider.dart';
import 'task_box_container.dart';

class DoingList extends GetView<HomeController> {
  const DoingList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.doingTasks.isEmpty && controller.doneTasks.isEmpty
          ? Column(
              children: [
                Image.asset(todoImage, fit: BoxFit.cover, width: 65.0.wp),
                Text(
                  'add_task'.tr,
                  style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
              ],
            )
          : ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 6.0.wp),
                  child: Text('live_tasks'.tr + ' (${controller.doingTasks.length})', style: TextStyle(fontSize: 14.0.sp, color: Colors.grey)),
                ),
                ...controller.doingTasks.map((task) => TaskBoxContainer(task)).toList(),
                if (controller.doingTasks.isNotEmpty) const AppDivider(),
              ],
            ),
    );
  }
}
