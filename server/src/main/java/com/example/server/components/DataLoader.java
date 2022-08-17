package com.example.server.components;
import com.example.server.models.*;
import com.example.server.models.enums.Difficulty;
import com.example.server.models.enums.LessonName;
import com.example.server.models.enums.LevelName;
import com.example.server.models.enums.QuestionType;
import com.example.server.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

@Component
public class DataLoader implements ApplicationRunner {

    @Autowired
    LevelRepository levelRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    QuestionRepository questionRepository;
    @Autowired
    LessonRepository lessonRepository;

    @Autowired
    LessonSlideRepository lessonSlideRepository;

    @Autowired
    ProgressRepository progressRepository;

    public DataLoader(){

    }

    public void run(ApplicationArguments args){
//        Setting up the level

        Level level1 = new Level(LevelName.BEGINNER);
        levelRepository.save(level1);

        Level level2 = new Level(LevelName.INTERMEDIATE);
        levelRepository.save(level2);

        Level level3 = new Level(LevelName.ADVANCED);
        levelRepository.save(level3);

//        Setting up the Scales1 Lesson

        Lesson scales1 = new Lesson(LessonName.SCALES1, level1);
        lessonRepository.save(scales1);

        LessonSlide scales1Slide1 = new LessonSlide(scales1,
            "Scales are the building blocks of Music. They will unlock a lot of tools for understanding music theory!\r\n\r\nFirst you need to know all the notes that exist; they are all shown above.", "images/lessonImages/scales_lesson_image_1.png");

        lessonSlideRepository.save(scales1Slide1);

        LessonSlide scales1Slide2 = new LessonSlide(scales1,
                "An easier way to look at it is to visualise a piano.\r\n\r\nEach key is a note and the distance between each key is known as a Half step.", "images/lessonImages/scales_lesson_image_2.png");

        lessonSlideRepository.save(scales1Slide2);

        LessonSlide scales1Slide3 = new LessonSlide(scales1,
                "There are only 12 notes to learn.\r\n\r\nSome notes have 2 names, for example A#, also known as Bb.\r\n\r\nThese are called “Enharmonic Equivalents” which is a fancy term for notes with 2 names.\r\n\r\nThe name of the note will depend on which key the music is written in.", "images/lessonImages/scales_lesson_image_2.png");

        lessonSlideRepository.save(scales1Slide3);

        LessonSlide scales1Slide4 = new LessonSlide(scales1,
                "Now to start we are going to look at Major Scales.\r\n\r\nnAn easy way to remember the make up of a Major scale is:\r\n\r\nWhole, Whole, Half, Whole, Whole, Whole, Half\r\n\r\nThis refers to the distance between each note in the scale.\r\n\r\nA Whole Step is a jump of 2 notes and a Half Step is a jump of 1 note.", "images/lessonImages/scales_lesson_image_3.png");

        lessonSlideRepository.save(scales1Slide4);

        LessonSlide scales1Slide5 = new LessonSlide(scales1,
                "So if we apply that formula to figure out the C Major Scale, it would be as above.\r\n\r\nSo the notes of the C Major Scale are:\r\n\r\nC D E F G A B C\r\n\r\nYou can use this method to figure out any key!\r\n\r\nJust pick the starting note of the key you want to know and follow the same structure.", "images/lessonImages/scales_lesson_image_4.png");

        lessonSlideRepository.save(scales1Slide5);

        LessonSlide scales1Slide6 = new LessonSlide(scales1,
                "As an example if we apply the same method to figure out G Major, it would look like the above.\r\n\r\nSo the notes of the G Major Scale are:\r\n\r\nG A B C D E F# G", "images/lessonImages/scales_lesson_image_5.png");

        lessonSlideRepository.save(scales1Slide6);


        List scales1Assets = new ArrayList<>();
        scales1Assets.add(scales1Slide1);
        scales1Assets.add(scales1Slide2);
        scales1Assets.add(scales1Slide3);
        scales1Assets.add(scales1Slide4);
        scales1Assets.add(scales1Slide5);
        scales1Assets.add(scales1Slide6);

        scales1.setSlides(scales1Assets);
        lessonRepository.save(scales1);




//        Setting up Chords 1 Lesson
        Lesson chords1 = new Lesson(LessonName.CHORDS1, level1);
        lessonRepository.save(chords1);

        LessonSlide chords1Slide1 = new LessonSlide(chords1,
                "The next thing to go over is chords, they are basically a combination of notes played together to create a deeper harmony.\n\nWe are going to look at the 2 most common chords found in music, the Major Chord and the Minor Chord.\n\nContinuing on from your Major Scale lesson if you take the notes and number them from 1st to 8th it would look like the above image.\n\nThe numbers refer to the degrees of the scale, you’ll notice 1st and 8th are the same note but different octaves hence it’s referred to as the 8th degree, this continues into the next octave with 9th and so on but that’s for another lesson.", "images/lessonImages/chords_lesson_image_1.png");

        lessonSlideRepository.save(chords1Slide1);

        LessonSlide chords1Slide2 = new LessonSlide(chords1,
                "The first chord to look at is the Major chord, It is made up of 3 notes, a root, a major 3rd and a 5th.\\n\\nLooking at a C major chord, the notes are C, E and G. C is your root note, E is your major 3rd and G is your 5th.", "images/lessonImages/chords_lesson_image_2.png");

        lessonSlideRepository.save(chords1Slide2);

        LessonSlide chords1Slide3 = new LessonSlide(chords1,
                "The tonality of the chord is defined by the 3rd, you’ll notice it has been referred to as a major 3rd.\n\\n\\nThis is because in a Major chord, the 3rd is 2 whole steps away from the root which creates a happy and positive sounding chord. \\n\\nThis pattern of root (2 whole steps) major 3rd (1 and a half steps) 5th is the make up of every major chord and like the previous lesson can be used starting from any note.", "images/lessonImages/chords_lesson_image_2.png");

        lessonSlideRepository.save(chords1Slide3);

        LessonSlide chords1Slide4 = new LessonSlide(chords1,
                "If you were to try and figure out the notes of a C minor chord, all you need to do is flatten the 3rd by a half step to create a minor 3rd. \\n\\nSo if you take the major 3rd note of E and take it down a half step, it becomes Eb, so the notes of the C minor chord is C, Eb and G. \\n\\n\\nA minor 3rd is 1 and half steps from your root note this creates a sad sounding chord. The pattern for a minor chord is root (1 and a half steps) minor 3rd (2 whole steps) 5th.", "images/lessonImages/chords_lesson_image_3.png");

        lessonSlideRepository.save(chords1Slide4);

        List chords1Assets = new ArrayList<>();
        chords1Assets.add(chords1Slide1);
        chords1Assets.add(chords1Slide2);
        chords1Assets.add(chords1Slide3);
        chords1Assets.add(chords1Slide4);

        chords1.setSlides(chords1Assets);
        lessonRepository.save(chords1);

//        Setting up future lessons

        Lesson scales2 = new Lesson(LessonName.SCALES2, level2);
        lessonRepository.save(scales2);

        Lesson chords2 = new Lesson(LessonName.CHORDS2, level2);
        lessonRepository.save(chords2);

        Lesson scales3 = new Lesson(LessonName.SCALES3, level3);
        lessonRepository.save(scales3);

        Lesson chords3 = new Lesson(LessonName.CHORDS3, level3);
        lessonRepository.save(chords3);


//        Saving Question 1
        List question1Assets = new ArrayList();
        question1Assets.add("images/question_images/easy/Cmaj-identify-note-C.png");
        question1Assets.add("Identify this note");

        List answer1Options = new ArrayList<>();
        answer1Options.add("B");
        answer1Options.add("C");
        answer1Options.add("F");
        answer1Options.add("A");

        List answer1Assets = new ArrayList();
        answer1Assets.add("C");

        String answer1audio = "audio/question_audio/easy/Cmaj-complete-scale.mp3";


        Question question1 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question1Assets, answer1Options, answer1Assets, answer1audio);
        questionRepository.save(question1);

//        Saving Question 2

