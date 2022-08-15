// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';

import 'Quiz/quiz.dart';
import 'lesson.dart';

class LandingPage extends StatefulWidget {
  final List progress;
  final Difficulty currentDifficulty;
  final selectedLesson;
  final userProgress;
  // ignore: prefer_const_constructors_in_immutables
  LandingPage(this.progress, this.currentDifficulty, this.selectedLesson,
      this.userProgress,
      {super.key});

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
            widget.selectedLesson.name != "BeginnerBoss" &&
                    widget.selectedLesson.name != "IntermediateBoss" &&
                    widget.selectedLesson.name != "AdvancedBoss"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        // widget.progress[0] ? Icons.star : Icons.star_border,
                        widget.userProgress[widget.selectedLesson] ==
                                    Difficulty.medium ||
                                widget.userProgress[widget.selectedLesson] ==
                                    Difficulty.hard ||
                                widget.userProgress[widget.selectedLesson] ==
                                    Difficulty.revision
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.yellow,
                        size: 100.00,
                      ),
                      Icon(
                        // widget.progress[1] ? Icons.star : Icons.star_border,
                        widget.userProgress[widget.selectedLesson] ==
                                    Difficulty.hard ||
                                widget.userProgress[widget.selectedLesson] ==
                                    Difficulty.revision
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.yellow,
                        size: 100.00,
                      ),
                      Icon(
                        // widget.progress[2] ? Icons.star : Icons.star_border,
                        widget.userProgress[widget.selectedLesson] ==
                                Difficulty.revision
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.yellow,
                        size: 100.00,
                      ),
                    ],
                  )
                : Container(
                    child: Column(
                    children: [
                      Text("Welcome to the boss level!"),
                      Text(
                          "This level contains only one quiz which will test your knowledge on EVERYTHING you have learned so far!!"),
                      Text(
                          "Beat the test and you will unlock the next level of lessons.")
                    ],
                  )),
            Visibility(
              visible: widget.selectedLesson.name != "BeginnerBoss" &&
                  widget.selectedLesson.name != "IntermediateBoss" &&
                  widget.selectedLesson.name != "AdvancedBoss",
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lesson');
                },
                child: const Text('Lesson'),
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/quiz');
            }, child: Builder(builder: (__) {
              if (widget.selectedLesson.name == "BeginnerBoss" ||
                  widget.selectedLesson.name == "IntermediateBoss" ||
                  widget.selectedLesson.name == "AdvancedBoss") {
                return Text("Boss Quiz");
              } else if (widget.userProgress[widget.selectedLesson] ==
                      Difficulty.easy ||
                  widget.userProgress.containsKey(widget.selectedLesson) ==
                      false) {
                return Text("Easy Quiz");
              } else if (widget.userProgress[widget.selectedLesson] ==
                  Difficulty.medium) {
                return Text("Medium Quiz");
              } else if (widget.userProgress[widget.selectedLesson] ==
                  Difficulty.hard) {
                return Text("Hard Quiz");
              } else if (widget.userProgress[widget.selectedLesson] ==
                  Difficulty.revision) {
                return Text("Revision Quiz");
              } else
                return Text("error");
            })),
          ],
        ),
      ),
    );
  }
}
