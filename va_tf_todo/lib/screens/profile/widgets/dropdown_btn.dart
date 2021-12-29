import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class AppDropDown extends GetView<ProfileController> {
  const AppDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
          value: controller.selectedMonth.value,
          onChanged: controller.setMonth,
          items: controller.months
              .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
              .toList()),
    );
  }
}
