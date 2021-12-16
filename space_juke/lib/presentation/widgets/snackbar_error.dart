import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_juke/values/themes/theme.dart';

SnackbarController snackbarError(String content, {bool isInfo = false}) => Get.snackbar(
      isInfo ? 'Info' : 'Error',
      content,
      snackPosition: isInfo ? SnackPosition.TOP : SnackPosition.BOTTOM,
      icon: Icon(isInfo ? Icons.info : Icons.error, color: AppColors.white),
      backgroundColor: isInfo ? Get.theme.primaryColor : Get.theme.errorColor,
      colorText: AppColors.white,
    );
