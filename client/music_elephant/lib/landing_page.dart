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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xffffecb4),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/timeline');
          },
        ),
      ),
      body: Container(
        color: Color(0xffffecb4),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo/Baton.png",
                height: 500,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: lessonName != "BeginnerBoss" &&
                        lessonName != "IntermediateBoss" &&
                        lessonName != "AdvancedBoss"
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 70,
                            right: 70,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Welcome to the end of this section!",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5a3d2b),
                                ),
                              ),
                              Text(
                                "This quiz will test your knowledge of EVERYTHING you have learned so far!!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff5a3d2b),
                                ),
                              ),
                              Text(
                                "Beat the test to unlock the next section.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff5a3d2b),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              Visibility(
                visible: lessonName != "BeginnerBoss" &&
                    lessonName != "IntermediateBoss" &&
                    lessonName != "AdvancedBoss",
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
                      if (lessonName == "BeginnerBoss" ||
                          lessonName == "IntermediateBoss" ||
                          lessonName == "AdvancedBoss") {
                        return Text(
                          "Section Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else if (widget.userProgress[lessonName] == "EASY" ||
                          widget.userProgress.containsKey(lessonName) ==
                              false) {
                        return Text(
                          "Easy Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else if (widget.userProgress[lessonName] == "MEDIUM") {
                        return Text(
                          "Medium Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else if (widget.userProgress[lessonName] == "HARD") {
                        return Text(
                          "Hard Quiz",
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffecb4),
                          ),
                        );
                      } else if (widget.userProgress[lessonName] ==
                          "REVISION") {
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
