import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

import '../controller.dart';

class TopImageSection extends GetView<AuthController> {
  const TopImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.only(top: 20.0.wp),
        height: 37.0.hp,
        decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
        child: Obx(
          () => RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Welcome to ",
              style: TextStyle(fontSize: 25, letterSpacing: 2, color: Colors.yellow[700]),
              children: [
                TextSpan(
                  text: controller.isSignupScreen() ? "uniQ X," : "Back,",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.yellow[700]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
