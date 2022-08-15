import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class CompletedIndicator extends StatelessWidget {
  final listItem;
  final setSelectedLesson;
  final quizGenerator;
  final bossGenerator;

  const CompletedIndicator(this.listItem, this.setSelectedLesson,
      this.quizGenerator, this.bossGenerator);
  @override
  Widget build(BuildContext context) {
    return DotIndicator(
      color: Color(0xff75c8ae),
      child: IconButton(
        icon: Icon(Icons.check, size: 20.0),
        color: Color(0xffffecb4),
        onPressed: () {
          setSelectedLesson(listItem);

          if (listItem.name == "BeginnerBoss" ||
              listItem.name == "IntermediateBoss" ||
              listItem.name == "AdvancedBoss") {
            bossGenerator();
          } else {
            quizGenerator();
          }

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
      color: Color(0xff75c8ae),
      child: IconButton(
        icon: Icon(Icons.lightbulb, size: 20.0),
        color: Color(0xffffecb4),
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
      color: Color(0xff75c8ae),
      child: IconButton(
        icon: Icon(Icons.bolt, size: 20.0),
        color: Colors.black,
        onPressed: () {
          setSelectedLesson(listItem);
          bossGenerator();
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
      color: Color(0xffe5771e),
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
      color: Color(0xff5a3d2b),
      child: IconButton(
        icon: Icon(Icons.lock, size: 20.0),
        color: Color(0xffffecb4),
        onPressed: () {},
      ),
    );
  }
}
