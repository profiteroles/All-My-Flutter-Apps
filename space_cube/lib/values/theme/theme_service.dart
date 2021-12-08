import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final storageKey = "isDarkMode";

  ThemeMode get theme => loadStoredTheme() ? ThemeMode.dark : ThemeMode.light;

  bool loadStoredTheme() => _getStorage.read(storageKey) ?? false;

  _saveThemeMode(bool isDarkMode) => _getStorage.write(storageKey, isDarkMode);

  void changeThemeMode() {
    Get.changeThemeMode(loadStoredTheme() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeMode(!loadStoredTheme());
  }
}
