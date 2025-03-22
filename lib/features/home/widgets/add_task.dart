import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Add spacing
        SizedBox(
          height: 20.h,
        ),

        GestureDetector(
          onTap: () => _scanQR(context),
          child: Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorsManger.secondColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/svg/qr.svg',
                width: 40.w,
                height: 40.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        SizedBox(
          height: 20.h,
        ),

        SizedBox(
          width: 70.w,
          height: 70.h,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.addTaskScreen);
            },
            shape: CircleBorder(),
            backgroundColor: ColorsManger.primaryColor,
            child: const Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _scanQR(BuildContext context) async {
  try {
    // Start the QR scan
    var result = await BarcodeScanner.scan();
    if (result.rawContent.isNotEmpty) {
      // Handle scanned content
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanned: ${result.rawContent}')),
      );
    }
  } catch (e) {
    // Handle errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}
