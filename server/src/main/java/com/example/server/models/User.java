package com.example.server.models;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String userName;

    @Column
    private String avatar;

    @Column
    private List<String> progress;

    public User(String userName, String avatar){
        this.userName = userName;
        this.avatar = avatar;
        this.progress = new ArrayList<>();
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

    public List<String> getProgress() {
        return progress;
    }

    public void setProgress(List<String> progress) {
        this.progress = progress;
    }
}
