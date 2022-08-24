import 'package:flutter/material.dart';
import 'timeline_widget.dart';

// TOP LEVEL OF TIMELINE - RENDERS TIMELINE WIDGET
class Timeline extends StatefulWidget {
  final lessons;
  final setSelectedLesson;
  final userProgress;
  final completedLessons;
  final bossGenerator;
  final checkIfBossUnlocked;
  final checkIfBossCompleted;
  final quizGenerator;
  final addLessonToUserProgress;
  final clearData;

  const Timeline(
      this.lessons,
      this.setSelectedLesson,
      this.userProgress,
      this.completedLessons,
      this.bossGenerator,
      this.checkIfBossUnlocked,
      this.checkIfBossCompleted,
      this.quizGenerator,
      this.addLessonToUserProgress,
      this.clearData,
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
            widget.clearData();
            Navigator.popAndPushNamed(context, '/users');
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
                    widget.bossGenerator,
                    widget.checkIfBossUnlocked,
                    widget.checkIfBossCompleted,
                    widget.quizGenerator,
                    widget.addLessonToUserProgress,
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
