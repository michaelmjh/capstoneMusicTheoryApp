import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/answer_model.dart';
import 'package:music_elephant/answer_widget.dart';
import 'package:collection/collection.dart';

import 'question_widget.dart';
import 'answer_widget.dart';
import 'result_widget.dart';
import 'QuestionAssets/question_assets.dart';

class QuestionParent extends StatefulWidget {
  const QuestionParent({super.key});

  @override
  State<QuestionParent> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionParent> {
  List questions = QuestionData.shared.questions;
  bool isSelected = false;
  List submittedAnswers = [];
  Function deepEq = const DeepCollectionEquality().equals;
  bool isSubmitted = false;
  String submissionText = '';
  int score = 0;
  int pageNumber = 1;
  int questionIndex = 0;
  bool reset = false;

  void answerQuestion(answer) {
    if (isSelected) {
      setState(() {
        isSelected = false;
        submittedAnswers.remove(answer);
      });
    } else {
      setState(() {
        isSelected = true;
        if (submittedAnswers.length < question1.correctAnswer!.length) {
          submittedAnswers.add(answer);
        }
      });
    }
  }

  void submit() {
    if (deepEq(submittedAnswers, question1.correctAnswer)) {
      print('correct!');
      setState(() {
        isSubmitted = true;
        submissionText = 'You got the right answer!';
        score += 1;
      });
    } else if (submittedAnswers.isEmpty) {
      print('no answer selected!');
    } else {
      print(submittedAnswers[0].text);
      setState(() {
        isSubmitted = true;
        submissionText = 'Aw boo you got it wrong :(';
      });
    }
  }

  void nextQuestion() {
    setState(
      () {
        if (questionIndex < questions.length) {
          pageNumber += 1;
          questionIndex += 1;
          isSelected = false;
          submittedAnswers = [];
          isSubmitted = false;
        } else {
          print('End of Quiz!');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: questionIndex < questions.length
          ? Column(
              children: [
                QuestionWidget(questions[questionIndex]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: !isSubmitted,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ...(questions[questionIndex].answerOptions
                                      as List<Answer>)
                                  .map((answer) {
                                return AnswerWidget(
                                    () => answerQuestion(answer),
                                    answer,
                                    reset);
                              }).toList(),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: submit,
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isSubmitted,
                      child: Column(
                        children: [
                          ...(questions[questionIndex].correctAnswer
                                  as List<Answer>)
                              .map((answer) {
                            return ElevatedButton(
                              onPressed: () {},
                              child: Text(answer.text),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                            );
                          }).toList(),
                          Text(submissionText),
                          questionIndex < questions.length - 1
                              ? ElevatedButton(
                                  onPressed: nextQuestion,
                                  child: Text('Next Question'),
                                )
                              : ElevatedButton(
                                  onPressed: nextQuestion,
                                  child: Text('Get Results'),
                                ),
                        ],
                      ),
                    ),
                    Text('Page Number: $pageNumber'),
                  ],
                ),
              ],
            )
          : Result(score: score, length: questions.length),
    );
  }
}
