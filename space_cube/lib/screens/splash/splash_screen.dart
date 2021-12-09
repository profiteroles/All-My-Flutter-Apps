import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/instance_manager.dart';
import 'package:space_cube/screens/splash/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  // final _pageController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, Colors.purple],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'SPACE JUKE',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
