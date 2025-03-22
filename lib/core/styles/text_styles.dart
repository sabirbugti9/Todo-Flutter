import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/color_manger.dart';

class CustomstextStyels {
  static TextStyle font24black700Wight = TextStyle(
      fontSize: 25.sp, fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle font20GrayWight = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManger.customsGray);
  static TextStyle font15black700Wight = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle font18White700Wight = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle font15White700Wight = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle font20black700Wight = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.grey);
  static TextStyle font20grayBoldWight = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.6));
  static TextStyle font15grayBoldWight = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.6));

  // periorty tasks

  static TextStyle font14ForMediumTasks = TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManger.mediumColor);
  static TextStyle font14ForHihgtTasks = TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManger.highColor);
  static TextStyle font14ForlowTasks = TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManger.lowColor);
}
