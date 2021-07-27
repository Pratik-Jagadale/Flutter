import 'package:flutter/material.dart';

import './main.dart';

class Result extends StatelessWidget {
  final resultscore;
  final Function resetQuiz;
  Result(this.resultscore, this.resetQuiz);

  String get _result {
    String resultText;
    if (resultscore <= 0) {
      resultText = 'Your are Awsome!';
    } else if (resultscore <= 40) {
      resultText = 'Pretty likeable ';
    } else if (resultscore <= 50) {
      resultText = 'you are strage!';
    } else {
      resultText = 'you are bad!!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext buildContext) {
    return (Center(
      child: Column(
        children: [
          Text(
            _result,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // FlatButton(onPressed: resetQuiz, child: Text('Restart Quiz?')),

          IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'you wont to Reset the Quiz?',
              onPressed: resetQuiz,
              iconSize: 36,
              color: Colors.green)
        ],
      ),
    ));
  }
}
