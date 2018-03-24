import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

  bool _answer;

  AnswerButton(this._answer);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      //true
        flex: 1,
//              fit:  FlexFit.loose,
        child: new Material(
          color: _answer == true ? Colors.greenAccent : Colors.redAccent,
          child: new InkWell(
            onTap: () => print(_answer == true ? "true" : "false"),
            child: new Center(
              child: new Container(
                child: new Text(_answer == true ? "true" : "false"),
              ),
            ),
          ),
        ));
  }

}