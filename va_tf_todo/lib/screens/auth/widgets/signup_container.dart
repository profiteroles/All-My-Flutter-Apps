import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart' as v;
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/text_field.dart';
import '../controller.dart';

class SignUpContainer extends GetView<AuthController> {
  SignUpContainer({Key? key}) : super(key: key);

  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.signupKey,
      child: Column(
        children: [
          XTextField(
            icon: Icons.account_box_outlined,
            hint: 'Full Name',
            validator: [
              v.FormBuilderValidators.required(context, errorText: 'validator_name'.tr),
              (value) {
                if (RegExp(r'[.,!@#$<>?":_`~;[\]\\|=+)(**&^%0-9-]').hasMatch(value!)) {
                  return 'validator_special'.tr;
                }
              }
            ],
          ),
          XTextField(
            icon: Icons.email_outlined,
            hint: 'Email',
            type: TextInputType.emailAddress,
            validator: [
              v.FormBuilderValidators.required(context, errorText: 'validator_required'.tr),
              v.FormBuilderValidators.email(context, errorText: 'validator_email'.tr),
            ],
          ),
          XTextField(
            hint: 'Password',
            obscure: true,
            controller: passwordCtrl,
            validator: [
              v.FormBuilderValidators.required(context, errorText: 'validator_required'.tr),
              v.FormBuilderValidators.minLength(context, 8, errorText: 'validator_8'.tr),
            ],
          ),
          XTextField(
            hint: 'Password Confirmation',
            obscure: true,
            validator: [
              v.FormBuilderValidators.required(
                context,
                errorText: 'validator_password_null'.tr,
              ),
              v.FormBuilderValidators.minLength(context, 8, errorText: 'validator_8'.tr),
              (value) {
                if (value != passwordCtrl.text) {
                  return 'validator_pass_match'.tr;
                }
              }
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.wp).copyWith(top: 3.0.wp),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'by_submission'.tr,
                style: Theme.of(context).textTheme.caption,
                children: [
                  TextSpan(
                    text: 'terms_conditions'.tr,
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
