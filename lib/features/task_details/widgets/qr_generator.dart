import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Center qrGnerator(taskId) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: BarcodeWidget(
        barcode: Barcode.qrCode(),
        data: taskId!,
        width: 250.w,
        height: 250.h,
        color: Colors.black,
        padding: EdgeInsets.zero,
      ),
    ),
  );
}
