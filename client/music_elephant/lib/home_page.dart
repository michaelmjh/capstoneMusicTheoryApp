import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music Elephant')),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/journey');
              },
              child: const Text('Journey'),
            ),
            ElevatedButton(
              child: Text('Timeline'),
              onPressed: () {
                Navigator.pushNamed(context, '/timeline');
              },
            )
          ],
        ),
      ),
    );
  }
}
