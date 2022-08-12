package com.example.server.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "lessonSlides")
public class LessonSlide {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TEXT")
    private String text;

    @Column(name="image")
    private String image;

    @ManyToOne
    @JoinColumn(name="lesson_id", nullable = false)
    @JsonIgnoreProperties({"lessonSlides"})
    private Lesson lesson;


    public LessonSlide(Lesson lesson, String text, String image){
        this.lesson = lesson;
        this.text = text;
        this.image = image;
    }

    public LessonSlide(){

    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Lesson getLesson() {
        return lesson;
    }

    public void setLesson(Lesson lesson) {
        this.lesson = lesson;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
