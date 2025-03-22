import 'package:flutter/material.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

Color getContainerColor(String taskType) {
  switch (taskType) {
    case 'waiting':
      return ColorsManger.myRedHavan;
    case 'Inprogress':
      return ColorsManger.secondColor;
    case 'inprogress':
      return ColorsManger.secondColor;
    case 'finished':
      return ColorsManger.finshedColorr;
    default:
      return Colors.grey; // Default color for other task types
  }
}

Color getPeriortyColor(String taskPertiorty) {
  switch (taskPertiorty) {
    case 'medium':
      return ColorsManger.mediumColor;
    case 'high':
      return ColorsManger.highColor;
    case 'low':
      return ColorsManger.lowColor;
    default:
      return Colors.grey; // Default color for other task types
  }
}

TextStyle getTextStyle(String taskType) {
  switch (taskType) {
    case 'waiting':
      return CustomstextStyels.font14ForHihgtTasks;
    case 'Inprogress':
      return CustomstextStyels.font14ForMediumTasks;
    case 'inprogress':
      return CustomstextStyels.font14ForMediumTasks;
    case 'finished':
      return CustomstextStyels.font14ForlowTasks;
    default:
      return TextStyle(
        fontSize: 14.0,
        color: Colors.black, // Default text style
        fontWeight: FontWeight.w400,
      );
  }
}
