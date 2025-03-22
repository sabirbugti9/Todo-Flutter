class ApiErrorModel {
  final String? message;
  final int statusCode;

  ApiErrorModel({required this.statusCode, this.message});

  // Factory constructor to create an instance from JSON
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
    };
  }
}
