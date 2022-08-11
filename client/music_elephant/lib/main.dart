import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/question_model.dart';
import 'package:music_elephant/landing_page.dart';

import 'QuestionAssets/question_assets.dart';
import 'Quiz/quiz.dart';
import 'home_page.dart';
import 'lesson.dart';
import 'landing_page.dart';

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

  String currentDifficulty = "easy";
  List<Question> currentQuiz = QuestionData.shared.easyQuestions;

  void updateProgress() {
    if (currentDifficulty == 'easy') {
      setState(() {
        progress = [true, false, false];
        currentDifficulty = "medium";
        currentQuiz = QuestionData.shared.mediumQuestions;
      });
    } else if (currentDifficulty == 'medium') {
      setState(() {
        progress = [true, true, false];
        currentDifficulty = "hard";
        currentQuiz = QuestionData.shared.hardQuestions;
      });
    } else if (currentDifficulty == 'hard') {
      setState(() {
        progress = [true, true, true];
        currentDifficulty = "revision";
        currentQuiz = QuestionData.shared.allQuestions;
      });
    }
  }

  // List selectedQuestions = QuestionData.shared.questions;

  void quizGenerator() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/quiz': (context) => Quiz(currentQuiz, updateProgress),
        '/lesson': (context) => const Lesson(),
        '/landingpage': (context) => LandingPage(progress, currentDifficulty),
      },
    );
  }
}
