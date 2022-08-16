import 'package:flutter/material.dart';

class AnswerWidget extends StatefulWidget {
  final selectHandler;
  final answer;
  final clearAnswer;
  final disabled;
  final answerList;
  final correctAnswers;

  AnswerWidget(this.selectHandler, this.answer, this.clearAnswer, this.disabled,
      this.answerList, this.correctAnswers);

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: isSelected
            ? ElevatedButton.styleFrom(
                primary: Color(0xff75c8ae),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              )
            : ElevatedButton.styleFrom(
                primary: Color(0xffe5771e),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
        onPressed: widget.disabled
            ? () => {
                  if (widget.answerList.contains(widget.answer))
                    {
                      isSelected = !isSelected,
                      widget.clearAnswer(),
                    }
                }
            : () => {
                  setState(
                    () {
                      isSelected = !isSelected;
                      if (isSelected) {
                        widget.selectHandler();
                      } else {
                        widget.clearAnswer();
                      }
                    },
                  ),
                },
        child: Text(
          widget.answer,
          style: TextStyle(
            fontSize: 32,
            color: Color(0xffffecb4),
          ),
        ),
      ),
    );
  }
}
