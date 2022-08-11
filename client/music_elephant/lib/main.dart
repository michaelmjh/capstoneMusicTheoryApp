import 'package:flutter/material.dart';
import 'package:music_elephant/landing_page.dart';

import 'Quiz/quiz.dart';
import 'home_page.dart';
import 'lesson.dart';
import 'landing_page.dart';
import 'lesson_overview.dart';

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
        '/lesson': (context) => const Lesson(),
        '/landingpage': (context) => const LandingPage(),
        '/lessonoverview': (context) => const LessonOv()
      },
    );
  }
}
