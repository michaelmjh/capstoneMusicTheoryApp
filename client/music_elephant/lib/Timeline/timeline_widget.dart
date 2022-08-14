import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../LessonAssets/lesson_assets.dart';
import '../QuestionAssets/Enums/difficulty.dart';
import '../QuestionAssets/Enums/level.dart';
import 'timeline_contents_containers.dart';
import 'timeline_indicators.dart';

// THIS WIDGET BUILDS THE TIMELINE INCLUDING INDICATORS AND CONNECTORS
// IT RENDERS CONTENTS CONTAINERS FROM timeline_content_containers.dart
class TimelineWidget extends StatelessWidget {
  final newList;
  final setSelectedLesson;
  final userProgress;
  final completedLessons;
  final getCompletedLessons;
  final bossGenerator;
  final checkIfBossUnlocked;
  final checkIfBossCompleted;

  const TimelineWidget(
    this.newList,
    this.setSelectedLesson,
    this.userProgress,
    this.completedLessons,
    this.getCompletedLessons,
    this.bossGenerator,
    this.checkIfBossUnlocked,
    this.checkIfBossCompleted,
  );

  @override
  Widget build(BuildContext context) {
    // These functions pull out the index numbers of each element in the lesson
    // list which comes AFTER the Intermediate and Advanced headers
    // This is so that the connectors can be programmed to display with
    // the appropriate colour for reflecting the user's progress
    var dummyIndexInt;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i].name == "DummyIntermediate") {
        dummyIndexInt = i + 1;
      }
    }
    var dummyIndexAdv;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i].name == "DummyAdvanced") {
        dummyIndexAdv = i + 1;
      }
    }

    // These functions pull out the index numbers of the boss lessons
    // These are used to programme how the boss indicators and connectors
    // should be shown on the timline, reflecting the user's progress
    var bossIndexBeg;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i].name == "BeginnerBoss") {
        bossIndexBeg = i;
      }
    }
    var bossIndexInt;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i].name == "IntermediateBoss") {
        bossIndexInt = i;
      }
    }
    var bossIndexAdv;
    for (var i = 0; i < newList.length; i++) {
      if (newList[i].name == "AdvancedBoss") {
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
            color: Color(0xffd3d3d3),
          ),
          // INDICATOR THEME
          indicatorTheme: IndicatorThemeData(
            size: 35.0,
          ),
        ),
        // this bit constructs the timeline - splits it out into builders
        // for the 3 main components - indicator, connector, contents
        builder: TimelineTileBuilder.connected(
          // CONTENTS BUILDER
          contentsBuilder: (context, index) {
            // Contents widgets are split by level, therefore when building
            // the timeline we need to check which level each tile belongs to
            // before it builds it
            if (newList[index].name == "BeginnerBoss" ||
                newList[index].name == "IntermediateBoss" ||
                newList[index].name == "AdvancedBoss") {
              return ContentsBoss(newList[index], userProgress);
            } else if (newList[index].level == Level.beginner) {
              return ContentsBeginner(newList[index], userProgress);
            } else if (newList[index].level == Level.intermediate) {
              return ContentsIntermediate(newList[index], userProgress);
            } else if (newList[index].level == Level.advanced) {
              return ContentsAdvanced(newList[index], userProgress);
              // Boss lessons have a separate Contents widget - need to check by
              // the name of those lessons because we can't otherwise differentiate
              // them from the lessons belonging to each level
            }
          },
          // CONNECTOR BUILDER
          connectorBuilder: (_, index, __) {
            // All of the below logic checks which colour should apply to
            // each connector, depending on the user's progress and whether
            // the tile being shown is a header or a boss
            if (index == 0 ||
                userProgress[newList[index]] == Difficulty.completed) {
              return SolidLineConnector(color: Colors.pink);
            } else if (userProgress.containsKey(newList[index]) == true) {
              return SolidLineConnector(color: Colors.orange);
            } else if (userProgress.containsKey(newList[dummyIndexInt]) ==
                    true &&
                newList[index].name == "DummyIntermediate") {
              if (userProgress[newList[dummyIndexInt]] ==
                  Difficulty.completed) {
                return SolidLineConnector(color: Colors.pink);
              } else {
                return SolidLineConnector(color: Colors.orange);
              }
            } else if (userProgress.containsKey(newList[dummyIndexAdv]) ==
                    true &&
                newList[index].name == "DummyAdvanced") {
              if (userProgress[newList[dummyIndexInt]] ==
                  Difficulty.completed) {
                return SolidLineConnector(color: Colors.pink);
              } else {
                return SolidLineConnector(color: Colors.orange);
              }
            } else {
              return SolidLineConnector(color: Colors.grey);
            }
          },
          // INDICATOR BUILDER
          indicatorBuilder: (_, index) {
            // Aaaall of this logic checks which indicator should be displayed
            // in each tile depending on the user's progress and whether the
            // level that tile belongs to has been unlocked yet
            if (newList[index].name == "DummyBeginner") {
              return DotIndicator(color: Colors.pink);
              // if the tile is the Int header & this section is unlocked > show Int header indicator
              // otherwise it will show a padlock
            } else if (newList[index].name == "DummyIntermediate" &&
                userProgress.containsKey(begBoss)) {
              return DotIndicator(color: Color.fromARGB(255, 12, 194, 175));
              // if the tile is the adv header & section is unlocked > show Adv header indicator
              // otherwise it will show a padlock
            } else if (newList[index].name == "DummyAdvanced" &&
                userProgress.containsKey(intBoss)) {
              return DotIndicator(color: Color.fromARGB(255, 190, 94, 207));
              // if the tile is marked as completed in userProgress > display the pink tick indicator
            } else if (userProgress[newList[index]] == Difficulty.completed) {
              return CompletedIndicator(newList[index], setSelectedLesson);
              // if tile is a boss ...
            } else if (newList[index].name == "BeginnerBoss" ||
                newList[index].name == "IntermediateBoss" ||
                newList[index].name == "AdvancedBoss") {
              // we run a check function to see if our userProgress shows that
              // all lessons in the appropriate section have been completed
              // if this is true, the boss level unlocks, if not we show a padlock
              if (checkIfBossUnlocked(newList[index].level) == true) {
                return BossIndicator(
                    newList[index], setSelectedLesson, bossGenerator);
              } else {
                return LockedIndicator();
              }
              // if the lesson exists in userProgress but it has not been marked as completed
              // the indicator is a pink lightbulb
            } else if (userProgress.containsKey(newList[index]) &&
                userProgress[newList[index]] != Difficulty.completed) {
              return InProgressIndicator(newList[index], setSelectedLesson);
              // if the lesson is not contained in userProgress it is locked
            } else if (userProgress.containsKey(newList[index]) == false) {
              if (checkIfBossCompleted(newList[index].level)) {
                return AvailableIndicator(newList[index], setSelectedLesson);
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
