package com.example.server.repositories;

import com.example.server.models.Question;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Long> {

    List<Question> findByLessonName(Enum lessonName);

    List<Question> findByLessonNameAndDifficulty(Enum lessonName, Enum difficulty);

    List<Question> findByDifficulty(Enum difficulty);
}
