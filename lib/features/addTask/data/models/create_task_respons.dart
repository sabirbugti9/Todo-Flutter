class CreateTaskRespons {
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String status;
  final String user;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  CreateTaskRespons({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  // Create a Task object from a JSON map
  factory CreateTaskRespons.fromJson(Map<String, dynamic> json) {
    return CreateTaskRespons(
      image: json['image'],
      title: json['title'],
      desc: json['desc'],
      priority: json['priority'],
      status: json['status'],
      user: json['user'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}
