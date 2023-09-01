import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'style.dart';

class MyHelpers {
  static confrimAwesomeDialog(
      {required BuildContext context,
      required String btnOkText,
      required String btnCancelText,
      required Function btnOkOnPress,
      String? text}) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      body:
          Image.asset("assets/images/logo.png", height: 150, fit: BoxFit.cover),
      btnOkText: btnOkText,
      btnOkColor: MyColors.primaryColor,
      btnOkOnPress: () async {
        btnOkOnPress();
      },
      btnCancelText: btnCancelText,
      btnCancelColor: Colors.redAccent,
      btnCancelOnPress: () {},
    ).show();
  }

  static closeAppDialog(BuildContext context) {
    confrimAwesomeDialog(
        context: context,
        btnOkText: "أغلق",
        btnCancelText: "لا",
        btnOkOnPress: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        });
  }

  //show snack bar
  static showSnackBar(String message, String status) {
    Get.snackbar(
      status == "error" ? 'خطا' : 'تنبيه',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          status == "error" ? MyColors.lightRed : MyColors.lightGreen,
      borderRadius: 10.r,
      margin: const EdgeInsets.all(15),
      colorText: MyColors.whiteColor,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
