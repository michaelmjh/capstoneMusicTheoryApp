import 'package:flutter/material.dart';

class Journey extends StatefulWidget {
  final quizGenerator;

  const Journey(this.quizGenerator, {super.key});

  @override
  State<Journey> createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music Elephant')),
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
