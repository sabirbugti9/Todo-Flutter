import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/routing/app_routes.dart';

import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

import 'package:tasky/features/home/data/models/get_tasks.response.dart';
import 'package:tasky/features/home/widgets/tasks_types_colors.dart';

class TaskWidget extends StatelessWidget {
  final String taskType;
  final String taskDescription;
  final String taskPriority;
  final String taskDueDate;
  final String taskBodyText;
  final GetTasksResponse task; // Pass the entire task object

  const TaskWidget({
    super.key,
    required this.taskType,
    required this.taskDescription,
    required this.taskPriority,
    required this.taskDueDate,
    required this.taskBodyText,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to TaskDetailsScreen with the task data
        Navigator.pushNamed(
          context, // This context must include BlocProvider<HomeCubit>
          Routes.taskDeatils,
          arguments: task,
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0.w),
          boxShadow: [
            BoxShadow(
              color: ColorsManger.myWhiteColor,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder Image
            Image.asset(
              "assets/images/png/cart.png",
              width: 50.w,
              height: 50.h,
            ),
            const SizedBox(width: 16.0), // Space between image and content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Status Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        taskDescription.length > 12
                            ? '${taskDescription.substring(0, 12)}...'
                            : taskDescription,
                        style: CustomstextStyels.font15black700Wight,
                      ),
                      Container(
                        width: 80.w,
                        height: 25.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0.w, vertical: 4.0.h),
                        decoration: BoxDecoration(
                          color: getContainerColor(taskType), // Dynamic color
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            taskType,
                            style: getTextStyle(taskType), // Dynamic style
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0.h),
                  // Task Description
                  Text(
                    taskBodyText,
                    style: CustomstextStyels.font20black700Wight,
                  ),
                  SizedBox(height: 16.0.h),
                  // Metadata: Priority and Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.flag,
                            color: getPeriortyColor(taskPriority),
                            size: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            taskPriority,
                            style: CustomstextStyels.font14ForMediumTasks
                                .copyWith(
                                    color: getPeriortyColor(taskPriority)),
                          ),
                        ],
                      ),
                      Text(
                        taskDueDate,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.more_vert,
              color: ColorsManger.customsGray,
            ),
          ],
        ),
      ),
    );
  }
}
