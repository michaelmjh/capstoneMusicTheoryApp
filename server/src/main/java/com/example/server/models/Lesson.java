package com.example.server.models;

import com.example.server.models.enums.LessonName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="lessons")

public class Lesson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private LessonName lessonName;


    @OneToMany(mappedBy = "lesson", fetch = FetchType.LAZY)
    @JsonIgnoreProperties({"lesson"})
    private List<LessonSlide> slides;


    @ManyToOne
    @JoinColumn(name="level_id", nullable = false)
    @JsonIgnoreProperties({"lessons"})
    private Level level;




    public Lesson(LessonName lessonName, Level level){
        this.lessonName = lessonName;
        this.level = level;
        this.slides = new ArrayList<>();
    }

    public Lesson(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LessonName getLessonName() {
        return lessonName;
    }

    public void setLessonName(LessonName lessonName) {
        this.lessonName = lessonName;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public List<LessonSlide> getSlides() {
        return slides;
    }

    public void setSlides(List<LessonSlide> slides) {
        this.slides = slides;
    }
}
