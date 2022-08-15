package com.example.server.repositories;

import com.example.server.models.Lesson;
import com.example.server.models.enums.LessonName;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonRepository extends JpaRepository<Lesson, Long> {

    Lesson findLessonByLessonName(LessonName lessonName);
}