        List question2Assets = new ArrayList();
        question2Assets.add("images/question_images/easy/Cmaj-identify-note-E.png");
        question2Assets.add("Identify this note");

        List answer2Options = new ArrayList<>();
        answer2Options.add("E");
        answer2Options.add("C");
        answer2Options.add("F");
        answer2Options.add("D");

        List answer2Assets = new ArrayList();
        answer2Assets.add("E");

        String answer2audio = "audio/question_audio/easy/Cmaj-complete-scale.mp3";

        Question question2 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question2Assets, answer2Options, answer2Assets, answer2audio);
        questionRepository.save(question2);

//        Saving Question 3

        List question3Assets = new ArrayList();
        question3Assets.add("images/question_images/easy/Cmaj-missing-note-A.png");
        question3Assets.add("Fill in the missing note");

        List answer3Options = new ArrayList<>();
        answer3Options.add("A");
        answer3Options.add("C");
        answer3Options.add("B");
        answer3Options.add("G");

        List answer3Assets = new ArrayList();
//        answer3Assets.add("images/question_images/easy/Cmaj-complete-scale.png");
        answer3Assets.add("A");

        String answer3audio = "audio/question_audio/easy/Cmaj-complete-scale.mp3";

        Question question3 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question3Assets, answer3Options, answer3Assets, answer3audio);
        questionRepository.save(question3);

