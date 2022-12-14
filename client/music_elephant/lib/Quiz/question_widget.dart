import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final question;

  QuestionWidget(this.question);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(question['questionAssets'][0],
              height: 200.00, width: 300.00),
          Text(
            question['questionAssets'][1],
            style: TextStyle(
              fontSize: 32,
              color: Color(0xff5a3d2b),
            ),
          ),
        ],
      ),
    );
  }
}
