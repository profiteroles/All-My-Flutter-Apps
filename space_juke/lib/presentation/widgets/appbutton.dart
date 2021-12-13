import 'package:flutter/material.dart';
import 'package:space_juke/values/themes/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.title,
    required this.onTap,
    required this.isLoading,
    this.padding = const EdgeInsets.all(14),
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final EdgeInsets padding;
  final bool isLoading;

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
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
        ),
      ),
    );
  }
}
