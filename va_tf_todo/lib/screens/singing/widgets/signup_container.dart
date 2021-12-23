import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart' as V;
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/text_field.dart';
import '../controller.dart';

class SignUpContainer extends GetView<SigningController> {
  SignUpContainer({Key? key}) : super(key: key);

  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.fbKey,
      child: Column(
        children: [
          XTextField(
            icon: Icons.account_box_outlined,
            hint: 'Full Name',
            validator: [
              V.FormBuilderValidators.required(context, errorText: 'Would be nice to get to know you'),
              (value) {
                if (RegExp(r'[.,!@#$<>?":_`~;[\]\\|=+)(**&^%0-9-]').hasMatch(value!)) {
                  return 'Looks like your name is quite special';
                }
              }
            ],
          ),
          XTextField(
            icon: Icons.email_outlined,
            hint: 'Email',
            type: TextInputType.emailAddress,
            validator: [
              V.FormBuilderValidators.required(context, errorText: 'Good try! Why don\'t you put your E-mail'),
              V.FormBuilderValidators.email(context, errorText: 'This doesn\'t look like E-mail'),
            ],
          ),
          XTextField(
            hint: 'Password',
            passValid: true,
            controller: passwordCtrl,
            validator: [
              V.FormBuilderValidators.required(context, errorText: 'Good try! Let\'s get down to business'),
              V.FormBuilderValidators.minLength(context, 8, errorText: 'Well we require min 8 charactors'),
            ],
          ),
          XTextField(
            hint: 'Password Confirmation',
            passValid: true,
            validator: [
              V.FormBuilderValidators.required(context, errorText: 'Sure it matches but ... You know how this works'),
              V.FormBuilderValidators.minLength(context, 8, errorText: 'Actually "Eye" may guide you through this'),
              (value) {
                if (value != passwordCtrl.text) {
                  return 'Passwords kinda need match!';
                }
              }
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.wp).copyWith(top: 3.0.wp),
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
      ),
    );
  }
}
