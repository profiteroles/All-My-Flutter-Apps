import 'package:deliverone/domain/routes/routes.dart';
import 'package:deliverone/path.dart';
import 'package:deliverone/presentation/widgets/app_text_field.dart';
import 'package:get/route_manager.dart';
import 'login_controller.dart';
import '..//widgets/appbutton.dart';
import 'package:deliverone/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

const logoSize = 50.0;

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  void login() async {
    print('LoginScreen - login is Called');
    final bool result = await controller.login();
    result ? Get.offNamed(AppRoutes.home) : null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: logoSize,
                      left: -5,
                      right: -5,
                      height: size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(size.width / 2),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: appGradients,
                            stops: [0.5, 1],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: logoSize,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(IMAGE_PATH + 'logo.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 20),
                        AppTextField(
                          controller: controller.emailController,
                          title: 'Email',
                          icon: Icons.person,
                        ),
                        SizedBox(height: 10),
                        AppTextField(
                          controller: controller.passwordController,
                          title: 'Password',
                          icon: Icons.lock,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: AppButton(title: 'Login', onTap: login),
              ),
            ],
          ),
          Positioned.fill(
            child: Obx(() => controller.loginState.value == LoginState.loading
                ? Container(
                    color: Colors.black26,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SizedBox.shrink()),
          ),
        ],
      ),
    );
  }
}
