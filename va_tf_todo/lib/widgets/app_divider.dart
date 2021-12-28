import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 2.0.hp),
      child: const Divider(thickness: 2),
    );
  }
}
