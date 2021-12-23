import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class ArrowBtn extends StatelessWidget {
  const ArrowBtn({
    required this.onPress,
    this.icon = Icons.arrow_forward,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Icon(icon),
      style: TextButton.styleFrom(
        fixedSize: Size(14.0.wp, 14.0.wp),
        backgroundColor: Theme.of(context).primaryColorLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
