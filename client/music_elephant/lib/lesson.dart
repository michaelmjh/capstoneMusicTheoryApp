import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  // List images = [
  //   "images/lessonImages/puppy1.png",
  //   "images/lessonImages/puppy2.png",
  //   "images/lessonImages/puppy3.png",
  //   "images/lessonImages/puppy4.png"
  // ];

  List lessonSlides = [
    {
      'text':
          'Scales are the building blocks of Music. They will unlock a lot of tools for understanding music theory!\n\nFirst you need to know all the notes that exist; they are all shown above.',
      'image': 'images/lessonImages/scales_lesson_image_1.png'
    },
    {
      'text':
          'An easier way to look at it is to visualise a piano.\n\nEach key is a note and the distance between each key is known as a Half step.',
      'image': 'images/lessonImages/scales_lesson_image_2.png'
    },
    {
      'text':
          'There are only 12 notes to learn.\n\nSome notes have 2 names, for example A#, also known as Bb.\n\nThese are called “Enharmonic Equivalents” which is a fancy term for notes with 2 names.\n\nThe name of the note will depend on which key the music is written in.',
      'image': 'images/lessonImages/scales_lesson_image_2.png'
    },
    {
      'text':
          'Now to start we are going to look at Major Scales.\n\nAn easy way to remember the make up of a Major scale is:\n\n\nWhole, Whole, Half, Whole, Whole, Whole, Half\n\n\nThis refers to the distance between each note in the scale.\n\nA Whole Step is a jump of 2 notes and a Half Step is a jump of 1 note.',
      'image': 'images/lessonImages/scales_lesson_image_3.png'
    },
    {
      'text':
          'So if we apply that formula to figure out the C Major Scale, it would be as above.\n\nSo the notes of the C Major Scale are:\n\nC	D	E	F	G	A	B	C\n\nYou can use this method to figure out any key!\n\nJust pick the starting note of the key you want to know and follow the same structure.',
      'image': 'images/lessonImages/scales_lesson_image_4.png'
    },
    {
      'text':
          'As an example if we apply the same method to figure out G Major, it would look like the above.\n\nSo the notes of the G Major Scale are:\n\nG	A	B	C	D	E	F# G',
      'image': 'images/lessonImages/scales_lesson_image_5.png'
    },
    {'text': '', 'image': ''}
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
      body: Stack(
        children: [
          Swiper(
            itemCount: lessonSlides.length,
            loop: false,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Column(
                  children: [
                    Text('Scales Lesson 1',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: index < lessonSlides.length - 1
                          ? Image.asset(lessonSlides[index]['image'])
                          : Text(''),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        lessonSlides[index]['text'],
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child:
                          Text('Slide ${index + 1} of ${lessonSlides.length}'),
                    ),
                    Visibility(
                      visible: index == lessonSlides.length - 1,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Return to Lesson Page'),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemWidth: 200.00,
            itemHeight: 300.00,
            layout: SwiperLayout.DEFAULT,
            pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: SwiperPagination.dots),
            control: const SwiperControl(
                iconNext: Icons.arrow_forward, iconPrevious: Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
