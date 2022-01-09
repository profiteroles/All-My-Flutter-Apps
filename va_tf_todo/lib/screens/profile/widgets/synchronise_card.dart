import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/profile/controller.dart';
import 'package:va_tf_todo/screens/settings/widgets/card.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/app_divider.dart';
import 'package:va_tf_todo/widgets/button.dart';

class SynchroniseCard extends GetView<ProfileController> {
  const SynchroniseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppDivider(),
        AppCard(
            title: 'Synchronise All My Data',
            onPress: () {
              Get.defaultDialog(
                title: 'user_info'.tr,
                titlePadding: EdgeInsets.symmetric(vertical: 2.0.hp),
                contentPadding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('synchronise_text'.tr),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0.hp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(
                            onPressed: () {},
                            title: 'confirm'.tr,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
        const AppDivider(),
      ],
    );
  }
}
