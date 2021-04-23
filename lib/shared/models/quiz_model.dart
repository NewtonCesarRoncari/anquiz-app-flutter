import 'dart:convert';

import 'package:AnQuiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel(
      {this.questionAnswered = 0,
      required this.image,
      required this.level,
      required this.title,
      required this.questions});

  factory QuizModel.fromMap(Map<String, dynamic> json) {
    return QuizModel(
      title: json["title"],
      questions: List<QuestionModel>.from(
          json['questions']?.map((e) => QuestionModel.fromMap(e))),
      questionAnswered: json["questionAnswered"],
      image: json["image"],
      level: json['level'].toString().parse,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": this.title,
      "questions": questions.map((e) => e.toMap()).toList(),
      "questionAnswered": this.questionAnswered,
      "image": this.image,
      "level": this.level.parse,
    };
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
