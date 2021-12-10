import 'package:deliverone/domain/models/user.dart';
import 'package:deliverone/domain/repository/api_repository.dart';
import 'package:deliverone/domain/repository/local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  HomeController({required this.localInterface, required this.apiInterface});
  final LocalStorageInterface localInterface;
  final APIRepositoryInterface apiInterface;

  Rx<User> user = User.empty().obs;
  RxInt index = 0.obs;
  RxBool isDarkMode = false.obs;

  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    loadCurrentTheme();
  }

  @override
  void onReady() {
    print('onReady is Called');
    super.onReady();
    loadUser();
  }

  void loadUser() async => localInterface.getUser().then((value) => user(value));

  void loadCurrentTheme() async => localInterface.isDarkMode().then((value) => isDarkMode(value));
  bool updateTheme(bool isDark) {
    print('Home Controller - updateTheme is Called');
    var savedTheme = localInterface.saveThemeMode(isDark);
    print('Theme Mode is $isDark');
    isDarkMode(isDark);
    return isDark;
  }

  Future<void> logout() async {
    print('Home Controller - logout is Called');
    final token = await localInterface.getToken();
    await apiInterface.logout(token);
    await localInterface.clearAllData();
  }
}
