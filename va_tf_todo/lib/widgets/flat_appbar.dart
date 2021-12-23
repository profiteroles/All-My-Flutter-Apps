import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class FlatAppBar extends GetView<HomeController> {
  const FlatAppBar(
    this.title, {
    this.hasInfoIcon = false,
    Key? key,
  }) : super(key: key);

  final bool hasInfoIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.wp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold)),
          if (hasInfoIcon)
            IconButton(
              icon: const Icon(Icons.info_outline, size: 28),
              onPressed: () => Get.defaultDialog(
                title: 'How This App Works',
                titlePadding: EdgeInsets.all(5.0.wp),
                titleStyle: Theme.of(context).dialogTheme.titleTextStyle,
                middleText: 'Create New List: Use [+] in the square.\n'
                    'Create New Task:Use (+) in the Cirle.\n'
                    'Delete List: Press & Hold the Square drag to the bin Icon',
              ),
            ),
        ],
      ),
    );
  }
}
