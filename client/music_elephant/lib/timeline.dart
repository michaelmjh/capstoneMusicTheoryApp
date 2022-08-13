import 'package:flutter/material.dart';
import 'package:music_elephant/journey.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:timelines/timelines.dart';

import 'dart:math';

import 'LessonAssets/lesson_model.dart';
import 'QuestionAssets/Enums/level.dart';

class Timeline extends StatefulWidget {
  final lessons;
  final completedLessons;
  final setSelectedLesson;
  final completedQuizzes;

  const Timeline(this.lessons, this.completedLessons, this.setSelectedLesson,
      this.completedQuizzes,
      {super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  var begList = [];
  var intList = [];
  var advList = [];
  var newList = [];

  void getLevels() {
    for (var item in widget.lessons) {
      if (item.level == Level.beginner) {
        begList.add(item);
      } else if (item.level == Level.intermediate) {
        intList.add(item);
      } else if (item.level == Level.advanced) {
        advList.add(item);
      }
    }
  }

  Lesson dummyBeg =
      Lesson(name: "DummyBeginner", slides: [], level: Level.beginner);
  Lesson dummyInt =
      Lesson(name: "DummyIntermediate", slides: [], level: Level.intermediate);
  Lesson dummyAdvStart =
      Lesson(name: "DummyAdvanced", slides: [], level: Level.advanced);

  void setNewList() {
    begList.insert(0, dummyBeg);
    intList.insert(0, dummyInt);
    advList.insert(0, dummyAdvStart);
    for (var item in begList) {
      newList.add(item);
    }
    for (var item in intList) {
      newList.add(item);
    }
    for (var item in advList) {
      newList.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    getLevels();
    setNewList();
    return Scaffold(
      appBar: AppBar(title: Text('User Timeline')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                _Timeline1(
                    getLevels,
                    setNewList,
                    newList,
                    widget.completedLessons,
                    widget.setSelectedLesson,
                    widget.completedQuizzes),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Timeline1 extends StatelessWidget {
  final getLevels;
  final setNewList;
  final newList;
  final completedLessons;
  final setSelectedLesson;
  final completedQuizzes;

  const _Timeline1(this.getLevels, this.setNewList, this.newList,
      this.completedLessons, this.setSelectedLesson, this.completedQuizzes);

  @override
  Widget build(BuildContext context) {
    final data = newList;

    return Flexible(
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0.03,
          connectorTheme: ConnectorThemeData(
            thickness: 4.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: IndicatorThemeData(
            size: 35.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (context, index) {
            if (data[index].level == Level.beginner) {
              return _EmptyContentsBeginner(data[index], completedQuizzes);
            } else if (data[index].level == Level.intermediate) {
              return _EmptyContentsInt(data[index], completedQuizzes);
            } else if (data[index].level == Level.advanced) {
              return _EmptyContentsAdv(data[index], completedQuizzes);
            }
          },
          connectorBuilder: (_, index, __) {
            if (index == 0 || completedLessons.contains(data[index])) {
              return SolidLineConnector(color: Colors.pink);
            } else if (data[index].name == "DummyBeginner") {
              return SolidLineConnector(color: Colors.pinkAccent);
            } else {
              return SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            if (data[index].name == "DummyBeginner") {
              return DotIndicator(color: Colors.pink);
            } else if (data[index].name == "DummyBegEnd") {
              return null;
            } else if (data[index].name == "DummyIntermediate") {
              return DotIndicator(color: Color.fromARGB(255, 12, 194, 175));
            } else if (data[index].name == "DummyIntEnd") {
              return null;
            } else if (data[index].name == "DummyAdvanced") {
              return DotIndicator(color: Color.fromARGB(255, 190, 94, 207));
            } else if (data[index].name == "DummyAdvEnd") {
              return null;
            } else {
              switch (completedLessons.contains(data[index])) {
                case true:
                  return DotIndicator(
                    color: Colors.pink,
                    child: IconButton(
                      icon: Icon(Icons.check, size: 20.0),
                      color: Colors.white,
                      onPressed: () {
                        setSelectedLesson(data[index]);
                        Navigator.pushNamed(context, '/landingpage');
                      },
                    ),
                  );
                case false:
                default:
                  return OutlinedDotIndicator(
                    color: Color(0xffbabdc0),
                    backgroundColor: Color(0xffe6e7e9),
                  );
              }
            }
          },
          itemExtentBuilder: (_, __) => 150.0,
          itemCount: data.length,
        ),
      ),
    );
  }
}

class _EmptyContentsBeginner extends StatelessWidget {
  final listItem;
  final completedQuizzes;

  const _EmptyContentsBeginner(this.listItem, this.completedQuizzes);

  @override
  Widget build(BuildContext context) {
    if (listItem.name == "DummyBeginner") {
      return Container(
          height: 40.0,
          margin: EdgeInsets.only(left: 10.0),
          child: Text("Beginner Lessons", style: TextStyle(fontSize: 25.0)));
    } else {
      return Card(
        margin: EdgeInsets.all(40.0),
        color: Color.fromARGB(255, 206, 199, 199),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Color.fromARGB(255, 111, 109, 109),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              listItem.name.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (__) {
                    if (completedQuizzes.length == 0) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (completedQuizzes.length < 2) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (completedQuizzes.length < 3) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  })
                ]),
          ],
        ),
      );
    }
  }
}

class _EmptyContentsInt extends StatelessWidget {
  final listItem;
  final completedQuizzes;

  const _EmptyContentsInt(this.listItem, this.completedQuizzes);

  @override
  Widget build(BuildContext context) {
    if (listItem.name == "DummyIntermediate") {
      return Container(
          height: 40.0,
          margin: EdgeInsets.only(left: 10.0),
          child:
              Text("Intermediate Lessons", style: TextStyle(fontSize: 25.0)));
    } else {
      return Card(
        margin: EdgeInsets.all(40.0),
        color: Color.fromARGB(255, 206, 199, 199),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Color.fromARGB(255, 111, 109, 109),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              listItem.name.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (__) {
                    if (completedQuizzes.length == 0) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (completedQuizzes.length < 2) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (completedQuizzes.length < 3) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  })
                ]),
          ],
        ),
      );
    }
  }
}

class _EmptyContentsAdv extends StatelessWidget {
  final listItem;
  final completedQuizzes;

  const _EmptyContentsAdv(this.listItem, this.completedQuizzes);

  @override
  Widget build(BuildContext context) {
    if (listItem.name == "DummyAdvanced") {
      return Container(
          height: 40.0,
          margin: EdgeInsets.only(left: 10.0),
          child: Text("Advanced Lessons", style: TextStyle(fontSize: 25.0)));
    } else {
      return Card(
        margin: EdgeInsets.all(40.0),
        color: Color.fromARGB(255, 206, 199, 199),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Color.fromARGB(255, 111, 109, 109),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              listItem.name.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (__) {
                    if (completedQuizzes.length == 0) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (completedQuizzes.length < 2) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (completedQuizzes.length < 3) {
                      return Icon(Icons.star_border_outlined);
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  })
                ]),
          ],
        ),
      );
    }
  }
}
