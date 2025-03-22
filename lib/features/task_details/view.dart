import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';

import 'package:tasky/features/task_details/widgets/header.dart';
import 'package:tasky/features/task_details/widgets/qr_generator.dart';
import 'package:tasky/features/task_details/widgets/task_date.dart';

import 'package:tasky/features/task_details/widgets/task_status_periorty.dart';

class TaskDetailsScreen extends StatefulWidget {
  final GetTasksResponse task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  String? _selectedStatus;
  String? _selectedPeriorty;

  final List<String> _statusOptions = [
    'In Progress',
    'Waiting',
    'Finished',
  ];
  final List<String> _periortyOptions = [
    'low',
    'medium',
    'high',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0.dg),
            child: Column(
              children: [
                // Header
                TaskDetailsHeader(
                  taskId: widget.task.sId!,
                ),
                // Task Details
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Task Image
                      if (widget.task.image != null)
                        Image.asset(
                          "assets/images/png/placeHolder.png",
                          width: 350.w,
                          height: 200.h,
                        ),
                      SizedBox(height: 16.h),
                      // Task Title
                      Text(
                        widget.task.title ?? 'No Title',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // Task Description
                      Text(
                        widget.task.desc ?? 'No Description',
                        style: CustomstextStyels.font20black700Wight,
                      ),
                      SizedBox(height: 16.h),
                      // Task Created At
                      statusDropDown(
                        taskCreatedAt(widget.task.createdAt!),
                      ),
                      SizedBox(height: 16.h),

                      // Status Dropdown
                      statusDropDown(taskStatus()),
                      SizedBox(height: 16.h),
                      // Priority Dropdown
                      statusDropDown(taskSPeriorty()),
                      SizedBox(height: 16.h),
                      // Date Picker with Calendar Icon

                      SizedBox(height: 16.h),
                      // QR Code Generator
                      qrGnerator(widget.task.sId),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget taskStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // DropdownButton text
        Expanded(
          child: DropdownButton<String>(
            value: _selectedStatus,
            hint: Text(
              widget.task.status ?? 'Select Status',
              style: CustomstextStyels.font14ForMediumTasks,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedStatus = newValue;
              });
            },
            items: _statusOptions
                .map<DropdownMenuItem<String>>((String taskStatus) {
              return DropdownMenuItem<String>(
                value: taskStatus,
                child: Text(
                  taskStatus,
                  style: CustomstextStyels.font14ForMediumTasks,
                ),
              );
            }).toList(),
            underline: Container(),
            isExpanded: true,
            icon: Image.asset(
              'assets/images/png/ArrowDown.png', // Custom image
              width: 20.w, // Adjust width if needed
              height: 20.h, // Adjust height if needed
            ),
          ),
        ),
      ],
    );
  }

  Widget taskSPeriorty() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Icon on the left
        Icon(
          Icons.flag,
          color: ColorsManger.mediumColor,
          size: 20.0,
        ),
        SizedBox(
          width: 10.w,
        ),
        // DropdownButton text
        Expanded(
          child: DropdownButton<String>(
            value: _selectedPeriorty,
            hint: Text(
              widget.task.priority ?? 'Select priority',
              style: CustomstextStyels.font14ForMediumTasks,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedPeriorty = newValue;
              });
            },
            items: _periortyOptions
                .map<DropdownMenuItem<String>>((String taskPeriorty) {
              return DropdownMenuItem<String>(
                value: taskPeriorty,
                child: Text(
                  taskPeriorty,
                  style: CustomstextStyels.font14ForMediumTasks,
                ),
              );
            }).toList(),
            underline: Container(),
            isExpanded: true,
            icon: Image.asset(
              'assets/images/png/ArrowDown.png', // Custom image for dropdown icon
              width: 20.w, // Adjust width if needed
              height: 20.h, // Adjust height if needed
            ),
          ),
        ),
      ],
    );
  }
}
