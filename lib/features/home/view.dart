import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/home/widgets/add_task.dart';
import 'package:tasky/features/home/widgets/filter_tasks.dart';
import 'package:tasky/features/home/widgets/home_header.dart';
import 'package:tasky/features/home/widgets/task_widget.dart';
import 'package:tasky/features/home/cubit/home_cubit.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadTasks(1);

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        context.read<HomeCubit>().hasMore) {
      context.read<HomeCubit>().loadMoreTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddTaskWidget(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(13.0.w),
          child: Column(
            children: [
              const Homeheader(),
              SizedBox(height: 20.h),
              _buildTitle(),
              SizedBox(height: 10.h),
              const FilterTasks(),
              SizedBox(height: 10.h),
              _buildTaskList(),

              // refresh token test
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Text(
          'My Tasks',
          style: CustomstextStyels.font20grayBoldWight,
        ),
      ],
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetTasksError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetTasksLoading && state is! GetTasksSuccess) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetTasksEmpty) {
              return const Center(child: Text("No tasks available."));
            } else if (state is GetTasksError) {
              return Center(child: Text(state.message));
            } else if (state is GetTasksSuccess) {
              return buildTaskListView(state.tasks);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget buildTaskListView(List<GetTasksResponse> tasks) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: tasks.length + (context.read<HomeCubit>().hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == tasks.length && context.read<HomeCubit>().hasMore) {
          return const Center(child: CircularProgressIndicator());
        } else if (index < tasks.length) {
          final task = tasks[index];
          return TaskWidget(
            task: task,
            taskDescription: task.title ?? 'No Title',
            taskBodyText: task.desc ?? 'No Description',
            taskDueDate: task.createdAt ?? formattedDate,
            taskPriority: task.priority ?? 'Medium',
            taskType: task.status ?? 'Pending',
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}

// Get current date without time
DateTime now = DateTime.now();
DateTime today = DateTime(now.year, now.month, now.day);
String formattedDate = DateFormat('yyyy-MM-dd').format(today);
