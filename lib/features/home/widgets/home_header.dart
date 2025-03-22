import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/text_styles.dart';

class Homeheader extends StatelessWidget {
  const Homeheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Logo", style: CustomstextStyels.font24black700Wight),
        SizedBox(
          width: 200.w,
        ),
        //add svg image
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.profile);
          },
          child: SvgPicture.asset(
            "assets/images/svg/profile.svg",
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(
          width: 30.w,
        ),

        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.login);
          },
          child: SvgPicture.asset(
            "assets/images/svg/exit.svg",
            width: 30,
            height: 30,
          ),
        ),
      ],
    );
  }
}
