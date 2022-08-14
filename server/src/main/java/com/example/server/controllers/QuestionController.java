package com.example.server.controllers;

import com.example.server.models.Question;
import com.example.server.models.enums.Difficulty;
import com.example.server.models.enums.LessonName;
import com.example.server.repositories.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class QuestionController {

    @Autowired
    QuestionRepository questionRepository;

    @GetMapping(value = "/questions")
    public ResponseEntity<List<Question>> getAllQuestions(){
        return new ResponseEntity<>(questionRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping(value ="/questions/scales1")
    public ResponseEntity<List<Question>> getAllLesson1Questions(
            @RequestParam(name="lesson", required = false) String lessonName1
    ){
        return new ResponseEntity<>(questionRepository.findByLessonName(LessonName.valueOf(lessonName1)), HttpStatus.OK);
    }

    @GetMapping(value ="/questions/scales1/difficulty")
    public ResponseEntity<List<Question>> getAllLesson1QuestionsWithDifficultyEasy(
            @RequestParam(name="lesson", required = false) String lessonName1,
            @RequestParam(name="difficulty", required = false) String difficulty1
    ){
        return new ResponseEntity<>(questionRepository.findByLessonNameAndDifficulty(LessonName.valueOf(lessonName1), Difficulty.valueOf(difficulty1)), HttpStatus.OK);
    }

}
