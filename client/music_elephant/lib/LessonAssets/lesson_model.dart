import '../QuestionAssets/Enums/level.dart';

class Lesson {
  String name;
  List<LessonSlide> slides;
  Levelz level;

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
  Stave1,
  Scales2,
  Chords2,
  Scales3,
  Chords3,
  DummyBeginner,
  DummyIntermediate,
  DummyAdvanced,
  DummyBegEnd,
  DummyIntEnd,
  DummyAdvEnd
}

class LessonSlide {
  String text;
  String image;

  LessonSlide({required this.text, required this.image});
}
