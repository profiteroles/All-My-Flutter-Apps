import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/widgets/text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart' as V;
import '../controller.dart';

class LoginContainer extends GetView<SigningController> {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.fbKey,
      child: Column(
        children: [
          XTextField(
            icon: Icons.mail_outline,
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
            validator: [
              V.FormBuilderValidators.required(context, errorText: 'Good try! Let\'s get down to business'),
              V.FormBuilderValidators.minLength(context, 8, errorText: 'Well we require min 8 charactors'),
            ],
          ),
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
      ),
    );
  }
}
