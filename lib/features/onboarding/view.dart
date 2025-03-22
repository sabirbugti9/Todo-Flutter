import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/core/widgets/art_widget.dart';
import 'package:tasky/features/onboarding/widgets/start_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.myWhiteColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          artWidget(500),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Task Management &\n        To-Do List',
            style: CustomstextStyels.font24black700Wight,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'This productive tool is designed to help\n         you better manage your task\n           project-wise conveniently!',
            style: CustomstextStyels.font20black700Wight,
          ),
          SizedBox(
            height: 20.h,
          ),
          startButton(),
        ],
      )),
    );
  }
}
