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

Question question4 = Question(
  type: QuestionType.arrange,
  level: Level.beginner,
  lesson: Lesson.scales2,
  difficulty: Difficulty.easy,
  image: '',
  text: 'Arrnge the notes in the key of C major',
  answerOptions: [e, f, g, a],
  correctAnswer: [e, f, g, a],
);

Question question5 = Question(
  type: QuestionType.arrange,
  level: Level.beginner,
  lesson: Lesson.scales2,
  difficulty: Difficulty.easy,
  image: '',
  text: 'Arrnge the notes in the key of C major',
  answerOptions: [c, d, b, bFlat],
  correctAnswer: [c, d, b, bFlat],
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
