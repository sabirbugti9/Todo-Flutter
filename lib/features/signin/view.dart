import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/core/widgets/art_widget.dart';

import 'package:tasky/features/signin/widgets/user_form.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                artWidget(280),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: CustomstextStyels.font24black700Wight,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                // SignIn screen
                UserForm(),

                //sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t have any account?',
                      style: CustomstextStyels.font20black700Wight,
                    ),
                    TextButton(
                      child: Text(
                        'Sign In here',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorsManger.primaryColor, // Text color
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
