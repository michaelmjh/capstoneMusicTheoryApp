package com.example.server.components;

import com.example.server.models.Lesson;
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

    public DataLoader(){

    }

    public void run(ApplicationArguments args){
        List lessonAssets = new ArrayList<>();
        lessonAssets.add("the image is here");
        lessonAssets.add("the other image is here");
        Level level1 = new Level(LevelName.BEGINNER);
        levelRepository.save(level1);
        Lesson lesson1 = new Lesson(LessonName.SCALES1, level1);
        lesson1.setSlides(lessonAssets);
        lessonRepository.save(lesson1);
        Lesson lesson2 = new Lesson(LessonName.CHORDS1, level1);
        lessonRepository.save(lesson2);
        Lesson lesson3 = new Lesson(LessonName.KEYSIGNATURES1, level1);
        lessonRepository.save(lesson3);
        List questionAssets = new ArrayList<>();
        questionAssets.add("this question image is here");
        List answerOptions = new ArrayList<>();
        answerOptions.add("A");
        answerOptions.add("B");
        answerOptions.add("C");
        answerOptions.add("D");
        List answerAssets = new ArrayList<>();
        answerAssets.add("the answer image is here");
        Question question1 = new Question(QuestionType.IDENTIFY, level1.getLevelName(), lesson1.getLessonName(), Difficulty.EASY, questionAssets, answerOptions, answerAssets);
        questionRepository.save(question1);
    }
}
