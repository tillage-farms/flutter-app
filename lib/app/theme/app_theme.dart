import 'package:flutter/material.dart';
import 'package:tillage_farms/app/theme/core/values/colors.dart';

final ThemeData appLightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  fontFamily: "TT Commons",
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
  ),
  inputDecorationTheme: getInputTheme(),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      // backgroundColor: AppColors.primaryAccentColor.withOpacity(0.2),
      primary: AppColors.primaryColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: AppColors.primaryColor, onPrimary: Colors.white),
  ),
);

InputDecorationTheme getInputTheme() {
  return InputDecorationTheme(
    isDense: true,
    suffixIconColor: AppColors.primaryAccentColor,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryAccentColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryAccentColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    hintStyle: TextStyle(
      color: AppColors.primaryAccentColor,
      fontSize: 20,
    ),
  );
}

final ThemeData appDarkTheme = ThemeData.light().copyWith(
  primaryColor: AppColors.primaryColor,
  appBarTheme: AppBarTheme(
      // backgroundColor: AppColors.primaryColor,
      ),
);
