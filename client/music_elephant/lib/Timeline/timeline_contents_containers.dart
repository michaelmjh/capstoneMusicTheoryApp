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
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Image.asset(
            "images/logo/listBeg.png",
            height: 125,
          ),
        ),
      );
    } else {
      // The code for ContentsCard starts on line 115 of this file!
      return ContentsCard(listItem, currentDiff);
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
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Image.asset(
            "images/logo/listInt.png",
            height: 125,
          ),
        ),
      );
    } else {
      // The code for ContentsCard starts on line 115 of this file!
      return ContentsCard(listItem, currentDiff);
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
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Image.asset(
            "images/logo/listAdv.png",
            height: 125,
          ),
        ),
      );
    } else {
      // The code for ContentsCard starts on line 115 of this file!
      return ContentsCard(listItem, currentDiff);
    }
  }
}

class ContentsBoss extends StatelessWidget {
  final listItem;
  final userProgress;

  const ContentsBoss(this.listItem, this.userProgress);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40.0),
      color: Color(0xff75c8ae),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Color(0xff75c8ae),
          )),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: const [
                  Text(
                    'Test Your Skills',
                    style: TextStyle(
                        fontSize: 50,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffecb4),
                        shadows: [
                          Shadow(
                            color: Color(0xff5a3d2b),
                            blurRadius: 30,
                          ),
                        ]),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

class ContentsCard extends StatelessWidget {
  final listItem;
  final currentDiff;

  const ContentsCard(this.listItem, this.currentDiff);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40.0),
      color: Color(0xffe5771e),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Color(0xffe5771e),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            listItem.name.toString(),
            style: TextStyle(
                fontSize: 32.0,
                color: Color(0xffffecb4),
                fontWeight: FontWeight.bold),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(builder: (__) {
                  if (currentDiff == null || currentDiff == Difficulty.easy) {
                    return Icon(
                      Icons.star_border_outlined,
                      color: Color(0xffffecb4),
                    );
                  } else if (currentDiff == Difficulty.completed) {
                    return Container();
                  } else {
                    return Icon(
                      Icons.star,
                      color: Color(0xffffecb4),
                    );
                  }
                }),
                Builder(builder: (__) {
                  if (currentDiff == Difficulty.hard ||
                      currentDiff == Difficulty.revision) {
                    return Icon(
                      Icons.star,
                      color: Color(0xffffecb4),
                    );
                  } else if (currentDiff == Difficulty.completed) {
                    return Text('Lesson complete!');
                  } else {
                    return Icon(
                      Icons.star_border_outlined,
                      color: Color(0xffffecb4),
                    );
                  }
                }),
                Builder(builder: (__) {
                  if (currentDiff == Difficulty.revision) {
                    return Icon(
                      Icons.star,
                      color: Color(0xffffecb4),
                    );
                  } else if (currentDiff == Difficulty.completed) {
                    return Container();
                  } else {
                    return Icon(
                      Icons.star_border_outlined,
                      color: Color(0xffffecb4),
                    );
                  }
                })
              ]),
        ],
      ),
    );
  }
}
