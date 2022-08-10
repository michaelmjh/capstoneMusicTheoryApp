package com.example.server.controllers;

import com.example.server.models.Question;
import com.example.server.repositories.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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

}
