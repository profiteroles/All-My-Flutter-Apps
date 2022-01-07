import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.color,
    this.hasMinSize = true,
    this.boldFont = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String? title;
  final Color? color;
  final bool hasMinSize, boldFont;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title ?? 'confirm'.tr),
      style: ElevatedButton.styleFrom(
        minimumSize: hasMinSize ? const Size(150, 40) : null,
        primary: color,
      ),
    );
  }
}
