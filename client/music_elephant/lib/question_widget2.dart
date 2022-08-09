import 'package:flutter/material.dart';

class QuestionWidget2 extends StatefulWidget {
  final updateAnswer;

  QuestionWidget2(this.updateAnswer);

  @override
  State<QuestionWidget2> createState() => _QuestionWidget2State();
}

class _QuestionWidget2State extends State<QuestionWidget2> {
  var updatedData = "";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DragTarget<String>(
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
            updatedData = data;
            widget.updateAnswer(data);
          });
        },
      ),
    );
  }
}
