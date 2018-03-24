import 'package:flutter/material.dart';
import '../utils/question.dart';

import '../utils/quiz.dart';
import '../ui/answer_button.dart';

import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';

import './score_page.dart';
import './landing_page.dart';


class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
//  State<StatefulWidget> createState() {
//    new QuizPageState();
//  }
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome", true)
  ]);
  String questionText;
  int questionNUmber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion();
    questionText = currentQuestion.question;
    questionNUmber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    print("was clicked");
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNUmber),
            new AnswerButton(false,  () => handleAnswer(false))
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(isCorrect,
            () {
          if (quiz.length == questionNUmber) {
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)));
            return;
          }
          currentQuestion = quiz.nextQuestion();
          this.setState(() {
            overlayShouldBeVisible = false;
            questionText = currentQuestion.question;
            questionNUmber = quiz.questionNumber;
          });
            }) : new Container()
      ],
    );
  }
}
