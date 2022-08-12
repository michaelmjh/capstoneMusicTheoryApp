import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:music_elephant/journey.dart';
import 'package:music_elephant/landing_page.dart';
// import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart';

import 'dart:math';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  var kTileHeight = 50.0;

  var list = [
    {'title': 'Scales1', 'status': _TimelineStatus.done, 'level': 'beginner'},
    {'title': 'Chords1', 'status': _TimelineStatus.done, 'level': 'beginner'},
    {
      'title': 'Scales2',
      'status': _TimelineStatus.todo,
      'level': 'intermediate'
    },
    {
      'title': 'Chords2',
      'status': _TimelineStatus.todo,
      'level': 'intermediate'
    },
    {'title': 'Scales3', 'status': _TimelineStatus.todo, 'level': 'advanced'},
    {'title': 'Chords3', 'status': _TimelineStatus.todo, 'level': 'advanced'},
  ];

  var begList = [];
  var intList = [];
  var advList = [];
  var newList = [];

  void getLevels() {
    for (var item in list) {
      if (item['level'] == 'beginner') {
        begList.add(item);
      } else if (item['level'] == 'intermediate') {
        intList.add(item);
      } else if (item['level'] == 'advanced') {
        advList.add(item);
      }
    }
  }

  void setNewList() {
    begList
        .insert(0, {'title': 'Beginner', 'status': null, 'level': 'beginner'});
    begList.add({'title': 'beg_end', 'status': null, 'level': 'beginner'});
    intList.insert(
        0, {'title': 'Intermediate', 'status': null, 'level': 'intermediate'});
    intList.add({'title': 'int_end', 'status': null, 'level': 'intermediate'});
    advList
        .insert(0, {'title': 'Advanced', 'status': null, 'level': 'advanced'});
    advList.add({'title': 'adv_end', 'status': null, 'level': 'advanced'});
    for (var item in begList) {
      newList.add(item);
    }
    for (var item in intList) {
      newList.add(item);
    }
    for (var item in advList) {
      newList.add(item);
    }
    // print(newList);
  }

  @override
  Widget build(BuildContext context) {
    getLevels();
    setNewList();
    return Scaffold(
      appBar: AppBar(title: Text('User Timeline')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                _Timeline1(list, getLevels, setNewList, newList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Timeline1 extends StatelessWidget {
  final list;
  final getLevels;
  final setNewList;
  final newList;

  const _Timeline1(this.list, this.getLevels, this.setNewList, this.newList);

  @override
  Widget build(BuildContext context) {
    final data = newList;

    return Flexible(
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0.05,
          connectorTheme: ConnectorThemeData(
            thickness: 8.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: IndicatorThemeData(
            size: 45.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (context, index) {
            if (data[index]['level'] == 'beginner') {
              return _EmptyContentsBeginner(data[index]);
            } else if (data[index]['level'] == 'intermediate') {
              return _EmptyContentsInt(data[index]);
            } else if (data[index]['level'] == 'advanced') {
              return _EmptyContentsAdv(data[index]);
            }
          },
          connectorBuilder: (_, index, __) {
            if (index == 0) {
              return SolidLineConnector(color: Color(0xff6ad192));
            } else {
              return SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            if (data[index]['title'] == 'Beginner') {
              return DotIndicator(color: Colors.yellow);
            } else if (data[index]['title'] == 'beg_end') {
              return null;
            } else if (data[index]['title'] == 'Intermediate') {
              return DotIndicator(color: Colors.orange);
            } else {
              switch (data[index]['status']) {
                case _TimelineStatus.done:
                  return DotIndicator(
                    color: Color(0xff6ad192),
                    child: ElevatedButton(
                      child: Icon(Icons.star),
                      onPressed: () {
                        Navigator.pushNamed(context, '/landingpage');
                      },
                    ),
                  );
                case _TimelineStatus.todo:
                default:
                  return OutlinedDotIndicator(
                    color: Color(0xffbabdc0),
                    backgroundColor: Color(0xffe6e7e9),
                  );
              }
            }
          },
          itemExtentBuilder: (_, __) => 200.0,
          itemCount: data.length,
        ),
      ),
    );
  }
}

class _EmptyContentsBeginner extends StatelessWidget {
  final listItem;

  const _EmptyContentsBeginner(this.listItem);

  @override
  Widget build(BuildContext context) {
    if (listItem['title'] == 'Beginner') {
      return Container(
          height: 40.0,
          child: Text(listItem['title'], style: TextStyle(fontSize: 30.0)));
    } else if (listItem['title'] == 'beg_end') {
      return Divider(color: Colors.black, indent: 20.0, endIndent: 20.0);
    } else {
      return Container(
        margin: EdgeInsets.only(left: 10.0),
        height: 40.0,
        child: Text(listItem['title'], style: TextStyle(fontSize: 20.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.blue,
        ),
      );
    }
  }
}

class _EmptyContentsInt extends StatelessWidget {
  final listItem;

  const _EmptyContentsInt(this.listItem);

  @override
  Widget build(BuildContext context) {
    if (listItem['title'] == 'Intermediate') {
      return Container(
          height: 40.0,
          child: Text(listItem['title'], style: TextStyle(fontSize: 30.0)));
    } else if (listItem['title'] == 'int_end') {
      return Divider(color: Colors.black, indent: 20.0, endIndent: 20.0);
    } else {
      return Container(
        margin: EdgeInsets.only(left: 10.0),
        height: 40.0,
        child: Text(listItem['title'], style: TextStyle(fontSize: 20.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.red,
        ),
      );
    }
  }
}

class _EmptyContentsAdv extends StatelessWidget {
  final listItem;

  const _EmptyContentsAdv(this.listItem);

  @override
  Widget build(BuildContext context) {
    if (listItem['title'] == 'Advanced') {
      return Container(
          height: 40.0,
          child: Text(listItem['title'], style: TextStyle(fontSize: 30.0)));
    } else if (listItem['title'] == 'adv_end') {
      return Divider(color: Colors.black, indent: 20.0, endIndent: 20.0);
    } else {
      return Container(
        margin: EdgeInsets.only(left: 10.0),
        height: 40.0,
        child: Text(listItem['title'], style: TextStyle(fontSize: 20.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.purple,
        ),
      );
    }
  }
}

enum _TimelineStatus {
  done,
  todo,
}
