// To parse this JSON data, do
//
//     final question2 = question2FromJson(jsonString);

import 'dart:convert';

List<Question2> question2FromJson(String str) =>
    List<Question2>.from(json.decode(str).map((x) => Question2.fromJson(x)));

String question2ToJson(List<Question2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question2 {
  Question2({
    required this.id,
    required this.questionType,
    required this.levelName,
    required this.lessonName,
    required this.difficulty,
    required this.questionAssets,
    required this.answerOptions,
    required this.answerAssets,
  });

  int id;
  QuestionType questionType;
  LevelName levelName;
  LessonName lessonName;
  Difficulty difficulty;
  List<String> questionAssets;
  List<String> answerOptions;
  List<String> answerAssets;

  factory Question2.fromJson(Map<String, dynamic> json) => Question2(
        id: json["id"],
        questionType: json["questionType"],
        levelName: json["levelName"],
        lessonName: json["lessonName"],
        difficulty: json["difficulty"],
        questionAssets: List<String>.from(json["questionAssets"].map((x) => x)),
        answerOptions: List<String>.from(json["answerOptions"].map((x) => x)),
        answerAssets: List<String>.from(json["answerAssets"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "questionType": questionType,
        "levelName": levelName,
        "lessonName": lessonName,
        "difficulty": difficulty,
        "questionAssets": List<dynamic>.from(questionAssets.map((x) => x)),
        "answerOptions": List<dynamic>.from(answerOptions.map((x) => x)),
        "answerAssets": List<dynamic>.from(answerAssets.map((x) => x)),
      };
}

enum Difficulty { EASY, MEDIUM, HARD }

enum LessonName { SCALES1, CHORDS1 }

enum LevelName { BEGINNER }

enum QuestionType { IDENTIFY, COMPLETE, ARRANGE }
