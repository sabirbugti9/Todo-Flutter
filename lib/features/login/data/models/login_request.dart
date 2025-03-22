class LoginRequest {
  final String phone;
  final String password;

  // Constructor
  LoginRequest(this.phone, this.password);

  // Method for converting a LoginRequest instance into JSON
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
