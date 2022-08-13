import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/question_model.dart';
import 'package:music_elephant/User/specific_profile.dart';
import 'package:music_elephant/User/user_container.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:music_elephant/timeline.dart';

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

  // DUMMY DATA - USER LESSON & QUIZ INFO
  // Imagining the user has these lists stored in their profile:
  var completedLessons = [scales1];
  var lessonsInProgress = [chords1];

  // this one may need some wrangling - this will track the user's
  // progress in the quizzes so we can show overall progress in the timeline
  var userProgress = {
    scales1: Difficulty.completed,
    chords1: Difficulty.medium,
    scales2: Difficulty.easy,
  };

  // var scalesEasyQuiz = QuestionData.shared.easyQuestions;
  // var scalesMediumQuiz = QuestionData.shared.mediumQuestions;
  // var scalesHardQuiz = QuestionData.shared.hardQuestions;

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

  void setLessonInProgress(lesson) {
    lessonsInProgress.add(lesson);
  }

  void setCompletedLesson(lesson) {
    completedLessons.add(lesson);
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

  void setNewList() {
    begList.insert(0, dummyBeg);
    intList.insert(0, dummyInt);
    advList.insert(0, dummyAdv);
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

  // void shuffle() {
  //   selectedQuestions.shuffle();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(getLevels, setNewList),
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
        '/timeline': (countext) => Timeline(newList, completedLessons,
            setSelectedLesson, userProgress, lessonsInProgress),
      },
    );
  }
}
