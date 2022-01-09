import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

import 'arrow_btn.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    this.subTitle = '',
    required this.title,
    this.icon,
    this.onPress,
    this.onChanged,
    this.isSwitch = false,
    this.value,
    Key? key,
    this.padHor = 3,
    this.padVer = 1,
  }) : super(key: key);

  final String title, subTitle;
  final IconData? icon;
  final VoidCallback? onPress;
  final bool isSwitch;
  final bool? value;
  final Function(bool)? onChanged;
  final double padHor, padVer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padHor.wp, vertical: padVer.wp),
      child: Card(
        elevation: 2,
        child: Center(
          child: ListTile(
            title: Text(title, style: Theme.of(context).textTheme.subtitle1),
            subtitle: subTitle.length > 1 ? Text(subTitle, style: Theme.of(context).textTheme.bodyText2) : null,
            trailing: isSwitch ? Switch(value: value ?? false, onChanged: onChanged ?? (value) {}) : ArrowBtn(onPress: onPress ?? () {}),
            contentPadding: EdgeInsets.all(5.0.wp),
            iconColor: Colors.orange,
            leading: icon == null ? null : Icon(icon),
          ),
        ),
      ),
    );
  }
}
