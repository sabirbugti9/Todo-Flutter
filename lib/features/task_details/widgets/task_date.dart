import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:tasky/core/styles/text_styles.dart';

Widget taskCreatedAt(task) {
  String formattedDate = 'No Date';
  if (task != null) {
    try {
      DateTime date = DateTime.parse(task!);
      formattedDate = DateFormat('MMM dd, yyyy')
          .format(date); // Format to a more readable format
    } catch (e) {
      formattedDate = 'Invalid Date';
    }
  }

  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'End Date',
            style: CustomstextStyels.font20black700Wight,
          ),
          Text(
            formattedDate,
            style: CustomstextStyels.font15black700Wight,
          ),
        ],
      ),
      Spacer(),
      Image.asset(
        'assets/images/png/calendar.png', // Custom image
        width: 20.w, // Adjust width if needed
        height: 20.h, // Adjust height if needed
      ),
    ],
  );
}
