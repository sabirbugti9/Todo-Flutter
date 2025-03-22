import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

class startButton extends StatelessWidget {
  const startButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.0.dg),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.login);
          print('hello');
        },
        child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManger.primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Let’s Start',
                  style: CustomstextStyels.font18White700Wight,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Image.asset('assets/images/png/arrow.png')
              ],
            )),
      ),
    );
  }
}
