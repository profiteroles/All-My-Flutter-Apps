import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

import 'arrow_btn.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    this.subTitle = '',
    required this.title,
    required this.icon,
    this.onPress,
    this.onChanged,
    this.isSwitch = false,
    this.value,
    Key? key,
  }) : super(key: key);

  final String title, subTitle;
  final IconData icon;
  final VoidCallback? onPress;
  final bool isSwitch;
  final bool? value;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Center(
        child: ListTile(
          title: Text(title, style: Theme.of(context).textTheme.subtitle1),
          subtitle: subTitle.length > 1 ? Text(subTitle, style: Theme.of(context).textTheme.bodyText2) : null,
          trailing: isSwitch ? Switch(value: value ?? false, onChanged: onChanged ?? (value) {}) : ArrowBtn(onPress: onPress ?? () {}),
          contentPadding: EdgeInsets.all(5.0.wp),
          iconColor: Colors.orange,
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
