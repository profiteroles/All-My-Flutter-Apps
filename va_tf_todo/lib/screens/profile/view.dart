import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/profile/controller.dart';
import 'widgets/dropdown_btn.dart';
import 'widgets/profile_image.dart';
import 'widgets/progress_circle.dart';
import 'widgets/report_row.dart';
import 'package:va_tf_todo/screens/settings/widgets/header.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/app_divider.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';
import 'widgets/user_details_card.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);

  final homeCtrl = Get.find<HomeController>();
  final authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar('profile'.tr),
      body: Obx(
        () {
          int createdTasks = homeCtrl.getTotalTasks();
          int completedTasks = homeCtrl.getTotalDoneTask();
          int liveTasks = createdTasks - completedTasks;

          return ListView(
            padding: EdgeInsets.all(5.0.wp),
            children: [
              ProfileImage(name: Header('authCtrl.userModel()!.photoURL'), image: 'authCtrl.userModel()!.photoURL'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Header('Report'), AppDropDown()],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                child: Text(DateFormat.yMMMM().format(DateTime.now()), style: Theme.of(context).textTheme.subtitle1),
              ),
              const AppDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReportStatusRow(color: green, results: liveTasks, text: 'live_tasks'.tr),
                  ReportStatusRow(color: orange, results: completedTasks, text: 'comleted'.tr),
                  ReportStatusRow(color: blue, results: createdTasks, text: 'created'.tr),
                ],
              ),
              SizedBox(height: 8.0.wp),
              ProgressCircle(total: createdTasks, current: completedTasks),
              const AppDivider(),
              UserDetailsCard(email: 'user@email.com', name: 'Jane Doe', logout: authCtrl.logout),
            ],
          );
        },
      ),
    );
  }
}
