import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/color_manger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.primaryColor,
      body: Center(
        child: SizedBox(
          height: 65.h,
          width: 124.w,
          child: Image.asset('assets/images/png/splash.png'),
        ),
      ),
    );
  }
}
