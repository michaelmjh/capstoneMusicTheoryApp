import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Journey extends StatefulWidget {
  var selectedProfile;
  final quizGenerator;

  Journey(this.selectedProfile, this.quizGenerator, {super.key});

  @override
  State<Journey> createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Elephant'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/users');
          },
          icon: Icon(Icons.group),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Scales 1"),
          onPressed: () {
            widget.quizGenerator();
            Navigator.pushNamed(context, '/landingpage');
          },
        ),
      ),
    );
  }
}
