import 'package:naguib_selim/data/user_model.dart';

class UserDataResponse {
  String message = "";
  UserModel user = UserModel();

  UserDataResponse() {}

  UserDataResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.user;
    return data;
  }
}
