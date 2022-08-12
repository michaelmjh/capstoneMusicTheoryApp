package com.example.server.controllers;


import com.example.server.models.LessonSlide;
import com.example.server.repositories.LessonSlideRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class LessonSlideController {

    @Autowired
    LessonSlideRepository lessonSlideRepository;

    @GetMapping(value = "/lessonslides")
    public ResponseEntity<List<LessonSlide>> getAllLessonSlides(){
        return new ResponseEntity<>(lessonSlideRepository.findAll(), HttpStatus.OK);
    }
}