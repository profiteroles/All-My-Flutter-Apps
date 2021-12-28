import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';

import 'widgets/card.dart';
import 'widgets/header.dart';

class SettingScreen extends GetView<SettingsController> {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: FlatAppBar('settings'.tr),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
            children: [
              Header('account'.tr),
              AppCard(title: 'User Full Name', subTitle: 'personal_info'.tr, icon: Icons.person, onPress: () {}),
              SizedBox(height: 5.0.wp),
              Header('app_settings'.tr),
              AppCard(title: 'language'.tr, subTitle: controller.appLanguage(), icon: Icons.language, onPress: () => languageDialog(context)),
              AppCard(title: 'notifications'.tr, isSwitch: true, value: controller.nofityOn(), icon: Icons.notifications_active, onChanged: controller.setNotification),
              AppCard(title: 'dark_mode'.tr, isSwitch: true, value: controller.isDarkMode(), icon: Icons.dark_mode, onChanged: controller.setThemeMode),
              AppCard(title: 'help'.tr, subTitle: '', icon: Icons.help, onPress: () {}),
              AppCard(title: 'privacy_policy'.tr, subTitle: 'terms_conditions'.tr, icon: Icons.policy_sharp, onPress: () {})
            ],
          )),
    );
  }

  Future<dynamic> languageDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
            title: Text('language'.tr, style: Theme.of(context).textTheme.headline6),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: () => controller.setLanguage(i), child: Text(controller.locale[i]['name'])),
                ),
                separatorBuilder: (context, i) => const Divider(),
                itemCount: controller.locale.length,
              ),
            ));
      },
    );
  }
}
