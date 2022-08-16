class QuestionLists {
  List getQuestionsByDifficulty(allQuestions, difficulty) {
    var newQuestions = [];
    allQuestions.forEach((question) {
      if (question['difficulty'] == difficulty) {
        newQuestions.add(question);
      }
    });
    newQuestions.shuffle();
    var shortList = selectFive(newQuestions);
    return shortList;
  }

  getQuestionsByLevel(allQuestions, level) {
    var newQuestions = [];
    if (level == "BEGINNER") {
      allQuestions.forEach((question) {
        if (question['levelName'] == 'BEGINNER') {
          newQuestions.add(question);
        }
      });
    } else if (level == 'INTERMEDIATE') {
      allQuestions.forEach((question) {
        if (question['levelName'] == 'BEGINNER' ||
            question['levelName'] == 'INTERMEDIATE') {
          newQuestions.add(question);
        }
      });
    } else {
      allQuestions.forEach((question) {
        newQuestions.add(question);
      });
    }
    newQuestions.shuffle();
    var shortList = selectFive(newQuestions);
    return shortList;
  }

  selectFive(questions) {
    var newShortList = [];
    for (int i = 0; i < 5; i++) {
      newShortList.add(questions[i]);
    }
    return newShortList;
  }

  selectTen(questions) {
    var newShortList = [];
    for (int i = 0; i < 10; i++) {
      newShortList.add(questions[i]);
    }
    return newShortList;
  }
}
