// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_elephant/Quiz/question_parent.dart';
import './Quiz/question_parent.dart';
import 'QuestionAssets/question_assets.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_border,
                  color: Colors.yellow,
                  size: 50.00,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.yellow,
                  size: 50.00,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.yellow,
                  size: 50.00,
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
