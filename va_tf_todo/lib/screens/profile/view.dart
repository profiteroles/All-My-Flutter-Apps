import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:va_tf_todo/screens/profile/controller.dart';
import 'package:va_tf_todo/screens/profile/widgets/synchronise_card.dart';
import 'widgets/dropdown_btn.dart';
import 'widgets/profile_image.dart';
import 'widgets/progress_circle.dart';
import 'widgets/report_row.dart';
import 'package:va_tf_todo/screens/settings/widgets/header.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';
import 'widgets/user_details_card.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          int createdTasks = controller.getTotalTasks();
          int completedTasks = controller.getTotalDoneTask();
          int liveTasks = createdTasks - completedTasks;
          return controller.authCtrl.userModel() == null
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: <Widget>[
                    const AppSliverAppBar('profile'),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ProfileImage(
                            name: Header(controller.authCtrl.userModel()!.name),
                            image: controller.authCtrl.userModel()!.photoURL,
                            onPressed: controller.uploadImage,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Header('report'.tr), const AppDropDown()],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                            child: Text(DateFormat.yMMMM().format(DateTime.now()), style: Theme.of(context).textTheme.subtitle1),
                          ),
                          SizedBox(height: 3.0.hp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ReportStatusRow(color: Theme.of(context).colorScheme.secondary, results: liveTasks, text: 'live_tasks'.tr),
                              ReportStatusRow(color: Theme.of(context).colorScheme.primary, results: completedTasks, text: 'comleted'.tr),
                              ReportStatusRow(color: orange, results: createdTasks, text: 'created'.tr),
                            ],
                          ),
                          SizedBox(height: 8.0.wp),
                          ProgressCircle(total: createdTasks, current: completedTasks),
                          const SynchroniseCard(),
                          UserDetailsCard(
                            padHor: 3,
                            email: controller.authCtrl.userModel()!.email,
                            name: controller.authCtrl.userModel()!.name,
                            noActivity: controller.homeCtrl.tasks.length,
                            noTasks: controller.authCtrl.userModel()!.totalTasks,
                            logout: controller.authCtrl.logout,
                          ),
                          SizedBox(height: 8.0.wp),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
