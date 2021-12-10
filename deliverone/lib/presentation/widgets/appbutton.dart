import 'package:deliverone/presentation/home/home_screen.dart';
import 'package:deliverone/themes/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.title,
    required this.onTap,
    this.padding = const EdgeInsets.all(14),
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: appGradients,
          ),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