//        Saving Question 4

        List question4Assets = new ArrayList();
        question4Assets.add("images/question_images/easy/Cmaj-missing-note-E.png");
        question4Assets.add("Fill in the missing note");

        List answer4Options = new ArrayList<>();
        answer4Options.add("E");
        answer4Options.add("C");
        answer4Options.add("B");
        answer4Options.add("A");

        List answer4Assets = new ArrayList();
//        answer4Assets.add("images/question_images/easy/Cmaj-complete-scale.png");
        answer4Assets.add("E");

        String answer4audio = "audio/question_audio/easy/Cmaj-complete-scale.mp3";

        Question question4 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question4Assets, answer4Options, answer4Assets, answer4audio);
        questionRepository.save(question4);

//        Saving Question 5

        List question5Assets = new ArrayList();
        question5Assets.add("");
        question5Assets.add("Arrange the first 4 notes of the C Major Scale");

        List answer5Options = new ArrayList<>();
        answer5Options.add("F");
        answer5Options.add("D");
        answer5Options.add("C");
        answer5Options.add("E");

        List answer5Assets = new ArrayList();
        answer5Assets.add("C");
        answer5Assets.add("D");
        answer5Assets.add("E");
        answer5Assets.add("F");

        String answer5audio = "audio/question_audio/easy/Cmaj-complete-scale.mp3";

        Question question5 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question5Assets, answer5Options, answer5Assets, answer5audio);
        questionRepository.save(question5);

//        Saving Question 6

        List question6Assets = new ArrayList();
        question6Assets.add("");
        question6Assets.add("Arrange the last 4 notes of the C Major Scale");

        List answer6Options = new ArrayList<>();
        answer6Options.add("A");
        answer6Options.add("C");
        answer6Options.add("G");
        answer6Options.add("B");


        List answer6Assets = new ArrayList();

        answer6Assets.add("G");
        answer6Assets.add("A");
        answer6Assets.add("B");
        answer6Assets.add("C");

        String answer6audio = "audio/question_audio/easy/Cmaj-complete-scale.mp3";

        Question question6 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question6Assets, answer6Options, answer6Assets, answer6audio);
        questionRepository.save(question6);

        //        Saving Question 7

        List question7Assets = new ArrayList();
        question7Assets.add("images/question_images/intermediate/Gmaj-identify-note-C-E.png");
        question7Assets.add("Identify these notes");

        List answer7Options = new ArrayList<>();
        answer7Options.add("F#");
        answer7Options.add("B");
        answer7Options.add("C");
        answer7Options.add("E");

        List answer7Assets = new ArrayList();
        answer7Assets.add("C");
        answer7Assets.add("E");

        String answer7audio = "audio/question_audio/intermediate/Gmaj-complete-scale.mp3";

        Question question7 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question7Assets, answer7Options, answer7Assets, answer7audio);
        questionRepository.save(question7);

//        Saving Question 8

        List question8Assets = new ArrayList();
        question8Assets.add("images/question_images/intermediate/Fmaj-identify-note-F-Bb.png");
        question8Assets.add("Identify these notes");

        List answer8Options = new ArrayList<>();
        answer8Options.add("Bb");
        answer8Options.add("G");
        answer8Options.add("F");
        answer8Options.add("E");

        List answer8Assets = new ArrayList();
        answer8Assets.add("F");
        answer8Assets.add("Bb");

        String answer8audio = "audio/question_audio/intermediate/Fmaj-complete-scale.mp3";

        Question question8 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question8Assets, answer8Options, answer8Assets, answer8audio);
        questionRepository.save(question8);

//        Saving Question 9

        List question9Assets = new ArrayList();
        question9Assets.add("images/question_images/intermediate/Gmaj-missing-note-B.png");
        question9Assets.add("Fill in the missing note");

        List answer9Options = new ArrayList<>();
        answer9Options.add("G");
        answer9Options.add("F#");
        answer9Options.add("A");
        answer9Options.add("B");

        List answer9Assets = new ArrayList();
//        answer9Assets.add("images/question_images/intermediate/Gmaj-complete-scale.png");
        answer9Assets.add("B");

        String answer9audio = "audio/question_audio/intermediate/Gmaj-complete-scale.mp3";

        Question question9 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question9Assets, answer9Options, answer9Assets, answer9audio);
        questionRepository.save(question9);

//        Saving Question 10

        List question10Assets = new ArrayList();
        question10Assets.add("images/question_images/intermediate/Gmaj-missing-note-F#.png");
        question10Assets.add("Fill in the missing note");

        List answer10Options = new ArrayList<>();
        answer10Options.add("A");
        answer10Options.add("C");
        answer10Options.add("F#");
        answer10Options.add("B");

        List answer10Assets = new ArrayList();
