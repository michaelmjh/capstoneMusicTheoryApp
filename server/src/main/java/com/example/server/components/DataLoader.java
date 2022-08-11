package com.example.server.components;

import com.example.server.models.Lesson;
import com.example.server.models.LessonSlide;
import com.example.server.models.Level;
import com.example.server.models.Question;
import com.example.server.models.enums.Difficulty;
import com.example.server.models.enums.LessonName;
import com.example.server.models.enums.LevelName;
import com.example.server.models.enums.QuestionType;
import com.example.server.repositories.LessonRepository;
import com.example.server.repositories.LevelRepository;
import com.example.server.repositories.QuestionRepository;
import com.example.server.repositories.UserRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;


import java.util.ArrayList;
import java.util.HashMap;
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

    public DataLoader(){

    }

    public void run(ApplicationArguments args){
//        Setting up the level

        Level level1 = new Level(LevelName.BEGINNER);
        levelRepository.save(level1);

//        Setting up the Scales1 Lesson

        Lesson scales1 = new Lesson(LessonName.SCALES1, level1);
        lessonRepository.save(scales1);

        LessonSlide scales1Slide1 = new LessonSlide(scales1,
        "Scales are the building blocks of Music. They will unlock a lot of tools for understanding music theory!\n\nFirst you need to know all the notes that exist; they are all shown above.", "images/lessonImages/scales_lesson_image_1.png");

        LessonSlide scales1Slide2 = new LessonSlide(scales1,
                "An easier way to look at it is to visualise a piano.\\n\\nEach key is a note and the distance between each key is known as a Half step.", "images/lessonImages/scales_lesson_image_2.png");

        LessonSlide scales1Slide3 = new LessonSlide(scales1,
                "There are only 12 notes to learn.\\n\\nSome notes have 2 names, for example A#, also known as Bb.\\n\\nThese are called “Enharmonic Equivalents” which is a fancy term for notes with 2 names.\\n\\nThe name of the note will depend on which key the music is written in.", "images/lessonImages/scales_lesson_image_2.png");

        LessonSlide scales1Slide4 = new LessonSlide(scales1,
                "Now to start we are going to look at Major Scales.\\n\\nAn easy way to remember the make up of a Major scale is:\\n\\n\\nWhole, Whole, Half, Whole, Whole, Whole, Half\\n\\n\\nThis refers to the distance between each note in the scale.\\n\\nA Whole Step is a jump of 2 notes and a Half Step is a jump of 1 note.", "images/lessonImages/scales_lesson_image_3.png");

        LessonSlide scales1Slide5 = new LessonSlide(scales1,
                "So if we apply that formula to figure out the C Major Scale, it would be as above.\\n\\nSo the notes of the C Major Scale are:\\n\\nC  D E F G A B C\\n\\nYou can use this method to figure out any key!\\n\\nJust pick the starting note of the key you want to know and follow the same structure.", "images/lessonImages/scales_lesson_image_4.png");

        LessonSlide scales1Slide6 = new LessonSlide(scales1,
                "As an example if we apply the same method to figure out G Major, it would look like the above.\\n\\nSo the notes of the G Major Scale are:\\n\\nG  A B C D E F# G", "images/lessonImages/scales_lesson_image_5.png");

        List scales1AllSlides = new ArrayList<>();
        scales1AllSlides.add(scales1Slide1);
        scales1AllSlides.add(scales1Slide2);
        scales1AllSlides.add(scales1Slide3);
        scales1AllSlides.add(scales1Slide4);
        scales1AllSlides.add(scales1Slide5);
        scales1AllSlides.add(scales1Slide6);

        scales1.setSlides(scales1AllSlides);
        lessonRepository.save(scales1);

        List scales1Assets = new ArrayList<>();
        scales1Assets.add("the image is here");
        scales1Assets.add("the other image is here");
        scales1.setSlides(scales1Assets);

//        Saving Question 1

        List question1Assets = new ArrayList();
        question1Assets.add("/images/question_images/easy/Cmaj-identify-note-C.jpg");
        question1Assets.add("Identify this note");

        List answer1Options = new ArrayList<>();
        answer1Options.add("B");
        answer1Options.add("C");
        answer1Options.add("F");
        answer1Options.add("A");

        List answer1Assets = new ArrayList();
        answer1Assets.add("C");


        Question question1 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question1Assets, answer1Options, answer1Assets);
        questionRepository.save(question1);

//        Saving Question 2

        List question2Assets = new ArrayList();
        question2Assets.add("/images/question_images/easy/Cmaj-identify-note-E.jpg");
        question2Assets.add("Identify this note");

        List answer2Options = new ArrayList<>();
        answer2Options.add("E");
        answer2Options.add("C");
        answer2Options.add("F");
        answer2Options.add("D");

        List answer2Assets = new ArrayList();
        answer2Assets.add("E");

        Question question2 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question2Assets, answer2Options, answer2Assets);
        questionRepository.save(question2);

