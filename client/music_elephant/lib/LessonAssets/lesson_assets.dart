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
  level: Level.beginner,
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
    level: Level.beginner);

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
    level: Level.intermediate);

Lesson chords2 = Lesson(name: "chords2", slides: [], level: Level.intermediate);

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
    level: Level.advanced);

Lesson chords3 = Lesson(name: "chords3", slides: [], level: Level.advanced);

Lesson dummyBeg =
    Lesson(name: "DummyBeginner", slides: [], level: Level.beginner);
Lesson dummyInt =
    Lesson(name: "DummyIntermediate", slides: [], level: Level.intermediate);
Lesson dummyAdv =
    Lesson(name: "DummyAdvanced", slides: [], level: Level.advanced);

Lesson begBoss =
    Lesson(name: "BeginnerBoss", slides: [], level: Level.beginner);
Lesson intBoss =
    Lesson(name: "IntermediateBoss", slides: [], level: Level.intermediate);
Lesson advBoss =
    Lesson(name: "AdvancedBoss", slides: [], level: Level.advanced);

class LessonData {
  static LessonData get shared => LessonData();

  List<Lesson> get allLessons =>
      [scales1, chords1, scales2, chords2, scales3, chords3];
}
