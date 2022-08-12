import '../QuestionAssets/Enums/level.dart';

class Lesson {
  LessonName name;
  List<LessonSlide> slides;
  Level level;

  Lesson({
    required this.name,
    required this.slides,
    required this.level,
  });
}

enum LessonName {
  Scales1,
  Chords1,
  KeySignatures1,
  Stave1;
}

class LessonSlide {
  Lesson lesson;
  String text;
  String image;

  LessonSlide({required this.lesson, required this.text, required this.image});
}
