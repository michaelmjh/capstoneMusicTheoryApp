import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/answer_model.dart';
import 'package:music_elephant/answer_widget.dart';

import 'question_widget.dart';
import 'answer_widget.dart';
import 'QuestionAssets/question_assets.dart';

class QuestionParent extends StatefulWidget {
  const QuestionParent({super.key});

  @override
  State<QuestionParent> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionParent> {
  final question = question3;

  void answerQuestion(answer) {
    null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          QuestionWidget(question),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...(question.answerOptions as List<Answer>).map((answer) {
                return AnswerWidget(() => answerQuestion(answer), answer);
              }).toList()
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
