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

  @override
  Widget build(BuildContext context) {
    var lesson = widget.currentLesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lesson['lessonName'],
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
              itemCount: lesson['slides'].length,
              loop: false,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: index < lesson['slides'].length - 1
                            // ? Container()
                            ? Image.asset(lesson['slides'][index]['image'])
                            : Text(
                                '',
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 70.0,
                          top: 20.0,
                          right: 70.0,
                          bottom: 20.0,
                        ),
                        child: Text(
                          lesson['slides'][index]['text'],
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xff5a3d2b),
                          ),
                        ),
                      ),
                      Center(
                        child: Visibility(
                          visible: index == lesson['slides'].length - 1,
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
                    color: Color(0xfff4a127), activeColor: Color(0xff75c8ae)),
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
