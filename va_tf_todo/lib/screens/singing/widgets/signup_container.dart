import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/text_field.dart';
import '../controller.dart';

class SignUpContainer extends GetView<SigningController> {
  const SignUpContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const XTextField(icon: Icons.account_box_outlined, hint: 'Full Name'),
        const XTextField(icon: Icons.email_outlined, hint: 'Email', type: TextInputType.emailAddress),
        const XTextField(hint: 'Password', passValid: true),
        const XTextField(hint: 'Password Confirmation', passValid: true, passConfirm: ''),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0.hp, horizontal: 3.0.wp),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "By submitting form you agree to our ",
              style: Theme.of(context).textTheme.caption,
              children: [
                TextSpan(
                  text: "Term & Conditions.",
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.orange),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
