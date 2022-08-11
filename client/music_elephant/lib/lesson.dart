import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  List images = [
    "images/lessonImages/puppy1.png",
    "images/lessonImages/puppy2.png",
    "images/lessonImages/puppy3.png",
    "images/lessonImages/puppy4.png"
  ];

  List lessonSlides = [
    {
      'text':
          'Scales are the building blocks of Music. They will unlock a lot of tools for understanding music theory! First you need to know all the notes that exist; they are listed below.',
      'image': 'images/missing_note.jpg'
    },
    {
      'text':
          'An easier way to look at it could to visualise a piano over 2 octaves. Each key on the piano is a note and the distance between each key is known as a Half step.',
      'image': 'images/missing_note2'
    }
  ];

  final controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lesson'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      // body: Column(
      //   children: [
      body: Swiper(
        itemCount: images.length,
        loop: false,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(27.0),
              // child: Image.asset(images[index]),
              child: Column(
                children: [
                  Text(lessonSlides[index]['text']),
                  // Image.asset(lessonSlides[index]['image']),
                ],
              ));
        },
        itemWidth: 200.00,
        itemHeight: 300.00,
        layout: SwiperLayout.STACK,
        pagination: const SwiperPagination(
            alignment: Alignment.topCenter, builder: SwiperPagination.dots),
        control: const SwiperControl(
            iconNext: Icons.arrow_forward, iconPrevious: Icons.arrow_back),
      ),
    );
  }
}
