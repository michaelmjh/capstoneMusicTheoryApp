import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/Enums/lesson.dart';
import 'package:music_elephant/QuestionAssets/Enums/level.dart';
import 'package:music_elephant/QuestionAssets/Enums/question_type.dart';

import 'answer_model.dart';

class Question {
  QuestionType type;
  Levelz level;
  Lesson lesson;
  Difficulty difficulty;
  String image;
  String text;
  List<Answer>? answerOptions;
  List<Answer>? correctAnswer;

  Question({
    required this.type,
    required this.level,
    required this.lesson,
    required this.difficulty,
    required this.image,
    required this.text,
    required this.answerOptions,
    required this.correctAnswer,
  });
}
