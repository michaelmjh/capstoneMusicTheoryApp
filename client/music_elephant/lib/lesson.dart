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
            child: Image.asset(images[index]),
          );
        },
        itemWidth: 200.00,
        itemHeight: 300.00,
        layout: SwiperLayout.STACK,
        pagination: const SwiperPagination(
            alignment: Alignment.topCenter, builder: SwiperPagination.dots),
        control: const SwiperControl(
            iconNext: Icons.arrow_forward, iconPrevious: Icons.arrow_back),
      ),
      // ListTile(
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       Expanded(
      //         child: ElevatedButton(
      //           onPressed: nextPage,
      //           child: const Text('next page'),
      //         ),
      //       ),
      //       Expanded(
      //         child: ElevatedButton(
      //           onPressed: SwiperController( nextPage({bool animation: true}),),
      //           child: const Text('previous page'),
      //         ),
      //       ),
      //     ],
      //   ),
      // ],
    );
  }
}
