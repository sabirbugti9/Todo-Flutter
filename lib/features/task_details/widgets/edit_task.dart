import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/features/home/cubit/home_cubit.dart';
import 'package:tasky/features/task_details/data/model/editModel/edit_request_model.dart';
import 'package:tasky/features/task_details/widgets/task_status_periorty.dart';

class EditTaskWidget extends StatefulWidget {
  final String taskId;

  const EditTaskWidget({super.key, required this.taskId});

  @override
  // ignore: library_private_types_in_public_api
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskWidget> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _selectedStatus;
  String? _selectedPriority;

  final List<String> _statusOptions = ['Inprogress', 'waiting', 'finished'];
  final List<String> _priorityOptions = ['low', 'medium', 'high'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.home);
                      },
                      child: SvgPicture.asset(
                        'assets/images/svg/arrow_left.svg',
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Text(
                      'Edit Task',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50.h),

                // Title Input
                statusDropDown(
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30.h),

                // Description Input
                statusDropDown(
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30.h),

                // Status Dropdown

                statusDropDown(
                  statusDropDown(
                    DropdownButton<String>(
                      underline: Container(),
                      value: _selectedStatus,
                      hint: Text('Select Status'),
                      items: _statusOptions
                          .map<DropdownMenuItem<String>>(
                            (String status) => DropdownMenuItem<String>(
                              value: status,
                              child: Text(status),
                            ),
                          )
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedStatus = newValue;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),

                // Priority Dropdown

                statusDropDown(DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedPriority,
                    hint: Text('Select Priority'),
                    items: _priorityOptions
                        .map<DropdownMenuItem<String>>(
                          (String priority) => DropdownMenuItem<String>(
                            value: priority,
                            child: Text(priority),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPriority = newValue;
                      });
                    },
                    isExpanded: true,
                  ),
                )),
                SizedBox(height: 30.h),

                // Save Changes Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final task = EditRequestModel(
                          title: _titleController.text,
                          desc: _descriptionController.text,
                          image: '', // Handle image if required
                          priority: _selectedPriority ?? '',
                          status: _selectedStatus ?? '',
                          user:
                              '6649fb2eef0bf93dd00711ba', // Replace with dynamic user ID
                        );
                        context.read<HomeCubit>().editTask(widget.taskId, task);
                      }
                    },
                    child: const Text('Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
