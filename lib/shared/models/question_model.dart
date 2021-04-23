import 'dart:convert';

import 'package:AnQuiz/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({required this.title, required this.answers})
      : assert(answers.length <= 4);

  factory QuestionModel.fromMap(Map<String, dynamic> json) {
    return QuestionModel(
      title: json["title"],
      answers: List<AnswerModel>.from(
          json['answers']?.map((e) => AnswerModel.fromMap(e))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": this.title,
      "answers": answers.map((e) => e.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));
}
