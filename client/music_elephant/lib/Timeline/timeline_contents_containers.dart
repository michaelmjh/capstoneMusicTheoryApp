import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../QuestionAssets/Enums/difficulty.dart';

class ContentsBeginner extends StatelessWidget {
  final listItem;
  final userProgress;

  const ContentsBeginner(this.listItem, this.userProgress);

  @override
  Widget build(BuildContext context) {
    var currentDiff = null;

    if (userProgress.containsKey(listItem)) {
      currentDiff = userProgress[listItem];
    }

    if (listItem.name == "DummyBeginner") {
      return Container(
          height: 40.0,
          margin: EdgeInsets.only(left: 10.0),
          child: Text("Beginner Lessons", style: TextStyle(fontSize: 25.0)));
    } else {
      return Card(
        margin: EdgeInsets.all(40.0),
        color: Color.fromARGB(255, 206, 199, 199),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Color.fromARGB(255, 111, 109, 109),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              listItem.name.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (__) {
                    if (currentDiff == null || currentDiff == Difficulty.easy) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.hard ||
                        currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    } else if (currentDiff == Difficulty.completed) {
                      return Text('Lesson complete!');
                    } else {
                      return Icon(Icons.star_border_outlined);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(
                        Icons.star_border_outlined,
                      );
                    }
                  })
                ]),
          ],
        ),
      );
    }
  }
}

class ContentsIntermediate extends StatelessWidget {
  final listItem;
  final userProgress;

  const ContentsIntermediate(this.listItem, this.userProgress);

  @override
  Widget build(BuildContext context) {
    var currentDiff = null;

    if (userProgress.containsKey(listItem)) {
      currentDiff = userProgress[listItem];
    }

    if (listItem.name == "DummyIntermediate") {
      return Container(
          height: 40.0,
          margin: EdgeInsets.only(left: 10.0),
          child:
              Text("Intermediate Lessons", style: TextStyle(fontSize: 25.0)));
    } else {
      return Card(
        margin: EdgeInsets.all(40.0),
        color: Color.fromARGB(255, 206, 199, 199),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Color.fromARGB(255, 111, 109, 109),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              listItem.name.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (__) {
                    if (currentDiff == null || currentDiff == Difficulty.easy) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.hard ||
                        currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    } else if (currentDiff == Difficulty.completed) {
                      return Text('Lesson complete!');
                    } else {
                      return Icon(Icons.star_border_outlined);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(
                        Icons.star_border_outlined,
                      );
                    }
                  })
                ]),
          ],
        ),
      );
    }
  }
}

class ContentsAdvanced extends StatelessWidget {
  final listItem;
  final userProgress;

  const ContentsAdvanced(this.listItem, this.userProgress);

  @override
  Widget build(BuildContext context) {
    var currentDiff = null;

    if (userProgress.containsKey(listItem)) {
      currentDiff = userProgress[listItem];
    }

    if (listItem.name == "DummyAdvanced") {
      return Container(
          height: 40.0,
          margin: EdgeInsets.only(left: 10.0),
          child: Text("Advanced Lessons", style: TextStyle(fontSize: 25.0)));
    } else {
      return Card(
        margin: EdgeInsets.all(40.0),
        color: Color.fromARGB(255, 206, 199, 199),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Color.fromARGB(255, 111, 109, 109),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              listItem.name.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (__) {
                    if (currentDiff == null || currentDiff == Difficulty.easy) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.hard ||
                        currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined,
                          color: Colors.yellow);
                    } else if (currentDiff == Difficulty.completed) {
                      return Text('Lesson complete!');
                    } else {
                      return Icon(Icons.star_border_outlined);
                    }
                  }),
                  Builder(builder: (__) {
                    if (currentDiff == Difficulty.revision) {
                      return Icon(Icons.star_border_outlined);
                    } else if (currentDiff == Difficulty.completed) {
                      return Container();
                    } else {
                      return Icon(
                        Icons.star_border_outlined,
                      );
                    }
                  })
                ]),
          ],
        ),
      );
    }
  }
}

class ContentsBoss extends StatelessWidget {
  final listItem;
  final userProgress;

  const ContentsBoss(this.listItem, this.userProgress);

  @override
  Widget build(BuildContext context) {
    var currentDiff = null;

    if (userProgress.containsKey(listItem)) {
      currentDiff = userProgress[listItem];
    }

    return Card(
      margin: EdgeInsets.all(40.0),
      color: Color.fromARGB(255, 206, 199, 199),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Color.fromARGB(255, 111, 109, 109),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Boss Level!",
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}