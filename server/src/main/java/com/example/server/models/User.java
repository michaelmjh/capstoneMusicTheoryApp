package com.example.server.models;

import com.example.server.models.enums.LessonName;
import com.example.server.models.enums.LevelName;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="userName")
    private String userName;

    @Column(name="avatar")
    private String avatar;

    @Enumerated(EnumType.STRING)
    private LessonName lessonName;

    @Enumerated(EnumType.STRING)
    private LevelName levelName;

    public User(String userName, String avatar, LessonName lessonName, LevelName levelName){
        this.userName = userName;
        this.avatar = avatar;
        this.lessonName = lessonName;
        this.levelName = levelName;
    }

    public User(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public LessonName getLessonName() {
        return lessonName;
    }

    public void setLessonName(LessonName lessonName) {
        this.lessonName = lessonName;
    }

    public LevelName getLevelName() {
        return levelName;
    }

    public void setLevelName(LevelName levelName) {
        this.levelName = levelName;
    }
}
