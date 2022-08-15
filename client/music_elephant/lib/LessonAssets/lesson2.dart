// To parse this JSON data, do
//
//     final lesson2 = lesson2FromJson(jsonString);

import 'dart:convert';

List<Lesson2> lesson2FromJson(String str) =>
    List<Lesson2>.from(json.decode(str).map((x) => Lesson2.fromJson(x)));

String lesson2ToJson(List<Lesson2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lesson2 {
  Lesson2({
    required this.id,
    required this.lessonName,
    required this.slides,
    required this.level,
  });

  int id;
  String lessonName;
  List<Slide> slides;
  Level level;

  factory Lesson2.fromJson(Map<String, dynamic> json) => Lesson2(
        id: json["id"],
        lessonName: json["lessonName"],
        slides: List<Slide>.from(json["slides"].map((x) => Slide.fromJson(x))),
        level: Level.fromJson(json["level"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lessonName": lessonName,
        "slides": List<dynamic>.from(slides.map((x) => x.toJson())),
        "level": level.toJson(),
      };
}

class Level {
  Level({
    required this.id,
    required this.levelName,
  });

  int id;
  String levelName;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["id"],
        levelName: json["levelName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "levelName": levelName,
      };
}

class Slide {
  Slide({
    required this.id,
    required this.text,
    required this.image,
  });

  int id;
  String text;
  String image;

  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        id: json["id"],
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "image": image,
      };
}