//        answer10Assets.add("images/question_images/intermediate/Gmaj-complete-scale.png");
        answer10Assets.add("F#");

        String answer10audio = "audio/question_audio/intermediate/Gmaj-complete-scale.mp3";

        Question question10 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question10Assets, answer10Options, answer10Assets, answer10audio);
        questionRepository.save(question10);

//        Saving Question 11

        List question11Assets = new ArrayList();
        question11Assets.add("");
        question11Assets.add("Arrange the first 4 notes of the G Major Scale");

        List answer11Options = new ArrayList<>();
        answer11Options.add("C");
        answer11Options.add("A");
        answer11Options.add("G");
        answer11Options.add("B");

        List answer11Assets = new ArrayList();
        answer11Assets.add("G");
        answer11Assets.add("A");
        answer11Assets.add("B");
        answer11Assets.add("C");

        String answer11audio = "audio/question_audio/intermediate/Gmaj-complete-scale.mp3";

        Question question11 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question11Assets, answer11Options, answer11Assets, answer11audio);
        questionRepository.save(question11);

//        Saving Question 12

        List question12Assets = new ArrayList();
        question12Assets.add("");
        question12Assets.add("Arrange the first 4 notes of the F Major Scale");

        List answer12Options = new ArrayList<>();
        answer12Options.add("A");
        answer12Options.add("Bb");
        answer12Options.add("F");
        answer12Options.add("Bb");


        List answer12Assets = new ArrayList();

        answer12Assets.add("F");
        answer12Assets.add("G");
        answer12Assets.add("A");
        answer12Assets.add("Bb");

        String answer12audio = "audio/question_audio/intermediate/Fmaj-complete-scale.mp3";

        Question question12 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question12Assets, answer12Options, answer12Assets, answer12audio);
        questionRepository.save(question12);


        //        Saving Question 13

        List question13Assets = new ArrayList();
        question13Assets.add("images/question_images/hard/Bmaj-identify-note-D#-G#.png");
        question13Assets.add("Identify these notes");

        List answer13Options = new ArrayList<>();
        answer13Options.add("G#");
        answer13Options.add("D#");
        answer13Options.add("C#");
        answer13Options.add("E");

        List answer13Assets = new ArrayList();
        answer13Assets.add("D#");
        answer13Assets.add("G#");

        String answer13audio = "audio/question_audio/hard/Bmaj-complete-scale.mp3";

        Question question13 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question13Assets, answer13Options, answer13Assets, answer13audio);
        questionRepository.save(question13);

//        Saving Question 14

        List question14Assets = new ArrayList();
        question14Assets.add("images/question_images/hard/Dbmaj-identify-note-Db-Bb.png");
        question14Assets.add("Identify these notes");

        List answer14Options = new ArrayList<>();
        answer14Options.add("Bb");
        answer14Options.add("Ab");
        answer14Options.add("F");
        answer14Options.add("Db");

        List answer14Assets = new ArrayList();
        answer14Assets.add("Db");
        answer14Assets.add("Bb");

        String answer14audio = "audio/question_audio/hard/Dbmaj-complete-scale.mp3";

        Question question14 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question14Assets, answer14Options, answer14Assets, answer14audio);
        questionRepository.save(question14);

//        Saving Question 15

        List question15Assets = new ArrayList();
        question15Assets.add("images/question_images/hard/Ebmaj-missing-note-Ab-Eb.png");
        question15Assets.add("Fill in the missing notes");

        List answer15Options = new ArrayList<>();
        answer15Options.add("Eb");
        answer15Options.add("F");
        answer15Options.add("Ab");
        answer15Options.add("Bb");

        List answer15Assets = new ArrayList();
//        answer15Assets.add("images/question_images/intermediate/Ebmaj-complete-scale.png");
        answer15Assets.add("Ab");
        answer15Assets.add("Eb");

        String answer15audio = "audio/question_audio/hard/Ebmaj-complete-scale.mp3";

        Question question15 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question15Assets, answer15Options, answer15Assets, answer15audio);
        questionRepository.save(question15);

//        Saving Question 16

        List question16Assets = new ArrayList();
        question16Assets.add("images/question_images/hard/Emaj-missing-note-F#-C#.png");
        question16Assets.add("Fill in the missing notes");

        List answer16Options = new ArrayList<>();
        answer16Options.add("A");
        answer16Options.add("C#");
        answer16Options.add("F#");
        answer16Options.add("D#");

        List answer16Assets = new ArrayList();
