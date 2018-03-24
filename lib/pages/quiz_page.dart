import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';


class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();

//  State<StatefulWidget> createState() {
//    new QuizPageState();
//  }

}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("True")),
            new QuestionText("Pizza is nice", 1),
            new AnswerButton(false,  () => print("False"))
          ],
        )
      ],
    );
  }
}
