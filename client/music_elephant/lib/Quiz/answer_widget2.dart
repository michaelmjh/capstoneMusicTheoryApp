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
        child: Draggable<String>(
          data: widget.answer,
          child: Container(
            color: isDraggable ? Color(0xffe5771e) : Color(0xffffecb4),
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                widget.answer,
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xffffecb4),
                ),
              ),
            ),
          ),
          feedback: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                widget.answer,
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
