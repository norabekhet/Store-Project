class UserModel {
  String? token;
  UserModel({this.token});
  UserModel.fromjson(Map<String, dynamic> json) {
    token = json["refresh_token"];
  }
}
