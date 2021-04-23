import 'dart:convert';

class AnswerModel {
  final String title;
  final bool isRight;

  AnswerModel({required this.title, this.isRight = false});

  factory AnswerModel.fromMap(Map<String, dynamic> json) {
    return AnswerModel(
      title: json["title"],
      isRight: json["isRight"] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": this.title,
      "isRight": this.isRight,
    };
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) => AnswerModel.fromMap(json.decode(source));
}
