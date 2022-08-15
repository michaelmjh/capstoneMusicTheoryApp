import 'package:flutter/material.dart';
import 'package:music_elephant/LessonAssets/lesson_assets.dart';
import 'package:music_elephant/journey.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:timelines/timelines.dart';

import 'dart:math';

import '../LessonAssets/lesson_model.dart';
import '../QuestionAssets/Enums/difficulty.dart';
import '../QuestionAssets/Enums/level.dart';
import 'timeline_widget.dart';

// TOP LEVEL OF TIMELINE - RENDERS TIMELINE WIDGET
class Timeline extends StatefulWidget {
  final lessons;
  final setSelectedLesson;
  final userProgress;
  final completedLessons;
  final getCompletedLessons;
  final bossGenerator;
  final checkIfBossUnlocked;
  final checkIfBossCompleted;

  const Timeline(
      this.lessons,
      this.setSelectedLesson,
      this.userProgress,
      this.completedLessons,
      this.getCompletedLessons,
      this.bossGenerator,
      this.checkIfBossUnlocked,
      this.checkIfBossCompleted,
      {super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    var newList = widget.lessons;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select a Lesson",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: Color(0xffffecb4),
        backgroundColor: Color(0xffe5771e),
        leading: IconButton(
          icon: Icon(
            Icons.people,
            color: Color(0xffffecb4),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/users');
          },
        ),
      ),
      body: Container(
        color: Color(0xffffecb4),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  TimelineWidget(
                    newList,
                    widget.setSelectedLesson,
                    widget.userProgress,
                    widget.completedLessons,
                    widget.getCompletedLessons,
                    widget.bossGenerator,
                    widget.checkIfBossUnlocked,
                    widget.checkIfBossCompleted,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
