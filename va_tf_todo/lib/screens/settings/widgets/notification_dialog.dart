import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/services/notifications.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/button.dart';

class NotificationDialog extends GetView<SettingsController> {
  const NotificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
          child: Text('notification_text'.tr),
        ),
        Row(
          children: [
            Obx(() => Checkbox(value: controller.isEverNotify(), onChanged: controller.isEverNotify)),
            Text('no_bother'.tr),
          ],
        ),
        Obx(
          () => Row(
            mainAxisAlignment: controller.isEverNotify() ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
            children: [
              AppButton(
                onPressed: controller.turnOffNotify,
                title: 'nope'.tr,
                hasMinSize: false,
                color: darkPrimaryVar,
              ),
              controller.isEverNotify()
                  ? const SizedBox.shrink()
                  : AppButton(
                      onPressed: () {
                        // NotificationsServices().showNotification(title: title, body: body),;
                        // AwesomeNotifications().requestPermissionToSendNotifications();
                        Get.back();
                      },
                      title: 'allow'.tr,
                      color: lightPurple,
                      hasMinSize: false,
                      boldFont: true,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
