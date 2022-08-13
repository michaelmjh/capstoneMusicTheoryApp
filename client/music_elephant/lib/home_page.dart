import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final getLevels;
  final setLessonList;
  final getLockedLessons;

  const HomePage(this.getLevels, this.setLessonList, this.getLockedLessons,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music Elephant')),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/journey');
              },
              child: const Text('Journey'),
            ),
            ElevatedButton(
              child: Text('Timeline'),
              onPressed: () {
                getLevels();
                setLessonList();
                getLockedLessons();
                Navigator.pushNamed(context, '/timeline');
              },
            )
          ],
        ),
      ),
    );
  }
}
