import 'package:deliverone/path.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:deliverone/themes/theme.dart';
import 'package:flutter/material.dart';
import 'splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: appGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(IMAGE_PATH + 'logo.png'),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'DeliverONE',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
