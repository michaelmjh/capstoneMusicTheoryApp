import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/question_model.dart';
import 'package:music_elephant/answer_widget2.dart';
import 'package:music_elephant/question_widget2.dart';
import 'package:collection/collection.dart';

import 'QuestionAssets/question_assets.dart';

class QuestionParent2 extends StatefulWidget {
  const QuestionParent2({super.key});

  @override
  State<QuestionParent2> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionParent2> {
  final question = question3;

  void answerQuestion(answer) {
    null;
  }

  Question demoQuestion = question4;
  List submittedAnswer = [];
  bool completeAnswer = false;
  Function deepEq = const DeepCollectionEquality().equals;
  bool isSubmitted = false;
  String submissionText = '';
  int score = 0;
  int pageNumber = 1;
  int questionIndex = 0;
  bool reset = false;

  void updateAnswer(data) {
    submittedAnswer.add(data);
    if (submittedAnswer.length == demoQuestion.correctAnswer?.length) {
      setState(() {
        completeAnswer = true;
      });
    }
  }

  void submit() {
    if (deepEq(submittedAnswer, demoQuestion.correctAnswer)) {
      print('correct!');
      setState(() {
        isSubmitted = true;
        submissionText = 'You got the right answer!';
        score += 1;
      });
    } else if (submittedAnswer.isEmpty) {
      print('no answer selected!');
    } else {
      print(submittedAnswer);
      setState(() {
        isSubmitted = true;
        submissionText = 'Aw boo you got it wrong :(';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
      body: Column(
        children: [
          Row(
            children: demoQuestion.answerOptions.map((answer) {
              return QuestionWidget2(updateAnswer);
            }).toList(),
          ),
          Row(
            children: demoQuestion.answerOptions.map((answer) {
              return AnswerWidget2(answer);
            }).toList(),
          ),
          Visibility(
            visible: completeAnswer,
            child: ElevatedButton(
              child: Text("submit"),
              onPressed: submit,
            ),
          ),
        ],
      ),
    );
  }
}
