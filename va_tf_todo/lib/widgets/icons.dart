import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/choice_btn.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

List<Icon> getIcons() {
  return const [
    Icon(IconData(AppIcons.person, fontFamily: 'MaterialIcons'), color: lightPurple),
    Icon(IconData(AppIcons.work, fontFamily: 'MaterialIcons'), color: lightPink),
    Icon(IconData(AppIcons.shop, fontFamily: 'MaterialIcons'), color: lightGreen),
    Icon(IconData(AppIcons.gym, fontFamily: 'MaterialIcons'), color: yellow),
    Icon(IconData(AppIcons.trip, fontFamily: 'MaterialIcons'), color: deepPink),
  ];
}

List<Color> getPriorities() => [lightGrey, blue, yellow, red];

class AppIcons {
  static const person = 0xe491;
  static const work = 0xe11c;
  static const gym = 57810;
  static const trip = 0xe071;
  static const shop = 0xe59c;
}

taskIcons(HomeController controller, {bool hasBackFunction = true}) {
  return getIcons()
      .map((e) => Obx(
            () => ChoiceBtn(
              label: e,
              elevation: controller.iconIndex() == getIcons().indexOf(e) ? 3 : 0,
              selected: controller.iconIndex() == getIcons().indexOf(e),
              onSelected: (selected) {
                controller.iconIndex.value = selected ? getIcons().indexOf(e) : 0;
                hasBackFunction ? Get.back(result: getIcons()[getIcons().indexOf(e)]) : null;
              },
            ),
          ))
      .toList();
}

priorityIcons(HomeController controller, {bool hasBackFunction = true}) {
  return getPriorities()
      .map((e) => Obx(
            () => ChoiceBtn(
              label: Icon(e == lightGrey ? Icons.outlined_flag : Icons.flag, color: e),
              elevation: controller.priorityIndex() == getPriorities().indexOf(e) ? 3 : 0,
              selected: controller.priorityIndex() == getPriorities().indexOf(e),
              onSelected: (selected) {
                controller.priorityIndex.value = selected ? getPriorities().indexOf(e) : 0;
                hasBackFunction ? Get.back(result: getPriorities()[getPriorities().indexOf(e)].toHex()) : null;
              },
            ),
          ))
      .toList();
}
