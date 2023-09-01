// ToDo Custom Internet Offline

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/style.dart';

class CustomOffline extends StatelessWidget {
  const CustomOffline({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: MyColors.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
               "assets/images/internet_offline.PNG",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: const Text(
                  "الأنترنت غير متصل",
                  style: TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: const Text(
                    "برجاء مراجعة شبكة الانترنت الخاصة بك والتأكد من جاهزية الشبكة للعمل",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
