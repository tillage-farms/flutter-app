/* import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:unicons/unicons.dart';

import 'package:wtfa_app/app/values/values.dart';

class ThemeService {
  Box box = Get.find<Box>();

  /// get the Icon  for togllinf the theme
  Icon themeToggleIcon() =>
      isDarkMode() ? const Icon(UniconsLine.sun) : const Icon(UniconsLine.moon);

  ///  read the selectedTheme from GetStorage
  bool isDarkMode() => box.get(StringValues.APP_THEME) ?? false;

  /// returns the theme mode
  ThemeMode getThemeMode() => isDarkMode() ? ThemeMode.dark : ThemeMode.light;

  /// toggles the themeMode and persist it
  void toogleThemeMode() {
    Get.changeThemeMode(isDarkMode() ? ThemeMode.light : ThemeMode.dark);
    box.put(StringValues.APP_THEME, !isDarkMode());
  }
}
 */