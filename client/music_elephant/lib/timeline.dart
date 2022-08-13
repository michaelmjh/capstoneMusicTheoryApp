import 'package:flutter/material.dart';
import 'package:music_elephant/LessonAssets/lesson_assets.dart';
import 'package:music_elephant/journey.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:timelines/timelines.dart';

import 'dart:math';

import 'LessonAssets/lesson_model.dart';
import 'QuestionAssets/Enums/difficulty.dart';
import 'QuestionAssets/Enums/level.dart';

class Timeline extends StatefulWidget {
  final lessons;
  final setSelectedLesson;
  final userProgress;
  final completedLessons;
  final getCompletedLessons;
  final intUnlocked;
  final advUnlocked;
  final getLockedLessons;
  final bossGenerator;
  final begList;
  final intList;
  final advList;

  const Timeline(
      this.lessons,
      this.setSelectedLesson,
      this.userProgress,
      this.completedLessons,
      this.getCompletedLessons,
      this.intUnlocked,
      this.advUnlocked,
      this.getLockedLessons,
      this.bossGenerator,
      this.begList,
      this.intList,
      this.advList,
      {super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    var newList = widget.lessons;

    return Scaffold(
      appBar: AppBar(title: Text('User Timeline')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                _Timeline1(
                  newList,
                  widget.setSelectedLesson,
                  widget.userProgress,
                  widget.completedLessons,
                  widget.getCompletedLessons,
                  widget.intUnlocked,
                  widget.advUnlocked,
                  widget.getLockedLessons,
                  widget.bossGenerator,
                  widget.begList,
                  widget.intList,
                  widget.advList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Timeline1 extends StatelessWidget {
  final newList;
  final setSelectedLesson;
  final userProgress;
  final completedLessons;
  final getCompletedLessons;
  final intUnlocked;
  final advUnlocked;
  final getLockedLessons;
  final bossGenerator;
  final begList;
  final intList;
  final advList;

  const _Timeline1(
    this.newList,
    this.setSelectedLesson,
    this.userProgress,
    this.completedLessons,
    this.getCompletedLessons,
    this.intUnlocked,
    this.advUnlocked,
    this.getLockedLessons,
    this.bossGenerator,
    this.begList,
    this.intList,
    this.advList,
  );

  @override
  Widget build(BuildContext context) {
    final data = newList;

    var dummyIndexInt;
    for (var i = 0; i < data.length; i++) {
      if (data[i].name == "DummyIntermediate") {
        dummyIndexInt = i + 1;
      }
    }

    var dummyIndexAdv;
    for (var i = 0; i < data.length; i++) {
      if (data[i].name == "DummyAdvanced") {
        dummyIndexAdv = i + 1;
      }
    }

    var bossIndexBeg;
    for (var i = 0; i < data.length; i++) {
      if (data[i].name == "BeginnerBoss") {
        bossIndexBeg = i;
        print(i);
      }
    }
    var bossIndexInt;
    for (var i = 0; i < data.length; i++) {
      if (data[i].name == "IntermediateBoss") {
        bossIndexInt = i;
        print(i);
      }
    }
    var bossIndexAdv;
    for (var i = 0; i < data.length; i++) {
      if (data[i].name == "AdvancedBoss") {
        bossIndexBeg = i;
        print(i);
      }
    }

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
              return _EmptyContentsBeginner(data[index], userProgress);
            } else if (data[index].level == Level.intermediate) {
              return _EmptyContentsInt(data[index], userProgress);
            } else if (data[index].level == Level.advanced) {
              return _EmptyContentsAdv(data[index], userProgress);
            } else if (data[index].name == "BeginnerBoss" ||
                data[index].name == "IntermediateBoss" ||
                data[index].name == "AdvancedBoss") {
              return _EmptyContentsBoss(data[index], userProgress);
            }
          },
          connectorBuilder: (_, index, __) {
            if (index == 0 ||
                userProgress[data[index]] == Difficulty.completed) {
              return SolidLineConnector(color: Colors.pink);
            } else if (userProgress.containsKey(data[index]) == true) {
              return SolidLineConnector(color: Colors.orange);
            } else if (userProgress.containsKey(data[dummyIndexInt]) == true &&
                data[index].name == "DummyIntermediate") {
              if (userProgress[data[dummyIndexInt]] == Difficulty.completed) {
                return SolidLineConnector(color: Colors.pink);
              } else {
                return SolidLineConnector(color: Colors.orange);
              }
            } else if (userProgress.containsKey(data[dummyIndexAdv]) == true &&
                data[index].name == "DummyAdvanced") {
              if (userProgress[data[dummyIndexInt]] == Difficulty.completed) {
                return SolidLineConnector(color: Colors.pink);
              } else {
                return SolidLineConnector(color: Colors.orange);
              }
            } else {
              return SolidLineConnector(color: Colors.grey);
            }
          },
          indicatorBuilder: (_, index) {
            if (data[index].name == "DummyBeginner") {
              return DotIndicator(color: Colors.pink);
            } else if (data[index].name == "DummyIntermediate") {
              if (userProgress.containsKey(begBoss)) {
                return DotIndicator(color: Color.fromARGB(255, 12, 194, 175));
              } else {
                return DotIndicator(
                    color: Colors.grey, child: Icon(Icons.lock));
              }
            } else if (data[index].name == "DummyAdvanced") {
              if (userProgress.containsKey(intBoss)) {
                return DotIndicator(color: Color.fromARGB(255, 190, 94, 207));
              } else {
                return DotIndicator(
                    color: Colors.grey, child: Icon(Icons.lock));
              }
            } else if (userProgress.containsKey(data[index]) == true &&
                userProgress[data[index]] == Difficulty.completed) {
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
            } else if (data[index].name == "BeginnerBoss" ||
                data[index].name == "IntermediateBoss" ||
                data[index].name == "AdvancedBoss") {
              getCompletedLessons(data[index].level);
              var completedSet = completedLessons.toSet();
              var begSet = begList.toSet();
              var intSet = intList.toSet();
              var advSet = intList.toSet();
              if (begSet.intersection(completedSet).length == begList.length &&
                  data[index].level == Level.beginner) {
                return DotIndicator(
                  color: Colors.red,
                  child: IconButton(
                    icon: Icon(Icons.bolt, size: 20.0),
                    color: Colors.black,
                    onPressed: () {
                      setSelectedLesson(data[index]);
                      bossGenerator();
                      Navigator.pushNamed(context, '/landingpage');
                    },
                  ),
                );
              } else if (intSet.intersection(completedSet).length ==
                      intList.length &&
                  data[index].level == Level.intermediate) {
                return DotIndicator(
                  color: Colors.red,
                  child: IconButton(
                    icon: Icon(Icons.bolt, size: 20.0),
                    color: Colors.black,
                    onPressed: () {
                      setSelectedLesson(data[index]);
                      bossGenerator();
                      Navigator.pushNamed(context, '/landingpage');
                    },
                  ),
                );
              } else if (advSet.intersection(completedSet).length ==
                      advList.length &&
                  data[index].level == Level.advanced) {
                return DotIndicator(
                  color: Colors.red,
                  child: IconButton(
                    icon: Icon(Icons.bolt, size: 20.0),
                    color: Colors.black,
                    onPressed: () {
                      setSelectedLesson(data[index]);
                      bossGenerator();
                      Navigator.pushNamed(context, '/landingpage');
                    },
                  ),
                );
              } else {
                return DotIndicator(
                  color: Colors.grey,
                  child: IconButton(
                    icon: Icon(Icons.lock, size: 20.0),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                );
              }
            } else if (userProgress.containsKey(data[index]) &&
                userProgress[data[index]] != Difficulty.completed) {
              return DotIndicator(
                color: Color.fromARGB(255, 229, 97, 141),
                child: IconButton(
                  icon: Icon(Icons.lightbulb, size: 20.0),
                  color: Colors.black,
                  onPressed: () {
                    setSelectedLesson(data[index]);
                    Navigator.pushNamed(context, '/landingpage');
                  },
                ),
              );
            } else if (userProgress.containsKey(data[index]) == false) {
              return DotIndicator(color: Colors.grey, child: Icon(Icons.lock));
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
  final userProgress;

  const _EmptyContentsBeginner(this.listItem, this.userProgress);

  @override
  Widget build(BuildContext context) {
    var currentDiff = null;

    if (userProgress.containsKey(listItem)) {
      currentDiff = userProgress[listItem];
    }

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
                    if (currentDiff == null || currentDiff == Difficulty.easy) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.hard ||
                        currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    } else if (currentDiff == Difficulty.completed) {
                      return Text('Lesson complete!');
                    } else {
                      return Icon(Icons.star_border_outlined);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(
                        Icons.star_border_outlined,
                      );
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
  final userProgress;

  const _EmptyContentsInt(this.listItem, this.userProgress);

  @override
  Widget build(BuildContext context) {
    var currentDiff = null;

    if (userProgress.containsKey(listItem)) {
      currentDiff = userProgress[listItem];
    }

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
                    if (currentDiff == null || currentDiff == Difficulty.easy) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.hard ||
                        currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    } else if (currentDiff == Difficulty.completed) {
                      return Text('Lesson complete!');
                    } else {
                      return Icon(Icons.star_border_outlined);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(
                        Icons.star_border_outlined,
                      );
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
  final userProgress;

  const _EmptyContentsAdv(this.listItem, this.userProgress);

  @override
  Widget build(BuildContext context) {
    var currentDiff = null;

    if (userProgress.containsKey(listItem)) {
      currentDiff = userProgress[listItem];
    }

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
                    if (currentDiff == null || currentDiff == Difficulty.easy) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.hard ||
                        currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    } else if (currentDiff == Difficulty.completed) {
                      return Text('Lesson complete!');
                    } else {
                      return Icon(Icons.star_border_outlined);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(
                        Icons.star_border_outlined,
                      );
                    }
                  })
                ]),
          ],
        ),
      );
    }
  }
}

class _EmptyContentsBoss extends StatelessWidget {
  final listItem;
  final userProgress;

  const _EmptyContentsBoss(this.listItem, this.userProgress);

  @override
  Widget build(BuildContext context) {
    var currentDiff = null;

    if (userProgress.containsKey(listItem)) {
      currentDiff = userProgress[listItem];
    }

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
            "Boss Level!",
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
