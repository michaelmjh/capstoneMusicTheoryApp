package com.example.server;

import com.example.server.models.Lesson;
import com.example.server.models.Level;
import com.example.server.models.enums.LessonName;
import com.example.server.models.enums.LevelName;
import com.example.server.repositories.LessonRepository;
import com.example.server.repositories.LevelRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ServerApplicationTests {

	@Autowired
	LevelRepository levelRepository;
	@Autowired
	LessonRepository lessonRepository;
	@Test
	void contextLoads() {
	}





}
