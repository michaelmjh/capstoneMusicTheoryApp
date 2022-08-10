package com.example.server.controllers;

import com.example.server.models.Level;
import com.example.server.repositories.LevelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class LevelController {

    @Autowired
    LevelRepository levelRepository;

    @GetMapping(value="/levels")
    public List<Level> getAllLevels(){
        return levelRepository.findAll();
    }
}
