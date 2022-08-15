package com.example.server.controllers;

import com.example.server.models.Lesson;
import com.example.server.models.enums.LessonName;
import com.example.server.repositories.LessonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
public class LessonController {

    @Autowired
    LessonRepository lessonRepository;

    @GetMapping(value = "/lessons")
    public ResponseEntity<List<Lesson>> getAllLessons(){
        return new ResponseEntity<>(lessonRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping(value ="/lessons/name")
    public ResponseEntity<Lesson> getLessonByLessonName(
            @RequestParam(name="lessonname", required = false) String lessonName
    ){
        return new ResponseEntity<>(lessonRepository.findLessonByLessonName(LessonName.valueOf(lessonName)), HttpStatus.OK);
    }
}
