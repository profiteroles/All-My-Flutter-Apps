import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
          body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
        children: [
          const FlatAppBar('Settings'),
          const Header('Account'),
          SettingCard(title: 'User Full Name', subTitle: 'Personal Info', icon: Icons.person, onPress: () {}),
          SizedBox(height: 5.0.wp),
          const Header('App Settings'),
          SettingCard(title: 'Language', subTitle: 'English', icon: Icons.language, onChanged: (value) {}),
          SettingCard(title: 'Notifications', isSwitch: true, value: controller.nofityOn(), icon: Icons.notifications_active, onChanged: controller.setNotification),
          SettingCard(title: 'Dark Mode', isSwitch: true, value: controller.isDarkMode(), icon: Icons.dark_mode, onChanged: controller.setThemeMode),
          SettingCard(title: 'Help', subTitle: '', icon: Icons.help, onPress: () {}),
          SettingCard(title: 'Privacy Policy', subTitle: 'Terms & Conditions', icon: Icons.policy_sharp, onPress: () {})
        ],
      )),
    );
  }
}
