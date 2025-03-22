import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget artWidget(int height) {
  return SizedBox(
    height: height.h,
    width: double.infinity,
    child: Image.asset(
      'assets/images/png/ART.png',
      fit: BoxFit.cover,
    ),
  );
}
