import 'package:flutter/material.dart';
import 'package:music_elephant/User/specific_profile.dart';
import 'package:music_elephant/User/user_container.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:music_elephant/Timeline/timeline_container.dart';

import 'Helpers/helper.dart';
import 'LessonAssets/lesson_assets.dart';
import 'Quiz/quiz.dart';
import 'lesson.dart';
import 'landing_page.dart';

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

  var selectedQuestions;

  var users = [
    {
      "name": "Ewan",
      "image": "images/profiles/ewan.png",
      "userProgress": {"SCALES1": "EASY", "CHORDS1": "MEDIUM"}
    },
    {
      "name": "Michael",
      "image": "images/profiles/michael.png",
      "userProgress": {
        "SCALES1": "HARD",
        "CHORDS1": "REVISION",
      }
    },
    {
      "name": "Nick",
      "image": "images/profiles/nick.png",
      "userProgress": {
        "SCALES1": "REVISION",
        "CHORDS1": "REVISION",
        "BeginnerBoss": "REVISION",
        "SCALES2": "REVISION",
        "CHORDS2": "REVISION"
      }
    },
    {
      "name": "Shuna",
      "image": "images/profiles/shuna.png",
      "userProgress": {
        "SCALES1": "REVISION",
        "CHORDS1": "REVISION",
        "BeginnerBoss": "REVISION",
        "CHORDS2": "REVISION",
        "SCALES2": "REVISION",
        "IntermediateBoss": "REVISION",
        "SCALES3": "REVISION",
        "CHORDS3": "REVISION"
      }
    },
    {
      "name": "Ian",
      "image": "images/dog-png-30.png",
      "userProgress": {},
    },
    {
      "name": "Josh",
      "image": "images/dog-png-30.png",
      "userProgress": {},
    },
    {
      "name": "Lou",
      "image": "images/dog-png-30.png",
      "userProgress": {},
    },
  ];

  var avatars = [
    {"images/profiles/nick.png"},
    {"images/profiles/shuna.png"},
    {"images/dog-png-30.png"},
    {"images/profiles/michael.png"},
    {"images/profiles/ewan.png"}
  ];

  var selectedProfile = {};

  // Selected lesson required when navigating to the lesson page from the timeline
  var selectedLesson;

  // DUMMY DATA - USER PROGRESS
  var userProgress;

  void addUser(newName) {
    var newUser = {'name': "", 'image': "", 'userProgress': {}};
    newUser['name'] = newName;
    newUser['image'] = "images/dog-png-30.png";
    newUser['userProgress'] = {};
  }

  void deleteUser(selectedProfile) {
    setState(() {
      users.remove(selectedProfile);
    });
  }

  void setUserProgress() {
    userProgress = selectedProfile['userProgress'];
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
  void setTimelineLessonList() {
    var list1 = [...begList];
    var list2 = [...intList];
    var list3 = [...advList];
    list1.insert(0, {
      "lessonName": "DummyBeginner",
      "slides": [],
      "level": {"levelName": "BEGINNER"}
    });
    list1.add(begBoss);
    list2.insert(0, {
      "lessonName": "DummyIntermediate",
      "slides": [],
      "level": {"levelName": "INTERMEDIATE"}
    });
    list2.add(intBoss);
    list3.insert(0, {
      "lessonName": "DummyAdvanced",
      "slides": [],
      "level": {"levelName": "ADVANCED"}
    });
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
  void getCompletedLessons(lesson) {
    userProgress.keys.forEach((key) {
      if (key == begBoss || key == intBoss || key == advBoss) {
        null;
      } else if (userProgress[key] == 'REVISION') {
        completedLessons.add(key);
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
  bool checkIfBossUnlocked(lesson) {
    var list = [];
    getCompletedLessons(lesson);
    switch (lesson['level']['levelName']) {
      case "BEGINNER":
        for (var item in begList) {
          list.add(item['lessonName']);
        }
        break;
      case "INTERMEDIATE":
        for (var item in intList) {
          list.add(item['lessonName']);
        }
        break;
      case "ADVANCED":
        for (var item in advList) {
          list.add(item['lessonName']);
        }
        break;
    }
    if (list.length == 0) {
      return false;
    } else if (completedLessons.toSet().containsAll(list)) {
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
  }

  void updateProgress() {
    var lessonName = selectedLesson['lessonName'];
    if (userProgress[lessonName] == null ||
        userProgress[lessonName] == 'EASY') {
      if (lessonName == 'BeginnerBoss' ||
          lessonName == 'IntermediateBoss' ||
          lessonName == 'AdvancedBoss') {
        setState(() {
          userProgress[lessonName] = 'REVISION';
        });
      } else {
        setState(() {
          userProgress[lessonName] = 'MEDIUM';
        });
      }
    } else if (userProgress[lessonName] == 'MEDIUM') {
      setState(() {
        userProgress[lessonName] = 'HARD';
      });
    } else if (userProgress[lessonName] == 'HARD') {
      setState(() {
        userProgress[lessonName] = 'REVISION';
      });
    }
  }

  void addLessonToUserProgress() {
    var lessonName = selectedLesson['lessonName'];
    if (lessonName == 'BeginnerBoss' ||
        lessonName == 'IntermediateBoss' ||
        lessonName == 'AdvancedBoss') {
      null;
    } else if (userProgress.containsKey(lessonName) == false) {
      userProgress[lessonName] = 'EASY';
    } else {
      null;
    }
  }

  void quizGenerator() {
    var newQuestions = [];
    var lessonName = selectedLesson['lessonName'];
    questions.forEach((question) {
      if (question['difficulty'] == userProgress[lessonName] &&
          question['lessonName'] == lessonName) {
        newQuestions.add(question);
      } else if (userProgress[lessonName] == 'REVISION' &&
          question['lessonName'] == lessonName) {
        newQuestions.add(question);
      } else if (userProgress[lessonName] == null &&
          question['lessonName'] == lessonName) {
        if (question['difficulty'] == 'EASY') {
          newQuestions.add(question);
        }
      }
    });
    newQuestions.shuffle();
    selectedQuestions = newQuestions;
    var shortList = selectFive(newQuestions);
    selectedQuestions = shortList;
  }

  selectFive(questions) {
    var newShortList = [];
    if (questions.length == 0) {
      null;
    } else {
      for (int i = 0; i < 5; i++) {
        newShortList.add(questions[i]);
      }
    }
    return newShortList;
  }

  selectTen(questions) {
    var newShortList = [];
    if (questions.length == 0) {
      null;
    } else {
      for (int i = 0; i < 10; i++) {
        newShortList.add(questions[i]);
      }
    }
    return newShortList;
  }

  // this function gathers gathers all questions of a particular level and
  // sends them to the lesson widget so the user can be tested on all questions
  // from a particular level
  void bossGenerator() {
    var newQuestions = [];

    questions.forEach((question) {
      if (selectedLesson['level']['levelName'] == "BEGINNER" &&
          question['levelName'] == "BEGINNER") {
        newQuestions.add(question);
      } else if (selectedLesson['level']['levelName'] == 'INTERMEDIATE' &&
          question['levelName'] == "INTERMEDIATE") {
        newQuestions.add(question);
      } else if (selectedLesson['level']['levelName'] == 'ADVANCED' &&
          question['levelName'] == "ADVANCED") {
        newQuestions.add(question);
      }
    });

    newQuestions.shuffle();
    var shortList = selectTen(newQuestions);
    selectedQuestions = shortList;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  getData() async {
    lessons = await Helper().getLessons();
    questions = await Helper().getAllQuestions();
    if (lessons != null && questions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  clearData() {
    begList.clear();
    intList.clear();
    advList.clear();
    newList.clear();
    completedLessons.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/users',
      routes: {
        '/quiz': (context) => Quiz(
              selectedQuestions,
              updateProgress,
              quizGenerator,
              userProgress,
              selectedLesson,
              bossGenerator,
            ),
        '/lesson': (context) => Lesson(selectedLesson),
        '/landingpage': (context) => LandingPage(
              selectedLesson,
              userProgress,
              addLessonToUserProgress,
            ),
        '/users': (context) => UserContainer(
            users,
            setSelectedProfile,
            getLevels,
            setTimelineLessonList,
            deleteUser,
            setUserProgress,
            getData,
            clearData,
            newList),
        '/profile': (context) => SpecificProfile(
            selectedProfile,
            getLevels,
            setTimelineLessonList,
            deleteUser,
            setUserProgress,
            clearData,
            newList),
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
              clearData,
            ),
      },
    );
  }
}
