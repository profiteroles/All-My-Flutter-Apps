import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:space_cube/routes/routes.dart';

class AlternativeSingBtn extends StatelessWidget {
  const AlternativeSingBtn({required this.isSignUp, Key? key}) : super(key: key);

  final bool isSignUp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Align(
        alignment: Alignment.bottomRight,
        child: RichText(
          text: TextSpan(
            text: (isSignUp ? 'Don\'t' : 'Already') + ' have an account? ',
            style: TextStyle(color: Colors.grey, fontSize: 15),
            children: <TextSpan>[
              TextSpan(
                text: 'Sign ' + (isSignUp ? 'Up' : 'In'),
                style: TextStyle(color: Colors.blueGrey, fontSize: 16, decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()..onTap = () => isSignUp ? Get.toNamed(JukeRoutes.signup) : Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
