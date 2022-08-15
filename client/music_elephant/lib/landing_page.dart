// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';

import 'Quiz/quiz.dart';
import 'lesson.dart';

class LandingPage extends StatefulWidget {
  final List progress;
  final Difficulty currentDifficulty;
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xff75c8ae),
                        child: Icon(
                          Icons.star,
                          color: widget.progress[0]
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
                          color: widget.progress[0]
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
                          color: widget.progress[0]
                              ? Color(0xffe5771e)
                              : Color(0xffffecb4),
                          size: 100.00,
                        ),
                      ),
                    ),
                  ],
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
                    child: widget.currentDifficulty == Difficulty.revision
                        ? Text(
                            "Test Your Knowledge",
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffffecb4),
                            ),
                          )
                        : Text(
                            "Next Quiz",
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffffecb4),
                            ),
                          ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                ),
              ),

              // ),
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
      ),
    );
  }
}
