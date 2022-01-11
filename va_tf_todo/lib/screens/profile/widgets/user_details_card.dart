import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:va_tf_todo/screens/profile/controller.dart';
import 'package:va_tf_todo/screens/settings/widgets/card.dart';
import 'package:va_tf_todo/screens/settings/widgets/header.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/button.dart';

class UserDetailsCard extends GetView<ProfileController> {
  const UserDetailsCard({
    Key? key,
    required this.email,
    required this.name,
    required this.logout,
    required this.noTasks,
    required this.noActivity,
    this.padHor = 0,
    this.padVer = 0,
  }) : super(key: key);
  final String email, name;
  final VoidCallback logout;
  final int noTasks, noActivity;
  final double padHor, padVer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padHor.wp, vertical: padVer.wp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header('personal_info'.tr),
          Card(
            elevation: 3,
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.hp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  appTile('full_name', name),
                  appTile('email', email),
                  appTile('total_activities', '$noActivity'),
                  appTile('total_task', '$noTasks'),
                  appTile('delete_all', '', onTap: controller.deleteAllDialog, child: const Icon(Icons.arrow_forward_ios_outlined)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.wp),
                    child: AppButton(onPressed: logout, title: 'logout'.tr),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile appTile(String leading, String trailing, {Function()? onTap, Widget? child}) {
    return ListTile(
      leading: Text(leading.tr, style: Get.theme.textTheme.subtitle1),
      trailing: TextButton(onPressed: onTap, child: child ?? Text(trailing.tr, style: Get.theme.textTheme.subtitle1)),
    );
  }
}
