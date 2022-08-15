import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/question_model.dart';
import 'package:music_elephant/User/add_profile.dart';
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
  // List<Question> currentQuiz = QuestionData.shared.easyQuestions;
  var selectedQuestions;

  var user1 = {"image": "image/dog-png-30.png", "name": "Ewan"};
  var user2 = {"image": "image/dog-png-30.png", "name": "Michael"};
  var user3 = {"image": "image/dog-png-30.png", "name": "Nick"};
  var user4 = {"image": "image/dog-png-30.png", "name": "shuna"};

  var users = [
    ["images/profiles/ewan.png", "Ewan"],
    ["images/profiles/michael.png", "Michael"],
    ["images/profiles/nick.png", "Nick"],
    ["images/profiles/shuna.png", "Shuna"],
    ["images/dog-png-30.png", "Ian"],
    ["images/dog-png-30.png", "Josh"],
    ["images/dog-png-30.png", "Lou"],
  ];

  var selectedProfile = "";

  // DUMMY DATA - LIST OF ALL LESSONS
  // Imagining this info will be stored in the app's main state
  var lessons = [scales1, scales2, scales3, chords1, chords2, chords3];
  // Selected lesson required when navigating to the lesson page from the timeline
  var selectedLesson;

  // DUMMY DATA - USER PROGRESS
  // this may need some wrangling - this will track the user's
  // progress in the quizzes so we can show overall progress in the timeline
  var userProgress = {
    scales1: Difficulty.revision,
    chords1: Difficulty.revision,
    begBoss: Difficulty.revision,
    scales2: Difficulty.revision,
    chords2: Difficulty.revision,
  };

  // Function for updating the userProgress property - this is currently not used
  // but could it be used when the user passes a quiz?
  void setCurrentProgress(lesson, difficulty) {
    setState(() {
      userProgress[lesson] = difficulty;
    });
  }

  // Function is run inside timeline_widget when user presses on timeline indicator
  void setSelectedLesson(lesson) {
    setState(() {
      selectedLesson = lesson;
    });
  }

  // These lists are used to build the timeline - the full question list is split
  // out by difficulty, items are added at beginning and end of each list,
  // then all lists are put back together again - the timeline then build
  // itself builting the new full list
  var begList = [];
  var intList = [];
  var advList = [];
  var newList = [];

  // This function splits the lessons into the above lists - it is run inside home_page.dart
  // - it runs when the user presses one the button to navigate to the timeline
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

  // this function constructs the new full lesson list by adding a header to
  // the start of each lesson level list, then a boss at the end of each lesson
  // level list
  // this runs inside home_page.dart after getLevels when the user presses on
  // the button to navigate to the timeline
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

  // this list is used by the timeline to check whether a section has been
  // compeleted, and therefore whether the next section can be unlocked or
  // a boss quiz has been unlocked
  var completedLessons = [];

  // this function fills the completedLessons list and is coded to ignore
  // boss lessons, because they shouldn't be included in the checks mentioned above
  void getCompletedLessons(level) {
    userProgress.keys.forEach((key) {
      if (key.level == level) {
        if (key.name == "BeginnerBoss" ||
            key.name == "IntermediateBoss" ||
            key.name == "AdvancedBoss") {
          null;
        } else if (userProgress[key] == Difficulty.revision) {
          completedLessons.add(key);
        }
      }
    });
  }

  // this function is used in timeline_widget - it checks if all lessons in
  // a particular level have been completed
  // if this is the case the function returns true, if not false
  // it runs a function which creates a list of all completed lessons, then
  // compares this to our existing lists of lessons divided into each level
  // it turns these lists into sets in order to check if the completed lessons
  // list contains all elements in the level list
  bool checkIfBossUnlocked(level) {
    var list = [];
    getCompletedLessons(level);
    switch (level) {
      case Level.beginner:
        list = begList;
        break;
      case Level.intermediate:
        list = intList;
        break;
      case Level.advanced:
        list = advList;
        break;
    }
    if (completedLessons.toSet().containsAll(list)) {
      return true;
    } else {
      return false;
    }
  }

  // function runs in timeline_widget to check if a boss level has been completed
  // this runs when a lesson has not yet been attempted but should be made
  // available to the user - so the function checks if the previous boss has been
  // beaten, in which case the lesson should be available
  bool checkIfBossCompleted(level) {
    var boss;
    switch (level) {
      case Level.intermediate:
        boss = begBoss;
        break;
      case Level.advanced:
        boss = intBoss;
        break;
    }
    if (userProgress.containsKey(boss)) {
      return true;
    } else {
      return false;
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

  // void quizGenerator() {
  // selectedQuestions = QuestionData.shared.getQuestions(currentDifficulty);
  // selectedQuestions.shuffle();
  // }

  void quizGenerator() {
    var allQuestions = QuestionData.shared.allQuestions;
    var newQuestions = [];
    allQuestions.forEach((question) {
      if (selectedLesson.name == question.lesson.name &&
          question.difficulty == currentDifficulty) {
        newQuestions.add(question);
      }
    });
    newQuestions.shuffle();
    selectedQuestions = newQuestions;
    // var shortList = selectFive(newQuestions);
    // selectedQuestions = shortList;
  }

  selectFive(questions) {
    var newShortList = [];
    for (int i = 0; i < 5; i++) {
      newShortList.add(questions[i]);
    }
    return newShortList;
  }

  selectTen(questions) {
    var newShortList = [];
    for (int i = 0; i < 10; i++) {
      newShortList.add(questions[i]);
    }
    return newShortList;
  }

  // this function gathers gathers all questions of a particular level and
  // sends them to the lesson widget so the user can be tested on all questions
  // from a particular level
  void bossGenerator() {
    print(selectedLesson.name);
    if (selectedLesson.level == Level.beginner) {
      selectedQuestions = QuestionData.shared.allBeginnerQuestions;
    } else if (selectedLesson.level == Level.intermediate) {
      selectedQuestions = QuestionData.shared.allBeginnerQuestions;
      selectedQuestions = [...QuestionData.shared.allIntermediateQuestions];
    } else if (selectedLesson.level == Level.advanced) {
      selectedQuestions = QuestionData.shared.allQuestions;
    }
    selectedQuestions.shuffle();
  }

  // void shuffle() {
  //   selectedQuestions.shuffle();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/users',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(getLevels, setTimelineLessonList),
        '/quiz': (context) => Quiz(
              selectedQuestions,
              updateProgress,
              quizGenerator,
            ),
        '/lesson': (context) => Lesson(selectedLesson),
        '/landingpage': (context) => LandingPage(
              progress,
              currentDifficulty,
            ),
        '/journey': (context) => Journey(
              selectedProfile,
              quizGenerator,
            ),
        '/users': (context) => UserContainer(
              users,
              setSelectedProfile,
            ),
        '/profile': (context) => SpecificProfile(selectedProfile),
        '/addProfile': (context) => AddProfile(),
        '/timeline': (countext) => Timeline(
            newList,
            setSelectedLesson,
            userProgress,
            completedLessons,
            getCompletedLessons,
            bossGenerator,
            checkIfBossUnlocked,
            checkIfBossCompleted,
            quizGenerator),
      },
    );
  }
}
