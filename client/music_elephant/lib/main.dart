import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/question_model.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:music_elephant/timeline.dart';

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
      });
    } else if (currentDifficulty == Difficulty.medium) {
      setState(() {
        progress = [true, true, false];
        currentDifficulty = Difficulty.hard;
      });
    } else if (currentDifficulty == Difficulty.hard) {
      setState(() {
        progress = [true, true, true];
        currentDifficulty = Difficulty.revision;
      });
    }
  }

  var selectedQuestions;

  void quizGenerator() {
    selectedQuestions = QuestionData.shared.getQuestions(currentDifficulty);
    selectedQuestions.shuffle();
  }

  // void shuffle() {
  //   selectedQuestions.shuffle();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/quiz': (context) =>
            Quiz(selectedQuestions, updateProgress, quizGenerator),
        '/lesson': (context) => const Lesson(),
        '/landingpage': (context) => LandingPage(
              progress,
              currentDifficulty,
            ),
        '/journey': (context) => Journey(quizGenerator),
        '/timeline': (countext) => Timeline(),
      },
    );
  }
}
