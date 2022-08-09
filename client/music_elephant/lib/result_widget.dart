import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final int length;

  Result({required this.score, required this.length});

  // even though this widget is stateless, because it is rendered by a stateFUL widget, we can change what is displayed in this widget
  // when its parent updates
  String get resultPhrase {
    String resultText = '';
    if (score == 3) {
      resultText =
          'Perfect! You should feel comfortable moving on to the next section';
    } else if (score == 2) {
      resultText =
          'Well done! You missed one but we think you will be fine moving on to the next section.';
    } else if (score == 1) {
      resultText =
          'You did a good job! But we would recommend revising this subject again before moving on.';
    } else if (score == 0) {
      resultText =
          'Not to worry! Go back and revise this subject and you\'ll smash it next time!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('End of Quiz!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          // string interpolation in Dart:
          Text('You scored $score out of $length',
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

