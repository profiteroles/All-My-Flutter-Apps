import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:va_tf_todo/screens/settings/widgets/header.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/button.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({
    Key? key,
    required this.email,
    required this.name,
    required this.logout,
    required this.amount,
    this.padHor = 0,
    this.padVer = 0,
  }) : super(key: key);
  final String email, name;
  final VoidCallback logout;
  final int amount;
  final double padHor, padVer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padHor.wp, vertical: padVer.wp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header('personal_info'.tr),
          Card(
            elevation: 3,
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.hp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  appTile(context, leading: 'full_name', trailing: name),
                  appTile(context, leading: 'email', trailing: email),
                  appTile(context, leading: 'total_task', trailing: '$amount'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.wp),
                    child: AppButton(onPressed: logout, title: 'Log Out'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile appTile(BuildContext context, {required String leading, required String trailing}) {
    return ListTile(
      leading: Text(leading.tr, style: Theme.of(context).textTheme.subtitle1),
      trailing: Text(trailing, style: Theme.of(context).textTheme.subtitle1),
    );
  }
}
