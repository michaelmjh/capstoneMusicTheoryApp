package com.example.server;

import com.example.server.models.Lesson;
import com.example.server.models.Level;
import com.example.server.models.Question;
import com.example.server.models.User;
import com.example.server.models.enums.Difficulty;
import com.example.server.models.enums.LessonName;
import com.example.server.models.enums.LevelName;
import com.example.server.models.enums.QuestionType;
import com.example.server.repositories.LessonRepository;
import com.example.server.repositories.LevelRepository;
import com.example.server.repositories.QuestionRepository;
import com.example.server.repositories.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class ServerApplicationTests {

	@Autowired
	LevelRepository levelRepository;
	@Autowired
	LessonRepository lessonRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	QuestionRepository questionRepository;
	@Test
	void contextLoads() {
	}

	@Test
	public void canCreateLevel(){
		Level level = new Level(LevelName.BEGINNER);
		levelRepository.save(level);
	}

	@Test
	public void canCreateLevelAndLesson(){
		Level level = new Level(LevelName.BEGINNER);
		levelRepository.save(level);
		Lesson lesson = new Lesson(LessonName.SCALES1, level);
		lessonRepository.save(lesson);
	}

	@Test
	public void canCreateUser(){
		Level level = new Level(LevelName.BEGINNER);
		levelRepository.save(level);
		Lesson lesson = new Lesson(LessonName.SCALES1, level);
		lessonRepository.save(lesson);
		User user = new User("EwanC1991", "images/myface.jpg", lesson.getLessonName(), level.getLevelName());
		userRepository.save(user);
	}

	@Test
	public void canCreateQuestionsLessonsUserAndLevel(){
		List<String> questionAssets = new ArrayList<>();
		questionAssets.add("image is here");
		List<String> answerAssets = new ArrayList<>();
		answerAssets.add("answer is here");
		List<String> answerOptions = new ArrayList<>();
		answerOptions.add("answer options are here");
		Level level = new Level(LevelName.BEGINNER);
		levelRepository.save(level);
		Lesson lesson = new Lesson(LessonName.SCALES1, level);
		lessonRepository.save(lesson);
		Question question = new Question(QuestionType.IDENTIFY, level.getLevelName(), lesson.getLessonName(), Difficulty.EASY, questionAssets, answerOptions, answerAssets);
		questionRepository.save(question);
	}





}
