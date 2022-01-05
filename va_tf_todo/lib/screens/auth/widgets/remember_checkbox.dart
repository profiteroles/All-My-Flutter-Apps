import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';

class RememberMeBox extends GetView<AuthController> {
  const RememberMeBox({Key? key, this.isLogin = true}) : super(key: key);

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.isRememberMe(),
                onChanged: (value) => controller.isRememberMe(!controller.isRememberMe()),
              ),
            ),
            Text('remember_me'.tr, style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        if (isLogin)
          TextButton(
            onPressed: () {},
            child: Text('forgot_password'.tr, style: Theme.of(context).textTheme.bodyText1),
          ),
      ],
    );
  }
}
