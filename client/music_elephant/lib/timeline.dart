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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Timeline')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              _Timeline1(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Timeline1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = [
      {'title': 'Scales1', 'status': _TimelineStatus.done},
      {'title': 'Chords1', 'status': _TimelineStatus.done},
      {'title': 'Scales2', 'status': _TimelineStatus.todo},
      {'title': 'Scales2', 'status': _TimelineStatus.todo},
    ];
    var kTileHeight = 50.0;

    final data = list;

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
        // padding: EdgeInsets.symmetric(vertical: 20.0),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (_, __) => _EmptyContents(),
          connectorBuilder: (_, index, __) {
            if (index == 0) {
              return SolidLineConnector(color: Color(0xff6ad192));
            } else {
              return SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            switch (data[index]['status']) {
              case _TimelineStatus.done:
                return DotIndicator(
                  color: Color(0xff6ad192),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20.0,
                  ),
                );
              case _TimelineStatus.todo:
              default:
                return OutlinedDotIndicator(
                  color: Color(0xffbabdc0),
                  backgroundColor: Color(0xffe6e7e9),
                );
            }
          },
          itemExtentBuilder: (_, __) => 50.0,
          itemCount: data.length,
        ),
      ),
    );
  }
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      height: 20.0,
      child: Text('title'),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Color(0xffe6e7e9),
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  todo,
}
