class EditResponseModel {
  String? sId;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  EditResponseModel(
      {this.sId,
      this.image,
      this.title,
      this.desc,
      this.priority,
      this.status,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});

  EditResponseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    priority = json['priority'];
    status = json['status'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
