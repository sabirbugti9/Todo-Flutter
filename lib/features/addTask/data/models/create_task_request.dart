class CreateTaskRequest {
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String dueDate;

  CreateTaskRequest({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.dueDate,
  });

  // Convert a Task object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'dueDate': dueDate,
    };
  }
}
