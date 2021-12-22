import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/widgets/text_field.dart';

import '../controller.dart';

class LoginContainer extends GetView<SigningController> {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const XTextField(icon: Icons.mail_outline, hint: 'your@email.com', type: TextInputType.emailAddress),
        const XTextField(hint: 'Password', passValid: true),
        Row(
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
                Text("Remember me", style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text("Forgot Password?", style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        )
      ],
    );
  }
}
