import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final question;

  QuestionWidget(this.question);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(question.image), height: 200.00, width: 300.00),
        Text(
          question.text,
          style: TextStyle(
            fontSize: 32,
            color: Color(0xff5a3d2b),
          ),
        ),
      ],
    );
  }
}
