import 'package:music_elephant/LessonAssets/lesson_slides.dart';

import '../QuestionAssets/Enums/level.dart';
import 'lesson_model.dart';

Lesson scales1 = Lesson(
  name: LessonName.Scales1,
  slides: [
    scalesSlide1,
    scalesSlide2,
    scalesSlide3,
    scalesSlide4,
    scalesSlide5,
    scalesSlide6,
    scalesSlide7
  ],
  level: Level.beginner,
);

class LessonData {
  static LessonData get shared => LessonData();

  List<Lesson> get allLessons => [
        scales1,
      ];
}
