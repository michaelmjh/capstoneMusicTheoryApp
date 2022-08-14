import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/question_model.dart';
import 'package:music_elephant/User/specific_profile.dart';
import 'package:music_elephant/User/user_container.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:music_elephant/Timeline/timeline_container.dart';

import 'LessonAssets/lesson_assets.dart';
import 'QuestionAssets/Enums/level.dart';
import 'QuestionAssets/question_assets.dart';
import 'Quiz/quiz.dart';
import 'home_page.dart';
import 'lesson.dart';
import 'landing_page.dart';
import 'journey.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> progress = [false, false, false];

  Difficulty currentDifficulty = Difficulty.easy;
  List<Question> currentQuiz = QuestionData.shared.easyQuestions;
  var selectedQuestions;

  var user1 = {"image": "image/dog-png-30.png", "name": "Ewan"};
  var user2 = {"image": "image/dog-png-30.png", "name": "Michael"};
  var user3 = {"image": "image/dog-png-30.png", "name": "Nick"};
  var user4 = {"image": "image/dog-png-30.png", "name": "shuna"};

  var users = ["Ewan", "Michael", "Nick", "Shuna", "Chris", "Josh", "Lou"];

  var selectedProfile = "";

  // DUMMY DATA - ALL LESSONS
  // Imagining this info will be stored in the app's main state
  var lessons = [scales1, scales2, scales3, chords1, chords2, chords3];
  var selectedLesson;

  // DUMMY DATA - USER PROGRESS
  // this may need some wrangling - this will track the user's
  // progress in the quizzes so we can show overall progress in the timeline
  var userProgress = {
    scales1: Difficulty.completed,
    chords1: Difficulty.completed,
    scales2: Difficulty.completed,
    chords2: Difficulty.medium,
    begBoss: Difficulty.completed,
  };

  void setCurrentProgress(lesson, difficulty) {
    setState(() {
      userProgress[lesson] = difficulty;
    });
  }

  void setSelectedLesson(lesson) {
    setState(() {
      selectedLesson = lesson;
    });
  }

  var begList = [];
  var intList = [];
  var advList = [];
  var newList = [];

  void getLevels() {
    for (var item in lessons) {
      if (item.level == Level.beginner) {
        begList.add(item);
      } else if (item.level == Level.intermediate) {
        intList.add(item);
      } else if (item.level == Level.advanced) {
        advList.add(item);
      }
    }
  }

  void setTimelineLessonList() {
    var list1 = [...begList];
    var list2 = [...intList];
    var list3 = [...advList];
    list1.insert(0, dummyBeg);
    list1.add(begBoss);
    list2.insert(0, dummyInt);
    list2.add(intBoss);
    list3.insert(0, dummyAdv);
    list3.add(advBoss);
    for (var item in list1) {
      newList.add(item);
    }
    for (var item in list2) {
      newList.add(item);
    }
    for (var item in list3) {
      newList.add(item);
    }
  }

  var completedLessons = [];

  void getCompletedLessons(level) {
    userProgress.keys.forEach((key) {
      if (key.level == level) {
        if (key.name == "BeginnerBoss" ||
            key.name == "IntermediateBoss" ||
            key.name == "AdvancedBoss") {
          null;
        } else if (userProgress[key] == Difficulty.completed) {
          completedLessons.add(key);
        }
      }
    });
  }

  void setSelectedProfile(newProfile) {
    setState(() {
      selectedProfile = newProfile;
    });
    print(selectedProfile);
  }

  void updateProgress() {
    if (currentDifficulty == Difficulty.easy) {
      setState(() {
        progress = [true, false, false];
        currentDifficulty = Difficulty.medium;
      });
    } else if (currentDifficulty == Difficulty.medium) {
      setState(() {
        progress = [true, true, false];
        currentDifficulty = Difficulty.hard;
      });
    } else if (currentDifficulty == Difficulty.hard) {
      setState(() {
        progress = [true, true, true];
        currentDifficulty = Difficulty.revision;
      });
    }
  }

  void quizGenerator() {
    selectedQuestions = QuestionData.shared.getQuestions(currentDifficulty);
    selectedQuestions.shuffle();
  }

  void bossGenerator(level) {
    selectedQuestions = QuestionData.shared.getAllQuestions(level);
    selectedQuestions.shuffle();
  }

  // void shuffle() {
  //   selectedQuestions.shuffle();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(getLevels, setTimelineLessonList),
        '/quiz': (context) =>
            Quiz(selectedQuestions, updateProgress, quizGenerator),
        '/lesson': (context) => Lesson(selectedLesson),
        '/landingpage': (context) => LandingPage(
              progress,
              currentDifficulty,
            ),
        '/journey': (context) => Journey(selectedProfile, quizGenerator),
        '/users': (context) => UserContainer(users, setSelectedProfile),
        '/profile': (context) => SpecificProfile(selectedProfile),
        '/timeline': (countext) => Timeline(
            newList,
            setSelectedLesson,
            userProgress,
            completedLessons,
            getCompletedLessons,
            bossGenerator,
            begList,
            intList,
            advList),
      },
    );
  }
}
