import 'package:flutter/material.dart';
import 'package:music_elephant/QuestionAssets/Enums/question_type.dart';
import 'package:music_elephant/Quiz/question_parent.dart';
import 'package:music_elephant/Quiz/question_widget2.dart';
// import 'package:music_elephant/answer.dart';
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

  QuestionContainer(this.question, this.submissionText, this.nextQuestion,
      this.final_question, this.increaseScore);

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

  void answerQuestion(answer) {
    submittedAnswers.add(answer);

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
            ? Row(children: [
                ...(widget.question.answerOptions as List).map((answer) {
                  return QuestionWidget2(answerQuestion, needsReset);
                }).toList(),
              ])
            : QuestionWidget(widget.question),
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
                        )
                      : Row(
                          children: [
                            ...(widget.question.answerOptions as List<Answer>)
                                .map((answer) {
                              return AnswerWidget(
                                  () => answerQuestion(answer),
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
