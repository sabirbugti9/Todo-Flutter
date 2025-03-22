import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/color_manger.dart';

Container statusDropDown(Widget widget) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      horizontal: 10.w,
      vertical: 8.h,
    ),
    decoration: BoxDecoration(
      color: ColorsManger.secondColor,
      borderRadius: BorderRadius.circular(16.w),
    ),
    child: widget,
  );
}
