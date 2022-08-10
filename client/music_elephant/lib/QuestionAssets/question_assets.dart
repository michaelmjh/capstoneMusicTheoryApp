import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/Enums/lesson.dart';
import 'package:music_elephant/QuestionAssets/Enums/level.dart';
import 'package:music_elephant/QuestionAssets/Enums/question_type.dart';
import 'package:music_elephant/QuestionAssets/answer_assets.dart';

import 'question_model.dart';

Question question1 = Question(
  type: QuestionType.identify,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.easy,
  image: 'images/question_images/easy/cmaj_identify_note_c.jpg',
  text: 'Identify the note',
  answerOptions: [b, c, f, a],
  correctAnswer: [c],
);

Question question2 = Question(
  type: QuestionType.identify,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.easy,
  image: 'images/question_images/easy/Cmaj-identify-note-E.jpg',
  text: 'Identify the note',
  answerOptions: [e, c, f, d],
  correctAnswer: [e],
);

Question question3 = Question(
  type: QuestionType.missing,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.easy,
  image: 'images/question_images/easy/Cmaj-missing-note-A.jpg',
  text: 'Fill in the missing note',
  answerOptions: [a, c, b, g],
  correctAnswer: [a],
);

Question question4 = Question(
  type: QuestionType.missing,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.easy,
  image: 'images/question_images/easy/Cmaj-missing-note-E.jpg',
  text: 'Fill in the missing note',
  answerOptions: [e, c, b, a],
  correctAnswer: [e],
);

Question question5 = Question(
  type: QuestionType.arrange,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.easy,
  image: '',
  text: 'Arrange the first 4 notes of the C Major scale',
  answerOptions: [e, c, f, d],
  correctAnswer: [c, d, e, f],
);

Question question6 = Question(
  type: QuestionType.arrange,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.easy,
  image: '',
  text: 'Arrange the last 4 notes of the C Major scale',
  answerOptions: [c, g, a, b],
  correctAnswer: [g, a, b, c],
);

class QuestionData {
  static QuestionData get shared => QuestionData();

  List<Question> get questions =>
      [question1, question2, question3, question4, question5];

  getQuestions() {
    return questions.shuffle();
  }

  getQuestion1() {
    return question1;
  }
}
