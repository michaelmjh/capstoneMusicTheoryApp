// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';

import 'Quiz/quiz.dart';
import 'lesson.dart';

class LandingPage extends StatefulWidget {
  final List progress;
  final String currentDifficulty;
  // ignore: prefer_const_constructors_in_immutables
  LandingPage(this.progress, this.currentDifficulty, {super.key});

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
                  widget.progress[0] ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 100.00,
                ),
                Icon(
                  widget.progress[1] ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 100.00,
                ),
                Icon(
                  widget.progress[2] ? Icons.star : Icons.star_border,
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
              child: widget.currentDifficulty == "revision"
                  ? Text("Test Your Knowledge")
                  : Text("Next Quiz"),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/quiz');
            //   },
            //   child: const Text('Normal'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/quiz');
            //   },
            //   child: const Text('Hard'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/quiz');
            //   },
            //   child: const Text('Revision'),
            // ),
          ],
        ),
      ),
    );
  }
}
