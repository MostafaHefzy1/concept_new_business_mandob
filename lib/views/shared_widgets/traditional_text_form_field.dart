import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/style.dart';

// ignore: must_be_immutable
class TraditionalTextFormField extends StatelessWidget {
  TraditionalTextFormField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    this.icon,
    this.controller,
    this.validate,
    this.onSave,
    this.maxLength,
    this.suffix,
    this.isPassword = false,
    this.suffixPressed,
    this.enabled = true,
  }) : super(key: key);

  final String hintText;
  final int? maxLength;
  final TextInputType textInputType;
  final Widget? icon;
  TextEditingController? controller;
  final String? Function(String? value)? validate;
  IconData? suffix;
  bool isPassword = false;
  Function()? suffixPressed;
  Function(String? value)? onSave;
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      enabled: enabled,
      maxLength: maxLength,
      validator: validate,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPressed,
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        isDense: true,
        filled: true,
        fillColor: MyColors.whiteColor,
        hintText: hintText,
        hintStyle: TextStyle(
          color: MyColors.hintTextColor,
          fontSize: 18.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(color: MyColors.greyColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(color: MyColors.greyColor, width: 1.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(color: MyColors.greyColor, width: 1.w),
        ),
        icon: icon,
      ),
    );
  }
}
