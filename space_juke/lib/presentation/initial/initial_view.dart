import 'package:get/get_state_manager/get_state_manager.dart';
import '../../values/constants.dart';
import '../../../../values/themes/theme.dart';
import 'package:flutter/material.dart';
import 'initial_controller.dart';

class InitialView extends GetWidget<InitialController> {
  const InitialView({Key? key}) : super(key: key);
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
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(IMAGE_PATH + 'logo.png'),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'SPACE JUKE',
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
