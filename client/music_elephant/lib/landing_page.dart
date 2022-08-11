// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
// import 'package:music_elephant/Quiz/question_parent.dart';
// import './Quiz/question_parent.dart';

import 'Quiz/quiz.dart';
import 'lesson.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  List<bool> progress = [false, false, false];

  void updateProgress(difficulty) {
    if (difficulty == 'easy') {
      setState(() {
        progress = [true, false, false];
      });
    }
    if (difficulty == 'medium') {
      setState(() {
        progress = [true, false, false];
      });
    }
    if (difficulty == 'hard') {
      setState(() {
        progress = [true, true, true];
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test your knowledge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  progress[0] ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 100.00,
                ),
                Icon(
                  progress[1] ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 100.00,
                ),
                Icon(
                  progress[2] ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 100.00,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lesson');
              },
              child: const Text('Lesson'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: const Text('Easy'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: const Text('Normal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: const Text('Hard'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: const Text('Revision'),
            ),
          ],
        ),
      ),
    );
  }
}
