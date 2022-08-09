import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final selectHandler;
  final answer;

  AnswerWidget(this.selectHandler, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answer.text),
      ),
    );
  }
}
