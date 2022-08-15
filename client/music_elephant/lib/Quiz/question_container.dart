import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/question_type.dart';
import 'package:music_elephant/Quiz/question_widget2.dart';
import 'package:collection/collection.dart';

import '../QuestionAssets/question_assets.dart';
import '../QuestionAssets/question_model.dart';
import 'answer_widget2.dart';
import 'question_widget.dart';
import 'answer_widget.dart';
import '../QuestionAssets/answer_model.dart';

class QuestionContainer extends StatefulWidget {
  String submissionText;
  final nextQuestion;
  final question;
  final final_question;
  final increaseScore;

  QuestionContainer(
    this.question,
    this.submissionText,
    this.nextQuestion,
    this.final_question,
    this.increaseScore,
  );

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  List submittedAnswers = [];
  Function deepEq = const DeepCollectionEquality().equals;

  bool isSelected = false;
  bool isSubmitted = false;
  bool disabled = false;
  bool completeAnswer = false;

  bool needsReset = false;

  void submit() {
    if (deepEq(submittedAnswers, widget.question.correctAnswer)) {
      setState(() {
        isSubmitted = true;
        widget.submissionText = 'You got the right answer!';
        needsReset = true;
        widget.increaseScore();
      });
    } else if (submittedAnswers.isEmpty) {
      null;
    } else {
      setState(() {
        isSubmitted = true;
        widget.submissionText = 'Aw boo you got it wrong :(';
        needsReset = true;
      });
    }
  }

// this function creates a list which will be filled when answers are clicked
// this will allow an accurate check for questions with more than one answer
  void createEmptyAnswerList(question) {
    for (var i = 0; i < question.correctAnswer.length; i++) {
      if (submittedAnswers.length != question.correctAnswer.length) {
        submittedAnswers.add("");
      }
    }
  }

// this function adds answers to the above list at an index that matches
// the correct answer list, if ths answer exists in that list
  void answerQuestion(answer, question) {
    var index;
    if (question.correctAnswer.contains(answer)) {
      index = question.correctAnswer.indexOf(answer);
      submittedAnswers[index] = answer;
    }
    if (submittedAnswers.length == widget.question.correctAnswer!.length) {
      setState(() {
        isSelected = true;
        disabled = true;
      });
    }
  }

  void clearAnswer() {
    setState(() {
      isSelected = false;
      submittedAnswers.clear();
      disabled = false;
    });
  }

  void reset() {
    needsReset = false;
    isSelected = false;
    submittedAnswers.clear();
    isSubmitted = false;
    disabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.question.type == QuestionType.arrange
            ? Builder(
                builder: (__) {
                  createEmptyAnswerList(widget.question);
                  print(widget.question.lesson);
                  print(widget.question.level);
                  return Column(
                    children: [
                      Container(
                        child: Text(
                          widget.question.text,
                          style: TextStyle(fontSize: 23.0),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.only(top: 15.0),
                      ),
                      Container(
                          child: Text(
                            "(Drag the letters into the boxes)",
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                          margin: EdgeInsets.only(top: 5.0, bottom: 15.0)),
                      Row(
                        children: [
                          ...(widget.question.answerOptions as List)
                              .map((answer) {
                            return QuestionWidget2(
                                answerQuestion, needsReset, widget.question);
                          }).toList(),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  );
                },
              )
            : Builder(builder: (__) {
                createEmptyAnswerList(widget.question);
                print(widget.question.lesson);
                print(widget.question.level);
                return QuestionWidget(widget.question);
              }),
        !isSubmitted
            ? Column(
                children: [
                  widget.question.type == QuestionType.arrange
                      ? Row(
                          children: [
                            ...(widget.question.answerOptions as List<Answer>)
                                .map((answer) {
                              return AnswerWidget2(answer);
                            }).toList(),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                      : Row(
                          children: [
                            ...(widget.question.answerOptions as List<Answer>)
                                .map((answer) {
                              return AnswerWidget(
                                  () => answerQuestion(answer, widget.question),
                                  answer,
                                  clearAnswer,
                                  disabled,
                                  submittedAnswers,
                                  widget.question.correctAnswer);
                            }).toList(),
                          ],
                        ),
                  Visibility(
                    visible: isSelected,
                    child: ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        submit();
                      },
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Text(widget.submissionText),
                  ...(widget.question.correctAnswer as List<Answer>)
                      .map((answer) {
                    return ElevatedButton(
                        onPressed: () {},
                        child: Text(answer.text),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ));
                  }).toList(),
                  !widget.final_question
                      ? ElevatedButton(
                          child: Text('Next Question'),
                          onPressed: () {
                            widget.nextQuestion();
                            reset();
                          },
                        )
                      : ElevatedButton(
                          child: Text('Get Results'),
                          onPressed: () {
                            widget.nextQuestion();
                          })
                ],
              )
      ],
    );
  }
}
