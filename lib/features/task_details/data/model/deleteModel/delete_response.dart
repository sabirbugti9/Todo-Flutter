class TaskDelete {
  final String id;
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String status;
  final String user;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  TaskDelete({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  // Factory method to create an instance from JSON
  factory TaskDelete.fromJson(Map<String, dynamic> json) {
    return TaskDelete(
      id: json['_id'],
      image: json['image'],
      title: json['title'],
      desc: json['desc'],
      priority: json['priority'],
      status: json['status'],
      user: json['user'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'status': status,
      'user': user,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}
