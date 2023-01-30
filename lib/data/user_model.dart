class UserModel {
  int id = -1;
  String name = "";
  String type = "";
  String b2bNumber = "";
  String phone = "";
  String email = "";
  String token = "";

  UserModel() {}

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    b2bNumber = json['b2b_number'];
    phone = json['phone'];
    email = json["email"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['b2b_number'] = this.b2bNumber;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
