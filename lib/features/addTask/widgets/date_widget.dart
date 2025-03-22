import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/core/styles/color_manger.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({super.key, required this.onDateSelected});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(
          picked); // Notify the parent widget about the selected date
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Due date',
          style: CustomstextStyels.font15grayBoldWight,
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManger.primaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Text(
                  _selectedDate == null
                      ? 'choose due date...'
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  style: CustomstextStyels.font15grayBoldWight,
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/png/calendar.png',
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
