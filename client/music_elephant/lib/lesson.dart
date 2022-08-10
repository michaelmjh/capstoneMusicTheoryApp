import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  List<String> images = [
    "client/music_elephant/images/lessonImages/puppy1.png",
    "client/music_elephant/images/lessonImages/puppy2.png",
    "client/music_elephant/images/lessonImages/puppy3.png",
    "client/music_elephant/images/lessonImages/puppy4.png",
    "client/music_elephant/images/lessonImages/puppy5.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lesson'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Swiper(
        itemCount: images.length,
        loop: false,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(27.0),
            child: Image.asset(
              images[index],
            ),
          );
        },
        itemWidth: 200.00,
        itemHeight: 300.00,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
