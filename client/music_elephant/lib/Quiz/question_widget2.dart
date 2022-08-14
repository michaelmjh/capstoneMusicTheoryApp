import 'package:flutter/material.dart';

import '../QuestionAssets/answer_model.dart';

class QuestionWidget2 extends StatefulWidget {
  final answerQuestion;
  final needsReset;

  QuestionWidget2(this.answerQuestion, this.needsReset);

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
              color: Colors.green,
              border: Border.all(color: Colors.black, width: 2),
            ),
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(updatedData),
            ),
          );
        },
        onAccept: (data) {
          setState(() {
            updatedData = data.text;
            widget.answerQuestion(data);
          });
        },
      ),
    );
  }
}
