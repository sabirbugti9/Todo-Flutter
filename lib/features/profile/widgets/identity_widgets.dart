import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

class IdentityWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const IdentityWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.dg),
      margin: EdgeInsets.all(5.dg),
      width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorsManger.widgetcolor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomstextStyels.font20black700Wight,
          ),
          Text(subTitle, style: CustomstextStyels.font20GrayWight),
        ],
      ),
    );
  }
}
