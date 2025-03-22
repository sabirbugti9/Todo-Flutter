class SigninResponse {
  final String id;
  final String displayName;
  final String accessToken;
  final String refreshToken;

  // Constructor
  SigninResponse({
    required this.id,
    required this.displayName,
    required this.accessToken,
    required this.refreshToken,
  });

  // Factory method to create an instance from JSON
  factory SigninResponse.fromJson(Map<String, dynamic> json) {
    return SigninResponse(
      id: json['_id'] as String,
      displayName: json['displayName'] as String,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'displayName': displayName,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  // Override toString for easy debugging
  @override
  String toString() {
    return 'SigninResponse(id: $id, displayName: $displayName, accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}
