import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/choice_btn.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/icons.dart';

class IconDropBox extends GetView<HomeController> {
  const IconDropBox(this.isPriorityIcon, {Key? key}) : super(key: key);
  final bool isPriorityIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Obx(() => isPriorityIcon
          ? Icon(
              controller.priorityIndex() == getPriorities().indexOf(lightGrey) ? Icons.outlined_flag : Icons.flag,
              color: getPriorities()[controller.priorityIndex()],
              size: 28,
            )
          : getIcons()[controller.iconIndex()]),
      onPressed: () => Get.dialog(
          IconDropDown(
            isPriorityIcon,
            children: isPriorityIcon
                ? getPriorities()
                    .map((e) => Obx(
                          () => ChoiceBtn(
                            label: Icon(e == lightGrey ? Icons.outlined_flag : Icons.flag, color: e),
                            elevation: controller.priorityIndex() == getPriorities().indexOf(e) ? 3 : 0,
                            selected: controller.priorityIndex() == getPriorities().indexOf(e),
                            onSelected: (selected) {
                              controller.priorityIndex.value = selected ? getPriorities().indexOf(e) : 0;
                              Get.back(result: getPriorities()[getPriorities().indexOf(e)].toHex());
                            },
                          ),
                        ))
                    .toList()
                //TaskList Icons
                : getIcons()
                    .map((e) => Obx(
                          () => ChoiceBtn(
                            label: e,
                            elevation: controller.iconIndex.value == getIcons().indexOf(e) ? 3 : 0,
                            selected: controller.iconIndex.value == getIcons().indexOf(e),
                            onSelected: (selected) {
                              controller.iconIndex.value = selected ? getIcons().indexOf(e) : 0;
                              Get.back(result: getIcons()[getIcons().indexOf(e)]);
                            },
                          ),
                        ))
                    .toList(),
          ),
          barrierColor: Colors.transparent,
          transitionCurve: Curves.easeIn),
    );
  }
}

class IconDropDown extends GetView<HomeController> {
  const IconDropDown(this.isPriorityIcon, {required this.children, Key? key}) : super(key: key);

  final List<Widget> children;
  final bool isPriorityIcon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isPriorityIcon ? Alignment.topRight : Alignment.topLeft,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: isPriorityIcon ? EdgeInsets.only(right: 3.0.wp) : EdgeInsets.only(top: 1.0.wp, left: 13.0.wp),
        height: 28.0.hp,
        width: 16.0.wp,
        decoration: BoxDecoration(color: Get.theme.canvasColor),
        child: Center(child: Wrap(spacing: 2.0.wp, children: children)),
      ),
    );
  }
}
