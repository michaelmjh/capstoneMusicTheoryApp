import 'package:flutter/material.dart';

import 'QuestionAssets/question_assets.dart';

class QuestionParent2 extends StatefulWidget {
  const QuestionParent2({super.key});

  @override
  State<QuestionParent2> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionParent2> {
  final question = question3;

  void answerQuestion(answer) {
    null;
  }

  void updateDroppedItems(data) {
    print(data);
    if (data == answerOptions[0]) {
      _firstDropped = true;
    } else if (data == answerOptions[1]) {
      _secondDropped = true;
    } else if (data == answerOptions[2]) {
      _thirdDropped = true;
    } else if (data == answerOptions[3]) {
      _fourthDropped = true;
    }
  }

  var answerOptions = ["A", "B", "C", "D"];

  var _droppedInFirstPosition = false;
  var _droppedInSecondPosition = false;
  var _droppedInThirdPosition = false;
  var _droppedInFourthPosition = false;
  var _firstDropped = false;
  var _secondDropped = false;
  var _thirdDropped = false;
  var _fourthDropped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DragTarget<String>(
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Container(
                      height: 120.0,
                      width: 120.0,
                      child: Center(
                        child: Text(_droppedInFirstPosition ? 'filled' : ' '),
                      ),
                    );
                  },
                  onAccept: (data) {
                    setState(() {
                      updateDroppedItems(data);
                      _droppedInFirstPosition = true;
                    });
                  },
                ),
              ),
              Expanded(
                child: DragTarget<String>(
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Container(
                      child: Center(
                        child: Image.asset(_droppedInSecondPosition
                            ? 'images/dog-png-30.png'
                            : 'images/Square.png'),
                      ),
                    );
                  },
                  onAccept: (data) {
                    setState(() {
                      updateDroppedItems(data);
                      _droppedInSecondPosition = true;
                    });
                  },
                ),
              ),
              Expanded(
                child: DragTarget<String>(
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Container(
                      child: Center(
                        child: Image.asset(_droppedInThirdPosition
                            ? 'images/dog-png-30.png'
                            : 'images/Square.png'),
                      ),
                    );
                  },
                  onAccept: (data) {
                    setState(() {
                      updateDroppedItems(data);
                      _droppedInThirdPosition = true;
                    });
                  },
                ),
              ),
              Expanded(
                child: DragTarget<String>(
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Container(
                      child: Center(
                        child: Image.asset(_droppedInFourthPosition
                            ? 'images/dog-png-30.png'
                            : 'images/Square.png'),
                      ),
                    );
                  },
                  onAccept: (data) {
                    setState(() {
                      updateDroppedItems(data);
                      _droppedInFourthPosition = true;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: answerOptions.map((option) {
              return (Visibility(
                visible: !_firstDropped,
                child: Expanded(
                  child: Draggable<String>(
                    data: option,
                    child: Container(
                      color: Colors.blue,
                      height: 120.0,
                      width: 120.0,
                      child: Center(
                        child: Text(
                          option,
                        ),
                      ),
                    ),
                    feedback: Container(
                      height: 120.0,
                      width: 120.0,
                      child: Center(
                        child: Text(
                          option,
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
                      height: 120.0,
                      width: 120.0,
                      child: Center(
                        child: Icon(Icons.cancel_presentation_outlined),
                      ),
                    ),
                  ),
                ),
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
