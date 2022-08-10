import 'package:flutter/material.dart';

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
      child: Expanded(
        child: IgnorePointer(
          ignoring: !isDraggable,
          child: Draggable<String>(
            data: widget.answer.text,
            child: Container(
              color: isDraggable ? Colors.blue : Colors.grey,
              height: 120.0,
              width: 120.0,
              child: Center(
                child: Text(
                  widget.answer.text,
                ),
              ),
            ),
            feedback: Container(
              height: 120.0,
              width: 120.0,
              child: Center(
                child: Text(
                  widget.answer.text,
                ),
              ),
            ),
            childWhenDragging: Container(
              height: 120.0,
              width: 120.0,
              child: Center(
                child: Icon(Icons.cancel_presentation_outlined),
              ),
            ),
            onDragEnd: (details) {
              setState(() {
                isDraggable = false;
              });
            },
          ),
        ),
      ),
    );
  }
}
