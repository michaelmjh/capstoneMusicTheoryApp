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
    if (deepEq(submittedAnswers, widget.question['answerAssets'])) {
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
    for (var i = 0; i < question['answerAssets'].length; i++) {
      if (submittedAnswers.length != question['answerAssets'].length) {
        submittedAnswers.add("");
      }
    }
  }

// this function adds answers to the above list at an index that matches
// the correct answer list, if ths answer exists in that list
  void answerQuestion(answer, question) {
    var index;
    if (question['answerAssets'].contains(answer)) {
      index = question['answerAssets'].indexOf(answer);
      submittedAnswers[index] = answer;
    }
    if (submittedAnswers.length == widget.question['answerAssets']!.length) {
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
        widget.question['questionType'] == "ARRANGE"
            ? Builder(
                builder: (__) {
                  createEmptyAnswerList(widget.question);
                  return Column(
                    children: [
                      Container(
                        child: Text(
                          widget.question['questionAssets'][1],
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Color(0xff5a3d2b),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.only(top: 15.0),
                      ),
                      Container(
                          child: Text(
                            "(Drag the letters into the boxes)",
                            style: TextStyle(
                              fontSize: 32.0,
                              color: Color(0xff5a3d2b),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          margin: EdgeInsets.only(top: 5.0, bottom: 15.0)),
                      Row(
                        children: [
                          ...(widget.question['answerOptions'] as List)
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
                return QuestionWidget(widget.question);
              }),
        !isSubmitted
            ? Column(
                children: [
                  widget.question['questionType'] == "ARRANGE"
                      ? Row(
                          children: [
                            ...(widget.question['answerOptions'] as List)
                                .map((answer) {
                              return AnswerWidget2(answer);
                            }).toList(),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                      : Column(
                          children: [
                            ...(widget.question['answerOptions'] as List)
                                .map((answer) {
                              return AnswerWidget(
                                  () => answerQuestion(answer, widget.question),
                                  answer,
                                  clearAnswer,
                                  disabled,
                                  submittedAnswers,
                                  widget.question['answerAssets']);
                            }).toList(),
                          ],
                        ),
                  Visibility(
                    visible: isSelected,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffffecb4),
                            ),
                          ),
                        ),
                        onPressed: () {
                          submit();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffe5771e),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Text(widget.submissionText),
                  ...(widget.question['answerAssets] as List<Answer>).map(
                    (answer) {
                      return Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            answer,
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffffecb4),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe5771e),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  !widget.final_question
                      ? Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.nextQuestion();
                              reset();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffe5771e),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Next Question",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Color(0xffffecb4),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.nextQuestion();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffe5771e),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: const Text(
                              "Get Results",
                              style: TextStyle(
                                fontSize: 32,
                                color: Color(0xffffecb4),
                              ),
                            ),
                          ),
                        ),
                ],
              )
      ],
    );
  }
}
