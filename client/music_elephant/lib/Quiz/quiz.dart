import 'package:flutter/material.dart';
import 'package:music_elephant/Quiz/question_container.dart';
import 'package:music_elephant/Quiz/result_widget.dart';

import '../QuestionAssets/question_assets.dart';
import '../QuestionAssets/question_model.dart';

class Quiz extends StatefulWidget {
  List questions;
  final updateProgress;

  Quiz(this.questions, this.updateProgress, {super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int score = 0;
  int pageNumber = 1;
  int questionIndex = 0;

  String submissionText = '';

  bool final_question = false;

  void increaseScore() {
    score++;
  }

  void nextQuestion() {
    setState(
      () {
        if (questionIndex < widget.questions.length - 1) {
          pageNumber += 1;
          questionIndex += 1;
          if (questionIndex >= widget.questions.length - 1) {
            final_question = true;
          }
        } else if (questionIndex == widget.questions.length - 1) {
          questionIndex += 1;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: questionIndex < widget.questions.length
          ? QuestionContainer(
              widget.questions[questionIndex],
              submissionText,
              nextQuestion,
              final_question,
              increaseScore,
            )
          : Result(
              score: score,
              length: widget.questions.length,
              updateProgress: widget.updateProgress),
    );
  }
}
