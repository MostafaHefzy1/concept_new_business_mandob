class UserDataSuccessModel {
  User? user;

  UserDataSuccessModel({this.user});

  UserDataSuccessModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;

  User({
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}
