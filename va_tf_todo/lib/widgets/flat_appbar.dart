import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar(
    this.title, {
    this.hasInfo = false,
    this.leading = false,
    this.titleSpacing = 15,
    this.titleWidget,
    this.onBack,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool hasInfo, leading;
  final double titleSpacing;
  final Widget? titleWidget;
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      pinned: false,
      floating: true,
      elevation: 8,
      title: titleWidget ?? Text(title.tr),
      titleSpacing: titleSpacing,
      centerTitle: false,
      leading: leading
          ? IconButton(
              onPressed: onBack ?? Get.back,
              icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.grey),
            )
          : null,
      actions: [
        if (hasInfo)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.info_outline, size: 32),
              onPressed: () => Get.defaultDialog(
                title: 'how_app'.tr,
                titlePadding: EdgeInsets.all(5.0.wp),
                titleStyle: Theme.of(context).dialogTheme.titleTextStyle,
                content: RichText(
                  text: TextSpan(
                    style: Theme.of(context).dialogTheme.contentTextStyle,
                    children: const [
                      TextSpan(text: 'Create New List: Use [+] in the square.'),
                      TextSpan(text: '\n'),
                      TextSpan(text: 'Create New Task:Use (+) in the Cirle.'),
                      TextSpan(text: '\n'),
                      TextSpan(text: 'Delete List: Press & Hold the Square drag to the bin Icon'),
                    ],
                  ),
                ),
                middleText: 'Create New List: Use [+] in the square.\n'
                    'Create New Task:Use (+) in the Cirle.\n'
                    'Delete List: Press & Hold the Square drag to the bin Icon',
              ),
            ),
          ),
      ],
    );
  }
}

class FlatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlatAppBar(
    this.title, {
    this.hasInfo = false,
    this.leading = false,
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  final String title;
  final bool hasInfo, leading;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(title.tr),
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: leading
          ? IconButton(
              onPressed: Get.back,
              icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.grey),
            )
          : null,
      actions: [
        if (hasInfo)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.info_outline, size: 32),
              onPressed: () => Get.defaultDialog(
                title: 'how_app'.tr,
                titlePadding: EdgeInsets.all(5.0.wp),
                titleStyle: Theme.of(context).dialogTheme.titleTextStyle,
                content: RichText(
                  text: TextSpan(
                    style: Theme.of(context).dialogTheme.contentTextStyle,
                    children: const [
                      TextSpan(text: 'Create New List: Use [+] in the square.'),
                      TextSpan(text: '\n'),
                      TextSpan(text: 'Create New Task:Use (+) in the Cirle.'),
                      TextSpan(text: '\n'),
                      TextSpan(text: 'Delete List: Press & Hold the Square drag to the bin Icon'),
                    ],
                  ),
                ),
                middleText: 'Create New List: Use [+] in the square.\n'
                    'Create New Task:Use (+) in the Cirle.\n'
                    'Delete List: Press & Hold the Square drag to the bin Icon',
              ),
            ),
          ),
      ],
    );
  }
}
