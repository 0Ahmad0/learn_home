import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnapp/constants/const_color.dart';
import 'package:learnapp/constants/theme/theme_services.dart';

Widget getTextField({
  required hint,
  isObserve = false,
  required onChange,
  required validator,
   suffixIcon = null,
  prefixIcon = null,
}) {
  return TextFormField(
    cursorColor: ThemeService().isSavedDarkMode()
    ?whiteColor
        :mainColor
    ,
    style: TextStyle(
      color: mainColor,
        fontFamily: 'AftikaRegular'),
    textInputAction: TextInputAction.next,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: onChange,
    validator: validator,
    obscureText: isObserve,
    decoration: InputDecoration(
      errorStyle: TextStyle(
        color:  ThemeService().isSavedDarkMode()
            ? colorSubtitleLight
            :Colors.red
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: ThemeService().isSavedDarkMode()
              ? colorSubtitleLight
              :Colors.red
        )
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.transparent, width: 0.0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.transparent, width: 0.0)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: ThemeService().isSavedDarkMode()
              ?whiteColor
              :mainColor
          )),
      filled: true,
      fillColor: colorTextFiled,
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'AftikaRegular',
        color: mainColor
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
    ),
  );
}
