import 'package:flutter/material.dart';
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

  void updateProgress(difficulty) {
    if (difficulty == 'easy') {
      setState(() {
        progress = [true, false, false];
        currentDifficulty = "medium";
      });
    }
    if (difficulty == 'medium') {
      setState(() {
        progress = [true, true, false];
        currentDifficulty = "hard";
      });
    }
    if (difficulty == 'hard') {
      setState(() {
        progress = [true, true, true];
        currentDifficulty = "revision";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/quiz': (context) => Quiz(QuestionData.shared.questions),
        '/lesson': (context) => const Lesson(),
        '/landingpage': (context) => LandingPage(progress, currentDifficulty),
      },
    );
  }
}
