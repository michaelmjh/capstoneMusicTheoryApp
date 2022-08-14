import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../LessonAssets/lesson_assets.dart';
import '../QuestionAssets/Enums/difficulty.dart';
import '../QuestionAssets/Enums/level.dart';
import 'timeline_contents_containers.dart';

class TimelineWidget extends StatelessWidget {
  final newList;
  final setSelectedLesson;
  final userProgress;
  final completedLessons;
  final getCompletedLessons;
  final bossGenerator;
  final begList;
  final intList;
  final advList;

  const TimelineWidget(
    this.newList,
    this.setSelectedLesson,
    this.userProgress,
    this.completedLessons,
    this.getCompletedLessons,
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
              return ContentsBeginner(data[index], userProgress);
            } else if (data[index].level == Level.intermediate) {
              return ContentsIntermediate(data[index], userProgress);
            } else if (data[index].level == Level.advanced) {
              return ContentsAdvanced(data[index], userProgress);
            } else if (data[index].name == "BeginnerBoss" ||
                data[index].name == "IntermediateBoss" ||
                data[index].name == "AdvancedBoss") {
              return ContentsBoss(data[index], userProgress);
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
                      bossGenerator(data[index].level);
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
                      bossGenerator(data[index].level);
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
                      bossGenerator(data[index].level);
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
