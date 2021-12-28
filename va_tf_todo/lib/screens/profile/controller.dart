import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  RxString selectedMonth = DateFormat.MMMM().format(DateTime.now()).obs;

  void setMonth(String? value) {
    debugPrint('ProfileController - setMonth is Called $value');
    selectedMonth(value);
  }
}
