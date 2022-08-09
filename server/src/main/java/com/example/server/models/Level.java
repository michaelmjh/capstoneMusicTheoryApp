package com.example.server.models;

import com.example.server.models.enums.LevelName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "levels")
public class Level {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="levelName")
    private LevelName levelName;

    @OneToMany(mappedBy="level", fetch = FetchType.LAZY)
    @JsonIgnoreProperties({"level"})
    private List<Lesson> lessons;

    public Level(LevelName levelName){
        this.levelName = levelName;
        this.lessons = new ArrayList<>();
    }

    public Level(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LevelName getLevelName() {
        return levelName;
    }

    public void setLevelName(LevelName levelName) {
        this.levelName = levelName;
    }

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }
}
