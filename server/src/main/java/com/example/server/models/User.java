package com.example.server.models;

import com.example.server.models.enums.LessonName;
import com.example.server.models.enums.LevelName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    @JsonIgnoreProperties({"user"})
    private List<Progress> progress;

//    @Enumerated(EnumType.STRING)
//    private LessonName lessonName;
//
//    @Enumerated(EnumType.STRING)
//    private LevelName levelName;



    public User(String userName, String avatar){
        this.userName = userName;
        this.avatar = avatar;
        this.progress = new ArrayList<>();
//        this.lessonName = lessonName;
//        this.levelName = levelName;
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

//    public LessonName getLessonName() {
//        return lessonName;
//    }
//
//    public void setLessonName(LessonName lessonName) {
//        this.lessonName = lessonName;
//    }
//
//    public LevelName getLevelName() {
//        return levelName;
//    }
//
//    public void setLevelName(LevelName levelName) {
//        this.levelName = levelName;
//    }

    public List<Progress> getProgress() {
        return progress;
    }

    public void setProgress(List<Progress> progress) {
        this.progress = progress;
    }
}
