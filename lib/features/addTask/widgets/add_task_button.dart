import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const AddTaskButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0.dg),
      child: GestureDetector(
        onTap: isLoading ? null : onPressed,
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsManger.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const CircularProgressIndicator(color: Colors.white)
              else
                Text(
                  'Add task',
                  style: CustomstextStyels.font18White700Wight,
                ),
              SizedBox(width: 15.w),
            ],
          ),
        ),
      ),
    );
  }
}
