import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'controller.dart';
import 'widgets/animated_card.dart';
import 'widgets/social_media_container.dart';
import 'widgets/toggle_container.dart';
import 'widgets/top_image.dart';

class SigningScreen extends GetView<AuthController> {
  const SigningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          TopImageSection(),
          AnimatedCard(),
          ToggleAnimationContainer(),
          AnimatedCard(hasShadow: false),
          SocialMediaContainer(),
        ],
      ),
    );
  }
}
