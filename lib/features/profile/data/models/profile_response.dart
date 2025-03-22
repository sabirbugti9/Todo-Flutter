class ProfileResponse {
  String? sId;
  String? displayName;
  String? username;
  List<String>? roles;
  bool? active;
  int? experienceYears;
  String? address;
  String? level;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProfileResponse(
      {this.sId,
      this.displayName,
      this.username,
      this.roles,
      this.active,
      this.experienceYears,
      this.address,
      this.level,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    displayName = json['displayName'];
    username = json['username'];
    roles = json['roles'].cast<String>();
    active = json['active'];
    experienceYears = json['experienceYears'];
    address = json['address'];
    level = json['level'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
