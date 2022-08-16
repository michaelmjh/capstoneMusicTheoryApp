import 'package:flutter/material.dart';

class SpecificProfile extends StatefulWidget {
  var selectedProfile;
  final getLevels;
  final setTimelineLessonList;

  SpecificProfile(
      this.selectedProfile, this.getLevels, this.setTimelineLessonList);

  @override
  State<SpecificProfile> createState() => _SpecificProfileState();
}

class _SpecificProfileState extends State<SpecificProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xffffecb4),
        backgroundColor: Color(0xffe5771e),
      ),
      body: Container(
        color: Color(0xffffecb4),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  color: Color(0xffe5771e),
                  elevation: 10,
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Color(0xffe5771e),
                          width: 6,
                        ),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage(
                              "images/profiles/michael.png",
                            ),
                            height: 300,
                            width: 300,
                          ),
                          SizedBox(height: 6),
                          Text(
                            widget.selectedProfile,
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffffecb4),
                            ),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(70.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Color(0xffe5771e),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(32), // Background color
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Begin Learning',
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffffecb4),
                            ),
                          ),
                        ),
                        onPressed: () {
                          widget.getLevels();
                          widget.setTimelineLessonList();
                          Navigator.pushNamed(context, '/timeline');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(70.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffe5771e),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffffecb4),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/journey');
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                "images/us.jpg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
