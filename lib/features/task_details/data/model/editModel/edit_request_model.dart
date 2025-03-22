class EditRequestModel {
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;

  EditRequestModel(
      {this.image,
      this.title,
      this.desc,
      this.priority,
      this.status,
      this.user});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['user'] = this.user;
    return data;
  }
}
