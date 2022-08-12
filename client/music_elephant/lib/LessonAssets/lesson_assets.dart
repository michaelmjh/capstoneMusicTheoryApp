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

Lesson chords1 = Lesson(
    name: LessonName.Chords1,
    slides: [
      scalesSlide1,
      scalesSlide2,
      scalesSlide3,
      scalesSlide4,
      scalesSlide5,
      scalesSlide6,
      scalesSlide7
    ],
    level: Level.beginner);

Lesson scales2 =
    Lesson(name: LessonName.Scales2, slides: [], level: Level.intermediate);

Lesson chords2 =
    Lesson(name: LessonName.Chords2, slides: [], level: Level.intermediate);

Lesson scales3 =
    Lesson(name: LessonName.Scales3, slides: [], level: Level.advanced);

Lesson chords3 =
    Lesson(name: LessonName.Chords3, slides: [], level: Level.advanced);

class LessonData {
  static LessonData get shared => LessonData();

  List<Lesson> get allLessons =>
      [scales1, chords1, scales2, chords2, scales3, chords3];
}
