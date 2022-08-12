import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/difficulty.dart';
import 'package:music_elephant/QuestionAssets/question_model.dart';
import 'package:music_elephant/User/specific_profile.dart';
import 'package:music_elephant/User/user_container.dart';
import 'package:music_elephant/landing_page.dart';
import 'package:music_elephant/timeline.dart';

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
        '/': (context) => const HomePage(),
        '/quiz': (context) =>
            Quiz(selectedQuestions, updateProgress, quizGenerator),
        '/lesson': (context) => const Lesson(),
        '/landingpage': (context) => LandingPage(
              progress,
              currentDifficulty,
            ),
        '/journey': (context) => Journey(selectedProfile, quizGenerator),
        '/users': (context) => UserContainer(users, setSelectedProfile),
        '/profile': (context) => SpecificProfile(selectedProfile),
                '/timeline': (countext) => Timeline(),
      },
    );
  }
}
