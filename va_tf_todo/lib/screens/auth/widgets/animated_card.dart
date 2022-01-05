import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

import '../controller.dart';

class AnimatedCard extends GetView<AuthController> {
  const AnimatedCard({this.hasShadow = true, Key? key}) : super(key: key);

  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInBack,
        top: controller.isSignupScreen() ? 66.0.hp : 58.0.hp,
        right: 0,
        left: 0,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            transformAlignment: Alignment.topRight,
            transform: (controller.isSignupScreen()
                ? (Matrix4.identity()
                  ..translate(0.025 * 100, 0.025 * 90)
                  ..scale(0.95, 0.95))
                : Matrix4.identity()),
            curve: Curves.fastOutSlowIn,
            height: controller.btnAnimationValue(),
            width: controller.btnAnimationValue(),
            padding: EdgeInsets.all(3.0.wp),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [if (hasShadow) BoxShadow(color: Colors.black.withOpacity(.3), spreadRadius: 1, blurRadius: 5)],
            ),
            child: !hasShadow
                ? InkWell(
                    onTap: controller.authState() == AuthState.initial ? () => controller.isSignupScreen() ? controller.register() : controller.login() : () {},
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.orange[200]!, Colors.red[400]!], begin: Alignment.topLeft, end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.3), spreadRadius: 1, blurRadius: 2, offset: const Offset(0, 1))]),
                      child: controller.authState() == AuthState.initial
                          ? Icon(Icons.arrow_forward, color: Theme.of(context).canvasColor)
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  )
                : const Center(),
          ),
        ),
      ),
    );
  }
}
