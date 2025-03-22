class SigninRequest {
  final String phone;
  final String password;
  final String displayName;
  final int experienceYears;
  final String address;
  final String level;

  SigninRequest({
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });

//toJson
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'displayName': displayName,
      'experienceYears': experienceYears,
      'address': address,
      'level': level,
    };
  }
}
