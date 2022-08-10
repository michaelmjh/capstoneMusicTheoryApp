import 'package:flutter/material.dart';
import 'package:music_elephant/Quiz/question_parent.dart';
import './Quiz/question_parent.dart';
import 'Quiz/quiz.dart';
import 'lesson.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test your knowledge'),
      ),
      body: Column(
        children: [
          MaterialApp(
            initialRoute: '/lesson',
            routes: {
              '/lesson': (context) => const Lesson(),
            },
          ),
          MaterialApp(
            initialRoute: '/Quiz',
            routes: {
              '/quiz': (context) => const Quiz(),
            },
          )
        ],
      ),
    );
  }
}