//        Saving Question 3

        List question3Assets = new ArrayList();
        question3Assets.add("/images/question_images/easy/Cmaj-missing-note-A.jpg");
        question3Assets.add("Fill in the missing notes");

        List answer3Options = new ArrayList<>();
        answer3Options.add("A");
        answer3Options.add("C");
        answer3Options.add("B");
        answer3Options.add("G");

        List answer3Assets = new ArrayList();
        answer3Assets.add("/images/question_images/easy/Cmaj-complete-scale.jpg");
        answer3Assets.add("A");

        Question question3 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question3Assets, answer3Options, answer3Assets);
        questionRepository.save(question3);

//        Saving Question 4

        List question4Assets = new ArrayList();
        question4Assets.add("/images/question_images/easy/Cmaj-missing-note-E.jpg");
        question4Assets.add("Fill in the missing notes");

        List answer4Options = new ArrayList<>();
        answer4Options.add("E");
        answer4Options.add("C");
        answer4Options.add("B");
        answer4Options.add("A");

        List answer4Assets = new ArrayList();
        answer4Assets.add("/images/question_images/easy/Cmaj-complete-scale.jpg");
        answer4Assets.add("E");

        Question question4 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question4Assets, answer4Options, answer4Assets);
        questionRepository.save(question4);

//        Saving Question 5

        List question5Assets = new ArrayList();
        question5Assets.add("");
        question5Assets.add("Arrange the first 4 notes of the C Major Scale");

        List answer5Options = new ArrayList<>();
        answer5Options.add("E");
        answer5Options.add("C");
        answer5Options.add("F");
        answer5Options.add("D");

        List answer5Assets = new ArrayList();
        answer5Assets.add("E");
        answer5Assets.add("C");
        answer5Assets.add("F");
        answer5Assets.add("D");

        Question question5 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question5Assets, answer5Options, answer5Assets);
        questionRepository.save(question5);

//        Saving Question 6

        List question6Assets = new ArrayList();
        question6Assets.add("");
        question6Assets.add("Arrange the last 4 notes of the C Major Scale");

        List answer6Options = new ArrayList<>();
        answer6Options.add("C");
        answer6Options.add("G");
        answer6Options.add("A");
        answer6Options.add("B");


        List answer6Assets = new ArrayList();

        answer6Assets.add("C");
        answer6Assets.add("G");
        answer6Assets.add("A");
        answer6Assets.add("B");



        Question question6 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.EASY, question6Assets, answer6Options, answer6Assets);
        questionRepository.save(question6);

        //        Saving Question 7

        List question7Assets = new ArrayList();
        question7Assets.add("/images/question_images/intermediate/Gmaj-identify-note-C-E.jpg");
        question7Assets.add("Identify these notes");

        List answer7Options = new ArrayList<>();
        answer7Options.add("F#");
        answer7Options.add("B");
        answer7Options.add("C");
        answer7Options.add("E");

        List answer7Assets = new ArrayList();
        answer7Assets.add("C");
        answer7Assets.add("E");


        Question question7 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question7Assets, answer7Options, answer7Assets);
        questionRepository.save(question7);

//        Saving Question 8

        List question8Assets = new ArrayList();
        question8Assets.add("/images/question_images/intermediate/Fmaj-identify-note-F-Bb.jpg");
        question8Assets.add("Identify these notes");

        List answer8Options = new ArrayList<>();
        answer8Options.add("Bb");
        answer8Options.add("G");
        answer8Options.add("F");
        answer8Options.add("E");

        List answer8Assets = new ArrayList();
        answer8Assets.add("F");
        answer8Assets.add("Bb");

        Question question8 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question8Assets, answer8Options, answer8Assets);
        questionRepository.save(question8);

//        Saving Question 9

        List question9Assets = new ArrayList();
        question9Assets.add("/images/question_images/intermediate/Gmaj-missing-note-B.jpg");
        question9Assets.add("Fill in the missing note");

        List answer9Options = new ArrayList<>();
        answer9Options.add("G");
        answer9Options.add("F#");
        answer9Options.add("A");
        answer9Options.add("B");

        List answer9Assets = new ArrayList();
        answer9Assets.add("/images/question_images/intermediate/Gmaj-complete-scale.jpg");
        answer9Assets.add("B");

        Question question9 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question9Assets, answer9Options, answer9Assets);
        questionRepository.save(question9);

//        Saving Question 10

        List question10Assets = new ArrayList();
        question10Assets.add("/images/question_images/intermediate/Gmaj-missing-note-F#.jpg");
        question10Assets.add("Fill in the missing notes");

        List answer10Options = new ArrayList<>();
        answer10Options.add("A");
        answer10Options.add("C");
        answer10Options.add("F#");
        answer10Options.add("B");

        List answer10Assets = new ArrayList();
        answer10Assets.add("/images/question_images/intermediate/Gmaj-complete-scale.jpg");
        answer10Assets.add("F#");

        Question question10 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question10Assets, answer10Options, answer10Assets);
        questionRepository.save(question10);

