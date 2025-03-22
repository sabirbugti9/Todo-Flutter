import 'package:flutter/material.dart';

class TaskPriorityWidget extends StatefulWidget {
  final List<String> listOfperiorts;
  final Function(String) onPrioritySelected;

  const TaskPriorityWidget({
    super.key,
    required this.listOfperiorts,
    required this.onPrioritySelected,
  });

  @override
  State<TaskPriorityWidget> createState() => _TaskPriorityWidgetState();
}

class _TaskPriorityWidgetState extends State<TaskPriorityWidget> {
  String? _selectedPriority; // Track the selected priority

  @override
  void initState() {
    super.initState();
    // Initialize with the first priority as the default
    _selectedPriority = widget.listOfperiorts.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: _selectedPriority, // Bind to the selected priority
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedPriority = value; // Update the selected priority
            });
            widget.onPrioritySelected(value); // Notify the parent widget
          }
        },
        items: widget.listOfperiorts.map((String priority) {
          return DropdownMenuItem<String>(
            value: priority,
            child: Text(priority),
          );
        }).toList(),
      ),
    );
  }
}
