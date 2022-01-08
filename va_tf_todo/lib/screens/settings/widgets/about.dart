import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:va_tf_todo/screens/settings/widgets/card.dart';
import 'package:va_tf_todo/screens/settings/widgets/header.dart';
import 'package:va_tf_todo/values/utils/asset_path.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar('about'.tr, leading: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
        child: ListView(
          children: [
            Center(child: Image.asset(todoImage, scale: 8)),
            Center(child: Text('version'.tr + ': 0.0.4', style: Get.textTheme.headline6)),
            SizedBox(height: 5.0.hp),
            AppCard(title: 'Visit Website', icon: Icons.web, onPress: () {}),
            AppCard(title: 'Rate us', icon: Icons.star, onPress: () {}),
            SizedBox(height: 5.0.hp),
            Header('follow_us'.tr),
            AppCard(title: 'Facebook', icon: Icons.facebook, onPress: () {}),
            AppCard(title: 'LinkedIn', icon: FontAwesomeIcons.linkedinIn, onPress: () {}),
            SizedBox(height: 5.0.hp),
            AppCard(title: 'terms_of_use'.tr, onPress: () {}),
            AppCard(title: 'ack'.tr, onPress: () {}),
            AppCard(title: 'licenses'.tr, onPress: () {}),
            SizedBox(height: 5.0.hp),
          ],
        ),
      ),
    );
  }
}
