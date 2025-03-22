import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/addTask/cubit/create_task_cubit.dart';
import 'package:tasky/features/addTask/data/models/create_task_request.dart';

import 'package:tasky/features/addTask/widgets/add_images.dart';
import 'package:tasky/features/addTask/widgets/add_task_button.dart';
import 'package:tasky/features/addTask/widgets/add_task_header.dart';
import 'package:tasky/features/addTask/widgets/date_widget.dart';
import 'package:tasky/features/addTask/widgets/title_and_description.dart';
import 'package:tasky/features/addTask/widgets/piriorty_widget.dart';
import 'package:tasky/features/task_details/widgets/task_status_periorty.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? _selectedDate;
  final List<String> _periortyOptions = ['low', 'medium', 'high'];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedPriority;

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
    }
  }

  void _onAddTaskPressed(BuildContext context) {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final priority = _selectedPriority ?? 'low';

    if (title.isEmpty || description.isEmpty || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    final createTaskRequest = CreateTaskRequest(
        title: title,
        desc: description,
        dueDate: _selectedDate?.toIso8601String() ?? '',
        priority: priority,
        image:
            'https://www.figma.com/design/87DbfZRjJh3M5yYG7ntxe1/ToDoApp?node-id=0-78&t=Yl6gromOc49XZotl-0');

    context.read<CreateTaskCubit>().createTask(createTaskRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0.dm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                AddTaskHeader(),
                SizedBox(height: 20.h),
                // Add image container
                AddImages(),
                SizedBox(height: 25.h),
                // Add title and description
                TitleAndDsecreptionWidget(
                  titleController: _titleController,
                  descriptionController: _descriptionController,
                ),
                SizedBox(height: 25.h),
                // Priority selection
                Text(
                  'Priority',
                  style: CustomstextStyels.font15grayBoldWight,
                ),
                SizedBox(height: 5.h),
                statusDropDown(
                  TaskPriorityWidget(
                    listOfperiorts: _periortyOptions,
                    onPrioritySelected: (priority) {
                      setState(() {
                        _selectedPriority =
                            priority; // Update the selected priority
                      });
                    },
                  ),
                ),
                // Date Picker
                SizedBox(height: 25.h),
                DatePickerWidget(
                  onDateSelected: (DateTime date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
                SizedBox(height: 25.h),
                // Submit button
                BlocConsumer<CreateTaskCubit, CreateTaskState>(
                  listener: (context, state) {
                    if (state is CreateTaskSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Task created successfully!')),
                      );
                      // Navigate to another screen or reset the form
                    } else if (state is CreateTaskError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AddTaskButton(
                      onPressed: () => _onAddTaskPressed(context),
                      isLoading: state is CreateTaskLoading,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
