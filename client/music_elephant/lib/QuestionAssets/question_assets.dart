import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/Enums/lesson.dart';
import 'package:music_elephant/QuestionAssets/Enums/level.dart';
import 'package:music_elephant/QuestionAssets/Enums/question_type.dart';
import 'package:music_elephant/QuestionAssets/answer_assets.dart';

import 'question_model.dart';

// EASY QUESTIONS
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

// MEDIUM QUESTIONS
Question question7 = Question(
  type: QuestionType.identify,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.medium,
  image: 'images/question_images/intermediate/Gmaj-identify-note-C-E.jpg',
  text: 'Identify the notes',
  answerOptions: [fSharp, b, c, e],
  correctAnswer: [c, e],
);

Question question8 = Question(
  type: QuestionType.identify,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.medium,
  image: 'images/question_images/intermediate/Fmaj-identify-note-F-Bb.jpg',
  text: 'Identify the notes',
  answerOptions: [bFlat, g, f, e],
  correctAnswer: [f, bFlat],
);

Question question9 = Question(
  type: QuestionType.missing,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.medium,
  image: 'images/question_images/intermediate/Gmaj-missing-note-B.jpg',
  text: 'Fill in the missing note',
  answerOptions: [g, fSharp, a, b],
  correctAnswer: [b],
);

Question question10 = Question(
  type: QuestionType.missing,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.medium,
  image: 'images/question_images/intermediate/Gmaj-missing-note-F#.jpg',
  text: 'Fill in the missing note',
  answerOptions: [a, c, fSharp, b],
  correctAnswer: [fSharp],
);

Question question11 = Question(
  type: QuestionType.arrange,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.medium,
  image: '',
  text: 'Arrange the first four notes of the G Major scale',
  answerOptions: [g, a, b, c],
  correctAnswer: [g, a, b, c],
);

Question question12 = Question(
  type: QuestionType.arrange,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.medium,
  image: '',
  text: 'Arrange the first four notes of the F Major scale',
  answerOptions: [f, bFlat, a, g],
  correctAnswer: [f, g, a, bFlat],
);

// HARD QUESTIONS
Question question13 = Question(
  type: QuestionType.identify,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.hard,
  image: 'images/question_images/hard/Bmaj-identify-note-D#-G#.jpg',
  text: 'Identify the notes',
  answerOptions: [gSharp, dSharp, cSharp, e],
  correctAnswer: [dSharp, gSharp],
);

Question question14 = Question(
  type: QuestionType.identify,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.hard,
  image: 'images/question_images/hard/Dbmaj-identify-note-Db-Bb.jpg',
  text: 'Identify the notes',
  answerOptions: [bFlat, aFlat, f, dFlat],
  correctAnswer: [dFlat, bFlat],
);

Question question15 = Question(
  type: QuestionType.missing,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.hard,
  image: 'images/question_images/hard/Ebmaj-missing-note-Ab-Eb.jpg',
  text: 'Fill in the missing notes',
  answerOptions: [eFlat, f, aFlat, bFlat],
  correctAnswer: [aFlat, eFlat],
);

Question question16 = Question(
  type: QuestionType.missing,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.hard,
  image: 'images/question_images/hard/Emaj-missing-note-F#-C#.jpg',
  text: 'Fill in the missing notes',
  answerOptions: [a, cSharp, fSharp, dSharp],
  correctAnswer: [fSharp, cSharp],
);

Question question17 = Question(
  type: QuestionType.arrange,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.hard,
  image: '',
  text: 'Arrange the first four notes of the E Major scale',
  answerOptions: [a, fSharp, e, gSharp],
  correctAnswer: [e, fSharp, gSharp, a],
);

Question question18 = Question(
  type: QuestionType.arrange,
  level: Level.beginner,
  lesson: Lesson.scales1,
  difficulty: Difficulty.hard,
  image: '',
  text: 'Arrange the first four notes of the Eb Major scale',
  answerOptions: [aFlat, g, eFlat, f],
  correctAnswer: [eFlat, f, g, aFlat],
);

class QuestionData {
  static QuestionData get shared => QuestionData();

  List<Question> get allQuestions => [
        question1,
        question2,
        question3,
        question4,
        question5,
        question6,
        question7,
        question8,
        question9,
        question10,
        question11,
        question12,
        question13,
        question14,
        question15,
        question16,
        question17,
        question18
      ];

  List<Question> easyQuestions = [
    question1,
    question2,
    question3,
    question4,
    question5,
    // question6,
  ];

  List<Question> mediumQuestions = [
    question7,
    question8,
    question9,
    question10,
    question11,
    // question12,
  ];

  List<Question> hardQuestions = [
    question13,
    question14,
    question15,
    question16,
    question17,
    // question18
  ];

  getQuestions(difficulty) {
    var newQuestions = [];
    allQuestions.forEach((question) {
      if (question.difficulty == difficulty) {
        newQuestions.add(question);
      }
    });
    newQuestions.shuffle();
    var shortList = selectFive(newQuestions);
    return shortList;
  }

  selectFive(questions) {
    var newShortList = [];
    for (int i = 0; i < 5; i++) {
      newShortList.add(questions[i]);
    }
    return newShortList;
  }

  getQuestion1() {
    return question1;
  }
}