//        answer16Assets.add("images/question_images/intermediate/Emaj-complete-scale.png");
        answer16Assets.add("F#");
        answer16Assets.add("C#");

        String answer16audio = "audio/question_audio/hard/Emaj-complete-scale.mp3";

        Question question16 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question16Assets, answer16Options, answer16Assets, answer16audio);
        questionRepository.save(question16);

//        Saving Question 17

        List question17Assets = new ArrayList();
        question17Assets.add("");
        question17Assets.add("Arrange the first 4 notes of the E Major Scale");

        List answer17Options = new ArrayList<>();
        answer17Options.add("A");
        answer17Options.add("F#");
        answer17Options.add("G#");
        answer17Options.add("E");

        List answer17Assets = new ArrayList();
        answer17Assets.add("E");
        answer17Assets.add("F#");
        answer17Assets.add("G#");
        answer17Assets.add("A");

        String answer17audio = "audio/question_audio/hard/Emaj-complete-scale.mp3";

        Question question17 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question17Assets, answer17Options, answer17Assets, answer17audio);
        questionRepository.save(question17);

//        Saving Question 18

        List question18Assets = new ArrayList();
        question18Assets.add("");
        question18Assets.add("Arrange the first 4 notes of the Eb Major Scale");

        List answer18Options = new ArrayList<>();
        answer18Options.add("F");
        answer18Options.add("Ab");
        answer18Options.add("Eb");
        answer18Options.add("G");


        List answer18Assets = new ArrayList();

        answer18Assets.add("Eb");
        answer18Assets.add("F");
        answer18Assets.add("G");
        answer18Assets.add("Ab");

        String answer18audio = "audio/question_audio/hard/Ebmaj-complete-scale.mp3";

        Question question18 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question18Assets, answer18Options, answer18Assets, answer18audio);
        questionRepository.save(question18);


//        Saving Question 19

        List question19Assets = new ArrayList();
        question19Assets.add("images/question_images/easy/C-maj-identify-chord.png");
        question19Assets.add("Identify the chord");

        List answer19Options = new ArrayList<>();
        answer19Options.add("Cmaj");
        answer19Options.add("Gmaj");
        answer19Options.add("Fmaj");
        answer19Options.add("Dmaj");


        List answer19Assets = new ArrayList();

        answer19Assets.add("Cmaj");

        String answer19audio = "audio/question_audio/easy/Cmaj-chord-audio.mp3";

        Question question19 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), chords1.getLessonName(), Difficulty.EASY, question19Assets, answer19Options, answer19Assets, answer19audio);
        questionRepository.save(question19);


//        Saving Question 20
        List question20Assets = new ArrayList();
        question20Assets.add("images/question_images/easy/G-maj-identify-chord.png");
        question20Assets.add("Identify the chord");

        List answer20Options = new ArrayList<>();
        answer20Options.add("Cmaj");
        answer20Options.add("Gmaj");
        answer20Options.add("Fmaj");
        answer20Options.add("Dmaj");


        List answer20Assets = new ArrayList();

        answer20Assets.add("Gmaj");

        String answer20audio = "audio/question_audio/easy/Gmaj-chord-audio.mp3";

        Question question20 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), chords1.getLessonName(), Difficulty.EASY, question20Assets, answer20Options, answer20Assets, answer20audio);
        questionRepository.save(question20);


//        Saving Question 21

        List question21Assets = new ArrayList();
        question21Assets.add("images/question_images/easy/C-maj-complete-the-chord.png");
        question21Assets.add("Complete the C major chord");

        List answer21Options = new ArrayList<>();
        answer21Options.add("C");
        answer21Options.add("D");
        answer21Options.add("G");
        answer21Options.add("E");


        List answer21Assets = new ArrayList();

        answer21Assets.add("E");

        String answer21audio = "audio/question_audio/easy/Cmaj-chord-audio.mp3";

        Question question21 = new Question(QuestionType.COMPLETE, level1.getLevelName(), chords1.getLessonName(), Difficulty.EASY, question21Assets, answer21Options, answer21Assets, answer21audio);
        questionRepository.save(question21);

//        Saving Question 22

        List question22Assets = new ArrayList();
        question22Assets.add("images/question_images/easy/G-maj-complete-the-chord.png");
        question22Assets.add("Complete the G major chord");

        List answer22Options = new ArrayList<>();
        answer22Options.add("G");
        answer22Options.add("B");
        answer22Options.add("C");
        answer22Options.add("D");


        List answer22Assets = new ArrayList();

        answer22Assets.add("B");

        String answer22audio = "audio/question_audio/easy/Gmaj-chord-audio.mp3";

        Question question22 = new Question(QuestionType.COMPLETE, level1.getLevelName(), chords1.getLessonName(), Difficulty.EASY, question22Assets, answer22Options, answer22Assets, answer22audio);
        questionRepository.save(question22);

