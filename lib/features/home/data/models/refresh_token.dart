class RefreshTokenResponse {
  final String access_token;

  RefreshTokenResponse({required this.access_token});

//from json
  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponse(
      access_token: json['access_token'],
    );

   
  }
}
