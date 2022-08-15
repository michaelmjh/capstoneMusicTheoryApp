import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Lesson extends StatefulWidget {
  final currentLesson;

  const Lesson(this.currentLesson, {super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  final controller = SwiperController();

  // List lessonSlides = [
  //   {
  //     'text':
  //         'Scales are the building blocks of Music. They will unlock a lot of tools for understanding music theory!\n\nFirst you need to know all the notes that exist; they are all shown above.',
  //     'image': 'images/lessonImages/scales_lesson_image_1.png'
  //   },
  //   {
  //     'text':
  //         'An easier way to look at it is to visualise a piano.\n\nEach key is a note and the distance between each key is known as a Half step.',
  //     'image': 'images/lessonImages/scales_lesson_image_2.png'
  //   },
  //   {
  //     'text':
  //         'There are only 12 notes to learn.\n\nSome notes have 2 names, for example A#, also known as Bb.\n\nThese are called “Enharmonic Equivalents” which is a fancy term for notes with 2 names.\n\nThe name of the note will depend on which key the music is written in.',
  //     'image': 'images/lessonImages/scales_lesson_image_2.png'
  //   },
  //   {
  //     'text':
  //         'Now to start we are going to look at Major Scales.\n\nAn easy way to remember the make up of a Major scale is:\n\n\nWhole, Whole, Half, Whole, Whole, Whole, Half\n\n\nThis refers to the distance between each note in the scale.\n\nA Whole Step is a jump of 2 notes and a Half Step is a jump of 1 note.',
  //     'image': 'images/lessonImages/scales_lesson_image_3.png'
  //   },
  //   {
  //     'text':
  //         'So if we apply that formula to figure out the C Major Scale, it would be as above.\n\nSo the notes of the C Major Scale are:\n\nC	D	E	F	G	A	B	C\n\nYou can use this method to figure out any key!\n\nJust pick the starting note of the key you want to know and follow the same structure.',
  //     'image': 'images/lessonImages/scales_lesson_image_4.png'
  //   },
  //   {
  //     'text':
  //         'As an example if we apply the same method to figure out G Major, it would look like the above.\n\nSo the notes of the G Major Scale are:\n\nG	A	B	C	D	E	F# G',
  //     'image': 'images/lessonImages/scales_lesson_image_5.png'
  //   },
  //   {'text': '', 'image': ''}
  // ];

  @override
  Widget build(BuildContext context) {
    var lesson = widget.currentLesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lesson.name.toString(),
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        foregroundColor: Color(0xffffecb4),
        backgroundColor: Color(0xffe5771e),
      ),
      body: Container(
        color: Color(0xffffecb4),
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Swiper(
              itemCount: lesson.slides.length,
              loop: false,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: index < lesson.slides.length - 1
                            ? Image.asset(lesson.slides[index].image)
                            : Text(''),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 70.0,
                          top: 20.0,
                          right: 70.0,
                          bottom: 20.0,
                        ),
                        child: Text(
                          lesson.slides[index].text,
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Center(
                        child: Visibility(
                          visible: index == lesson.slides.length - 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 380.0,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffe5771e),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Return to Lesson Page',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Color(0xffffecb4),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
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
                builder: const DotSwiperPaginationBuilder(
                    color: Color(0xffe5771e), activeColor: Color(0xff75c8ae)),
              ),
              control: const SwiperControl(
                  iconNext: Icons.arrow_forward,
                  iconPrevious: Icons.arrow_back,
                  color: Color(0xff75c8ae)),
            ),
          ],
        ),
      ),
    );
  }
}
