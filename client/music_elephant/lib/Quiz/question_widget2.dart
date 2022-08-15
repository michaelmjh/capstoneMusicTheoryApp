import 'package:flutter/material.dart';

import '../QuestionAssets/answer_model.dart';

class QuestionWidget2 extends StatefulWidget {
  final answerQuestion;
  final needsReset;
  final question;

  QuestionWidget2(
    this.answerQuestion,
    this.needsReset,
    this.question,
  );

  @override
  State<QuestionWidget2> createState() => _QuestionWidget2State();
}

class _QuestionWidget2State extends State<QuestionWidget2> {
  var updatedData = "";

  @override
  Widget build(BuildContext context) {
    if (widget.needsReset == true) {
      updatedData = "";
    }

    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      child: DragTarget<Answer>(
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            margin: EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              color: Color(0xff75c8ae),
            ),
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                updatedData,
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xffffecb4),
                ),
              ),
            ),
          );
        },
        onAccept: (data) {
          setState(() {
            updatedData = data.text;
            widget.answerQuestion(data, widget.question);
          });
        },
      ),
    );
  }
}
