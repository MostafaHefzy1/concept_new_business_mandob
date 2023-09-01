// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constants.dart';
import '../style.dart';

ThemeData lightTheme = ThemeData(
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: MyColors.lightGreen),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: MyColors.primaryColor,
  ),
  fontFamily: AppConstats.fontFamily,
  scaffoldBackgroundColor: MyColors.whiteColor,
  textTheme: const TextTheme(
    bodyText1: blackTextStyle,
    bodyText2: TextStyle(
      fontFamily: AppConstats.fontFamily,
      color: MyColors.blackColor,
      height: 0.9,
    ),
  ),
);