//          Saving Question 23

        List question23Assets = new ArrayList();
        question23Assets.add("");
        question23Assets.add("Arrange the C major chord in order");

        List answer23Options = new ArrayList<>();
        answer23Options.add("G");
        answer23Options.add("C");
        answer23Options.add("E");
//        answer23Options.add("D");


        List answer23Assets = new ArrayList();

        answer23Assets.add("C");
        answer23Assets.add("E");
        answer23Assets.add("G");

        String answer23audio = "audio/question_audio/easy/Cmaj-chord-audio.mp3";

        Question question23 = new Question(QuestionType.ARRANGE, level1.getLevelName(), chords1.getLessonName(), Difficulty.EASY, question23Assets, answer23Options, answer23Assets, answer23audio);
        questionRepository.save(question23);


//        Saving Question 24

        List question24Assets = new ArrayList();
        question24Assets.add("");
        question24Assets.add("Arrange the G major chord in order");

        List answer24Options = new ArrayList<>();
        answer24Options.add("G");
        answer24Options.add("D");
        answer24Options.add("B");
//        answer24Options.add("C");


        List answer24Assets = new ArrayList();

        answer24Assets.add("G");
        answer24Assets.add("B");
        answer24Assets.add("D");

        String answer24audio = "audio/question_audio/easy/Gmaj-chord-audio.mp3";

        Question question24 = new Question(QuestionType.ARRANGE, level1.getLevelName(), chords1.getLessonName(), Difficulty.EASY, question24Assets, answer24Options, answer24Assets, answer24audio);
        questionRepository.save(question24);


//        Saving Question 25

        List question25Assets = new ArrayList();
        question25Assets.add("images/question_images/intermediate/Dmaj-identify-chord.png");
        question25Assets.add("Identify the chord");

        List answer25Options = new ArrayList<>();
        answer25Options.add("Bbmaj");
        answer25Options.add("Ebmaj");
        answer25Options.add("Dmaj");
        answer25Options.add("Gmaj");


        List answer25Assets = new ArrayList();

        answer25Assets.add("Dmaj");

        String answer25audio = "audio/question_audio/intermediate/Dmaj-chord-audio.mp3";

        Question question25 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), chords1.getLessonName(), Difficulty.MEDIUM, question25Assets, answer25Options, answer25Assets, answer25audio);
        questionRepository.save(question25);


//        Saving Question 26
        List question26Assets = new ArrayList();
        question26Assets.add("images/question_images/intermediate/Fmaj-identify-chord.png");
        question26Assets.add("Identify the chord");

        List answer26Options = new ArrayList<>();
        answer26Options.add("Cmaj");
        answer26Options.add("Gmaj");
        answer26Options.add("Fmaj");
        answer26Options.add("Dmaj");


        List answer26Assets = new ArrayList();

        answer26Assets.add("Fmaj");

        String answer26audio = "audio/question_audio/intermediate/Fmaj-chord-audio.mp3";

        Question question26 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), chords1.getLessonName(), Difficulty.MEDIUM, question26Assets, answer26Options, answer26Assets, answer26audio);
        questionRepository.save(question26);


//        Saving Question 27

        List question27Assets = new ArrayList();
        question27Assets.add("images/question_images/intermediate/Ebmaj-complete-the-chord.png");
        question27Assets.add("Complete the Eb major chord");

        List answer27Options = new ArrayList<>();
        answer27Options.add("Eb");
        answer27Options.add("F");
        answer27Options.add("G");
        answer27Options.add("Bb");


        List answer27Assets = new ArrayList();

        answer27Assets.add("G");

        String answer27audio = "audio/question_audio/intermediate/Ebmaj-chord-audio.mp3";


        Question question27 = new Question(QuestionType.COMPLETE, level1.getLevelName(), chords1.getLessonName(), Difficulty.MEDIUM, question27Assets, answer27Options, answer27Assets, answer27audio);
        questionRepository.save(question27);

//        Saving Question 28

        List question28Assets = new ArrayList();
        question28Assets.add("images/question_images/intermediate/Abmaj-complete-the-chord.png");
        question28Assets.add("Complete the Ab major chord");

        List answer28Options = new ArrayList<>();
        answer28Options.add("C");
        answer28Options.add("Ab");
        answer28Options.add("Eb");
        answer28Options.add("Bb");


        List answer28Assets = new ArrayList();

        answer28Assets.add("C");

        String answer28audio = "audio/question_audio/intermediate/Abmaj-chord-audio.mp3";

        Question question28 = new Question(QuestionType.COMPLETE, level1.getLevelName(), chords1.getLessonName(), Difficulty.MEDIUM, question28Assets, answer28Options, answer28Assets, answer28audio);
        questionRepository.save(question28);

