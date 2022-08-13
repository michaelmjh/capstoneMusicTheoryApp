import 'package:music_elephant/LessonAssets/lesson_slides.dart';

import '../QuestionAssets/Enums/level.dart';
import 'lesson_model.dart';

Lesson scales1 = Lesson(
  name: "Scales 1",
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
    name: "Chords 1",
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
    Lesson(name: "Scales 2", slides: [], level: Level.intermediate);

Lesson chords2 =
    Lesson(name: "Chords 2", slides: [], level: Level.intermediate);

Lesson scales3 = Lesson(name: "Scales 3", slides: [], level: Level.advanced);

Lesson chords3 = Lesson(name: "Chords 3", slides: [], level: Level.advanced);

Lesson dummyBeg =
    Lesson(name: "DummyBeginner", slides: [], level: Level.beginner);
Lesson dummyInt =
    Lesson(name: "DummyIntermediate", slides: [], level: Level.intermediate);
Lesson dummyAdv =
    Lesson(name: "DummyAdvanced", slides: [], level: Level.advanced);

Lesson begBoss = Lesson(name: "BeginnerBoss", slides: [], level: Level.boss);
Lesson intBoss =
    Lesson(name: "IntermediateBoss", slides: [], level: Level.boss);
Lesson advBoss = Lesson(name: "AdvancedBoss", slides: [], level: Level.boss);

class LessonData {
  static LessonData get shared => LessonData();

  List<Lesson> get allLessons =>
      [scales1, chords1, scales2, chords2, scales3, chords3];
}
