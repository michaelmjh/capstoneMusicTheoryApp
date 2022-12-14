import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../LessonAssets/lesson_assets.dart';
import 'timeline_contents_containers.dart';
import 'timeline_indicators.dart';

// THIS WIDGET BUILDS THE TIMELINE INCLUDING INDICATORS AND CONNECTORS
// IT RENDERS CONTENTS CONTAINERS FROM timeline_content_containers.dart
class TimelineWidget extends StatelessWidget {
  final newList;
  final setSelectedLesson;
  final userProgress;
  final completedLessons;
  final bossGenerator;
  final checkIfBossUnlocked;
  final checkIfBossCompleted;
  final quizGenerator;
  final addLessonToUserProgress;

  const TimelineWidget(
    this.newList,
    this.setSelectedLesson,
    this.userProgress,
    this.completedLessons,
    this.bossGenerator,
    this.checkIfBossUnlocked,
    this.checkIfBossCompleted,
    this.quizGenerator,
    this.addLessonToUserProgress,
  );

  @override
  Widget build(BuildContext context) {
    // These functions pull out the index numbers of each element in the lesson
    // list which comes AFTER the Intermediate and Advanced headers
    // This is so that the connectors can be programmed to display with
    // the appropriate colour for reflecting the user's progress
    var dummyIndexInt;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i]['lessonName'] == "DummyIntermediate") {
        dummyIndexInt = i + 1;
      }
    }
    var dummyIndexAdv;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i]['lessonName'] == "DummyAdvanced") {
        dummyIndexAdv = i + 1;
      }
    }

    // These functions pull out the index numbers of the boss lessons
    // These are used to programme how the boss indicators and connectors
    // should be shown on the timline, reflecting the user's progress
    var bossIndexBeg;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i]['lessonName'] == "BeginnerBoss") {
        bossIndexBeg = i;
      }
    }
    var bossIndexInt;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i]['lessonName'] == "IntermediateBoss") {
        bossIndexInt = i;
      }
    }
    var bossIndexAdv;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i]['lessonName'] == "AdvancedBoss") {
        bossIndexBeg = i;
      }
    }

    return Flexible(
      // Timeline.tileBuilder - creates the timline using individual tiles
      // each tile contains an indicator, a connector after the indicator
      // and a contents box
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          // moves the position of the full timeline vertically on the page:
          nodePosition: 0.03,
          // CONNECTOR THEME
          connectorTheme: ConnectorThemeData(
            thickness: 4.0,
            color: Color(0xff75c8ae),
          ),
          // INDICATOR THEME
          indicatorTheme: IndicatorThemeData(
            size: 35.0,
          ),
        ),
        // this bit constructs the timeline - splits it out into builders
        // for the 3 main components - indicator, connector, contents
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (context, index) {
            // Contents widgets are split by level, therefore when building
            // the timeline we need to check which level each tile belongs to
            // before it builds it
            if (newList[index]['lessonName'] == "BeginnerBoss" ||
                newList[index]['lessonName'] == "IntermediateBoss" ||
                newList[index]['lessonName'] == "AdvancedBoss") {
              return ContentsBoss(newList[index], userProgress);
            } else if (newList[index]['level']['levelName'] == 'BEGINNER') {
              return ContentsBeginner(newList[index], userProgress);
            } else if (newList[index]['level']['levelName'] == 'INTERMEDIATE') {
              return ContentsIntermediate(newList[index], userProgress);
            } else if (newList[index]['level']['levelName'] == 'ADVANCED') {
              return ContentsAdvanced(newList[index], userProgress);
              // Boss lessons have a separate Contents widget - need to check by
              // the name of those lessons because we can't otherwise differentiate
              // them from the lessons belonging to each level
            }
          },
          connectorBuilder: (_, index, __) {
            var lesson = newList[index];
            // All of the below logic checks which colour should apply to
            // each connector, depending on the user's progress and whether
            // the tile being shown is a header or a boss
            if (index == 0 ||
                userProgress[lesson['lessonName']] == 'REVISION') {
              return SolidLineConnector(
                color: Color(0xff75c8ae),
              );
            } else if (lesson['lessonName'] == "DummyIntermediate" &&
                userProgress['BeginnerBoss'] == 'REVISION') {
              return SolidLineConnector(
                color: Color(0xff75c8ae),
              );
            } else if (lesson['lessonName'] == "DummyAdvanced" &&
                userProgress['IntermediateBoss'] == 'REVISION') {
              return SolidLineConnector(
                color: Color(0xff75c8ae),
              );
            } else {
              return SolidLineConnector(
                color: Color(0xff5a3d2b),
              );
            }
          },
          indicatorBuilder: (_, index) {
            var lesson = newList[index];
            // Aaaall of this logic checks which indicator should be displayed
            // in each tile depending on the user's progress and whether the
            // level that tile belongs to has been unlocked yet
            if (lesson['lessonName'] == "DummyBeginner") {
              return DotIndicator(
                color: Color(0xff75c8ae),
              );
              // if the tile is the Int header & this section is unlocked > show Int header indicator
              // otherwise it will show a padlock
            } else if (lesson['lessonName'] == "DummyIntermediate" &&
                userProgress.containsKey("BeginnerBoss")) {
              return DotIndicator(
                color: Color(0xff75c8ae),
              );
              // if the tile is the adv header & section is unlocked > show Adv header indicator
              // otherwise it will show a padlock
            } else if (lesson['lessonName'] == "DummyAdvanced" &&
                userProgress.containsKey("IntermediateBoss")) {
              return DotIndicator(
                color: Color(0xff75c8ae),
              );
              // if the tile is marked as revision in userProgress > display the pink tick indicator
            } else if (userProgress[lesson['lessonName']] == 'REVISION') {
              return CompletedIndicator(lesson, setSelectedLesson,
                  quizGenerator, bossGenerator, addLessonToUserProgress);
              // if tile is a boss ...
            } else if (lesson['lessonName'] == "BeginnerBoss" ||
                lesson['lessonName'] == "IntermediateBoss" ||
                lesson['lessonName'] == "AdvancedBoss") {
              // we run a check function to see if our userProgress shows that
              // all lessons in the appropriate section have been completed
              // if this is true, the boss level unlocks, if not we show a padlock
              if (checkIfBossUnlocked(lesson) == true) {
                return BossIndicator(lesson, setSelectedLesson, bossGenerator,
                    addLessonToUserProgress);
              } else {
                return LockedIndicator();
              }
              // if the lesson exists in userProgress but it has not been marked as completed
              // the indicator is a pink lightbulb
            } else if (userProgress.containsKey(lesson['lessonName']) &&
                userProgress[lesson['lessonName']] != 'REVISION') {
              return AvailableIndicator(newList[index], setSelectedLesson,
                  quizGenerator, addLessonToUserProgress);
              // if the lesson is not contained in userProgress it is locked
            } else if (userProgress.containsKey(lesson['lessonName']) ==
                false) {
              if (checkIfBossCompleted(lesson['level']['levelName']) ||
                  lesson['level']['levelName'] == 'BEGINNER') {
                return AvailableIndicator(newList[index], setSelectedLesson,
                    quizGenerator, addLessonToUserProgress);
              } else {
                return LockedIndicator();
              }
            }
          },
          // this sets the spacing between indicators
          itemExtentBuilder: (_, __) => 150.0,
          // this tells the builder how many items in the timeline so it can render
          // the final tile without a connector
          itemCount: newList.length,
        ),
      ),
    );
  }
}
