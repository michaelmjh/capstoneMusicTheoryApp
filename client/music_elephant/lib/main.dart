import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/User/add_profile.dart';
import 'package:music_elephant/User/specific_profile.dart';
import 'package:music_elephant/User/user_container.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:music_elephant/Timeline/timeline_container.dart';

import 'Helpers/helper.dart';
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
  var lessons;
  var questions;
  var isLoaded = false;

  // List<bool> progress = [false, false, false];

  // Difficulty currentDifficulty = Difficulty.medium;
  // List<Question> currentQuiz = QuestionData.shared.easyQuestions;
  var selectedQuestions;

  var users = [
    ["images/profiles/ewan.png", "Ewan"],
    [
      "images/profiles/michael.png",
      "Michael",
      {"SCALES1": "REVISION", "CHORDS1": "REVISION"}
    ],
    ["images/profiles/nick.png", "Nick"],
    ["images/profiles/shuna.png", "Shuna"],
    ["images/dog-png-30.png", "Ian"],
    ["images/dog-png-30.png", "Josh"],
    ["images/dog-png-30.png", "Lou"],
  ];

  var selectedProfile = "";

  // Selected lesson required when navigating to the lesson page from the timeline
  var selectedLesson;

  // DUMMY DATA - USER PROGRESS
  // this may need some wrangling - this will track the user's
  // progress in the quizzes so we can show overall progress in the timeline
  var userProgress;

  void setUserProgress() {
    userProgress = users[1][2];
  }

  // {
  // "SCALES1": "MEDIUM",
  // chords1: "HARD",
  // begBoss: "REVISION",
  // scales2: "EASY",
  // chords2: "EASY",
  // };

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
    for (var item in lessons!) {
      if (item['level']['levelName'] == 'BEGINNER') {
        begList.add(item);
      } else if (item['level']['levelName'] == 'INTERMEDIATE') {
        intList.add(item);
      } else if (item['level']['levelName'] == 'ADVANCED') {
        advList.add(item);
      }
    }
  }

  // this function constructs the new full lesson list by adding a header to
  // the start of each lesson level list, then a boss at the end of each lesson
  // level list
  // this runs inside home_page.dart after getLevels when the user presses on
  // the button to navigate to the timeline
  void setTimelineLessonList() async {
    var list1 = [...begList];
    var list2 = [...intList];
    var list3 = [...advList];
    list1.insert(0, {
      "lessonName": "DummyBeginner",
      "slides": [],
      "level": {"levelName": "BEGINNER"}
    });
    list1.add({
      "lessonName": "BeginnerBoss",
      "slides": [],
      "level": {"levelName": "BEGINNER"}
    });
    list2.insert(0, {
      "lessonName": "DummyIntermediate",
      "slides": [],
      "level": {"levelName": "INTERMEDIATE"}
    });
    list2.add({
      "lessonName": "IntermediateBoss",
      "slides": [],
      "level": {"levelName": "INTERMEDIATE"}
    });
    list3.insert(0, {
      "lessonName": "DummyAdvanced",
      "slides": [],
      "level": {"levelName": "ADVANCED"}
    });
    list3.add({
      "lessonName": "AdvancedBoss",
      "slides": [],
      "level": {"levelName": "ADVANCED"}
    });
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
      if (userProgress[key] == level) {
        if (key == "BeginnerBoss" ||
            key == "IntermediateBoss" ||
            key == "AdvancedBoss") {
          null;
        } else if (userProgress[key] == 'REVISION') {
          completedLessons.add(level);
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
      case "BEGINNER":
        list = begList;
        break;
      case "INTERMEDIATE":
        list = intList;
        break;
      case "ADVANCED":
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
      case "INTERMEDIATE":
        boss = 'BeginnerBoss';
        break;
      case "ADVANCED":
        boss = 'IntermediateBoss';
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
    if (userProgress[selectedLesson] == 'EASY') {
      setState(() {
        // progress = [true, false, false];
        // currentDifficulty = Difficulty.medium;
        userProgress[selectedLesson] = 'MEDIUM';
      });
    } else if (userProgress[selectedLesson] == 'MEDIUM') {
      setState(() {
        // progress = [true, true, false];
        // currentDifficulty = Difficulty.hard;
        userProgress[selectedLesson] = 'HARD';
      });
    } else if (userProgress[selectedLesson] == 'HARD') {
      setState(() {
        // progress = [true, true, true];
        // currentDifficulty = Difficulty.revision;
        userProgress[selectedLesson] = 'REVISION';
      });
    }
  }

  void addLessonToUserProgress() {
    if (userProgress.containsKey(selectedLesson['lessonName']) == false) {
      userProgress[selectedLesson['lessonName']] = 'EASY';
    } else {
      null;
    }
  }

  void quizGenerator() {
    var newQuestions = [];

    questions.forEach((question) {
      if (selectedLesson['lessonName'] == question['lessonName'] &&
          question['difficulty'] ==
              userProgress[selectedLesson['lessonName']]) {
        newQuestions.add(question);
      }
    });
    newQuestions.shuffle();
    selectedQuestions = newQuestions;
    var shortList = selectFive(newQuestions);
    selectedQuestions = shortList;
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
    if (selectedLesson['level']['levelName'] == "BEGINNER") {
      selectedQuestions = questions;
    } else if (selectedLesson['level']['levelName'] == "INTERMEDIATE") {
    } else if (selectedLesson['level']['levelName'] == "ADVANCED") {}
    selectedQuestions.shuffle();
  }

  @override
  void initState() {
    super.initState();
    getData();
    setUserProgress();
  }

  getData() async {
    lessons = await Helper().getLessons();
    questions = await Helper().getAllQuestions();

    if (lessons != null && questions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/users',
      routes: {
        '/': (context) => HomePage(getLevels, setTimelineLessonList),
        '/quiz': (context) => Quiz(
              selectedQuestions,
              updateProgress,
              quizGenerator,
              userProgress,
            ),
        '/lesson': (context) => Lesson(selectedLesson),
        '/landingpage': (context) => LandingPage(
              // progress,
              // currentDifficulty,
              selectedLesson,
              userProgress,
            ),
        '/journey': (context) => Journey(
              selectedProfile,
              quizGenerator,
            ),
        '/users': (context) => UserContainer(
            users, setSelectedProfile, getLevels, setTimelineLessonList),
        '/profile': (context) =>
            SpecificProfile(selectedProfile, getLevels, setTimelineLessonList),
        '/addProfile': (context) => AddProfile(),
        '/timeline': (countext) => Timeline(
              newList,
              setSelectedLesson,
              userProgress,
              completedLessons,
              bossGenerator,
              checkIfBossUnlocked,
              checkIfBossCompleted,
              quizGenerator,
              addLessonToUserProgress,
            ),
      },
    );
  }
}
