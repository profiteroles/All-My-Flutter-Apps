import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'remember_checkbox.dart';
import 'package:va_tf_todo/widgets/text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart' as v;
import '../controller.dart';

class LoginContainer extends GetView<AuthController> {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.loginKey,
      child: Column(
        children: [
          XTextField(
            icon: Icons.mail_outline,
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
            validator: [
              v.FormBuilderValidators.required(context, errorText: 'validator_required'.tr),
              v.FormBuilderValidators.minLength(context, 8, errorText: 'validator_8'.tr),
            ],
          ),
          const RememberMeBox(),
        ],
      ),
    );
  }
}
