import 'package:music_elephant/QuestionAssets/Enums/answer_type.dart';

import 'answer_model.dart';

Answer a = Answer(
  text: 'A',
  type: AnswerType.singleNote,
);

Answer aFlat = Answer(
  text: 'Ab',
  type: AnswerType.singleNote,
);

Answer aSharp = Answer(
  text: 'A#',
  type: AnswerType.singleNote,
);

Answer b = Answer(
  text: 'B',
  type: AnswerType.singleNote,
);

Answer bFlat = Answer(
  text: 'Bb',
  type: AnswerType.singleNote,
);

Answer c = Answer(
  text: 'C',
  type: AnswerType.singleNote,
);

Answer cSharp = Answer(
  text: 'C#',
  type: AnswerType.singleNote,
);

Answer d = Answer(
  text: 'D',
  type: AnswerType.singleNote,
);

Answer dFlat = Answer(
  text: 'Db',
  type: AnswerType.singleNote,
);

Answer dSharp = Answer(
  text: 'D#',
  type: AnswerType.singleNote,
);

Answer e = Answer(
  text: 'E',
  type: AnswerType.singleNote,
);

Answer eFlat = Answer(
  text: 'Eb',
  type: AnswerType.singleNote,
);
Answer f = Answer(
  text: 'F',
  type: AnswerType.singleNote,
);

Answer fSharp = Answer(
  text: 'F#',
  type: AnswerType.singleNote,
);

Answer g = Answer(
  text: 'G',
  type: AnswerType.singleNote,
);

Answer gFlat = Answer(
  text: 'Gb',
  type: AnswerType.singleNote,
);

Answer gSharp = Answer(
  text: 'G#',
  type: AnswerType.singleNote,
);

class AnswerData {
  static AnswerData get shared => AnswerData();

  List<Answer> get answers => [
        a,
        aFlat,
        aSharp,
        b,
        bFlat,
        c,
        cSharp,
        d,
        dFlat,
        dSharp,
        e,
        eFlat,
        f,
        fSharp,
        g,
        gFlat,
        gSharp,
      ];
}
