import 'package:flutter/material.dart';
import 'package:music_elephant/Quiz/question_container.dart';
import 'package:music_elephant/Quiz/result_widget.dart';

import '../QuestionAssets/question_assets.dart';
import '../QuestionAssets/question_model.dart';

class Quiz extends StatefulWidget {
  List questions;
  final updateProgress;
  final quizGenerator;
  final userProgress;
  final selectedLesson;
  final bossGenerator;

  Quiz(this.questions, this.updateProgress, this.quizGenerator,
      this.userProgress, this.selectedLesson, this.bossGenerator,
      {super.key});

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
        title: Text(
          "Quiz",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        foregroundColor: Color(0xffffecb4),
        backgroundColor: Color(0xffe5771e),
      ),
      body: Container(
        color: Color(0xffffecb4),
        padding: const EdgeInsets.all(20),
        child: questionIndex < widget.questions.length
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
                updateProgress: widget.updateProgress,
                quizGenerator: widget.quizGenerator,
                selectedLesson: widget.selectedLesson,
                bossGenerator: widget.bossGenerator,
              ),
      ),
    );
  }
}
