import 'package:flutter/material.dart';

class AnswerWidget extends StatefulWidget {
  final selectHandler;
  final answer;
  // bool isSelected = false;
  final reset;

  AnswerWidget(this.selectHandler, this.answer, this.reset);

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   primary: isSelected ? Colors.green : Colors.blue,
        // ),
        // onPressed: selectHandler,
        style: widget.reset
            ? ElevatedButton.styleFrom(primary: Colors.blue)
            : ElevatedButton.styleFrom(
                primary: isSelected ? Colors.green : Colors.blue),
        onPressed: () => {
          setState(
            () {
              isSelected = !isSelected;
              widget.selectHandler();
            },
          ),
        },
        child: Text(widget.answer.text),
      ),
    );
  }
}
