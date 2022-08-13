import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:music_elephant/journey.dart';
import 'package:music_elephant/landing_page.dart';
// import 'package:timeline_tile/timeline_tile.dart';
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

  Lesson dummyBegStart =
      Lesson(name: "DummyBeginner", slides: [], level: Level.beginner);
  Lesson dummyBegEnd =
      Lesson(name: "DummyBegEnd", slides: [], level: Level.beginner);
  Lesson dummyIntStart =
      Lesson(name: "DummyIntermediate", slides: [], level: Level.intermediate);
  Lesson dummyIntEnd =
      Lesson(name: "DummyIntEnd", slides: [], level: Level.intermediate);
  Lesson dummyAdvStart =
      Lesson(name: "DummyAdvanced", slides: [], level: Level.advanced);
  Lesson dummyAdvEnd =
      Lesson(name: "DummyAdvEnd", slides: [], level: Level.advanced);

  void setNewList() {
    begList.insert(0, dummyBegStart);
    begList.add(dummyBegEnd);
    intList.insert(0, dummyIntStart);
    intList.add(dummyIntEnd);
    advList.insert(0, dummyAdvStart);
    advList.add(dummyAdvEnd);
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
          nodePosition: 0.05,
          connectorTheme: ConnectorThemeData(
            thickness: 8.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: IndicatorThemeData(
            size: 45.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (context, index) {
            if (data[index].level == Level.beginner) {
              return _EmptyContentsBeginner(data[index], completedQuizzes);
            } else if (data[index].level == Level.intermediate) {
              return _EmptyContentsInt(data[index]);
            } else if (data[index].level == Level.advanced) {
              return _EmptyContentsAdv(data[index]);
            }
          },
          connectorBuilder: (_, index, __) {
            if (index == 0 || completedLessons.contains(data[index])) {
              return SolidLineConnector(color: Color(0xff6ad192));
            } else if (data[index].name == "DummyBeginner") {
              return SolidLineConnector(color: Color(0xff6ad192));
            } else {
              return SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            if (data[index].name == "DummyBeginner") {
              return DotIndicator(color: Colors.yellow);
            } else if (data[index].name == "DummyBegEnd") {
              return null;
            } else if (data[index].name == "DummyIntermediate") {
              return DotIndicator(color: Colors.orange);
            } else if (data[index].name == "DummyIntEnd") {
              return null;
            } else if (data[index].name == "DummyAdvanced") {
              return DotIndicator(color: Colors.teal);
            } else if (data[index].name == "DummyAdvEnd") {
              return null;
            } else {
              switch (completedLessons.contains(data[index])) {
                case true:
                  return DotIndicator(
                    color: Color(0xff6ad192),
                    child: ElevatedButton(
                      child: Icon(Icons.star),
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
          itemExtentBuilder: (_, __) => 200.0,
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
          child: Text("Beginner Lessons", style: TextStyle(fontSize: 30.0)));
    } else if (listItem.name == "DummyBegEnd") {
      return Divider(color: Colors.black, indent: 20.0, endIndent: 20.0);
    } else {
      return Column(
        children: [
          Text(
            listItem.name.toString(),
            style: TextStyle(fontSize: 20.0),
          ),
          Row(children: [
            Builder(builder: (__) {
              if (completedQuizzes.length == 0) {
                return Icon(Icons.star_border_outlined);
              } else {
                return Icon(Icons.star_border_outlined, color: Colors.yellow);
              }
            }),
            Builder(builder: (__) {
              if (completedQuizzes.length < 2) {
                return Icon(Icons.star_border_outlined);
              } else {
                return Icon(Icons.star_border_outlined, color: Colors.yellow);
              }
            }),
            Builder(builder: (__) {
              if (completedQuizzes.length < 3) {
                return Icon(Icons.star_border_outlined);
              } else {
                return Icon(Icons.star_border_outlined, color: Colors.yellow);
              }
            })
          ]),
        ],
      );
    }
  }
}

class _EmptyContentsInt extends StatelessWidget {
  final listItem;

  const _EmptyContentsInt(this.listItem);

  @override
  Widget build(BuildContext context) {
    if (listItem.name == "DummyIntermediate") {
      return Container(
          height: 40.0,
          child:
              Text("Intermediate Lessons", style: TextStyle(fontSize: 30.0)));
    } else if (listItem.name == "DummyIntEnd") {
      return Divider(color: Colors.black, indent: 20.0, endIndent: 20.0);
    } else {
      return Container(
        margin: EdgeInsets.only(left: 10.0),
        height: 40.0,
        child: Text(listItem.name.toString(), style: TextStyle(fontSize: 20.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.red,
        ),
      );
    }
  }
}

class _EmptyContentsAdv extends StatelessWidget {
  final listItem;

  const _EmptyContentsAdv(this.listItem);

  @override
  Widget build(BuildContext context) {
    if (listItem.name == "DummyAdvanced") {
      return Container(
          height: 40.0,
          child: Text("Advanced Lessons", style: TextStyle(fontSize: 30.0)));
    } else if (listItem.name == "DummyAdvEnd") {
      return Divider(color: Colors.black, indent: 20.0, endIndent: 20.0);
    } else {
      return Container(
        margin: EdgeInsets.only(left: 10.0),
        height: 40.0,
        child: Text(listItem.name.toString(), style: TextStyle(fontSize: 20.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.purple,
        ),
      );
    }
  }
}

enum _TimelineStatus {
  done,
  todo,
}
