import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController snackbarError(String content) => Get.snackbar(
      'Error',
      content,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(Icons.error, color: Colors.white),
      backgroundColor: Get.theme.errorColor,
      colorText: Colors.white,
    );
