import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final question;

  QuestionWidget(this.question);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
            image: AssetImage(question['questionAssets'[0]]),
            height: 200.00,
            width: 300.00),
        Text(
          question['questionAssets'[1]],
          style: TextStyle(fontSize: 28),
        ),
      ],
    );
  }
}
