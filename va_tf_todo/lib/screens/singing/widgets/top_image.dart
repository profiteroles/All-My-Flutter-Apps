import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

import '../controller.dart';

class TopImageSection extends GetView<SigningController> {
  const TopImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      child: Container(
        height: 300,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Container(
          padding: EdgeInsets.only(top: 15.0.wp, left: 5.0.wp),
          color: const Color(0xFF3b5999).withOpacity(.85),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Welcome to",
                    style: TextStyle(fontSize: 25, letterSpacing: 2, color: Colors.yellow[700]),
                    children: [
                      TextSpan(
                        text: controller.isSignupScreen() ? " uniQ X," : " Back,",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.yellow[700]),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  controller.isSignupScreen() ? "Signup to Continue" : "Signin to Continue",
                  style: const TextStyle(letterSpacing: 1, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
