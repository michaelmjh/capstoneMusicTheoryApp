import 'package:flutter/material.dart';

import '../QuestionAssets/answer_model.dart';

class AnswerWidget2 extends StatefulWidget {
  final answer;

  AnswerWidget2(this.answer);

  @override
  State<AnswerWidget2> createState() => _AnswerWidget2State();
}

class _AnswerWidget2State extends State<AnswerWidget2> {
  bool isDraggable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      child: IgnorePointer(
        ignoring: !isDraggable,
        child: Draggable<Answer>(
          data: widget.answer,
          child: Container(
            color: isDraggable ? Colors.blue : Colors.grey,
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                widget.answer.text,
              ),
            ),
          ),
          feedback: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                widget.answer.text,
              ),
            ),
          ),
          childWhenDragging: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Icon(Icons.cancel_presentation_outlined),
            ),
          ),
          onDragCompleted: () {
            setState(() {
              isDraggable = false;
            });
          },
        ),
      ),
    );
  }
}
