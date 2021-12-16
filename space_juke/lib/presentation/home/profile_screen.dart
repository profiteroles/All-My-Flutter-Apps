import 'package:space_juke/presentation/widgets/appbar.dart';

import 'home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../values/themes/theme.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/user_details_card.dart';

class ProfileScreen extends GetWidget<HomeController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JukeAppBar('Profile'),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, style: BorderStyle.solid, color: AppColors.green),
                      image: DecorationImage(
                        image: NetworkImage(controller.user.image),
                      ),
                    ),
                  ),
                  Text(
                    controller.user.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: UserDetailsCard(
                      email: controller.user.email,
                      toggleTheme: controller.updateTheme,
                      isThemeDark: controller.isDarkMode(),
                    ),
                  ),
                  Center(child: AppElevatedBtn(onTap: controller.logout, title: 'Log Out')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
