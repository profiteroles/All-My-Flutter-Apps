import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import '../controller.dart';

class SocialMediaContainer extends GetView<AuthController> {
  const SocialMediaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //Important this cunt here keep the button behind the Keyboard
      top: 83.0.hp,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Obx(() => Text(controller.isSignupScreen() ? 'signup_with'.tr : 'siginin_with'.tr)),
          SizedBox(height: 2.0.wp),
          SignInButton(Buttons.Google, onPressed: controller.signWithGoogle),
        ],
      ),
    );
  }
}
