import './question.dart';

class Quiz {
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex+1;

//  Question get nextQuestion {
//    _currentQuestionIndex++;
//    if (_currentQuestionIndex >= length) return null;
//    return _questions[_currentQuestionIndex];
//  }

  Question nextQuestion() {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }

  int get score => _score;

  set score(int value) {
    _score = value;
  }

  int get currentQuestionIndex => _currentQuestionIndex;

  set currentQuestionIndex(int value) {
    _currentQuestionIndex = value;
  }

  List<Question> get questions => _questions;

  set questions(List<Question> value) {
    _questions = value;
  }


}