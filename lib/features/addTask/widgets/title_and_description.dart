import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/text_styles.dart';

class TitleAndDsecreptionWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const TitleAndDsecreptionWidget({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task Title',
          style: CustomstextStyels.font15grayBoldWight,
        ),
        SizedBox(height: 5.h),
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            labelText: '   Enter title here ....',
            labelStyle: CustomstextStyels.font15grayBoldWight,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          '  Task Description',
          style: CustomstextStyels.font15grayBoldWight,
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 150,
          child: TextField(
            controller: descriptionController,
            expands: true,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              labelText: '   Enter description here ....',
              labelStyle: CustomstextStyels.font15grayBoldWight,
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
