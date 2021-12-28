import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, this.title, required this.onPressed, this.color}) : super(key: key);

  final VoidCallback onPressed;
  final String? title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title ?? 'confirm'.tr),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        minimumSize: const Size(150, 40),
        primary: color,
      ),
    );
  }
}