//          Saving Question 29

        List question29Assets = new ArrayList();
        question29Assets.add("");
        question29Assets.add("Arrange the D major chord in order");

        List answer29Options = new ArrayList<>();
        answer29Options.add("A");
        answer29Options.add("F#");
        answer29Options.add("D");
//        answer29Options.add("E");


        List answer29Assets = new ArrayList();

        answer29Assets.add("D");
        answer29Assets.add("F#");
        answer29Assets.add("A");

        String answer29audio = "audio/question_audio/intermediate/Dmaj-chord-audio.mp3";

        Question question29 = new Question(QuestionType.ARRANGE, level1.getLevelName(), chords1.getLessonName(), Difficulty.MEDIUM, question29Assets, answer29Options, answer29Assets, answer29audio);
        questionRepository.save(question29);


//        Saving Question 30

        List question30Assets = new ArrayList();
        question30Assets.add("");
        question30Assets.add("Arrange the A major chord in order");

        List answer30Options = new ArrayList<>();
        answer30Options.add("A");
        answer30Options.add("E");
        answer30Options.add("C#");
//        answer30Options.add("B");


        List answer30Assets = new ArrayList();

        answer30Assets.add("A");
        answer30Assets.add("C#");
        answer30Assets.add("E");

        String answer30audio = "audio/question_audio/intermediate/Amaj-chord-audio.mp3";

        Question question30 = new Question(QuestionType.ARRANGE, level1.getLevelName(), chords1.getLessonName(), Difficulty.MEDIUM, question30Assets, answer30Options, answer30Assets, answer30audio);
        questionRepository.save(question30);

        //        Saving Question 31

        List question31Assets = new ArrayList();
        question31Assets.add("images/question_images/hard/Ebmaj-identify-chord.png");
        question31Assets.add("Identify the chord");

        List answer31Options = new ArrayList<>();
        answer31Options.add("Bbmaj");
        answer31Options.add("Ebmaj");
        answer31Options.add("Dmaj");
        answer31Options.add("Gmaj");


        List answer31Assets = new ArrayList();

        answer31Assets.add("Ebmaj");

        String answer31audio = "audio/question_audio/intermediate/Ebmaj-chord-audio.mp3";

        Question question31 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), chords1.getLessonName(), Difficulty.HARD, question31Assets, answer31Options, answer31Assets, answer31audio);
        questionRepository.save(question31);


//        Saving Question 32
        List question32Assets = new ArrayList();
        question32Assets.add("images/question_images/hard/Gbmaj-identify-chord.png");
        question32Assets.add("Identify the chord");

        List answer32Options = new ArrayList<>();
        answer32Options.add("Gbmaj");
        answer32Options.add("Bmaj");
        answer32Options.add("Bbmaj");
        answer32Options.add("Emaj");


        List answer32Assets = new ArrayList();

        answer32Assets.add("Gbmaj");

        String answer32audio = "audio/question_audio/hard/Gbmaj-chord-audio.mp3";


        Question question32 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), chords1.getLessonName(), Difficulty.HARD, question32Assets, answer32Options, answer32Assets, answer32audio);
        questionRepository.save(question32);


//        Saving Question 33

        List question33Assets = new ArrayList();
        question33Assets.add("images/question_images/hard/Abmin-complete-the-chord.png");
        question33Assets.add("Complete the Ab minor chord");

        List answer33Options = new ArrayList<>();
        answer33Options.add("Ab");
        answer33Options.add("Cb");
        answer33Options.add("Eb");
        answer33Options.add("Db");


        List answer33Assets = new ArrayList();

        answer33Assets.add("Cb");

        String answer33audio = "audio/question_audio/hard/Abmin-chord-audio.mp3";

        Question question33 = new Question(QuestionType.COMPLETE, level1.getLevelName(), chords1.getLessonName(), Difficulty.HARD, question33Assets, answer33Options, answer33Assets, answer33audio);
        questionRepository.save(question33);

//        Saving Question 34

        List question34Assets = new ArrayList();
        question34Assets.add("images/question_images/hard/Abmaj-complete-the-chord.png");
        question34Assets.add("Complete the Ab major chord");

        List answer34Options = new ArrayList<>();
        answer34Options.add("Bb");
        answer34Options.add("Eb");
        answer34Options.add("C");
        answer34Options.add("Ab");


        List answer34Assets = new ArrayList();

        answer34Assets.add("C");

        String answer34audio = "audio/question_audio/hard/Abmaj-chord-audio.mp3";

        Question question34 = new Question(QuestionType.COMPLETE, level1.getLevelName(), chords1.getLessonName(), Difficulty.HARD, question34Assets, answer34Options, answer34Assets, answer34audio);
        questionRepository.save(question34);

