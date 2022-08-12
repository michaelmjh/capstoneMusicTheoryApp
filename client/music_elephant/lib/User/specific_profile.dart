import 'package:flutter/material.dart';

class SpecificProfile extends StatefulWidget {
  var selectedProfile;

  SpecificProfile(this.selectedProfile);

  @override
  State<SpecificProfile> createState() => _SpecificProfileState();
}

class _SpecificProfileState extends State<SpecificProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedProfile),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: (ElevatedButton(
          child: Text("Start Learning"),
          onPressed: () {
            Navigator.pushNamed(context, '/journey');
          },
        )),
      ),
    );
  }
}
