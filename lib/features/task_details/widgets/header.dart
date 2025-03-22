import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/home/cubit/home_cubit.dart';

class TaskDetailsHeader extends StatelessWidget {
  final String taskId;

  const TaskDetailsHeader({
    super.key,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          // Show a success message and navigate back
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task deleted successfully.')),
          );
          Navigator.pushReplacementNamed(context, Routes.home);
        } else if (state is DeleteTaskError) {
          // Show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is EditTaskSuccess) {
          // Show a success message after editing
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task edited successfully.')),
          );
        } else if (state is EditTaskError) {
          // Show an error message for edit failure
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              'assets/images/svg/arrow_left.svg',
            ),
          ),
          SizedBox(width: 24.w),
          Text(
            'Task Details',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (String value) {
              if (value == 'edit') {
                // Navigate to an edit screen
                Navigator.pushNamed(
                  context,
                  Routes.editTask,
                  arguments: taskId,
                );
              } else if (value == 'delete') {
                // Confirm deletion
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Task'),
                      content: const Text(
                          'Are you sure you want to delete this task?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.read<HomeCubit>().deleteTask(taskId);
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Text(
                    'Edit',
                    style: CustomstextStyels.font15black700Wight,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Text(
                    'Delete',
                    style: CustomstextStyels.font14ForHihgtTasks
                        .copyWith(fontSize: 20),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
