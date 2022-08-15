import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class CompletedIndicator extends StatelessWidget {
  final listItem;
  final setSelectedLesson;
  final quizGenerator;

  const CompletedIndicator(
      this.listItem, this.setSelectedLesson, this.quizGenerator);
  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: Colors.pink,
      child: IconButton(
        icon: Icon(Icons.check, size: 20.0),
        color: Colors.white,
        onPressed: () {
          setSelectedLesson(listItem);
          quizGenerator();
          Navigator.pushNamed(context, '/landingpage');
        },
      ),
    );
  }
}

class InProgressIndicator extends StatelessWidget {
  final listItem;
  final setSelectedLesson;
  final quizGenerator;

  const InProgressIndicator(
      this.listItem, this.setSelectedLesson, this.quizGenerator);
  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: Color.fromARGB(255, 229, 97, 141),
      child: IconButton(
        icon: Icon(Icons.lightbulb, size: 20.0),
        color: Colors.black,
        onPressed: () {
          setSelectedLesson(listItem);
          quizGenerator();
          Navigator.pushNamed(context, '/landingpage');
        },
      ),
    );
  }
}

class BossIndicator extends StatelessWidget {
  final listItem;
  final setSelectedLesson;
  final bossGenerator;

  const BossIndicator(
      this.listItem, this.setSelectedLesson, this.bossGenerator);
  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: Colors.red,
      child: IconButton(
        icon: Icon(Icons.bolt, size: 20.0),
        color: Colors.black,
        onPressed: () {
          setSelectedLesson(listItem);
          bossGenerator(listItem.level);
          Navigator.pushNamed(context, '/landingpage');
        },
      ),
    );
  }
}

class AvailableIndicator extends StatelessWidget {
  final listItem;
  final setSelectedLesson;
  final quizGenerator;

  const AvailableIndicator(
      this.listItem, this.setSelectedLesson, this.quizGenerator);
  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: Colors.grey,
      child: IconButton(
        icon: Icon(Icons.cloud),
        iconSize: 15,
        onPressed: () {
          setSelectedLesson(listItem);
          quizGenerator();
          Navigator.pushNamed(context, '/landingpage');
        },
      ),
    );
  }
}

class LockedIndicator extends StatelessWidget {
  const LockedIndicator();
  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: Colors.grey,
      child: IconButton(
        icon: Icon(Icons.lock, size: 20.0),
        color: Colors.black,
        onPressed: () {},
      ),
    );
  }
}