//          Saving Question 35

        List question35Assets = new ArrayList();
        question35Assets.add("");
        question35Assets.add("Arrange the Gb minor chord in order");

        List answer35Options = new ArrayList<>();
        answer35Options.add("Gb");
        answer35Options.add("A");
        answer35Options.add("Db");
//        answer35Options.add("A");


        List answer35Assets = new ArrayList();

        answer35Assets.add("Gb");
        answer35Assets.add("A");
        answer35Assets.add("Db");

        String answer35audio = "audio/question_audio/hard/Gbmin-chord-audio.mp3";

        Question question35 = new Question(QuestionType.ARRANGE, level1.getLevelName(), chords1.getLessonName(), Difficulty.HARD, question35Assets, answer35Options, answer35Assets, answer35audio);
        questionRepository.save(question35);


//        Saving Question 36

        List question36Assets = new ArrayList();
        question36Assets.add("");
        question36Assets.add("Arrange the Db minor chord in order");

        List answer36Options = new ArrayList<>();
        answer36Options.add("Ab");
        answer36Options.add("Db");
        answer36Options.add("E");
//        answer36Options.add("Gb");


        List answer36Assets = new ArrayList();

        answer36Assets.add("Db");
        answer36Assets.add("E");
        answer36Assets.add("Ab");

        String answer36audio = "audio/question_audio/hard/Dbmin-chord-audio.mp3";


        Question question36 = new Question(QuestionType.ARRANGE, level1.getLevelName(), chords1.getLessonName(), Difficulty.HARD, question36Assets, answer36Options, answer36Assets, answer36audio);
        questionRepository.save(question36);

        User user1 = new User("Ewan", "images/profiles/ewan.png");
        userRepository.save(user1);
        Difficulty currentDifficulty = Difficulty.EASY;
        Progress user1Scales1Progress = new Progress(scales1.getLessonName(), currentDifficulty, user1);
        progressRepository.save(user1Scales1Progress);
        Progress user1Chords1progress = new Progress(chords1.getLessonName(), currentDifficulty, user1);
        progressRepository.save(user1Chords1progress);
        List user1Progress = new ArrayList<>();
        user1Progress.add(user1Scales1Progress);
        user1Progress.add(user1Scales1Progress);
        user1.setProgress(user1Progress);
        userRepository.save(user1);

        User user2 = new User("Michael", "images/profiles/michael.png");
        userRepository.save(user2);
        Difficulty currentDifficulty2 = Difficulty.EASY;
        Progress user2Scales1Progress = new Progress(scales1.getLessonName(), currentDifficulty2, user2);
        progressRepository.save(user2Scales1Progress);
        Progress user2Chords1progress = new Progress(chords1.getLessonName(), currentDifficulty2, user2);
        progressRepository.save(user2Chords1progress);
        List user2Progress = new ArrayList<>();
        user2Progress.add(user2Scales1Progress);
        user2Progress.add(user2Scales1Progress);
        user2.setProgress(user2Progress);
        userRepository.save(user2);

        User user3 = new User("Shuna", "images/profiles/shuna.png");
        userRepository.save(user3);
        Difficulty currentDifficulty3 = Difficulty.EASY;
        Progress user3Scales1Progress = new Progress(scales1.getLessonName(), currentDifficulty3, user3);
        progressRepository.save(user3Scales1Progress);
        Progress user3Chords1progress = new Progress(chords1.getLessonName(), currentDifficulty3, user3);
        progressRepository.save(user3Chords1progress);
        List user3Progress = new ArrayList<>();
        user3Progress.add(user3Scales1Progress);
        user3Progress.add(user3Scales1Progress);
        user3.setProgress(user3Progress);
        userRepository.save(user3);

        User user4 = new User("Nick", "images/profiles/nick.png");
        userRepository.save(user4);
        Difficulty currentDifficulty4 = Difficulty.EASY;
        Progress user4Scales1Progress = new Progress(scales1.getLessonName(), currentDifficulty4, user4);
        progressRepository.save(user4Scales1Progress);
        Progress user4Chords1progress = new Progress(chords1.getLessonName(), currentDifficulty4, user4);
        progressRepository.save(user4Chords1progress);
        List user4Progress = new ArrayList<>();
        user4Progress.add(user4Scales1Progress);
        user4Progress.add(user4Scales1Progress);
        user4.setProgress(user4Progress);
        userRepository.save(user4);
    }
}


