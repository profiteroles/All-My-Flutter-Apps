import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../widgets/appbutton.dart';
import '..//widgets/input_field.dart';
import '../widgets/sign_boiler_plate.dart';
import 'signup_controller.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignBoilerPlate(
        fbKey: controller.fbKey,
        height: Get.height,
        children: [
          JukeInputField(
            title: 'Name',
            hint: 'Your Name',
            icon: Icons.person,
            nameValid: true,
          ),
          SizedBox(height: Get.height * 0.02),
          JukeInputField(
            title: 'Email',
            hint: 'youremail@example.com',
            icon: Icons.email,
            emailValid: true,
            inputType: TextInputType.emailAddress,
          ),
          SizedBox(height: Get.height * 0.02),
          JukeInputField(
            controller: password,
            title: 'Password',
            hint: 'Password',
            icon: Icons.lock,
            passValid: true,
          ),
          SizedBox(height: Get.height * 0.02),
          JukeInputField(
            title: 'Password Confirmation',
            hint: 'Password Confirmation',
            icon: Icons.lock,
            passValid: true,
            passConfirm: password.text,
          ),
          SizedBox(height: Get.height * 0.03),
          AppButton(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
            title: 'Sign up',
            onTap: controller.register,
            isLoading: controller.singUpState.value == SingUpState.loading,
          )
        ],
      ),
    );
  }
}
