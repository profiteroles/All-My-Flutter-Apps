import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
    this.padHor = 5,
    this.padVer = 1,
    this.thickness = 2,
  }) : super(key: key);

  final double padHor, padVer, thickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padHor.wp, vertical: padVer.hp),
      child: Divider(thickness: thickness),
    );
  }
}
