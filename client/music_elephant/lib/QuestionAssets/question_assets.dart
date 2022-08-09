import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/Enums/lesson.dart';
import 'package:music_elephant/QuestionAssets/Enums/level.dart';
import 'package:music_elephant/QuestionAssets/Enums/question_type.dart';
import 'package:music_elephant/QuestionAssets/answer_assets.dart';

import 'question_model.dart';

Question question1 = Question(
  type: QuestionType.missing,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.easy,
  image: 'images/missing_note.jpg',
  text: 'Choose the missing note',
  answerOptions: [a, f, e, c],
  correctAnswer: [c],
);

Question question2 = Question(
  type: QuestionType.identify,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.easy,
  image: 'images/name_the_note.jpg',
  text: 'Choose the missing note',
  answerOptions: [a, f, e, c],
  correctAnswer: [e],
);

Question question3 = Question(
  type: QuestionType.missing,
  level: Level.intermediate,
  lesson: Lesson.scales2,
  difficulty: Difficulty.easy,
  image: 'images/missing_note2.jpg',
  text: 'Choose the missing notes',
  answerOptions: [d, fSharp, b, g, cSharp, e],
  correctAnswer: [b, d],
);

class QuestionData {
  static QuestionData get shared => QuestionData();

  List<Question> get questions => [
        question1,
        question2,
        question3,
      ];

  getQuestions() {
    return questions;
  }
}
