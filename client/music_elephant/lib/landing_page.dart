// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';

import 'Quiz/quiz.dart';
import 'lesson.dart';

class LandingPage extends StatefulWidget {
  // final List progress;
  // final Difficulty currentDifficulty;
  final selectedLesson;
  final userProgress;
  // ignore: prefer_const_constructors_in_immutables
  LandingPage(this.selectedLesson, this.userProgress, {super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var lessonName = widget.selectedLesson['lessonName'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Your Knowledge",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        foregroundColor: Color(0xffffecb4),
        backgroundColor: Color(0xffe5771e),
      ),
      body: Container(
        color: Color(0xffffecb4),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: widget.selectedLesson['lessonName'] != "BeginnerBoss" &&
                        widget.selectedLesson['lessonName'] !=
                            "IntermediateBoss" &&
                        widget.selectedLesson['lessonName'] != "AdvancedBoss"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Color(0xff75c8ae),
                              child: Icon(
                                Icons.star,
                                color: widget.userProgress[lessonName] ==
                                            "MEDIUM" ||
                                        widget.userProgress[lessonName] ==
                                            "HARD" ||
                                        widget.userProgress[lessonName] ==
                                            "REVISION"
                                    ? Color(0xffe5771e)
                                    : Color(0xffffecb4),
                                size: 100.00,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Color(0xff75c8ae),
                              child: Icon(
                                Icons.star,
                                color:
                                    widget.userProgress[lessonName] == "HARD" ||
                                            widget.userProgress[lessonName] ==
                                                "REVISION"
                                        ? Color(0xffe5771e)
                                        : Color(0xffffecb4),
                                size: 100.00,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Color(0xff75c8ae),
                              child: Icon(
                                Icons.star,
                                color: widget.userProgress[lessonName] ==
                                        "REVISION"
                                    ? Color(0xffe5771e)
                                    : Color(0xffffecb4),
                                size: 100.00,
                              ),
                            ),
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
                        ),
                      ),
              ),
              Visibility(
                visible: widget.selectedLesson['lessonName'] !=
                        "BeginnerBoss" &&
                    widget.selectedLesson['lessonName'] != "IntermediateBoss" &&
                    widget.selectedLesson['lessonName'] != "AdvancedBoss",
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffe5771e),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Lesson',
                        style: TextStyle(
                          fontSize: 32,
                          color: Color(0xffffecb4),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/lesson');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffe5771e),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(builder: (__) {
                      if (widget.selectedLesson['lessonName'] ==
                              "BeginnerBoss" ||
                          widget.selectedLesson['lessonName'] ==
                              "IntermediateBoss" ||
                          widget.selectedLesson['lessonName'] ==
                              "AdvancedBoss") {
                        return Text(
                          "Boss Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else if (widget.userProgress[widget.selectedLesson] ==
                              Difficulty.easy ||
                          widget.userProgress
                                  .containsKey(widget.selectedLesson) ==
                              false) {
                        return Text(
                          "Easy Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else if (widget.userProgress[widget.selectedLesson] ==
                          Difficulty.medium) {
                        return Text(
                          "Medium Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else if (widget.userProgress[widget.selectedLesson] ==
                          Difficulty.hard) {
                        return Text(
                          "Hard Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else if (widget.userProgress[widget.selectedLesson] ==
                          Difficulty.revision) {
                        return Text(
                          "Revision Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else {
                        return Text(
                          "error",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      }
                    }),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
