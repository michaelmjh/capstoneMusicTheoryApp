import 'package:music_elephant/LessonAssets/lesson_slides.dart';

import '../QuestionAssets/Enums/level.dart';
import 'lesson_model.dart';

Lesson scales1 = Lesson(
  name: "scales1",
  slides: [
    scalesSlide1,
    scalesSlide2,
    scalesSlide3,
    scalesSlide4,
    scalesSlide5,
    scalesSlide6,
    scalesSlide7
  ],
  level: Levelz.beginner,
);

Lesson chords1 = Lesson(
    name: "chords1",
    slides: [
      scalesSlide6,
      scalesSlide5,
      scalesSlide4,
      scalesSlide3,
      scalesSlide2,
      scalesSlide1
    ],
    level: Levelz.beginner);

Lesson scales2 = Lesson(
    name: "scales2",
    slides: [
      scalesSlide2,
      scalesSlide3,
      scalesSlide4,
      scalesSlide5,
      scalesSlide6,
      scalesSlide1
    ],
    level: Levelz.intermediate);

Lesson chords2 =
    Lesson(name: "chords2", slides: [], level: Levelz.intermediate);

Lesson scales3 = Lesson(
    name: "scales3",
    slides: [
      scalesSlide3,
      scalesSlide4,
      scalesSlide5,
      scalesSlide6,
      scalesSlide1,
      scalesSlide2
    ],
    level: Levelz.advanced);

Lesson chords3 = Lesson(name: "chords3", slides: [], level: Levelz.advanced);

Lesson dummyBeg =
    Lesson(name: "DummyBeginner", slides: [], level: Levelz.beginner);
Lesson dummyInt =
    Lesson(name: "DummyIntermediate", slides: [], level: Levelz.intermediate);
Lesson dummyAdv =
    Lesson(name: "DummyAdvanced", slides: [], level: Levelz.advanced);

Lesson begBoss =
    Lesson(name: "BeginnerBoss", slides: [], level: Levelz.beginner);
Lesson intBoss =
    Lesson(name: "IntermediateBoss", slides: [], level: Levelz.intermediate);
Lesson advBoss =
    Lesson(name: "AdvancedBoss", slides: [], level: Levelz.advanced);

class LessonData {
  static LessonData get shared => LessonData();

  List<Lesson> get allLessons =>
      [scales1, chords1, scales2, chords2, scales3, chords3];
}
