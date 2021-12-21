import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

import '../controller.dart';

class AnimatedCard extends GetView<SigningController> {
  const AnimatedCard({this.hasShadow = true, Key? key}) : super(key: key);

  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInBack,
        top: controller.isSignupScreen() ? 535 : 430,
        right: 0,
        left: 0,
        child: Center(
          child: Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(3.0.wp),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [
              if (hasShadow)
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                )
            ]),
            child: !hasShadow
                ? Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.orange[200]!, Colors.red[400]!], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.3), spreadRadius: 1, blurRadius: 2, offset: const Offset(0, 1))]),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  )
                : const Center(),
          ),
        ),
      ),
    );
  }
}
