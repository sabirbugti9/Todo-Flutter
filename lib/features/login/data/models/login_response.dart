class LoginResponse {
  final String _id;
  final String access_token;
  final String refresh_token;

  // Constructor
  LoginResponse({
    required String id,
    required this.access_token,
    required this.refresh_token,
  }) : _id = id;

  String get id => _id;

  String get accessToken => access_token;

  String get refreshToken => refresh_token;

  // Factory constructor for creating a new LoginResponse from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['_id'] as String,
      access_token: json['access_token'] as String,
      refresh_token: json['refresh_token'] as String,
    );
  }
}
