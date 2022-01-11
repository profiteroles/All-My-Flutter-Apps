import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/notifications.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/add_dialog.dart';
import 'package:va_tf_todo/values/utils/keys.dart';
import 'package:va_tf_todo/values/utils/notification_utilities.dart';

class FabDragBtn extends GetView<HomeController> {
  const FabDragBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<TasksList>(
      onAccept: controller.deleteTask,
      builder: (_, __, ___) => Obx(
        () => AnimatedOpacity(
          opacity: controller.fabOpacity(),
          duration: const Duration(milliseconds: 800),
          curve: Curves.bounceOut,
          child: Visibility(
            visible: controller.pageIndex() == 1 ? true : false,
            child: FloatingActionButton(
              backgroundColor: controller.deleting.value ? Colors.red : Theme.of(context).floatingActionButtonTheme.backgroundColor,
              child: Icon(
                controller.deleting.value ? Icons.delete : Icons.add,
                color: Theme.of(context).canvasColor,
                size: 30,
              ),
              onPressed: controller.tasks.isNotEmpty
                  ? () => Get.to(() => const AddDialog(), transition: Transition.downToUp)
                  : () {
                      controller.isEmptyError(true);
                      EasyLoading.showInfo('error_create_activity'.tr);
                      Future.delayed(const Duration(milliseconds: 300), () => controller.isEmptyError(false));
                      Future.delayed(const Duration(milliseconds: 600), () => controller.isEmptyError(true));
                      Future.delayed(const Duration(milliseconds: 900), () => controller.isEmptyError(false));
                    },
            ),
          ),
        ),
      ),
    );
  }
}
