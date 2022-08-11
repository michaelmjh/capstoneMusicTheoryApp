import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/question_model.dart';
import 'package:music_elephant/landing_page.dart';

import 'QuestionAssets/question_assets.dart';
import 'Quiz/quiz.dart';
import 'home_page.dart';
import 'lesson.dart';
import 'landing_page.dart';
import 'journey.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> progress = [false, false, false];

  Difficulty currentDifficulty = Difficulty.easy;
  List<Question> currentQuiz = QuestionData.shared.easyQuestions;

  void updateProgress() {
    if (currentDifficulty == Difficulty.easy) {
      setState(() {
        progress = [true, false, false];
        currentDifficulty = Difficulty.medium;
        currentQuiz = QuestionData.shared.mediumQuestions;
      });
    } else if (currentDifficulty == Difficulty.medium) {
      setState(() {
        progress = [true, true, false];
        currentDifficulty = Difficulty.hard;
        currentQuiz = QuestionData.shared.hardQuestions;
      });
    } else if (currentDifficulty == Difficulty.hard) {
      setState(() {
        progress = [true, true, true];
        currentDifficulty = Difficulty.revision;
        currentQuiz = QuestionData.shared.allQuestions;
      });
    }
  }

  List selectedQuestions = [];

  void quizGenerator() {
    selectedQuestions = QuestionData.shared.getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/quiz': (context) => Quiz(currentQuiz, updateProgress),
        '/lesson': (context) => const Lesson(),
        '/landingpage': (context) => LandingPage(progress, currentDifficulty),
        '/journey': (context) => const Journey(),
      },
    );
  }
}
