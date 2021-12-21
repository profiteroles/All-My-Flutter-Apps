import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:va_tf_todo/screens/singing/controller.dart';
import 'package:va_tf_todo/values/colors.dart';
import '../../values/utils/extention.dart';
import 'widgets/animated_card.dart';
import 'widgets/social_media_buttons.dart';
import 'widgets/top_image.dart';

class SigningScreen extends GetView<SigningController> {
  const SigningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          const TopImageSection(),
          const AnimatedCard(),
          //Main Contianer for Login and Signup
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInBack,
              top: controller.isSignupScreen() ? 200 : 230,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInBack,
                height: controller.isSignupScreen() ? 380 : 250,
                padding: EdgeInsets.all(5.0.wp),
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15, spreadRadius: 5),
                ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => controller.isSignupScreen(false),
                            child: Column(
                              children: [
                                Text(
                                  "LOGIN",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: !controller.isSignupScreen() ? activeColor : textColor1),
                                ),
                                if (!controller.isSignupScreen())
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.isSignupScreen(true),
                            child: Column(
                              children: [
                                Text(
                                  "SIGNUP",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: controller.isSignupScreen() ? activeColor : textColor1),
                                ),
                                if (controller.isSignupScreen())
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                      controller.isSignupScreen() ? const SignUpContainer() : const LoginContainer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const AnimatedCard(hasShadow: false),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Obx(() => Text(controller.isSignupScreen() ? "Or Signup with" : "Or Signin with")),
                Container(
                  margin: EdgeInsets.only(right: 5.0.wp, left: 5.0.wp, top: 4.0.wp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SocialMediaButton(icon: Icons.facebook, title: 'Facebook', bgColor: fbColor),
                      SocialMediaButton(icon: Icons.g_mobiledata, title: 'Google', bgColor: googleColor),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginContainer extends GetView<SigningController> {
  const LoginContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0.wp),
      child: Column(
        children: [
          const XTextField(icon: Icons.mail_outline, hint: 'your@email.com', type: TextInputType.emailAddress),
          const XTextField(icon: Icons.lock_clock_outlined, hint: 'Password', obscureText: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: controller.isRememberMe(),
                    activeColor: textColor2,
                    onChanged: (value) => controller.isRememberMe(!controller.isRememberMe()),
                  ),
                  const Text("Remember me", style: TextStyle(fontSize: 12, color: textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?", style: TextStyle(fontSize: 12, color: textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SignUpContainer extends GetView<SigningController> {
  const SignUpContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0.wp),
      child: Column(
        children: [
          const XTextField(icon: Icons.account_box_outlined, hint: 'Full Name'),
          const XTextField(icon: Icons.email_outlined, hint: 'Email', type: TextInputType.emailAddress),
          const XTextField(icon: Icons.lock_clock_outlined, hint: 'Password', obscureText: true),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => controller.isMale(true),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(color: controller.isMale() ? textColor2 : Colors.transparent, border: Border.all(width: 1, color: controller.isMale() ? Colors.transparent : textColor1), borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.account_box_outlined,
                          // MaterialCommunityIcons.account_outline,
                          color: controller.isMale() ? Colors.white : iconColor,
                        ),
                      ),
                      const Text(
                        "Male",
                        style: const TextStyle(color: textColor1),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () => controller.isMale(false),
                  // setState(() {
                  //   isMale = false;
                  // });
                  // },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(color: controller.isMale() ? Colors.transparent : textColor2, border: Border.all(width: 1, color: controller.isMale() ? textColor1 : Colors.transparent), borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.account_box_outlined,
                          // MaterialCommunityIcons.account_outline,
                          color: controller.isMale() ? iconColor : Colors.white,
                        ),
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(color: textColor1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(text: "By pressing 'Submit' you agree to our ", style: TextStyle(color: textColor2), children: [
                TextSpan(
                  text: "term & conditions",
                  style: TextStyle(color: Colors.orange),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class XTextField extends StatelessWidget {
  const XTextField({
    this.type = TextInputType.text,
    this.obscureText = false,
    required this.icon,
    required this.hint,
    Key? key,
  }) : super(key: key);

  final TextInputType type;
  final bool obscureText;
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: obscureText,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: iconColor),
          contentPadding: const EdgeInsets.all(10),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, color: textColor1),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor1),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor1),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
