
import 'dart:convert';

UserModel userFromJson(String str) => UserModel.toObject(json.decode(str));

class UserModel {
  User user;
  String token;

  UserModel({required this.user, required this.token});

  factory UserModel.toObject(Map<String, dynamic> json) =>
      UserModel(
          user: User.toObject(json['user']),
          token: json['token'],
      );

  Map<String, dynamic> toJson() => {
    "user" : user.toJson(),
    "token" : token,
  };
}

class User {
  String id;
  String username;
  String email;
  String avatar;
  String date; 
  String address;
  String job;
  Map<String, String> postSaved;

  User({
    required this.id, required this.username, 
    required this.email, required this.avatar,
    required this.date, required this.address,
    required this.job, required this.postSaved
  });

  factory User.toObject(Map<String, dynamic> json) =>
      User(
        id: json['id'], username: json['username'], 
        email: json['email'], avatar: json['avatar'],
        date: json['date'], address: json['address'],
        postSaved: json['postSaved'], job: json['job'],
      );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : username,
    "email" : email,
    "avatar": avatar,
    "date": date,
    "address": address,
    "job": job,
    "postSaved": postSaved,
  };

}
