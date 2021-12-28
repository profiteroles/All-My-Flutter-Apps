import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import '../controller.dart';

class SocialMediaContainer extends GetView<AuthController> {
  const SocialMediaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //Important this cunt here keep the button behind the Keyboard
      top: 85.0.hp,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Obx(() => Text(controller.isSignupScreen() ? "Or Signup with" : "Or Signin with")),
          SizedBox(height: 4.0.wp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [SocialMediaButton('Facebook'), SocialMediaButton('Google')],
          ),
        ],
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: title == "Google" ? () {} : () {},
      child: Row(children: [Icon(title == "Google" ? Icons.g_mobiledata : Icons.facebook), SizedBox(width: 1.0.wp), Text(title)]),
      style: TextButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.grey),
        minimumSize: Size(35.0.wp, 10.0.wp),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.white,
        backgroundColor: title == "Google" ? const Color(0xFFDE4B39) : const Color(0xFF3B5999),
      ),
    );
  }
}
