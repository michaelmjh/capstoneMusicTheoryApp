package com.example.server.models;

import com.example.server.models.enums.Difficulty;
import com.example.server.models.enums.LessonName;
import com.example.server.models.enums.LevelName;
import com.example.server.models.enums.QuestionType;
import jdk.internal.org.jline.utils.DiffHelper;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="questions")
public class Question {

    @Id
    @GeneratedValue
    private Long id;

    @Column
    private QuestionType questionType;

    @Column
    private LevelName levelName;

    @Column
    private LessonName lessonName;

    @Column
    private Difficulty difficulty;

    @Column
    private List<String> questionAssets;

    @Column
    private List<String> answerOptions;

    @Column
    private List<String> answerAssets;

    public Question(QuestionType questionType, LevelName levelName, LessonName lessonName, Difficulty difficulty, List<String> questionAssets, List<String> answerOptions, List<String> answerAssets){
        this.questionType = questionType;
        this.levelName = levelName;
        this.lessonName = lessonName;
        this.difficulty = difficulty;
        this.questionAssets = questionAssets;
        this.answerOptions = answerOptions;
        this.answerAssets = answerAssets;
    }

    public Question(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public QuestionType getQuestionType() {
        return questionType;
    }

    public void setQuestionType(QuestionType questionType) {
        this.questionType = questionType;
    }

    public LevelName getLevelName() {
        return levelName;
    }

    public void setLevelName(LevelName levelName) {
        this.levelName = levelName;
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

    public List<String> getQuestionAssets() {
        return questionAssets;
    }

    public void setQuestionAssets(List<String> questionAssets) {
        this.questionAssets = questionAssets;
    }

    public List<String> getAnswerOptions() {
        return answerOptions;
    }

    public void setAnswerOptions(List<String> answerOptions) {
        this.answerOptions = answerOptions;
    }

    public List<String> getAnswerAssets() {
        return answerAssets;
    }

    public void setAnswerAssets(List<String> answerAssets) {
        this.answerAssets = answerAssets;
    }
}
