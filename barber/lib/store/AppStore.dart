import '../utils/AppColors.dart';
import '../utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isDarkModeOn = false;

  @observable
  late Color scaffoldBackground;

  @observable
  late Color backgroundColor;

  @observable
  late Color backgroundSecondaryColor;

  @observable
  late Color textPrimaryColor;

  @observable
  late Color appColorPrimaryLightColor;

  @observable
  late Color textSecondaryColor;

  @observable
  late Color appBarColor;

  @observable
  late Color iconColor;

  @observable
  late Color iconSecondaryColor;

  @observable
  String selectedLanguage = 'en';

  @observable
  var selectedDrawerItem = -1;

  @action
  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if (isDarkModeOn) {
      scaffoldBackground = appBackgroundColorDark;

      appBarColor = cardBackgroundBlackDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = cardBackgroundBlackDark;

      iconColor = iconColorPrimary;
      iconSecondaryColor = iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = appShadowColorDark;
    } else {
      scaffoldBackground = Colors.white;

      appBarColor = Colors.white;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = appSecondaryBackgroundColor;
      appColorPrimaryLightColor = appColorPrimaryLight;

      iconColor = iconColorPrimaryDark;
      iconSecondaryColor = iconColorSecondaryDark;

      textPrimaryColor = appTextColorPrimary;
      textSecondaryColor = appTextColorSecondary;

      textPrimaryColorGlobal = appTextColorPrimary;
      textSecondaryColorGlobal = appTextColorSecondary;
      shadowColorGlobal = appShadowColor;
    }

    await setBool(isDarkModeOnPref, isDarkModeOn);
  }

  @action
  void setLanguage(String aLanguage) => selectedLanguage = aLanguage;

  @action
  void setDrawerItemIndex(int aIndex) {
    selectedDrawerItem = aIndex;
  }
}
