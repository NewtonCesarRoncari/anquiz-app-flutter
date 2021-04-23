import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;
  final int score;

  UserModel({required this.name, required this.photoUrl, this.score = 0});

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "photoUrl": this.photoUrl,
      "score": this.score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      photoUrl: json["photoUrl"],
      score: json["score"],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
