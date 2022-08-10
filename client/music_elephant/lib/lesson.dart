import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

// ignore: prefer_const_constructors
var image1 = Image(
  image: AssetImage("client/music_elephant/images/lesson images/puppy1 .jpeg"),
);
var image2 = Image(
  image: AssetImage("client/music_elephant/images/lesson images/puppy2 .jpeg"),
);
var image3 = Image(
  image: AssetImage("client/music_elephant/images/lesson images/puppy3 .jpeg"),
);
var image4 = Image(
  image: AssetImage("client/music_elephant/images/lesson images/puppy4 .jpeg"),
);
var image5 = Image(
  image: AssetImage("client/music_elephant/images/lesson images/puppy5 .jpeg"),
);

List<Image> images = [image1, image2, image3, image4, image5];

class Lesson extends StatelessWidget {
  const Lesson({super.key});

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
        // itemBuilder: (BuildContext context, int index) {
        //   return Image.network(images);
        // },
        itemCount: 5,
        itemWidth: 300.00,
        itemHeight: 400.00,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
