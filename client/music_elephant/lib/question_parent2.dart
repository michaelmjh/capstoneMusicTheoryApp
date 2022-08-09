import 'package:flutter/material.dart';
import 'package:music_elephant/answer_widget2.dart';
import 'package:music_elephant/question_widget2.dart';

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

  var answerOptions = ["A", "B", "C", "D"];
  var submittedAnswer = [];
  var completeAnswer = false;

  void updateAnswer(data) {
    submittedAnswer.add(data);
    if (submittedAnswer.length == answerOptions.length) {
      setState(() {
        completeAnswer = true;
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
            children: answerOptions.map((answer) {
              return QuestionWidget2(updateAnswer);
            }).toList(),
          ),
          Row(
            children: answerOptions.map((answer) {
              return AnswerWidget2(answer);
            }).toList(),
          ),
          Visibility(
            visible: completeAnswer,
            child: ElevatedButton(
              child: Text("submit"),
              onPressed: (() {
                print("hello is me youre looking for");
              }),
            ),
          ),
        ],
      ),
    );
  }
}