//        Saving Question 11

        List question11Assets = new ArrayList();
        question11Assets.add("");
        question11Assets.add("Arrange the first 4 notes of the G Major Scale");

        List answer11Options = new ArrayList<>();
        answer11Options.add("G");
        answer11Options.add("A");
        answer11Options.add("B");
        answer11Options.add("C");

        List answer11Assets = new ArrayList();
        answer11Assets.add("G");
        answer11Assets.add("A");
        answer11Assets.add("B");
        answer11Assets.add("C");

        Question question11 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question11Assets, answer11Options, answer11Assets);
        questionRepository.save(question11);

//        Saving Question 12

        List question12Assets = new ArrayList();
        question12Assets.add("");
        question12Assets.add("Arrange the first 4 notes of the F Major Scale");

        List answer12Options = new ArrayList<>();
        answer12Options.add("F");
        answer12Options.add("G");
        answer12Options.add("A");
        answer12Options.add("Bb");


        List answer12Assets = new ArrayList();

        answer12Assets.add("F");
        answer12Assets.add("G");
        answer12Assets.add("A");
        answer12Assets.add("Bb");



        Question question12 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.MEDIUM, question12Assets, answer12Options, answer12Assets);
        questionRepository.save(question12);


        //        Saving Question 13

        List question13Assets = new ArrayList();
        question7Assets.add("/images/question_images/hard/Bmaj-identify-note-D#-G#.jpg");
        question7Assets.add("Identify these notes");

        List answer13Options = new ArrayList<>();
        answer13Options.add("G#");
        answer13Options.add("D#");
        answer13Options.add("C#");
        answer13Options.add("E");

        List answer13Assets = new ArrayList();
        answer13Assets.add("D#");
        answer13Assets.add("G#");


        Question question13 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question13Assets, answer13Options, answer13Assets);
        questionRepository.save(question13);

//        Saving Question 14

        List question14Assets = new ArrayList();
        question14Assets.add("/images/question_images/hard/Dbmaj-identify-note-Db-Bb.jpg");
        question14Assets.add("Identify these notes");

        List answer14Options = new ArrayList<>();
        answer14Options.add("Bb");
        answer14Options.add("Ab");
        answer14Options.add("F");
        answer14Options.add("Db");

        List answer14Assets = new ArrayList();
        answer14Assets.add("Db");
        answer14Assets.add("Bb");

        Question question14 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question14Assets, answer14Options, answer14Assets);
        questionRepository.save(question14);

//        Saving Question 15

        List question15Assets = new ArrayList();
        question15Assets.add("/images/question_images/hard/Ebmaj-missing-note-Ab-Eb.jpg");
        question15Assets.add("Fill in the missing note");

        List answer15Options = new ArrayList<>();
        answer15Options.add("Eb");
        answer15Options.add("F");
        answer15Options.add("Ab");
        answer15Options.add("Bb");

        List answer15Assets = new ArrayList();
        answer15Assets.add("/images/question_images/intermediate/Ebmaj-complete-scale.jpg");
        answer15Assets.add("Ab");
        answer15Assets.add("Eb");

        Question question15 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question15Assets, answer15Options, answer15Assets);
        questionRepository.save(question15);

//        Saving Question 16

        List question16Assets = new ArrayList();
        question16Assets.add("/images/question_images/hard/Emaj-missing-note-F#-C#.jpg");
        question16Assets.add("Fill in the missing notes");

        List answer16Options = new ArrayList<>();
        answer16Options.add("A");
        answer16Options.add("C#");
        answer16Options.add("F#");
        answer16Options.add("D#");

        List answer16Assets = new ArrayList();
        answer16Assets.add("/images/question_images/intermediate/Emaj-complete-scale.jpg");
        answer16Assets.add("F#");
        answer16Assets.add("C#");

        Question question16 = new Question(QuestionType.COMPLETE, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question16Assets, answer16Options, answer16Assets);
        questionRepository.save(question16);

//        Saving Question 17

        List question17Assets = new ArrayList();
        question17Assets.add("");
        question17Assets.add("Arrange the first 4 notes of the E Major Scale");

        List answer17Options = new ArrayList<>();
        answer17Options.add("E");
        answer17Options.add("F#");
        answer17Options.add("G#");
        answer17Options.add("A");

        List answer17Assets = new ArrayList();
        answer17Assets.add("E");
        answer17Assets.add("F#");
        answer17Assets.add("G#");
        answer17Assets.add("A");

        Question question17 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question17Assets, answer17Options, answer17Assets);
        questionRepository.save(question17);

//        Saving Question 18

        List question18Assets = new ArrayList();
        question18Assets.add("");
        question18Assets.add("Arrange the first 4 notes of the Eb Major Scale");

        List answer18Options = new ArrayList<>();
        answer18Options.add("Eb");
        answer18Options.add("F");
        answer18Options.add("G");
        answer18Options.add("Ab");


        List answer18Assets = new ArrayList();

        answer18Assets.add("Eb");
        answer18Assets.add("F");
        answer18Assets.add("G");
        answer18Assets.add("Ab");



        Question question18 = new Question(QuestionType.ARRANGE, level1.getLevelName(), scales1.getLessonName(), Difficulty.HARD, question18Assets, answer18Options, answer18Assets);
        questionRepository.save(question18);

    }
}
