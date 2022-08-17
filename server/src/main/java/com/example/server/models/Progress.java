package com.example.server.models;

import com.example.server.models.enums.Difficulty;
import com.example.server.models.enums.LessonName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name="progress")
public class Progress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="lessonName")
    private LessonName lessonName;

    @Column(name="difficulty")
    private Difficulty difficulty;

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    @JsonIgnoreProperties({"progress"})
    private User user;


    public Progress(LessonName lessonName, Difficulty difficulty, User user){
        this.lessonName = lessonName;
        this.difficulty = difficulty;
        this.user = user;
    }

    public Progress(){

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

    public Difficulty getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(Difficulty difficulty) {
        this.difficulty = difficulty;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
