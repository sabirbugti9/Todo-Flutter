import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.home);
          },
          child: SvgPicture.asset(
            'assets/images/svg/arrow_left.svg',
          ),
        ),
        SizedBox(width: 20.w),
        Text(
          'Profile',
          style: CustomstextStyels.font24black700Wight,
        ),
      ],
    );
  }
}
