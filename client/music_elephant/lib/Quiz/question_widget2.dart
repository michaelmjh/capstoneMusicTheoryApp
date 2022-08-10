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

    return Expanded(
      child: DragTarget<Answer>(
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            height: 120.0,
            width: 120.0,
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
