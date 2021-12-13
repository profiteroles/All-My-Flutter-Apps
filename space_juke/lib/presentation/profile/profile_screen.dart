import '../home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../values/themes/theme.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/user_details_card.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();

  ProfileScreen({Key? key}) : super(key: key);

  // void onUpdateTheme(bool isDark) {
  //   print('ProfileScreen - onUpdateTheme is Called');
  //   controller.updateTheme(isDark);
  //   Get.changeTheme(isDark ? darkTheme : lightTheme);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Obx(() {
        final user = controller.user.value;
        return Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('X'), // Image.asset(controller.user.image),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    user.name,
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
                      email: user.email,
                      toggleTheme: controller.updateTheme,
                      isThemeDark: controller.isDarkMode(),
                    ),
                  ),
                  Center(child: AppElevatedBtn(onTap: controller.logout, title: 'Log Out'))
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
