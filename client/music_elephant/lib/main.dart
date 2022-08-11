import 'package:flutter/material.dart';
// import 'package:music_elephant/Quiz/question_parent.dart';
// import 'package:music_elephant/Quiz/question_parent2.dart';
import 'package:music_elephant/landing_page.dart';

import 'Quiz/quiz.dart';
import 'home_page.dart';
// import './Quiz/question_parent.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/quiz': (context) => const Quiz(),
        // '/questions': (context) => const QuestionParent(),
        // '/questions2': (context) => const QuestionParent2(),
        '/lesson': (context) => const Lesson(),
        '/landingpage': (context) => const LandingPage()
      },
    );
  }
}
