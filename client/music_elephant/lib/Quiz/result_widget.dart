import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final score;
  final length;
  final updateProgress;
  final quizGenerator;
  final selectedLesson;
  final bossGenerator;

  Result({
    required this.score,
    required this.length,
    required this.updateProgress,
    required this.quizGenerator,
    required this.selectedLesson,
    required,
    this.bossGenerator,
  });

  String get resultPhrase {
    String resultText = '';
    if (score >= 4) {
      resultText =
          'Perfect! You should feel comfortable moving on to the next section';
    } else {
      resultText =
          'Not to worry! Go back and revise this subject! You\'ll smash it next time!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            score > 3 ? "images/logo/Happy.png" : "images/logo/Sad.png",
            height: 500,
          ),
          const Text(
            'End of Quiz!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xff5a3d2b),
            ),
          ),
          Text(
            'You scored $score out of $length',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xff5a3d2b),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 70,
              right: 70,
            ),
            child: Text(
              resultPhrase,
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xff5a3d2b),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffe5771e),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Return to Lesson',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xffffecb4),
                  ),
                ),
              ),
              onPressed: () {
                if (selectedLesson['lessonName'] == 'BeginnerBoss' ||
                    selectedLesson['lessonName'] == 'IntermediateBoss' ||
                    selectedLesson['lessonName'] == 'AdvancedBoss') {
                  if (score > 8) {
                    updateProgress();
                    bossGenerator();
                  } else {
                    null;
                  }
                } else {
                  if (score > 3) {
                    updateProgress();
                    quizGenerator();
                  } else {
                    null;
                  }
                }
                Navigator.pushNamed(context, '/landingpage');
              },
            ),
          ),
        ],
      ),
    );
  }
}
