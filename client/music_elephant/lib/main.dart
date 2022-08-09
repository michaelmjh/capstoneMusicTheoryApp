import 'package:flutter/material.dart';
import 'package:music_elephant/question_parent.dart';

import 'home_page.dart';
import 'question_parent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/questions': (context) => const QuestionParent(),
      },
    );
  }
}
